import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'result.dart';
import 'quiz_dados.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      'Quiz': (context) => Quiz(quiz: quiz),
      Result.routeName: (context) => Result(),
    });
  }
}
