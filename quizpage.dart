import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:animezone/resultpage.dart';

class getjson extends StatelessWidget {
  String s;
  getjson({this.s});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(s),
        builder: (context, snapshot) {
          List myData = json.decode(snapshot.data.toString());

          if (myData == null) {
            return Scaffold(
              body: Container(
                child: Center(
                  child: Text('Loading'),
                ),
              ),
            );
          } else {
            return quizPage(myData: myData);
          }
        });
  }
}

class quizPage extends StatefulWidget {
  var myData;
  quizPage({Key key, @required this.myData}) : super(key: key);
  @override
  _quizPageState createState() => _quizPageState(myData);
}

class _quizPageState extends State<quizPage> {
  bool canceltimer = false;
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  String showTimer = "30";
  int timer = 30;
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer--;
        }
        showTimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < 15) {
        i++;
      } else {
        canceltimer = true;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => resultpage(marks: marks)),
        );
      }
      btnColor["a"] = Colors.white;
      btnColor["b"] = Colors.white;
      btnColor["c"] = Colors.white;
      btnColor["d"] = Colors.white;
    });
    if (canceltimer == false) starttimer();
  }

  var myData;
  Color colortoShow = Colors.white;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;

  Map<String, Color> btnColor = {
    "a": Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white
  };

  void checkAnswer(String k) {
    if (myData[2][i.toString()] == myData[1][i.toString()][k]) {
      marks += 10;
      colortoShow = right;
    } else {
      colortoShow = wrong;
    }
    setState(() {
      btnColor[k] = colortoShow;
      canceltimer = true;
    });
    Timer(Duration(seconds: 1), nextquestion);
  }

  _quizPageState(this.myData);
  Widget choiceButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {
          checkAnswer(k);
        },
        child: Text(
          myData[1][i.toString()][k],
          maxLines: 1,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        color: btnColor[k],
        splashColor: Colors.grey[700],
        minWidth: 200.0,
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('AnimeZone'),
                  content: Text('You can not go back at this stage'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'))
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  myData[0][i.toString()],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    choiceButton('a'),
                    choiceButton('b'),
                    choiceButton('c'),
                    choiceButton('d')
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(showTimer,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
