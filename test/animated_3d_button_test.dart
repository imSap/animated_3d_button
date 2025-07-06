import 'package:animated_3D_button/animated_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimatedShadowButton triggers onPressed', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Animated3DButton(
            onPressed: () => tapped = true,
            child: const Text('Tap'),
          ),
        ),
      ),
    );

    expect(tapped, isFalse);
    await tester.tap(find.text('Tap'));
    await tester.pumpAndSettle();
    expect(tapped, isTrue);
  });
}
