import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  double _totalPrice = 0.0;

  List<CartItem> get items => _items;
  double get totalPrice => _totalPrice;

  void addToCart(String name, double price, String imageUrl) {
    int existingIndex = _items.indexWhere((item) => item.name == name);
    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(
        CartItem(name: name, price: price, imageUrl: imageUrl, quantity: 1),
      );
    }
    _updateTotalPrice();
    notifyListeners();
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    _updateTotalPrice();
    notifyListeners();
  }

  void updateItemQuantity(int index, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(index);
      return;
    }

    _items[index].quantity = newQuantity;
    _updateTotalPrice();
    notifyListeners();
  }

  void _updateTotalPrice() {
    _totalPrice = _items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void clearCart() {
    _items = [];
    _totalPrice = 0;
    notifyListeners();
  }
}
