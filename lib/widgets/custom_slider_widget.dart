import 'dart:math';

import 'package:flutter/material.dart';

class CustomSliderWidget extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  final String initials;
  final Color activeColor;

  const CustomSliderWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.initials,
    required this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: RotatedBox(
        child: Column(
          children: <Widget>[
            Text(
              initials,
              style: TextStyle(
                color: activeColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Slider(
              min: 0,
              max: 255,
              divisions: 255,
              value: value,
              onChanged: onChanged,
              inactiveColor: Colors.black87,
              activeColor: activeColor,
            ),
          ],
        ),
        quarterTurns: -1,
      ),
    );
  }
}
