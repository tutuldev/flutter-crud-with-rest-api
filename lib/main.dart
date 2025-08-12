import 'package:crud_with_rest_rest_api/Screen/ProductCreateScreen.dart';
import 'package:crud_with_rest_rest_api/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD APP',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: ProductCreateScreen(),
      home: ProductGridViewScreen(),
    );
  }
}


