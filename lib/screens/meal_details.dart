import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.mealdata});
  final Meal mealdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detaylar"),
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(mealdata.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Card(
            child: Column(
              children: [
                Text(mealdata.name),
                Text("Malzemeler: ${mealdata.ingredients.toString()}"),
                Text("Puanlama: ${mealdata.rating}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
