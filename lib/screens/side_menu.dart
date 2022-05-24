// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:interviews/screens/interviews_screen.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('interview company')
          ),
          DrawerListTile(
            title: "interviews",
            
            press: () {
             // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => InterviewsScreen())));
            },
          ),
          DrawerListTile(
            title: "Companies",
           
            press: () {},
          ),
          DrawerListTile(
            title: "Candidate",
            
            press: () {},
          ),
         
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
    
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}