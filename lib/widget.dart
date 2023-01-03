import 'package:document_easy/painter.dart';
import 'package:flutter/material.dart';

class ZoomableWidget extends StatefulWidget {
  final double widthScreen;
  final double heightScreen;
  const ZoomableWidget(
      {super.key, required this.widthScreen, required this.heightScreen});

  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  double _scaleFactor = 1.0;
  final double _baseScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _scaleFactor = _baseScaleFactor;
      },
      onScaleUpdate: (details) {
        if (details.scale == 1.0) {
          return;
        }
        setState(() {
          _scaleFactor = _baseScaleFactor * details.scale;
        });
      },
      child: SizedBox(
        width: widget.widthScreen,
        height: widget.heightScreen,
        child: Transform(
          transform: Matrix4.diagonal3Values(
            _scaleFactor,
            _scaleFactor,
            _scaleFactor,
          ),
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.1,
            maxScale: 2,
            child: SingleChildScrollView(
              child: CustomPaint(
                willChange: true,
                painter: ShapePainter(),
                child: SizedBox(
                    width: widget.widthScreen, height: widget.heightScreen),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
