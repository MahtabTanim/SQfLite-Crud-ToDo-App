import 'package:flutter/material.dart';
import 'package:your_tasks/screens/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "To Do",
    home: const HomePage(),
    theme: ThemeData(primarySwatch: Colors.cyan),
  ));
}
