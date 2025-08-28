///Ang purpose ng program ay ma-calculate ang assignment score, midterm and final score para makita kung pasado ang grado ng isang estudyante
// Ang ginawa kong logic at pag lumagpas ng 100 ang score mag lalabas ng error messaga "FormatException", at kailangan ko mag declare ng double dahil ang score ay DOUBLE HAHAHAHA


import 'dart:io';

void main() {
  double passingGrade = 60.0;
  double maxScore = 100.0;
  double assignmentWeight = 0.2;
  double midtermWeight = 0.3;
  double finalExamWeight = 0.5;

  // import Student name
  stdout.write("Enter student's name: ");
  String studentName = stdin.readLineSync() ?? "Unknown";

  double getScore(String prompt) {
    stdout.write(prompt);
    try {
      double score = double.parse(stdin.readLineSync()!);

      // lahat ng i input na score bawal lumagpas ng 100 
      if (score < 0 || score > maxScore) {
        throw FormatException("Score must be between 0 and $maxScore.");
      }
      return score;
    } catch (e) {
      print("Invalid input: $e");
      exit(1);
    }
  }

  // import Score for assignments score, midterm score, final scores
  double assignmentScore = getScore("Enter Assignment score: ");
  double midtermScore = getScore("Enter Midterm score: ");
  double finalExamScore = getScore("Enter Final Exam score: ");

  //to calculate the final grade
  double finalGrade =
      (assignmentScore * assignmentWeight) +
      (midtermScore * midtermWeight) +
      (finalExamScore * finalExamWeight);

  //this is the result of grade report
  print("=== Student Grade Report ===");
  print("Student Name: $studentName");
  print("Assignment Score: ${assignmentScore.toStringAsFixed(1)}");
  print("Midterm Score: ${midtermScore.toStringAsFixed(1)}");
  print("Final Exam Score: ${finalExamScore.toStringAsFixed(1)}");
  print("Final Grade: ${finalGrade.toStringAsFixed(1)}");

  if (finalGrade >= passingGrade) {
    print("Result: Passed ");
  } else {
    print("Result: Failed ");
  }
}
