import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey,
    this.grosorPrimario = 10.0,
    this.grosorSecundario = 4.0,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;

  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this, duration: new Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;

    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress( 
              ( widget.porcentaje - diferenciaAnimar) + ( diferenciaAnimar * controller.value  ),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorPrimario,
              widget.grosorSecundario,
            ),
          ),
        );
      },
    );

  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );


  @override
  void paint(Canvas canvas, Size size) {

    //circulo de fondo
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset c = new Offset( size.width * .5, size.height / 2 );

    double radio = min( size.width * .5 , size.height * .5 );

    canvas.drawCircle(c, radio, paint);

    //circulo pintado por arriba
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
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
