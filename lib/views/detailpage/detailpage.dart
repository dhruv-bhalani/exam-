import 'dart:io';
import 'dart:math';

import 'package:app_eatures_exma/utils/extension.dart';
import 'package:app_eatures_exma/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  Future<void> pickImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: source);

    if (file != null) {
      Globals.image = File(file.path);
      setState(() {});
    } else {
      debugPrint("Image picking failed.");
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Detail Page')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade300,
              radius: 80,
              foregroundImage:
                  Globals.image != null ? FileImage(Globals.image!) : null,
              child: Globals.image == null
                  ? const Text(
                      "Add Image",
                      style: TextStyle(color: Colors.black),
                    )
                  : null,
            ),
            FloatingActionButton.small(
              backgroundColor: Colors.white70,
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Select Image Source"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera),
                          title: const Text("Camera"),
                          onTap: () {
                            pickImage(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text("Gallery"),
                          onTap: () {
                            pickImage(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add_a_photo),
            ),
            SizedBox(height: 20), // Spacer to replace the 100.height extension
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Student Name ',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            20.height,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'GR id ',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            20.height,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Standard ',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            50.height,
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
                20.width,
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Reset'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
