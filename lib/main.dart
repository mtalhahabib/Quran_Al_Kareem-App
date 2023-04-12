import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Quran/ayaat.dart';
import 'Quran/surah.dart';
import 'recitation/tilawat.dart';
import 'bottom_navigation.dart';
import 'mosque_map.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      systemNavigationBarColor:Colors.green// Set status bar color here
    ));
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BottomNavigation(),

    );
  }
}
