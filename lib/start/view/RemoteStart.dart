import 'package:flutter/material.dart';

class RemoteStart extends StatefulWidget{
  final String title;
  const RemoteStart({super.key, required this.title});
  @override
  State<RemoteStart> createState() => _RemoteStartState();
}

class _RemoteStartState extends State<RemoteStart>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'UI pending',
            ),
          ],
        ),
      ),
    );
  }
}