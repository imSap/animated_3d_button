import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Animated3DButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final Widget child;

  const Animated3DButton({
    super.key,
    required this.onPressed,
    this.width = 150,
    this.height = 50,
    this.color = Colors.blue,
    required this.child,
  });

  @override
  State<Animated3DButton> createState() => _Animated3DButtonState();
}

class _Animated3DButtonState extends State<Animated3DButton> {
  double _position = 10;
  static const double _shadowHeight = 10;

  void _handleTapDown(TapDownDetails _) {
    _provideHapticFeedback();
    setState(() => _position = 0);
  }

  void _handleTapUp(TapUpDetails _) => _handleTapCancel();

  void _handleTapCancel() {
    setState(() => _position = _shadowHeight);
    widget.onPressed();
  }

  Future<void> _provideHapticFeedback() async {
    await HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular((widget.width / 10) + 5);

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Stack(
        children: [
          SizedBox(
            height: widget.height + _shadowHeight,
            width: widget.width,
          ),
          Positioned(
            top: _shadowHeight,
            child: Container(
              height: widget.height,
              width: widget.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.6),
                borderRadius: borderRadius,
                border: Border.all(
                  color: widget.color.withOpacity(0.4),
                  width: 2,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            bottom: _position,
            child: Container(
              height: widget.height,
              width: widget.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: borderRadius,
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
