import 'package:flutter/material.dart';

// สร้างคลาส Product และ ProductItem ถ้ายังไม่ได้สร้าง

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Grid'),
        ),
        body: CustomScrollView(
          slivers: [
            CustomSliverGrid(
              products: [
                Product(
                  id: 1,
                  brand: 'Action',
                  title: 'interstellar',
                  price: 200,
                  images: 'Interstellar-2014.jpg.webp',
                ),

                Product(
                  id: 2,
                  brand: 'Comedy',
                  title: 'ONE PIECE (2023) ',
                  price: 120,
                  images: 'ONE-PIECE-2023.webp',
                ),

                Product(
                  id: 3,
                  brand: 'Fantasy',
                  title: 'Puss in Boots',
                  price: 150,
                  images: 'Puss-in-Boots-The-Last-Wish-2022.webp',
                ),

                Product(
                  id: 4,
                  brand: 'Horror',
                  title: 'It Lives Inside (2023)',
                  price: 180,
                  images: 'It-Lives-Inside-2023.webp',
                ),
                // เพิ่มรายการผลิตภัณฑ์เพิ่มเติมตามต้องการ
              ],
            ),
            // เพิ่ม SliverAppBar หรือ SliverList ตามต้องการ
          ],
        ),
      ),
    );
  }
}

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductItem(product: products[index]);
          },
          childCount: products.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.73,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String brand;
  final String title;
  final double price;
  final String images;

  Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.price,
    required this.images,
  });
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.images),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.brand,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
