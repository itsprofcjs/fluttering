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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/space.webp'),
              ),
              Text(
                'CJS !',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 40,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Fluttering Flutter Development'.toUpperCase(),
                style: GoogleFonts.sourceSans3(
                  textStyle: TextStyle(
                    color: Colors.blue.shade100,
                    fontSize: 25,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(
                  color: Colors.blue.shade100,
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.add,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    'add me to ',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    'ascljanflnls@cjs.com',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
