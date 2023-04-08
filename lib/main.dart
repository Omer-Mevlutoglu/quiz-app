// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quizapp_/pages/quizmanger.dart';
import 'package:quizapp_/pages/openpage.dart';

void main() => runApp( MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => OpenPage(),
          '/quizpage': (context) => QuizPage(),
        },
      ),);

