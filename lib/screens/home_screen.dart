import 'package:flutter/material.dart';

import '../data/products_data.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cartCount = 0;

  late List<Product> products;

  @override
  void initState() {
    super.initState();

    products = productsJson.map((json) => Product.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Catalog"),

        actions: [
          Padding(
            padding: const EdgeInsets.all(12),

            child: Badge(
              label: Text(cartCount.toString()),

              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search product",
                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                itemCount: products.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),

                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    product: product,

                    onTap: () async {
                      final result = await Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => DetailScreen(product: product),
                        ),
                      );

                      if (result == true) {
                        setState(() {
                          cartCount++;
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
