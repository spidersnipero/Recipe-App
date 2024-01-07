import 'package:flutter/material.dart';

class MealItemMeataData extends StatelessWidget {
  const MealItemMeataData({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 201, 201, 201)),
        ),
      ],
    );
  }
}
