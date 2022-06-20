import 'package:flower_care/tools/image_modal_picker.dart';
import 'package:flutter/material.dart';

class FlowerViewWidget extends StatefulWidget {
  const FlowerViewWidget({super.key});

  // @override
  // _FlowerViewWidgetState createState() {
  //   return _FlowerViewWidgetState();
  // }
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
                children: const <Widget>[
                  ImageModalPickerWidget(),
                  TextField(decoration: InputDecoration(labelText: "Nazwa"))
                ],
              ),
            )));
  }
}
