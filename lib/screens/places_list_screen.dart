import 'package:flutter/material.dart';
import 'package:mapsnaps/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
  builder: (ctx, greatPlaces, ch) {
    return greatPlaces.items.isEmpty
        ? Center(child: const Text('Got no place yet, Start adding some!'))
        : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(
                  greatPlaces.items[i].image,
                ),
              ),
              title: Text(greatPlaces.items[i].title),
              onTap: () {
                // Handle the onTap action here
              },
            ),
          );
  },
),

    );
  }
}
