import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.title, required this.thumbnail, required this.description, required this.platform, required this.publisher, required this.releaseDate, required this.link});

  final String title;//
  final String thumbnail;//
  final String description;
  final String platform;//
  final String publisher;//
  final String releaseDate;//
  final String link;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Text(title,
                style: const
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
                ),
              ),
              const SizedBox(height: 20,),

              Image.network(thumbnail),
              const SizedBox(height: 20,),
              Text(description,
                style: const
                TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20,),
              Text('Platform : $platform',
                style: const TextStyle(
                fontSize: 20,
              ),
              ),
              const SizedBox(height: 20,),
              Text('Publisher : $publisher',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20,),
              Text('Released Date : $releaseDate',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}

