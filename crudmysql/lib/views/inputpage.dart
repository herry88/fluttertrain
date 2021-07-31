import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Halaman Input Data',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
