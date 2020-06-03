import 'package:flutter/material.dart';
import 'package:homeinsuranceapp/pages/home.dart';
import 'package:homeinsuranceapp/pages/get_home_details.dart';
void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/':(context)=>HomePage(),
        '/gethomedetails':(context)=>HomeDetails(),
      },
    );
  }
}
