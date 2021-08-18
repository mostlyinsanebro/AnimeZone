import 'package:animezone/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    'images/bad.png',
    'images/allmight.png',
    'images/god.png'
  ];
  String image;
  String message;
  @override
  initState() {
    if (marks < 80) {
      image = images[0];
      message = "You should try harder..\n" + "You scored $marks/150 marks";
    } else if (marks < 120) {
      image = images[1];
      message = "You are good..\n" + "You scored $marks/150 marks";
    } else {
      image = images[2];
      message = "You are an anime god..\n" + "You scored $marks/150 marks";
    }
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Text(
            'RESULT',
            style: TextStyle(
              fontSize: 23.0,
            ),
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                width: 300.0,
                height: 300.0,
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 200.0,
              height: 10.0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                },
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 25.0,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  side: BorderSide(
                    color: Colors.grey[900],
                    width: 5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
