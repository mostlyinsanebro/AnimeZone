import 'package:flutter/material.dart';
import 'package:animezone/quizpage.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> source = [
    "assets/dbz.json",
    "assets/naruto.json",
    "assets/deathnote.json",
    "assets/one.json",
    "assets/hero.json"
  ];
  List<String> images = [
    "images/dbz3.png",
    "images/naruto.png",
    "images/deathnote.png",
    "images/onepunchman.png",
    "images/hero.png"
  ];
  Widget customCard(String animeName, String image, Color animeColor, int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => getjson(s: source[i]),
              ),
            );
          },
          child: Material(
            elevation: 5.0,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                  ),
                  Material(
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                  Text(
                    animeName,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: animeColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            'AnimeZone',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "SyneMono",
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          customCard("DBZ", images[0], Colors.deepOrange, 0),
          customCard("Naruto", images[1], Colors.yellow[900], 1),
          customCard("Death Note", images[2], Colors.black, 2),
          customCard("One Punch Man", images[3], Colors.red[900], 3),
          customCard("My Hero Academia", images[4], Colors.green[900], 4),
        ],
      ),
    );
  }
}
