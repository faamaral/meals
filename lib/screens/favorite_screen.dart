import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('Nenhuma refeição foi marcada como favorita'),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) => MealItem(meal: favoriteMeals[index]),
          );
  }
}
