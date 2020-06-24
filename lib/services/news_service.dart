import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mangakun/model/category_model.dart';
import 'package:mangakun/model/newsmodels.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = 'cc6c6f13dbb04866a86ac2ef693e9a5e';

class NewsService with ChangeNotifier{

List<Article> headlines = [];
String _selectedCategory = 'bussines';

bool _isLoading = true;

 List<Category>  categories = [
   Category(FontAwesomeIcons.building, 'business'),
   Category(FontAwesomeIcons.tv, 'entertainment'),
   Category(FontAwesomeIcons.addressCard, 'general'),
   Category(FontAwesomeIcons.headSideVirus, 'health'),
   Category(FontAwesomeIcons.vials, 'science'),
   Category(FontAwesomeIcons.volleyballBall, 'sports'),
   Category(FontAwesomeIcons.memory, 'technology'),
 ];

 Map<String, List<Article>> categoryArticles = {};

 //entertainment general health science sports technology
NewsService(){
  this.getTopHeadlines();
  categories.forEach((item){
   this.categoryArticles[item.name] = new List();
  });

  this.getArticleByCategory(this._selectedCategory);
}

bool get isLoading => this._isLoading;

get selectedCategory => this._selectedCategory;

set selectedCategory (String valor){

this._selectedCategory = valor;
this._isLoading = true;
this.getArticleByCategory(valor);

  notifyListeners();
}

List<Article> get getArticuloCategoriaSleccionada =>  this.categoryArticles[this.selectedCategory];

getTopHeadlines() async {
  final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=au';

  final resp = await http.get(url);

  final newsRespons = newsResponsFromJson(resp.body);

  this.headlines.addAll(newsRespons.articles);

  notifyListeners();

}

getArticleByCategory (String category) async{

  if(this.categoryArticles[category].length > 0 ){
     this._isLoading = false;
     notifyListeners();
    return this.categoryArticles[category];
  }

final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=au&category=$category';

  final resp = await http.get(url);

  final newsRespons = newsResponsFromJson(resp.body);

  this.categoryArticles[category].addAll(newsRespons.articles);
    this._isLoading = false;
  notifyListeners();

}







}