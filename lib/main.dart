import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const Quizler());
}


class Quizler extends StatelessWidget {
  const Quizler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(.7),
          title: const Text(
            'Paheliyaan',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey.shade700,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}


QuizBrain quizBrain=QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int iconNo=0;
  bool icon_bool = true;

  List<Icon> setIcons = [];

  // List<String> questions = [
  //   'Do you think Param should come to class everyday?',
  //   'But Param doesn\'t like to . As your friend you should support him. Would you?',
  //   'Dil ka dariyaaa , beh hi gaya . Dosto ne mujhko class bhej diya .',
  //   'Param Go to eat',
  // ];
  //
  // List<bool> Canswers = [true, false, true, true];/

  void checkAnswer(bool userGivenAnswer)
  {
    bool answers=quizBrain.getAnswers();
    if(answers==userGivenAnswer)
    {
      print("You got it right");
      icon_bool = true;
    }
    else
    {
      print("You got it wrong");
      icon_bool = false;
    }
  }

  void showResult(bool b)
  {
    if (b)
    {
      Fluttertoast.showToast(
          msg: "yay! Right . On to the Next One",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green.shade700,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else
    {
      Fluttertoast.showToast(
          msg: "oops . Wrong . NeverMind",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //Questions
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 5,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.green.shade800)),
              onPressed: () {

                Fluttertoast.cancel();

                setState(() {

                  checkAnswer(true);

                  quizBrain.nextQuestion();

                  if(iconNo < quizBrain.getNoOfQuestion())
                  {
                    setIcons.add(quizBrain.addIcon(icon_bool));
                    ++iconNo;
                    showResult(icon_bool);
                  }

                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red.shade800),
              ),
              onPressed: () {

                Fluttertoast.cancel();

                setState(() {

                  checkAnswer(false);

                  quizBrain.nextQuestion();

                  if(iconNo < quizBrain.getNoOfQuestion())
                    {
                      setIcons.add(quizBrain.addIcon(icon_bool));
                      ++iconNo;
                      showResult(icon_bool);
                    }

                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: setIcons,
          ),
        )
      ],
    );
  }
}
