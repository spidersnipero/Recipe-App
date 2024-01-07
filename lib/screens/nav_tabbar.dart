import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/favs_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meal.dart';

class TabBarScreen extends ConsumerStatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);
  @override
  ConsumerState createState() {
    return _TabBarScreenState();
  }
}

class _TabBarScreenState extends ConsumerState<TabBarScreen> {
  int _currentScreen = 0;
  void setPage(int a) {
    setState(() {
      _currentScreen = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Categories();
    String title = "Categories";
    IconData favIcon = Icons.star_border;
    if (_currentScreen == 1) {
      final favs = ref.watch(favMeals);
      content = MealScreen(
        meals: favs,
      );
      title = "Favorites";
      favIcon = Icons.star;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: content,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          if (value == 0) {setPage(0)} else {setPage(1)}
        },
        currentIndex: _currentScreen,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(favIcon), label: 'Favorites'),
        ],
      ),
    );
  }
}
