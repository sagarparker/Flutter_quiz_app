import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What is your fav color?',
      'answer': [
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'Blue', 'score': 2},
      ]
    },
    {
      'questionText': 'What is your fav animal?',
      'answer': [
        {'text': 'Cat', 'score': 7},
        {'text': 'Dog', 'score': 4},
        {'text': 'Fox', 'score': 2},
      ]
    },
    {
      'questionText': 'What is your fav sitcom?',
      'answer': [
        {'text': 'The office', 'score': 7},
        {'text': 'BBT', 'score': 4},
        {'text': 'Parks & Rec', 'score': 2},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("Answer chosen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Quiz"),
          backgroundColor: Colors.blue,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
