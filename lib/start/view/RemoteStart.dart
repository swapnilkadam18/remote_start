import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RemoteStart(title: 'Remote Start'),
    );
  }
}

class RemoteStart extends StatefulWidget {
  final String title;

  const RemoteStart({Key? key, required this.title}) : super(key: key);

  @override
  _RemoteStartState createState() => _RemoteStartState();
}

class _RemoteStartState extends State<RemoteStart> {
  bool isDefaultTimerEnabled = true;

  void disableController() {
    setState(() {
      isDefaultTimerEnabled = false; // Disable the controller
    });
  }

  void enabledController() {
    setState(() {
      isDefaultTimerEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DefaultTimerContainer(isControllerEnabled: isDefaultTimerEnabled),
            const SizedBox(height: 20),
            const TextWidgetContainer(),
            const SizedBox(height: 20),
            ButtonContainer(disableController: disableController,
                enableController: enabledController),
          ],
        ),
      ),
    );
  }
}

class DefaultTimerContainer extends StatefulWidget {
  final bool isControllerEnabled;

  const DefaultTimerContainer({Key? key, required this.isControllerEnabled})
      : super(key: key);

  @override
  _DefaultTimerContainerState createState() => _DefaultTimerContainerState();
}

class _DefaultTimerContainerState extends State<DefaultTimerContainer> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(setTimerValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add padding here
          child: TextField(
            controller: _controller,
            enabled: widget.isControllerEnabled,
            decoration: InputDecoration(
              labelText: 'Timer',
              hintText: '1 minute',
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  void setTimerValue() {
    final timerVal = _controller.text;
    print(timerVal);
  }
}

class TextWidgetContainer extends StatelessWidget {
  const TextWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Timer countdown');
  }
}

class ButtonContainer extends StatelessWidget {
  final VoidCallback disableController;

  final VoidCallback enableController;

  const ButtonContainer({Key? key, required this.disableController, required this.enableController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StartButton(disableController: disableController),
        ResetButton(enableController: enableController),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  final VoidCallback disableController;

  const StartButton({Key? key, required this.disableController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        disableController(); // Call the callback function to disable the controller
      },
      child: Icon(Icons.play_arrow),
    );
  }
}

class ResetButton extends StatelessWidget {
  final VoidCallback enableController;
  const ResetButton({Key? key, required this.enableController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        enableController();
      },
      child: Icon(Icons.stop),
    );
  }
}
