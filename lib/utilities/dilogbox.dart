import 'package:flutter/material.dart';
import 'package:todohive/utilities/buttons.dart';

class dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
   dialogbox({super.key, this.controller,required this.oncancel,required this.onsave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller:controller,decoration:InputDecoration(hintText: 'add a new task') ),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
Mybutton(text: 'Save', onPressed: onsave),
    SizedBox(width: 8,),
    Mybutton(text: 'cancel', onPressed: oncancel)  ],


)          ],
        ),

      ),
    );
  }
}
