import 'package:quizzler/Questions.dart';
import 'package:flutter/material.dart';
import 'Quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz_brain quizbrain = Quiz_brain();
void main() {
  runApp(
    Quizzler(),
  );
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Widget> scorekeeper = [];
  void checkanswer(bool ans) {
    setState(
      () {

        correctanswer = quizbrain.getquesans();
        if(ans==correctanswer)
          scorekeeper.add(Icon(Icons.check, color:Colors.green));
          else
          scorekeeper.add(Icon(Icons.close, color:Colors.red));
        
        quizbrain.nxtquestion();
      },
    );
  }

  bool correctanswer;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizbrain.getquestext(),
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.red[300],
              child: Text('True'),
              onPressed: () {
                checkanswer(true);
                
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.white,
              child: Text('False'),
              onPressed: () {
                checkanswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
