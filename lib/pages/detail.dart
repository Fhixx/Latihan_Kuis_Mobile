import 'package:flutter/material.dart';

import '../models/animals_data.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;

  const DetailPage({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      appBar: AppBar(
        backgroundColor: Colors.black45,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),

        title: Text(
          animal.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // IMAGE
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Image.network(
                animal.image,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
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

            const SizedBox(height: 18),

            // ANIMAL DETAILS
            const Text(
              'Animal Details:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Height : ${animal.height}',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF555555),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              'Weight : ${animal.weight}',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF555555),
              ),
            ),

            const SizedBox(height: 14),

            // ACTIVITIES
            const Text(
              'Animal Activities',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),

            const SizedBox(height: 6),

            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: animal.activities.map(
                (activity) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFF),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFFD8D1D8),
                      ),
                    ),
                    child: Text(
                      activity,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF555055),
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