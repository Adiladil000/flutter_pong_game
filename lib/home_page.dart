import 'dart:async';

import 'package:flutter/material.dart';

import 'ball.dart';
import 'brick.dart';
import 'cover_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction { UP, DOWN }

class _HomePageState extends State<HomePage> {
  // ball variables
  double ballX = 0;
  double ballY = 0;
  var ballDirection = direction.DOWN;

  // game setting
  bool gameHasStarted = false;

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      // update direction
      updateDirection();

      //move ball
      moveBall();
    });
  }

  void updateDirection() {
    setState(() {
      if (ballY >= 0.9) {
        ballDirection = direction.UP;
      } else if (ballY <= -0.9) {
        ballDirection = direction.DOWN;
      }
    });
  }

  void moveBall() {
    setState(() {
      if (ballDirection == direction.DOWN) {
        ballY += 0.01;
      } else if (ballDirection == direction.UP) {
        ballY -= 0.01;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Stack(
            children: [
              //tap to play
              CoverScreen(
                gameHasStarted: gameHasStarted,
              ),

              // top brick
              const MyBrick(x: 0, y: -0.9),

              //bottom brick
              const MyBrick(x: 0, y: 0.9),
              MyBall(x: ballX, y: ballY)
            ],
          ),
        ),
      ),
    );
  }
}
