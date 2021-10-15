import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/color_model.dart';
import 'widgets/custom_slider_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final ColorModel colorModel = ColorModel(255, 255, 255);
  static const platform = MethodChannel("sample/toast");

  void onChangedR(double _value) {
    setState(() => colorModel.r = _value);
  }

  void onChangedG(double _value) {
    setState(() => colorModel.g = _value);
  }

  void onChangedB(double _value) {
    setState(() => colorModel.b = _value);
  }

  Color makeColor() {
    return Color.fromARGB(
        255, colorModel.r.toInt(), colorModel.g.toInt(), colorModel.b.toInt());
  }

  Future<void> showNativeToast() async {
    final Map<String, dynamic> arguments = {
      "message":
          "The hex color is: R ${colorModel.r} | G ${colorModel.g} | B ${colorModel.b}"
    };
    await platform.invokeMethod<void>('showNativeToast', arguments);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text("HEX"),
          centerTitle: true,
        ),
        backgroundColor: makeColor(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomSliderWidget(
                    initials: 'R (${colorModel.r.toInt()})',
                    value: colorModel.r,
                    onChanged: onChangedR,
                    activeColor: Colors.red,
                  ),
                  CustomSliderWidget(
                    initials: 'G (${colorModel.g.toInt()})',
                    value: colorModel.g,
                    onChanged: onChangedG,
                    activeColor: Colors.green,
                  ),
                  CustomSliderWidget(
                    initials: 'B (${colorModel.b.toInt()})',
                    value: colorModel.b,
                    onChanged: onChangedB,
                    activeColor: Colors.blue,
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text("SHOW RGB VALUES"),
                onPressed: showNativeToast,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
