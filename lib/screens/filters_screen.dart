import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteinFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String descrption,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(descrption),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    _gluteinFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters = {
              'gluten': _gluteinFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }, icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free',
                    'Only include gluten-free meals', _gluteinFree, (newValue) {
                      setState(() {
                        _gluteinFree = newValue;
                      });
                    }),
                _buildSwitchListTile('Lactose-Free',
                    'Only include lactose-free meals', _lactoseFree, (
                        newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile('Vegetarian',
                    'Only include vegetarian meals', _vegetarian, (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile('Vegan',
                    'Only include vegan meals', _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
