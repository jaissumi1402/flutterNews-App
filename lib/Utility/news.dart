import 'dart:convert';

import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url="https://newsapi.org/v2/top-headlines?country=in&apiKey=cc7ec26d25c34a6190a3ae19fcb4dd1c";
    var response = await http.get(Uri.parse(url));
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description']!=null){
          ArticleModel articleModel = ArticleModel(
            title:element['title'],
            author: element["author"],
            description: element["description"],
            urlToImage: element["urlToImage"],
             url: element["url"],
            content: element["content"]
          );
          news.add(articleModel);

        }

        });
    }

  }

  
}
class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url="https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=cc7ec26d25c34a6190a3ae19fcb4dd1c";
    var response = await http.get(Uri.parse(url));
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description']!=null){
          ArticleModel articleModel = ArticleModel(
              title:element['title'],
              author: element["author"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              url: element["url"],
              content: element["content"]
          );
          news.add(articleModel);

        }

      });
    }

  }


}
