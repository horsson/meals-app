import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//
//  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            final selectedMeal = categoryMeals[index];
            return MealItem(
              title: selectedMeal.title,
              affordability: selectedMeal.affordability,
              complexity: selectedMeal.complexity,
              duration: selectedMeal.duration,
              imageUrl: selectedMeal.imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
