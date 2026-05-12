// Practicing todo app
import 'package:flutter/material.dart';

import 'package:app_02_todolist/taskspage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 138, 88, 224),
          foregroundColor: Colors.white,
        ),
      ),

      title: "TodoList",

      home: const Taskspage(),
    ),
  );
}
