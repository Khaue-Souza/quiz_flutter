import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/question.dart';
import 'package:quiz_flutter/quiz_brain.dart';

void main() {
  runApp(Quiz());
}
class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {

  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = quizBrain.getQuestionAnswer();
                  if (correctAnswer == true) {
                    print('Acertou');
                  } else {
                    print('Errou!');
                  }
                  quizBrain.nextQuestion();
                });
                print('Verdadeiro foi pressionado.');
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
              child: Text(
                'Falso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = quizBrain.getQuestionAnswer();
                  if (correctAnswer == false) {
                    print('Acertou');
                  } else {
                    print('Errou!');
                  }
                  quizBrain.nextQuestion();
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
                print('Falso foi pressionado.');
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children : scoreKeeper

          ),
        ),
      ],
    );
  }
}