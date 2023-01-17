import 'dart:math';

import 'package:flutter/material.dart';

class CalculateBMI {
  CalculateBMI({@required this.height, @required this.weight});
  int height;
  int weight;
  int age;

  double bmi;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDescription() {
    if (bmi >= 25) {
      return 'You have a higher body weight. You need to exercise';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower body weight. You need to eat more';
    }
  }
}
