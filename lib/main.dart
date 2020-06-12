import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool allDone = false;
  int currIndex = 0;
  List<String> questions = ['true', 'false', 'true', 'false', 'false'];
  List<bool> answers = [true, false, true, false, false];
  List<Widget> grade = [];

  void checkAnswer(bool userInput) {
    setState(() {
      if (userInput == answers[currIndex]) {
        grade.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        grade.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      if (currIndex == questions.length - 1) {
        allDone = true;
        SuccessAlertBox(
            context: context,
            title: "All done!",
            messageText: "You have finished all questions.");
      } else {
        currIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[currIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                disabledColor: Colors.green.shade200,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: allDone
                    ? null
                    : () {
                        setState(() {
                          checkAnswer(true);
                        });
                      }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              disabledColor: Colors.red.shade200,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: allDone
                  ? null
                  : () {
                      setState(() {
                        checkAnswer(true);
                      });
                    },
            ),
          ),
        ),
        Row(children: grade)
      ],
    );
  }
}
