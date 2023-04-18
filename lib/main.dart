import 'package:flutter/material.dart';
import 'package:flutter_1/models/student.dart';
import 'package:flutter_1/screens/student_add.dart';
import 'package:flutter_1/screens/student_delete.dart';
import 'package:flutter_1/screens/student_update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  int _selectedBottomNavigationIndex = 0;
  int selectedTileIndex = -1;
  final List appBarTitles = [
    "Öğrenci Takip Sistemi",
    "Öğrenci Ekle",
    "Öğrenci Güncelle",
    "Öğrenci Sil"
  ];
  AppBar currentAppBar =
      AppBar(title: const Text("Öğrenci Bilgi Sistemi"), centerTitle: false);
  List students = [
    Student.withId(1, "Alin", "Tezcan", 100, "Derslerde dikkatli"),
    Student.withId(2, "Gülşah", "Ulutaş", 60, "Gelişmesi gerekli"),
    Student.withId(3, "Ali", "Acaroğlu", 25, "Bundan bir şey olmaz"),
    Student.withId(4, "Ahmet", "Mehmet", 45, "Gelişim gösteriyor"),
    Student.withId(5, "Örnek", "Öğrenci 1", 100, "Derslerde dikkatli"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: currentAppBar,
        body: selectBody(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedBottomNavigationIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Ana Sayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Ekle",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.update), label: "Güncelle"),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete),
                label: "Sil",
              ),
            ]));
  }

  buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                ListTile(
                  onTap: () => setState(() {
                    selectedTileIndex = index;
                  }),
                  tileColor: selectedTileIndex == index
                      ? Color.fromARGB(255, 145, 196, 238)
                      : Colors.white,
                  // ignore: prefer_const_constructors
                  leading: CircleAvatar(
                      // ignore: prefer_const_constructors
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png")),
                  title: Text(
                    students[index].firstName + " " + students[index].lastName,
                    style:
                        TextStyle(color: setNameColor(students[index].grade)),
                  ),

                  subtitle: Column(
                    children: [
                      Row(children: [
                        Text(
                            "Sınav Notu : ${students[index].grade}" " - " +
                                "${students[index].getStatus}",
                            style: TextStyle(
                                color: setNameColor(students[index].grade))),
                      ]),
                      Row(children: [Text("Bilgi : ${students[index].info}")])
                    ],
                  ),

                  // ignore: prefer_const_constructors
                  trailing: buildStatusIcon(students[index].grade),
                ),
                // ignore: prefer_const_constructors
                Divider(
                  height: 10,
                  color: Colors.black45,
                )
              ]);
            },
          ),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomNavigationIndex = index;
      currentAppBar =
          AppBar(title: Text(appBarTitles[_selectedBottomNavigationIndex]));
    });
  }

  selectBody() {
    if (_selectedBottomNavigationIndex == 0) {
      return buildBody();
    } else if (_selectedBottomNavigationIndex == 1) {
      return StudentAdd();
    } else if (_selectedBottomNavigationIndex == 2) {
      return StudentUpdate();
    } else if (_selectedBottomNavigationIndex == 3) {
      return StudentDelete();
    }
  }

  buildStatusIcon(int grade) {
    if (grade >= 70) {
      return const Icon(Icons.done);
    } else if (grade >= 50) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.clear);
    }
  }

  Color setNameColor(int grade) {
    if (grade >= 70) {
      return Colors.lightGreen;
    } else if (grade >= 50) {
      return Colors.lightBlue;
    } else {
      return const Color.fromARGB(255, 226, 102, 93);
    }
  }
}
