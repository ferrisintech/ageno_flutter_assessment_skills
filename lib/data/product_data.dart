import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> categories = [
  {'name': 'Buty', 'icon': FontAwesomeIcons.shoePrints},
  {'name': 'Koszulki', 'icon': FontAwesomeIcons.shirt},
  {'name': 'Krawaty', 'icon': FontAwesomeIcons.userTie},
  {'name': 'Kapelusze', 'icon': FontAwesomeIcons.hatCowboy},
  {'name': 'Skarpety', 'icon': FontAwesomeIcons.socks},
];

final Map<int, List<Map<String, dynamic>>> categoryProducts = {
  0: [
    {'name': 'Nike Air Max', 'price': 349.99, 'imageUrl': 'assets/buty1.jpeg'},
    {
      'name': 'Adidas Superstar',
      'price': 299.99,
      'imageUrl': 'assets/buty2.jpeg',
    },
  ],
  1: [
    {'name': 'T-shirt Basic', 'price': 59.99, 'imageUrl': 'assets/shirt1.jpeg'},
    {
      'name': 'Polo Ralph Lauren',
      'price': 129.99,
      'imageUrl': 'assets/shirt2.jpeg',
    },
  ],
};
