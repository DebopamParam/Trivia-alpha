
import 'questions.dart';

import 'package:flutter/material.dart';

class QuizBrain
{
  int _Qno = 0 ;
  
  final List<Question> _questionBank=[
    Question('The Firefox logo isn’t a fox.', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Google rents out goats.', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'Samsung is 38 years and 1 month older than Apple.',
        true),
    Question(
        'Domain name registration used to be free.',
        true),
    Question(
        'Alexa is always listening to your conversations.',
        true),
  ];
  
  void nextQuestion()
  {
    if (_Qno<_questionBank.length - 1)
      {
        _Qno++;
      }
  }

  String getQuestion()
  {
    return _questionBank[_Qno].questionText;
  }

  bool getAnswers()
  {
    return _questionBank[_Qno].questionAnswer;
  }

  int getNoOfQuestion()
  {
    return _questionBank.length;
  }

  Icon addIcon(bool checkedAnswer)
  {
        if(checkedAnswer)
        {
          return const Icon(
            Icons.check_box_outlined,
            color: Colors.green,
          );
        }
        else
        {
          return const Icon(
            Icons.close_outlined,
            color: Colors.red,
          );
        }
  }


}
