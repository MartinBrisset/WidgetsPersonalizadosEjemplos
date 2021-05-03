import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,  
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(99),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;

  _MiRadialProgress(
    this.porcentaje
  );


  @override
  void paint(Canvas canvas, Size size) {

    //circulo de fondo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset c = new Offset( size.width * .5, size.height / 2 );

    double radio = min( size.width * .5 , size.height * .5 );

    canvas.drawCircle(c, radio, paint);

    //circulo pintado por arriba
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    double arcAngulo = 2 * pi * ( porcentaje / 100 );

    canvas.drawArc(
      Rect.fromCircle(center: c, radius: radio),
      -pi / 2, 
      arcAngulo, 
      false, 
      paintArco 
    );

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
