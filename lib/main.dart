import 'package:flutter/material.dart';
import 'credit_card_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreditCardPage()
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

