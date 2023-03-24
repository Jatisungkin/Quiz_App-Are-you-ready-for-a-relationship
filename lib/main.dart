import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'How Do You Know If You\'re Ready for a Relationship?, click READY to find out ',
      'answers': [
        {'text': 'READY', 'score': 0},
      ]
    },
    {
      'questionText':
          ' Should I rush into a relationship just because I feel like I need to be married by a certain age?',
      'answers': [
        {
          'text':
              'No. It\'s important not to rush into a relationship just because of societal pressures',
          'score': 10
        },
        {
          'text':
              ' Yes, it\'s important to rush into a relationship to ensure that you get married by a certain age.',
          'score': 2
        },
        {
          'text':
              'No, it\'s not important to take your time when looking for a partner because finding someone quickly is more important',
          'score': 2
        },
        {
          'text':
              'No, societal pressures and expectations should be the main factor in deciding when to enter into a relationship or get married',
          'score': 2
        },
      ]
    },
    {
      'questionText': 'What should I focus on when looking for a partner?',
      'answers': [
        {
          'text':
              'Physical attraction should be the main focus when looking for a partner',
          'score': 3
        },
        {
          'text':
              'You should look for someone who has the same interests as you, even if your values and goals don\'t align',
          'score': 2
        },
        {
          'text':
              'Compatibility. It\'s important to look for someone who is compatible with you in terms of values, goals, and personality',
          'score': 10
        },
        {
          'text':
              'Compatibility isn\'t important - as long as you love each other, that\'s all that matters',
          'score': 2
        },
      ]
    },
    {
      'questionText':
          'Is it important to be open-minded when meeting potential partners?',
      'answers': [
        {
          'text':
              'You should only consider partners who fit a very specific criteria, and shouldn\'t keep an open mind',
          'score': 2
        },
        {
          'text':
              'Keeping an open mind when meeting potential partners can help you find someone who is a good match for you',
          'score': 10
        },
        {
          'text':
              'You should only meet potential partners through online dating, and not attend social events or join groups',
          'score': 2
        },
        {
          'text':
              'You shouldn\'t be open-minded when meeting potential partners, and should have a rigid list of expectations',
          'score': 2
        },
      ]
    },
    {
      'questionText':
          'What\'s the most important factor in finding a good wife?',
      'answers': [
        {
          'text':
              'The most important factor in finding a good wife is their appearance or physical attractiveness',
          'score': 1
        },
        {
          'text':
              'The most important factor in finding a good wife is their financial status or their family\'s wealth',
          'score': 1
        },
        {
          'text':
              'The most important factor in finding a good wife is their social status or popularity',
          'score': 1
        },
        {
          'text':
              'Emotional connection. While compatibility and shared values are important, it\'s also crucial to find someone with whom you share a deep emotional connection',
          'score': 10
        },
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

  void _answerQuestions(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    debugPrint('debug:_questionIndex');
    if (_questionIndex < _questions.length) {
      debugPrint('we have more questions');
    } else {
      debugPrint('no more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Are You Ready For A Relationship'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
