import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen();

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0, // is the default configure if different index is needed
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
              tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Categories',
              ),
          ],
        )
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(),
        ],),
      ),
    );
  }
}
