import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settins.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen({required this.settings, required this.onSettingsChanged, Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem Glutén',
                'Exibe apenas refeições sem glutén',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactóse',
                'Exibe apenas refeições sem lactóse',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'Exibe apenas refeições veganas',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                'Vegatariana',
                'Exibe apenas refeições vegetarianas',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
