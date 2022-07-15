import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List diceList = [1, 2, 3, 4, 5, 6];
  var _diceOne = 1;
  var _diceTwo = 1;
  String text = 'Player One Turn';

  bool playerOne = true;
  bool playerTwo = false;

  void radomDiceO() {
    setState(() {
      _diceOne = diceList[Random().nextInt(6)];
    });
  }

  void radomDiceT() {
    setState(() {
      _diceTwo = diceList[Random().nextInt(6)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.lobster(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text,
                style: GoogleFonts.aclonica(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Player 1",
                      style: GoogleFonts.acme(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: playerOne
                          ? () {
                              radomDiceO();
                              playerOne = false;
                              playerTwo = true;
                              text = "Player Two Turn";
                            }
                          : null,
                      child: Image.asset(
                        'images/$_diceOne.png',
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Player 2",
                      style: GoogleFonts.acme(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: playerTwo
                          ? () {
                              radomDiceT();
                              if (_diceOne > _diceTwo) {
                                const snackBar = SnackBar(
                                  duration: Duration(milliseconds: 800),
                                  content: Text('Player One Win'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                playerTwo = false;
                                playerOne = true;
                                text = "Player One Turn";
                              } else if (_diceOne == _diceTwo) {
                                const snackBar = SnackBar(
                                  duration: Duration(milliseconds: 800),
                                  content: Text('Draw'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                playerTwo = false;
                                playerOne = true;
                                text = "Player One Turn";
                              } else {
                                const snackBar = SnackBar(
                                  duration: Duration(milliseconds: 800),
                                  content: Text('Player Two Win'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                playerTwo = false;
                                playerOne = true;
                                text = "Player One Turn";
                              }
                            }
                          : null,
                      child: Image.asset(
                        'images/$_diceTwo.png',
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
