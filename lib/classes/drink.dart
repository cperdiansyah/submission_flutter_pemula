import 'dart:convert';

class Drink {
  Drink({
    required this.name,
  });

  String name;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );

  /*Map<String, dynamic> toJson() => {
        "name": name,
      };*/
}

List<Drink> parseFood(String json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Drink.fromJson(json)).toList();
}
