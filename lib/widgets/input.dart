// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  
 final String text;
 final String hinttext;

  const Input({required this.text,required this.hinttext}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(width: 80,child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)),
          SizedBox(width:20 ),//MediaQuery.of(context).size.width*0.05,),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFF2A2D3E),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                  
                ),
                hintText: hinttext,
              ),
            ),
            )
        ],
      )
    );
  }
}