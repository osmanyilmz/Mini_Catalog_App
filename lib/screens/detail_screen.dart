import 'package:flutter/material.dart';

import '../models/product_model.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.network(
            product.image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  product.title,

                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(product.description, style: const TextStyle(fontSize: 18)),

                const SizedBox(height: 20),

                Text(
                  "\$${product.price}",

                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to cart")),
                      );

                      Navigator.pop(context, true);
                    },

                    child: const Text("Add To Cart"),
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
