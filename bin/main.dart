// Implementing A
// Defining an interface (abstract class) named Role
abstract class Role {
  void displayRole();
}

// Implementing B
// Creating a class Person implementing the interface
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print("Role: Undefined");
  }

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}

// Implementing C
// Creating a class Student extending Person
class Student extends Person {
  int studentID;
  String grade;
  List<int> courseScores = [];

  Student(String name, int age, String address, this.studentID, this.grade)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  void addCourseScore(int score) {
    courseScores.add(score);
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// Implementing D
// Creating a class Teacher extending Person
class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void addCourseTaught(String course) {
    coursesTaught.add(course);
  }

  void displayCoursesTaught() {
    print("Courses Taught: ${coursesTaught.join(', ')}");
  }
}

// Implementing E
// Creating a class StudentManagementSystem
class StudentManagementSystem {
  static void main() {
    // Creating instances of Student and Teacher classes
    Student student = Student("John Doe", 20, "123 Main Street", 1001, "A");
    student.addCourseScore(90);
    student.addCourseScore(85);
    student.addCourseScore(82);

    Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St", 2001);
    teacher.addCourseTaught("Math");
    teacher.addCourseTaught("English");
    teacher.addCourseTaught("Bangla");

    // Displaying Student Information
    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName()}");
    print("Age: ${student.getAge()}");
    print("Address: ${student.getAddress()}");
    print("Average Score: ${student.calculateAverageScore().toStringAsFixed(1)}");

    // Displaying Teacher Information
    print("\nTeacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName()}");
    print("Age: ${teacher.getAge()}");
    print("Address: ${teacher.getAddress()}");
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}