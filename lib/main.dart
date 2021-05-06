import 'package:flutter/material.dart';

import 'package:ejemplo1/src/pages/graficas_circulares_page.dart';
// import 'package:ejemplo1/src/labs/circular_progress_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      // home: CircularProgressPage(),
      home: GraficasCircularesPage(),
    );
  }
}