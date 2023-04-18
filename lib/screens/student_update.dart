import 'package:flutter/material.dart';

class StudentUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentUpdateState();
  }
}

class _StudentUpdateState extends State<StudentUpdate> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(labelText: "Öğrenci Adı"),
                validator: null),
            TextFormField(
              decoration: const InputDecoration(labelText: "Öğrenci Soyadı"),
              validator: null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Notu"),
              validator: null,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Güncelle"))
          ],
        ),
      ),
    );
  }
}
