import 'dart:convert';

import 'package:get_list_from_api/models/news.dart';
import 'package:http/http.dart';

import '../models/games.dart';

class api
{


    static Future<List<Articles>> getAllNews() async
    {
      final Response response = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=b700668063bb46c49b2c74a67057d4ad'));
      if(response.statusCode == 200)
      {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<dynamic> articlesJson = jsonResponse['articles'];
        return articlesJson.map<Articles>((item) => Articles.fromJson(item)).toList();;
      }else
      {
        throw Exception('Can not load news');
      }
    }

  }
