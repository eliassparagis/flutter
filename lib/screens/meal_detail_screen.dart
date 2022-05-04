import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-details';

  const MealDetailScreen();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String mealId = routeArgs['id'];
    final Meal meal = DUMMY_MEALS.where((meal) => meal.id == mealId).first;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Text(meal.complexity.toString()),
    );
  }
}
