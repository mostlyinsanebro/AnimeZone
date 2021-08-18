import 'dart:async';

import 'package:animezone/home.dart';
import 'package:flutter/material.dart';
import 'package:animezone/quizpage.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'AnimeZone',
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontFamily: 'SyneMono',
          ),
        ),
      ),
    );
  }
}
