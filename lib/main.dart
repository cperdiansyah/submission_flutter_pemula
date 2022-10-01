import 'package:flutter/material.dart';
import 'package:submission_flutter_fundamental/resources/colors.dart';
import 'package:submission_flutter_fundamental/routes/routes.dart';
import 'package:submission_flutter_fundamental/screens/list_restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({required Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App Submission 1',
      theme: ThemeData(
        primaryColor: RestaurantAppColors.PRIMARY_COLOR,
      ),
      initialRoute: restaurantListRoute,
      routes: {
        restaurantListRoute: (context) => const ListRestaurant(),
      },
    );c
  }
}
