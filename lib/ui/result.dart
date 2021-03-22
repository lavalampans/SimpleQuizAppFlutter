import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function handleReset;
  Result(this.resultScore, this.handleReset);

  String get message {
    return 'Your score is $resultScore';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            message,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: handleReset,
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
