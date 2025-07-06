
import 'package:animated_3d_button/animated_3d_button.dart';
import 'package:flutter/material.dart';


void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Animated Button Example')),
        body: Center(
          child: Animated3DButton(
            color: Colors.indigo,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tapped!')),
              );
            },
            child: const Text('Click Me'),
          ),
        ),
      ),
    );
  }
}
