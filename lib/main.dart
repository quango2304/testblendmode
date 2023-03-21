import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blend Mode Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blend Mode Test'),
        ),
        body: BlendModeTest(),
      ),
    );
  }
}

class BlendModeTest extends StatelessWidget {
  final List<BlendMode> blendModes = BlendMode.values;
  final image = "https://cdn.freebiesupply.com/logos/large/2x/google-icon-logo-png-transparent.png";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("source"),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Text("destination"),
            Image.network(
              image,
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            ...blendModes.map((mode) => blendModeExample(mode)).toList()
          ],
        ),
      ),
    );
  }

  Widget blendModeExample(BlendMode mode) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(mode.toString()),
        SizedBox(height: 20),
        Image.network(
          image,
          color: Colors.red,
          colorBlendMode: mode,
          width: 200,
          height: 200,
        )
      ],
    );
  }
}
