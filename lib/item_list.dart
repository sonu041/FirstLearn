import 'package:flutter/material.dart';
import 'package:first_learn/item_details.dart';
import 'package:first_learn/siksha.dart';

class ItemList extends StatelessWidget {
  final Learn learn;
  ItemList({this.learn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(learn.name),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: learn.details
            .map((details) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        details: details,
                      )));
            },
            child: Hero(
              tag: details.alImg,
              child: Card(
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(details.alImg))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
