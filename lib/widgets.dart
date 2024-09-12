import 'package:flutter/material.dart';

Widget assetImage(bool? isCorrect) {
  return Container(
    child: isCorrect == null
        ? const Text("")
        : isCorrect == true
            ? Image.asset(
                "images/true.png",
                height: 100,
                width: 100,
              )
            : Image.asset(
                "images/false.png",
                height: 100,
                width: 100,
              ),
  );
}
