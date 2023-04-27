import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  const MyBall({super.key, required this.x, required this.y});

  final double x;
  final double y;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        width: 20,
        height: 20,
      ),
    );
  }
}
