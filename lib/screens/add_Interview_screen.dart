// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:interviews/widgets/input.dart';

class AddInterviewScreen extends StatefulWidget {
  const AddInterviewScreen({Key? key}) : super(key: key);

  @override
  State<AddInterviewScreen> createState() => _AddInterviewScreenState();
}

class _AddInterviewScreenState extends State<AddInterviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Text(
                'ADD Interview',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Input(text: 'name', hinttext: 'candidate name..'),
                Input(text: 'company', hinttext: 'company name'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Input(text: 'vacant', hinttext: 'vacant type'),
                Input(text: 'interview employee', hinttext: 'first employee'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Input(text: 'interview employee', hinttext: 'second employee'),
                Input(text: 'interview employee', hinttext: 'third employee'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Input(text: 'model', hinttext: 'interview model'),
                Input(text: 'Date', hinttext: 'interview Date'),
              ],
            ),
            SizedBox(height: 80,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  height: 60,
                  minWidth: 100,
              child: Text('Save'),
              color: Colors.blueAccent,
              onPressed: (){Navigator.of(context).pop();
              }),
              MaterialButton(
                height: 60,
                minWidth: 100,
              child: Text('Cancel'),
              color: Colors.blueAccent,
              onPressed: (){Navigator.of(context).pop();
              })
              ],
            )
          ],
        ),
      )),
    );
  }
}
