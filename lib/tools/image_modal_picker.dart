import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageModalPickerWidget extends StatefulWidget {
  const ImageModalPickerWidget({super.key});

  @override
  State<ImageModalPickerWidget> createState() => _ImageModalPickerWidgetState();
}

class _ImageModalPickerWidgetState extends State<ImageModalPickerWidget> {
  late File _image;

  Future getImageFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  Future getImageFromCamera() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _showGalleryCameraModal(context),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: CircleAvatar(
            radius: 45.0,
            child: Icon(Icons.camera_alt),
          ),
        ));
  }

  Future<void> _showGalleryCameraModal(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: const Icon(Icons.collections),
                      title: const Text('Gallery'),
                      onTap: () => getImageFromGallery()),
                  ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Camera'),
                      onTap: () => getImageFromCamera())
                ]));
  }
}
