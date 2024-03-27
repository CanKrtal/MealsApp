import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.mealdata});
  final Meal mealdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
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
                          mealdata.name,
                          style: const TextStyle(
                            fontSize: 20, // Başlık font büyüklüğü
                            fontWeight: FontWeight.bold, // Başlık font tipi
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Malzemeler: ${mealdata.ingredients.toString()}",
                          style: const TextStyle(
                            fontSize: 16, // Malzemeler metni font büyüklüğü
                            color: Colors.black, // Malzeme metni rengi
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Puanlama: ${mealdata.rating}",
                          style: const TextStyle(
                            fontSize: 16, // Puanlama metni font büyüklüğü
                            color: Colors.black, // Puan metni rengi
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
