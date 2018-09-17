import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:first_learn/siksha.dart';
import 'package:first_learn/item_list.dart';

void main() => runApp(MaterialApp(
  title: 'First Learn',
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/sonu041/SikshaContent/master/siksha.json";
  SikshaHub sikshaHub;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    sikshaHub = SikshaHub.fromJson(decodedJson);
    print(sikshaHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Learn'),
        backgroundColor: Colors.cyan,
      ),
      body: sikshaHub == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : GridView.count(
        crossAxisCount: 2,
        children: sikshaHub.learn
            .map((learn) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemList(
                        learn: learn,
                      )));
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(learn.img))),
                    ),
                    Text(
                      learn.name,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
        ))
            .toList(),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Developed By Shuvankar Sarkar',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Feedback'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Refresh pressed');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),*/
    );
  }
}
