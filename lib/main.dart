import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  var _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your fav color?',
        'answers': ['Black', 'Red', 'White', 'Blue']
      },
      {
        'questionText': 'What\'s your fav animal?',
        'answers': ['Tiger', 'Lion', 'Horse', 'Fox']
      },
      {
        'questionText': 'What\'s your fav F1 driver?',
        'answers': [
          'Charles Leclerc',
          'George Russel',
          'Danniel Riccardo',
          'Lewis Hamilton'
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
