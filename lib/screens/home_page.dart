import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../constants/pp_colors.dart';
import '../data/product_data.dart';
import '../provider/cart_provider.dart';
import '../widget/product_card.dart';
import 'cart_modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int columnCount = 2;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CartModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentProducts = categoryProducts[_selectedIndex] ?? [];

    return Scaffold(
      body: Container(
        color: AppColors.white70,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          children: [
            SizedBox(height: 60),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Georgia",
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(categories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () => _onTabSelected(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color:
                                _selectedIndex == index
                                    ? Colors.black
                                    : Colors.white,
                            border: Border.all(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow:
                                _selectedIndex == index
                                    ? [
                                      const BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(0, 4),
                                      ),
                                    ]
                                    : [],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                categories[index]['icon'],
                                color:
                                    _selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                  color:
                                      _selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: AnimationLimiter(
                child: Container(
                  color: Colors.blueGrey[50],
                  child:
                      currentProducts.isEmpty
                          ? Center(
                            child: Text(
                              'Brak produktów w tej kategorii',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          )
                          : GridView.count(
                            padding: EdgeInsets.only(bottom: 10),
                            shrinkWrap: true,
                            crossAxisCount: columnCount,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7,
                            children: List.generate(
                              currentProducts.length,
                              (index) => AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: columnCount,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: ProductCard(
                                      imageUrl:
                                          currentProducts[index]['imageUrl']!,
                                      name: currentProducts[index]['name'],
                                      price: currentProducts[index]['price'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: () => _showCartModal(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Icon(Icons.shopping_cart),
                    label: Text(
                      'Koszyk ${cart.totalPrice.toStringAsFixed(2)} zł',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
