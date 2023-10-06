// lib/models/api_models.dart
class HeartData {
  int age;
  int sex;
  int cp;
  int trestbps;
  int chol;
  int fbs;
  int restecg;
  int thalach;
  int exang;
  double oldpeak;
  int slope;
  int ca;
  int thal;

  HeartData({
    required this.age,
    required this.sex,
    required this.cp,
    required this.trestbps,
    required this.chol,
    required this.fbs,
    required this.restecg,
    required this.thalach,
    required this.exang,
    required this.oldpeak,
    required this.slope,
    required this.ca,
    required this.thal,
  });

  Map<String, dynamic> toJson() {
    return {
      "age": age,
      "sex": sex,
      "cp": cp,
      "trestbps": trestbps,
      "chol": chol,
      "fbs": fbs,
      "restecg": restecg,
      "thalach": thalach,
      "exang": exang,
      "oldpeak": oldpeak,
      "slope": slope,
      "ca": ca,
      "thal": thal,
    };
  }
}

class HeartScore {
  final double score;

  HeartScore({required this.score});

  factory HeartScore.fromJson(Map<String, dynamic> json) {
    return HeartScore(score: json['score']);
  }
}
