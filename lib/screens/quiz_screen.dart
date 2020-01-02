import 'package:flutter/material.dart';
import 'package:quizio/questions.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreKeeper = [];

  List<Question> questionList = [
    Question(question: 'You can lead a cow down stairs but not up stairs' , answer: false ),
    Question(question: 'A slug\'s blood is green', answer: true),
    Question(question: 'Life is a bitch sometimes', answer: true),
  ];

  int questionNumber  = 0;//variable to track the number of question

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[                                                   //question text
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    questionList[questionNumber].questionText,
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    bool correctAnswer = questionList[questionNumber].questionAnswer;//answers
                    if(correctAnswer == true){
                      print("user got the it right");
                    } else{
                      print("user got it wrong");
                    }
                    setState(() {
                      questionNumber++;//increasing the question by 1
                    });
                  },
                  color: Colors.green,
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    bool correctAnswer = questionList[questionNumber].questionAnswer;//answer
                    if(correctAnswer ==false){
                      print("User got this right");
                    }else{
                      print("User got this wrong");
                    }
                    setState(() {
                      questionNumber++;
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            //TODO: add row here as your score keeper
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
