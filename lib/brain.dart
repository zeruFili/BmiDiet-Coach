import 'dart:math';

class Calc {
  Calc({required this.height, required this.weight, required this.bloodType});

  final int height;
  final int weight;
  final String bloodType;

  double _bmi = 0;

  String Bmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    String interpretation = '';

    if (_bmi >= 25) {
      interpretation =
          'You have a higher than normal body weight. Try to exercise more. ';

      // Add food suggestion based on blood type
      switch (bloodType) {
        case 'A':
        case 'A-':
        case 'A+':
          interpretation +=
              'Include more plant-based foods such as vegetables, legumes, and grains. Limit red meat and dairy.';
          break;
        case 'B':
        case 'B-':
        case 'B+':
          interpretation +=
              'Include a variety of foods such as meat, dairy, grains, and vegetables. Avoid processed foods.';
          break;
        case 'O':
        case 'O-':
        case 'O+':
          interpretation +=
              'Focus on a high-protein diet, including lean meat, fish, and vegetables. Limit grains and dairy.';
          break;
        case 'AB':
          interpretation +=
              'Include a balanced diet with a variety of foods, including meat, fish, dairy, grains, and vegetables.';
          break;
        default:
          interpretation += 'No specific recommendation for this blood type.';
          break;
      }
    } else if (_bmi > 18.5) {
      interpretation = 'You have a normal body weight. Good job!';

      // Add different recommendation based on blood type
      switch (bloodType) {
        case 'A':
        case 'A-':
        case 'A+':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as vegetables, fruits, whole grains, and lean proteins.';
          break;
        case 'B':
        case 'B-':
        case 'B+':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as fruits, vegetables, whole grains, and lean proteins.';
          break;
        case 'O':
        case 'O-':
        case 'O+':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as fruits, vegetables, whole grains, and proteins from both plants and animals.';
          break;
        case 'AB':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as fruits, vegetables, whole grains, lean proteins, and dairy products.';
          break;
        default:
          interpretation += ' No specific recommendation for this blood type.';
          break;
      }
    } else {
      interpretation =
          'You have a lower than normal body weight. You can eat a bit more.';

      // Add different recommendation based on blood type
      switch (bloodType) {
        case 'A':
        case 'A-':
        case 'A+':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as vegetables, fruits, whole grains, and proteins.';
          break;
        case 'B':
        case 'B-':
        case 'B+':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as fruits, vegetables, whole grains, and proteins.';
          break;
        case 'O':
        case 'O-':
        case 'O+':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as fruits, vegetables, whole grains, and proteins.';
          break;
        case 'AB':
          interpretation +=
              ' Include a balanced diet with a variety of foods such as fruits, vegetables, whole grains, lean proteins, and dairy products.';
          break;
        default:
          interpretation += ' No specific recommendation for this blood type.';
          break;
      }
    }

    return interpretation;
  }
}
