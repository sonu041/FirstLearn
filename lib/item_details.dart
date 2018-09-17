import 'package:flutter/material.dart';
import 'package:first_learn/siksha.dart';

class ItemDetails extends StatelessWidget {
  final Details details;
  ItemDetails({this.details});

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        //height: MediaQuery.of(context).size.height - 20.0,
        width: MediaQuery.of(context).size.width - 20.0,
        left: 10.0,
        //top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
//                    Text(
//                      details.text,
//                      style: TextStyle(
//                          fontSize: 18.0, fontWeight: FontWeight.bold),
//                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(details.objImg),
                        ),
                      ),
                    ),
                  ],
                ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                            details.description,
//                            style: new TextStyle(
//                              fontSize: 40.0,
//                              fontFamily: 'Roboto',
//                              //color: new Color(0xFF26C6DA),
//                            )
//                        ),
//                      ],
//                    ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    details.description,
                    style: TextStyle(
                        fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: details.alImg,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(details.alImg)),
              ),
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text(details.text),
      ),
      body: bodyWidget(context),
    );
  }
}
