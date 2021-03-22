import 'package:flutter/material.dart';
import './ui/quiz.dart';
import './ui/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What is your fovorite color',
      'answers': [
        {'text': 'Black', 'score': 2},
        {'text': 'Green', 'score': 10},
        {'text': 'Yellow', 'score': 20},
      ]
    },
    {
      'questionText': 'what is your favorite animal',
      'answers': [
        {'text': 'Cat', 'score': 2},
        {'text': 'Dog', 'score': 10},
        {'text': 'Bird', 'score': 20},
      ]
    },
    {
      'questionText': 'what is your favorite country',
      'answers': [
        {'text': 'Sweden', 'score': 2},
        {'text': 'Finland', 'score': 10},
        {'text': 'Danmark', 'score': 20},
      ]
    }
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuestions() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My first app'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuestions),
    ));
  }
}
