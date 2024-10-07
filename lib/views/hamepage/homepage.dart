import 'package:app_eatures_exma/utils/globals.dart';
import 'package:app_eatures_exma/utils/routes.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<TextEditingController> allControllers = [];

  @override
  void initState() {
    if (Globals.T.isEmpty) {
      allControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.T.length < 2) {
      Globals.T.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
      allControllers.add(TextEditingController());
    } else {
      Globals.T.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.T.clear();
    for (int i = 0; i < allControllers.length; i++) {
      if (allControllers[i].text.isNotEmpty) {
        Globals.T.add(allControllers[i].text);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('App Bar')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 200,
          width: 500,
          color: Colors.white,
          child: Container(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 46, 75, 150),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              "+ Add Student",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.detailPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
