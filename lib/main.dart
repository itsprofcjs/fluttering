import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SoundApp(),
        ),
      ),
    );
  }
}

class SoundApp extends StatefulWidget {
  const SoundApp({super.key});

  @override
  State<SoundApp> createState() => _SoundAppState();
}

class _SoundAppState extends State<SoundApp> {
  void onPlayClick(int soundNo) {
    final player = AudioPlayer();

    player.play(AssetSource('note$soundNo.wav'));
  }

  Expanded buildKey({required MaterialColor color, required int soundNo}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          onPlayClick(soundNo);
        },
        child: Text(
          'Click me!',
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildKey(color: Colors.red, soundNo: 1),
        buildKey(color: Colors.yellow, soundNo: 2),
        buildKey(color: Colors.grey, soundNo: 3),
        buildKey(color: Colors.blue, soundNo: 4),
        buildKey(color: Colors.green, soundNo: 5),
        buildKey(color: Colors.brown, soundNo: 6),
        buildKey(color: Colors.cyan, soundNo: 7)
      ],
    );
  }
}
