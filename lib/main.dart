import 'package:flutter/material.dart';
import 'package:remote_start/start/view/RemoteStart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RemoteStart(title: 'Remotely'),
    );
  }
}
