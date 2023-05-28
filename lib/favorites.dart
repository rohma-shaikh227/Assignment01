import 'dart:convert';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<String> myList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.favorite_outline_rounded),
        title: Text("Shared Pref Demo"),
      ),
      body: Container(
        color: Colors.orange[50],
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Card(
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                myList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 2,
              color: Colors.deepOrange,
            );
          },
          itemCount: myList.length,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadFavourites();
  }

  void loadFavourites() {
    setState(() {
      myList = [
        "Favourite 1",
        "Favourite 2",
        "Favourite 3",
      ];
    });
  }
}
