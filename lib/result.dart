import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You Are NOT Ready For a Relationship';
    } else if (resultScore <= 12) {
      resultText = 'You Are NOT Ready For a Relationship';
    } else if (resultScore <= 40) {
      resultText = 'You Are READY For a Relationship';
    } else {
      resultText = 'You Are NOT Ready For a Relationship';
    }
    return resultText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(
        resultPhrase,
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      TextButton(onPressed: resetHandler, child: const Text('Restart Quiz'))
    ]));
  }
}
