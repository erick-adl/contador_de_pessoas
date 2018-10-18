import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo invertido?";
      } else if (_people < 10) {
        _infoText = "Pode entrar";
      } else {
        _infoText = "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/rest_background.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Icon(Icons.add,color: Colors.white, size: 70.0,),
                    onPressed: () {
                      debugPrint("+1");
                      _changePeople(1);
                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Icon(Icons.remove,color: Colors.white, size: 70.0,),
                    onPressed: () {
                      debugPrint("-1");
                      _changePeople(-1);
                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}
