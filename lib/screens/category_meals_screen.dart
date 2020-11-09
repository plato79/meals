import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          affordability: categoryMeals[index].affordability,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
