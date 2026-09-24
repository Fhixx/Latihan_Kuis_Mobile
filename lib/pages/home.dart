import 'package:flutter/material.dart';
import '../models/animals_data.dart';
import '../pages/login.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      appBar: AppBar(
        backgroundColor: Colors.black45,
        elevation: 0,
        title: Text(
          "Animal List",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
            context, 
              MaterialPageRoute(builder: (context)=>LoginPage()), 
              (route)=> false
            );
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
            ),
          )
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyAnimals.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          childAspectRatio: 0.82,
        ), 
        itemBuilder: (context, index) {
          final Animal animal = dummyAnimals[index];
          return AnimalCard(
            animal: animal,
          );
        },
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final Animal animal;

  const AnimalCard({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      color: const Color(0xFFFFF9FF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFFE0D8E0),
          width: 1,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =========================
            // IMAGE
            // =========================
            SizedBox(
              height: 92,
              width: double.infinity,
              child: Center(
                child: Image.network(
                  animal.image,
                  height: 92,
                  fit: BoxFit.contain,

                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    );
                  },

                  loadingBuilder: (
                    context,
                    child,
                    loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 6),

            // =========================
            // NAMA HEWAN
            // =========================
            Text(
              animal.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
              ),
            ),

            const SizedBox(height: 2),

            // =========================
            // TYPE
            // =========================
            Text(
              animal.type,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF9A929A),
              ),
            ),

            const SizedBox(height: 6),

            // =========================
            // HABITAT
            // =========================
            Wrap(
              spacing: 5,
              runSpacing: 4,
              children: animal.habitat.map(
                (habitat) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFF),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: const Color(0xFFD8D1D8),
                      ),
                    ),

                    child: Text(
                      habitat,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5F595F),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}