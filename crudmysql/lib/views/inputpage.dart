import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputData extends StatelessWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Item Code',
                    labelText: 'Item Code',
                    hintStyle: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Item Code',
                    labelText: 'Item Code',
                    hintStyle: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Item Code',
                    labelText: 'Item Code',
                    hintStyle: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
