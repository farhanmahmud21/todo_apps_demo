import 'package:flutter/material.dart';
import './home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.limeAccent)),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.pink,
          appBarTheme: AppBarTheme(
              foregroundColor: Colors.amber, backgroundColor: Colors.redAccent),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.pinkAccent)),
      home: Home_Screen(),
    );
  }
}
