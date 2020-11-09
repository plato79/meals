import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) => Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );

  Widget buildContainer(Widget child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                ),
              ),
              buildSectionTitle(
                context,
                'Ingredients',
              ),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(
                context,
                'Steps',
              ),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '# ${index + 1}',
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      if (index + 1 != selectedMeal.steps.length) Divider()
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
