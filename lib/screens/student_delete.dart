import 'package:flutter/material.dart';

class StudentDelete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentDeleteState();
  }
}

class _StudentDeleteState extends State<StudentDelete> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Öğrenciyi silmek istediğinizden emin misiniz?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Evet")),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    child: const Text("Hayır")),
                const SizedBox(
                  width: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
