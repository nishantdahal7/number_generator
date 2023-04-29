import 'dart:math';

import 'package:flutter/material.dart';

class NumberGeneratorScreen extends StatefulWidget {
  const NumberGeneratorScreen({super.key});

  @override
  NumberGeneratorScreenState createState() => NumberGeneratorScreenState();
}

class NumberGeneratorScreenState extends State<NumberGeneratorScreen> {
  int score = 0;
  int roundsPlayed = 0;
  int number1 = 0;
  int number2 = 0;

  void _generateRandomNumbers() {
    setState(() {
      number1 = Random().nextInt(100);
      number2 = Random().nextInt(100);
    });
  }

  void _checkAnswer(bool isGreater) {
    setState(() {
      if ((isGreater && number1 > number2) ||
          (!isGreater && number2 > number1)) {
        score++;
      }
      roundsPlayed++;
      if (roundsPlayed >= 10) {
        _showGameOverDialog();
        return;
      }
      _generateRandomNumbers();
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over!'),
          content: Text('Your score is $score.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: const Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      score = 0;
      roundsPlayed = 0;
      _generateRandomNumbers();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Greater Number'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Which number is greater?',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$number1',
                  style: const TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$number2',
                  style: const TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  child: const Text('Number 1'),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  child: const Text('Number 2'),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Text(
              'Score: $score / 10',
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _restartGame,
              child: const Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }
}
