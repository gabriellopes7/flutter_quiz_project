import 'package:flutter/material.dart';

class Arguments {
  int acertos = 0;
  Arguments(this.acertos);
}

class Result extends StatelessWidget {
  const Result({super.key});
  static const routeName = "Results";

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Arguments;

    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Quiz')),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Resultado",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Você acertou\n${argumentos.acertos} de 10\nperguntas",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //Tem que ser pushed para resetar o estado das rotas
                      Navigator.pushNamed(context, 'Quiz');
                    },
                    child: Text(
                      "Jogar Novamente",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
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
      ),
    );
  }
}
