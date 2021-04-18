import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = "Yo are a bad person";
    } else if (totalScore <= 10) {
      resultText = "You are a fine person";
    } else {
      resultText = "You are a good person";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Result : " + resultPhrase,
            style: new TextStyle(
              fontSize: 20,
            ),
          ),
          ElevatedButton(onPressed: resetHandler, child: Text("Play again")),
        ],
      ),
    );
  }
}
