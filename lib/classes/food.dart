import 'dart:convert';

class Food {
  Food({
    required this.name,
  });

  String name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
      );

  /*Map<String, dynamic> toJson() => {
        "name": name,
      };*/
}

List<Food> parseFood(String json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Food.fromJson(json)).toList();
}
