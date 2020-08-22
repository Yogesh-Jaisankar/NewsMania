import 'dart:convert';


import 'package:NewsMania/models/Article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];

  Future<void>getNews()async{
    String url="https://newsapi.org/v2/top-headlines?country=in&apiKey=0393226abb23435da91bd9ee4b101889";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null&&element["description"]!=null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
              content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news =[];

  Future<void>getNews(String category)async{
    String url="https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=0393226abb23435da91bd9ee4b101889";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null&&element["description"]!=null){
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}