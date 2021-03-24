import 'package:day4/flashcard.dart';
import 'package:day4/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(
      question: "What is my name?",
      answer: "Baxtiyorjon",
    ),
    Flashcard(question: "What is my surname?", answer: "Boxodirov"),
    Flashcard(
      question: "What is my lastname?",
      answer: "Bahromjon o'g'li",
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front:
                      FlashcardView(text: _flashcards[_currentIndex].question),
                  back: FlashcardView(
                    text: _flashcards[_currentIndex].answer,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPrevCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text("Prev"),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    setState(() {
      _currentIndex = (_currentIndex > 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
