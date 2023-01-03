import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  /* final double scale;
  ShapePainter({required this.scale}) : super();
 */
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    Offset startPointX = Offset(0, size.height / 2);
    Offset endPointX = Offset(size.width, size.height / 2);

    Offset startPointY = Offset(size.width / 2, 0);
    Offset endPointY = Offset(size.width / 2, size.height);

    canvas.drawLine(startPointX, endPointX, paint);
    canvas.drawLine(startPointY, endPointY, paint);

    var gridSize = 40;
    var numLinesY = (size.height / 2 / gridSize).round();
    var numLinesX = (size.width / 2 / gridSize).round();

    paintLineY(canvas, size, gridSize, numLinesY,
        numLinesX); // ve cot y va them so y > 0
    paintNumLineY(canvas, size, gridSize, numLinesY,
        numLinesX); // ve cot y va them so y < 0
    paintLineX(canvas, size, gridSize, numLinesY,
        numLinesX); // ve cot y va them so x > 0
    paintNumLineX(canvas, size, gridSize, numLinesY,
        numLinesX); // ve cot y va them so x < 0

    paintTriangle(canvas, size);
    paintCirle(canvas, size);
    paintRectangle(canvas, size);
    paintHexagon(canvas, size);
  }

  void paintLineY(
      Canvas canvas, Size size, int gridSize, int numLinesY, int numLinesX) {
    var paint = paintStyle();

    for (int i = 1; i <= numLinesY; i++) {
      Offset startPointY =
          Offset(size.width / 2 - 3, (size.height / 2) - (i * gridSize));

      Offset endPointY =
          Offset(size.width / 2 + 3, (size.height / 2) - (i * gridSize));
      final textPainter = textPainterWidget(text: i.toString());
      textPainter.layout();

      final y = size.height / 2 - (gridSize * i);
      final offset = Offset(size.width / 2 - 25, y - textPainter.height / 2);

      textPainter.paint(canvas, offset);

      canvas.drawLine(startPointY, endPointY, paint);
    }
  }

  void paintNumLineY(
      Canvas canvas, Size size, int gridSize, int numLinesY, int numLinesX) {
    var paint = paintStyle();

    for (int i = 1; i <= numLinesY; i++) {
      Offset startPointY =
          Offset(size.width / 2 - 3, (size.height / 2) + i * gridSize);
      Offset endPointY =
          Offset(size.width / 2 + 3, (size.height / 2) + i * gridSize);
      final textPainter = textPainterWidget(text: (-i).toString());

      textPainter.layout();

      final y = size.height / 2 + i * gridSize;
      final offset = Offset(size.width / 2 - 25, y - textPainter.height / 2);

      textPainter.paint(canvas, offset);
      canvas.drawLine(startPointY, endPointY, paint);
    }
  }

  void paintLineX(
      Canvas canvas, Size size, int gridSize, int numLinesY, int numLinesX) {
    var paint = paintStyle();

    for (int i = 1; i <= numLinesX; i++) {
      Offset startPointX =
          Offset(size.width / 2 + gridSize * i, (size.height / 2 + 3));
      Offset endPointX =
          Offset(size.width / 2 + gridSize * i, (size.height / 2 - 3));

      final textPainter = textPainterWidget(text: (i).toString());

      textPainter.layout();

      final x = (i * gridSize);
      final offset = Offset(
          size.width / 2 + x - textPainter.width / 2, size.height / 2 + 5);

      textPainter.paint(canvas, offset);

      canvas.drawLine(startPointX, endPointX, paint);
    }
  }

  void paintNumLineX(
      Canvas canvas, Size size, int gridSize, int numLinesY, int numLinesX) {
    var paint = paintStyle();

    for (int i = 1; i <= numLinesX; i++) {
      Offset startPointX =
          Offset(size.width / 2 - gridSize * i, (size.height / 2 + 3));
      Offset endPointX =
          Offset(size.width / 2 - gridSize * i, (size.height / 2 - 3));

      final textPainter = textPainterWidget(text: (-i).toString());
      textPainter.layout();

      final x = i * gridSize;
      final offset = Offset(
          size.width / 2 - x - textPainter.width / 2, size.height / 2 + 5);

      textPainter.paint(canvas, offset);
      canvas.drawLine(startPointX, endPointX, paint);
    }
  }

///// vẽ tam giác
  void paintTriangle(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    var path = Path();
    path.moveTo(size.width / 4, size.height / 8);
    path.lineTo(size.width / 6, size.height / 4);

    path.lineTo(size.width / 3, size.height / 4);
    path.close();
    canvas.drawPath(path, paint);
  }

///// vẽ tam giác
  void paintCirle(Canvas canvas, Size size) {
    final center = Offset(size.width / 1.3, size.height / 4);

    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      size.width * 1 / 8,
      paint,
    );
  }

///// vẽ da giac
  void paintHexagon(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    var path = Path();

    path.moveTo(size.width * 1 / 7, size.height * 1 / 1.5);
    path.lineTo(size.width * 1 / 3, size.height * 1 / 1.5);
    path.lineTo(size.width * 1 / 2.5, size.height * 1 / 1.4);
    path.lineTo(size.width * 1 / 3, size.height * 1 / 1.3);
    path.lineTo(size.width * 1 / 7, size.height * 1 / 1.3);
    path.lineTo(size.width * 1 / 12.5, size.height * 1 / 1.4);
    path.close();

    //path.lineTo(size.width * 1 / 4, size.height * 1 / 1.5);
    //path.lineTo(size.width * 1 / 4, size.height * 1 / 1.5); */

    canvas.drawPath(path, paint);
  }

///// vẽ hình vuông
  void paintRectangle(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final a = Offset(size.width * 1 / 1.5, size.height * 1 / 1.5);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Paint paintStyle(
    {Color? colorsPaint, double? strokeWIdth, StrokeCap? strokeCap}) {
  return Paint()
    ..color = colorsPaint ?? Colors.black
    ..strokeWidth = strokeWIdth ?? 1
    ..strokeCap = strokeCap ?? StrokeCap.round;
}

TextPainter textPainterWidget({required String text}) {
  return TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);
}
