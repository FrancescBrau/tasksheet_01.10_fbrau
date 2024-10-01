import 'package:flutter/material.dart';
import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Product(
      name: 'Elegant Shirt',
      price: 49.99,
      description: 'A comfortable and stylish shirt, perfect for any occasion.',
      imagePath: 'images/camisa.jpg',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              product.imagePath,
              height: 350,
              width: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            product.name,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(product: product),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${product.name} - ${product.price}€',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
