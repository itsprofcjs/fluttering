import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Dicing...'),
        ),
        body: SafeArea(child: DicePage()),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                print('Left dice rolled');
              },
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Image.asset('images/dice1.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                print('Right dice rolled');
              },
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Image.asset('images/dice2.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
