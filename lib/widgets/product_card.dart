import 'package:flutter/material.dart';
import '../models/products.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.network(product.image,
                    fit: BoxFit.cover, height: 150)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$${product.price}',
                  style: const TextStyle(fontSize: 16, color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
