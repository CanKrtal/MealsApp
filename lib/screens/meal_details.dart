import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/fovarites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({super.key, required this.mealdata});
  final Meal mealdata;

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Detaylar"),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavorites(widget.mealdata);
              },
              icon: Icon(favorites.contains(widget.mealdata)
                  ? Icons.favorite
                  : Icons.favorite_border))
        ],
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(widget.mealdata.imageUrl),
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 4, // Kart yüksekliği
                  margin: const EdgeInsets.only(
                      top: 15, left: 10, right: 10), // Kartın dış boşluğu
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.mealdata.name,
                          style: const TextStyle(
                            fontSize: 20, // Başlık font büyüklüğü
                            fontWeight: FontWeight.bold, // Başlık font tipi
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Malzemeler: ${widget.mealdata.ingredients.toString()}",
                          style: const TextStyle(
                            fontSize: 16, // Malzemeler metni font büyüklüğü
                            color: Colors.black, // Malzeme metni rengi
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Puanlama: ${widget.mealdata.rating}",
                          style: const TextStyle(
                            fontSize: 16, // Puanlama metni font büyüklüğü
                            color: Colors.black, // Puan metni rengi
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Fiyat: ${widget.mealdata.price.toString()}₺",
                          style: const TextStyle(
                            fontSize: 16, // Malzemeler metni font büyüklüğü
                            color: Colors.black, // Malzeme metni rengi
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

      // body: Center(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 200,
      //           width: 200,
      //           alignment: Alignment.center,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(33),
      //             color: Colors.brown,
      //             image: DecorationImage(
      //                 image: NetworkImage(mealdata.imageUrl),
      //                 fit: BoxFit.cover),
      //           ),
      //         ),
      //       ),
      //       Card(
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 const SizedBox(height: 50),
      //                 Text(
      //                   mealdata.name,
      //                   style: const TextStyle(fontSize: 20),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   "Malzemeler\n${mealdata.ingredients.toString()}",
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //       Card(
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text("Puan: ${mealdata.rating}"),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
