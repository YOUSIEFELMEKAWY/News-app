import 'package:flutter/material.dart';
import 'package:get_list_from_api/models/news.dart';
import 'package:get_list_from_api/network/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // Define API key and URL
  final String apiKey = 'b700668063bb46c49b2c74a67057d4ad';
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News Headlines'),
      ),
      body: FutureBuilder<List<Articles>>(
        future: api.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      snapshot.data?[index].urlToImage != null
                          ? Image.network(snapshot.data![index].urlToImage.toString())
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data?[index].title ?? 'No Title',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          snapshot.data?[index].description ?? 'No Description',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data?[index].source?.name ?? 'Unknown Source',
                              style: const TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              snapshot.data?[index].publishedAt != null
                                  ? DateTime.parse(snapshot.data![index].publishedAt.toString())
                                  .toLocal()
                                  .toString()
                                  .substring(0, 10)
                                  : 'Unknown Date',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
