import 'package:flower_care/tools/image_modal_picker.dart';
import 'package:flutter/material.dart';

class FlowerViewWidget extends StatefulWidget {
  const FlowerViewWidget({super.key});

  @override
  State<FlowerViewWidget> createState() => _FlowerViewWidgetState();
}

class _FlowerViewWidgetState extends State<FlowerViewWidget> {
  final _formKey = GlobalKey<FormState>();

  State<ImageModalPickerWidget> imageModalPicker() =>
      const ImageModalPickerWidget().createState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ImageModalPickerWidget(),
                  const TextField(
                      decoration: InputDecoration(labelText: "Nazwa")),
                  const TextField(
                      decoration: InputDecoration(labelText: "Pokój")),
                  _addReminder(),
                  _notesDivider(),
                ],
              ),
            )));
  }

  GestureDetector _addReminder() {
    return GestureDetector(
      onTap: () => print("Adding reminder"),
      child: Container(
          margin: const EdgeInsets.only(top: 15.00),
          child: const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 17,
              ),
              children: [
                WidgetSpan(
                  child: Icon(Icons.add_circle, color: Colors.green),
                ),
                TextSpan(
                  text: 'Reminder',
                )
              ],
            ),
          )),
    );
  }

  _notesDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 30.00),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
          const Text("Notes"),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: const Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
        ]),
        Row(
          children: const <Widget>[Text("below ")],
        ),
      ]),
    );
  }
}
