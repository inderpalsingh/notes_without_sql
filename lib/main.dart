import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Notes',
      home: HomePage(),
    );
  }
}