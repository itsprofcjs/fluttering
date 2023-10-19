import 'package:flutter/material.dart';
import 'package:fluttering_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: QuizApp()),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizBrain quizBrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  int currentQuestion = 0;
  bool showAlert = false;

  Expanded renderQuestion() {
    return Expanded(
      flex: 12,
      child: Center(
        child: Text(
          quizBrain.getCurrentQuestion(),
          style: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TextButton renderButton(String text, Function() onPressed,
      MaterialStateProperty<Color?>? backgroundColor) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(text),
      ),
    );
  }

  void addIcon(bool isYes) {
    Icon yesIcon = const Icon(
      Icons.check,
      color: Colors.green,
    );

    Icon noIcon = const Icon(
      Icons.close,
      color: Colors.red,
    );

    Icon iconToAdd;

    if (isYes) {
      iconToAdd = yesIcon;
    } else {
      iconToAdd = noIcon;
    }

    setState(() => scoreKeeper.add(iconToAdd));
  }

  List<Icon> renderList() => scoreKeeper.isNotEmpty
      ? scoreKeeper
      : const [
          Icon(
            Icons.help,
            color: Colors.transparent,
          ),
        ];

  void onClick(BuildContext context, bool givenAnswer) {
    bool correctAnswer = quizBrain.getCurrentAnswer();

    if (givenAnswer == correctAnswer) {
      addIcon(true);
    } else {
      addIcon(false);
    }

    setState(() {
      if (!quizBrain.getNextQuestion()) {
        scoreKeeper = [];

        Alert(
            context: context,
            title: "Restart!!!",
            desc: "Questions are over, will re-start",
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(116, 116, 191, 1.0),
                  Color.fromRGBO(52, 138, 199, 1.0),
                ]),
                child: const Text(
                  "Okay",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ]).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        renderQuestion(),
        renderButton('True', () => onClick(context, true),
            const MaterialStatePropertyAll(Colors.green)),
        const Spacer(
          flex: 1,
        ),
        renderButton('False', () => onClick(context, false),
            const MaterialStatePropertyAll(Colors.red)),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: renderList(),
        ),
      ],
    );
  }
}
