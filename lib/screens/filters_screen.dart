import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTitle(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection ',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          _buildSwitchListTitle(
            'Gluten Free',
            'Only includes gluten-free meals',
            _glutenFree,
            (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          _buildSwitchListTitle(
            'Vegan',
            'Only includes Vegan meals',
            _vegan,
            (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
          _buildSwitchListTitle(
            'Vegetarian',
            'Only includes Vegetarian meals',
            _vegetarian,
            (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),
          _buildSwitchListTitle(
            'Lactose Free',
            'Only includes lactose-free meals',
            _lactoseFree,
            (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          Expanded(
            child: ListView(
              children: <Widget>[],
            ),
          )
        ],
      ),
    );
  }
}
