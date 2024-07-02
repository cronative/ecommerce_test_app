import 'package:ecommorce_test_app/models/products.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.network(product.image,
                    fit: BoxFit.cover, height: 300)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('\$${product.price}',
                  style: TextStyle(fontSize: 24, color: Colors.green)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(product.description, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
