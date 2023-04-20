import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Image.asset("assets/images/logo.png"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Quiz');
                  },
                  child: Text(
                    "Jogar",
                    style: TextStyle(fontSize: 35),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
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
