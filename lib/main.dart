import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './screens/text_fetched_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Fetching',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/textfetch': (context) => TextFetched(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
