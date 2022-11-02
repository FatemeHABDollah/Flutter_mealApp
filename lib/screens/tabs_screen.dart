import 'package:flutter/material.dart';

import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: 'Categories',
              icon: Icon(Icons.category),
            ),
            Tab(
              text: 'Favorites',
              icon: Icon(Icons.star),
            ),
          ]),
        ),
        drawer: MainDrawer(),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoriteScreen(widget.favoriteMeals),
        ]),
      ),
    );
  }
}
