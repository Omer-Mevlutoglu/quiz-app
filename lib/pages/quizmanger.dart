// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';

 class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int score = 0;
  final List<Map<String, Object>> QuestionBank = [
    {
      'question': 'What is the capital city of Egypt? ',
      'answers': [
        {'text': 'Cairo', 'correct': true},
        {'text': 'Giza', 'correct': false},
        {'text': 'Alexandria', 'correct': false},
        {'text': ' Aswan', 'correct': false},
      ],
    },
    {
      'question': 'Which ancient monument is located on the west bank of the Nile river in Egypt?',
      'answers': [
        {'text': 'Giza Pyramid complex', 'correct': false},
        {'text': 'Valley of the Kings', 'correct': true},
        {'text': 'Karnak Temple complex', 'correct': false},
        {'text': 'Abu Simbel temples', 'correct': false},
      ],
    },
    {
      'question': 'Which river flows through Egypt?',
      'answers': [
        {'text': 'Amazon River', 'correct': false},
        {'text': 'Mississippi River', 'correct': false},
        {'text': 'Nile River', 'correct': true},
        {'text': 'Yangtze River', 'correct': false},
      ],
    },
    {
      'question': 'What is the ancient Egyptian writing system called?',
      'answers': [
        {'text': 'Cuneiform', 'correct': false},
        {'text': 'Hyroglyphics', 'correct': true},
        {'text': ' Sanskrit', 'correct': false},
        {'text': 'Hangul', 'correct': false},
      ],
    },
     {
      'question': 'What was the purpose of the pyramids of Giza?',
      'answers': [
        {'text': 'Temples for religious worship', 'correct': false},
        {'text': 'Tombs for pharaohs and their consorts', 'correct': true},
        {'text': 'Observatories for astronomical study', 'correct': false},
        {'text': 'Fortresses for military defense', 'correct': false},
      ],
    },
  ];

  void _answerQuestion(bool correct) {
    setState(() {
      if (correct) {
        score += 10;
      }
      index += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      index = 0;
      score = 0;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text('Quiz App'),
      centerTitle: true,
      backgroundColor: Colors.orange,
    ),
    body: index < QuestionBank.length
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Text(
                'Question ${index + 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                QuestionBank[index]['question'] as String,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...(QuestionBank[index]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange,
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(16),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                          child: Text(
                            answer['text'] as String,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () =>
                              _answerQuestion(answer['correct'] as bool),
                        ),
                      ))
                  .toList(),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LinearProgressIndicator(
                  value: (index + 1) / QuestionBank.length,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orange,
                  ),
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.0,),
              Center(
                child: Text(
                  'Done!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
              ),
              
              Text('Your Total Score = $score/50',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,),
              
              SizedBox(height: 20),
              TextButton(
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _resetQuiz,
              ),
            ],
          ),
  );
  }
}

