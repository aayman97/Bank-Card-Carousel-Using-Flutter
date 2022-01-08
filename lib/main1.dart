import 'package:banking_app/homepage.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class MyApp2 extends StatefulWidget {
  MyApp2({Key? key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
     return  MaterialApp(
      title: 'Bank App',
      debugShowCheckedModeBanner: false,
      home:HomePage2()
    );
  }
  
}