class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;
  late String info;

  Student(this.firstName, this.lastName, this.grade);

  Student.withId(this.id, this.firstName, this.lastName, this.grade, this.info);

  String get getStatus {
    String massage = "";

    if (grade >= 70) {
      massage = "Geçti";
    } else if (grade >= 50) {
      massage = "Bütünleme";
    } else {
      massage = "Kaldı";
    }
    return massage;
  }
}
