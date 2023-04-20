import 'package:flutter/material.dart';
import 'package:quiz/result.dart';
import 'quiz_dados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.quiz});

  final List quiz;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;
  @override
  Widget build(BuildContext context) {
    quiz.shuffle();

    quiz.forEach((element) {
      int alternativaCorreta = element['alternativa_correta'];
      List respostas = element['respostas'];
      String respostaCorreta = element['respostas'][alternativaCorreta - 1];
      print(respostaCorreta);
      respostas.shuffle();
      int i = 1;
      respostas.forEach((element) {
        if (element == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      element['alternativa_correta'] = alternativaCorreta;
    });
    // quiz.add({
    //   "pergunta": "O Flutter é:",
    //   "respostas": ["Uma linguagem", "Um aplicativo", "Um SDK", "Um Notebook"],
    //   "alternativa_correta": 3
    // });
    // for (int i = 3; i <= 20; i++) {
    //   quiz.add({
    //     "pergunta": "Pergunta $i ",
    //     "respostas": ["resposta 1", "resposta 2", "resposta 3", "resposta 4"],
    //     "alternativa_correta": 1
    //   });
    // }

    // print(quiz);

    void answered(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          acertos++;
        } else {
          erros++;
        }
        if (perguntaNumero < 10) {
          perguntaNumero++;
        } else {
          Navigator.pushNamed(context, 'Results',
              arguments: Arguments(acertos));
        }
      });
    }

    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Quiz')),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Pergunta $perguntaNumero de 10",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                "Pergunta\n\n" + quiz[perguntaNumero - 1]["pergunta"],
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    answered(1);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["respostas"][0],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    answered(2);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["respostas"][1],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    answered(3);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["respostas"][2],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    answered(4);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["respostas"][3],
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
