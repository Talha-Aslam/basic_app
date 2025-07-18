import 'package:basic_app/data/dummy_data.dart';
import 'package:basic_app/model/meal.dart';
import 'package:basic_app/screens/meal_Screen.dart';
import 'package:basic_app/widgets/category_grid_items.dart';
import 'package:flutter/material.dart';
import 'package:basic_app/model/category.dart';

class CatergoryScreen extends StatelessWidget {
  const CatergoryScreen({super.key, required this.ontoogleFavoriteMeal});
  final void Function(Meal meal) ontoogleFavoriteMeal;

  void onselectCategory(BuildContext context, Category category) {
    final filter_meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealScreen(
          ontoogleFavoriteMeal: ontoogleFavoriteMeal,
          title: category.title,
          meals: filter_meals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisExtent: 150,
          mainAxisSpacing:
              20), // Using SliverGridDelegateWithFixedCrossAxisCount to create a grid layout
      children: [
        // alternative to using a for loop
        // ...availableCategories.map((category) => CategoryGridItems(category: category)).toList
        // this will create a list of CategoryGridItems widgets from the availableCategories list and spread them into the children list of the GridView
        for (final category in availableCategories)
          CategoryGridItems(
            category: category,
            onSelectCategory: () => onselectCategory(context, category),
          ),
      ],
    );
  }
}
