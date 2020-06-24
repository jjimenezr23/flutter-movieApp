import 'package:flutter/material.dart';
import 'package:mangakun/pages/tabs_page.dart';
import 'package:mangakun/services/news_service.dart';
import 'package:mangakun/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new NewsService())
        ],
         
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manga home',
        theme: mytheme,
        home: TabsPage(),
      ),
    );
  }
}