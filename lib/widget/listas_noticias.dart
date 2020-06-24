import 'package:flutter/material.dart';
import 'package:mangakun/model/newsmodels.dart';
import 'package:mangakun/theme/theme.dart';


class ListaNoticias extends StatelessWidget {
  
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index){

        return _Noticias(noticias: this.noticias[index], index: index, );
      }
    );
  }


}

  class _Noticias extends StatelessWidget {

    final Article noticias;
    final int index;

  const _Noticias({ @required this.noticias, @required this.index});
    
    @override
    Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          _TarjetaTopBar(noticias: noticias, index: index,),
          _TarjetaTitulo(noticias: noticias, ),
          _TarjetaImagen(noticias:noticias),
          _TarjetaBody(noticias: noticias),
          _TarjetasBotones(),


          SizedBox(height: 10),
          Divider()
                  ],
                );
              }
          
            
  }

  class _TarjetasBotones extends StatelessWidget {

    
    @override
    Widget build(BuildContext context) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           RawMaterialButton(
             onPressed: (){},
             fillColor: mytheme.accentColor,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             child: Icon(Icons.star_border),
             ),
             SizedBox(width: 10),
              RawMaterialButton(
             onPressed: (){},
             fillColor: Colors.blue,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             child: Icon(Icons.more),
             )
          ]
        ),
      );
    }
  }

  class _TarjetaBody extends StatelessWidget {

    final Article noticias;

  const _TarjetaBody({this.noticias});

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text((noticias.description != null) ? noticias.description : ''),
      );
    }
  }

  class _TarjetaImagen extends StatelessWidget {

    final Article noticias;

  const _TarjetaImagen({ this.noticias});

    
  
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                child: Container(
            child:(noticias.urlToImage != null ) 
            ? FadeInImage(
              placeholder: AssetImage('assets/img/giphy.gif'), 
              image: NetworkImage(noticias.urlToImage)) 
              : Image(image: AssetImage('assets/img/no-image.png'),)
          ),
        ),
      );
    }
  }



 

class _TarjetaTopBar extends StatelessWidget {

  final Article noticias;
  final int index;

  const _TarjetaTopBar({ this.noticias, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle(color: mytheme.accentColor),),
          Text('${noticias.source.name}. ')
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
 final Article noticias;

  const _TarjetaTitulo({ this.noticias});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticias.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}