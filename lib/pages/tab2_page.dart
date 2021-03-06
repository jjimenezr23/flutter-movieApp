import 'package:flutter/material.dart';
import 'package:mangakun/model/category_model.dart';
import 'package:mangakun/services/news_service.dart';
import 'package:mangakun/theme/theme.dart';
import 'package:mangakun/widget/listas_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(children: <Widget>[
          _ListaCategorias(),
            if ( !newsService.isLoading )
              Expanded(
                child: ListaNoticias( newsService.getArticuloCategoriaSleccionada)
              ),

            if ( newsService.isLoading )
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              )
            )
          ]),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
           final cName = categories[index].name;

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(children: <Widget>[
                _CategoryButtom( categories[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ]),
            );
          }),
    );
  }
}

class _CategoryButtom extends StatelessWidget {
  final Category categorie;

  const _CategoryButtom(this.categorie);

  @override
  Widget build(BuildContext context) {
     final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categorie.name; 
      },
          child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal:10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categorie.icon,
          color: (newsService.selectedCategory == this.categorie.name)
          ? mytheme.accentColor
          : Colors.black54
        ),
      ),
    );
  }
}
