import 'dart:async';

import 'package:a_tpa/models/non_video_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowListVideo extends StatefulWidget {
  @override
  _ShowListVideoState createState() => _ShowListVideoState();
}

class _ShowListVideoState extends State<ShowListVideo> {
// Explicit

  Firestore firestore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<NonVideoModel> nonVideoModels = [];

// Method

  @override
  void initState() {
    super.initState();
    readFirestore();
  }

  Future<void> readFirestore() async {
    CollectionReference collectionReference = firestore.collection('NonVideo');
    subscription = await collectionReference.snapshots().listen((response) {
      snapshots = response.documents;
      for (var snapshot in snapshots) {
        String nameVideo = snapshot.data['Name'];
        String detailVideo = snapshot.data['Detail'];
        String pathImage = snapshot.data['PathImage'];
        String pathVideo = snapshot.data['PathVideo'];

        NonVideoModel nonVideoModel =
            NonVideoModel(nameVideo, detailVideo, pathImage, pathVideo);
        setState(() {
          nonVideoModels.add(nonVideoModel);
        });

        // print('$pathVideo');

      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 180.0,
      height: 120.0,
      child: Image.network(
        nonVideoModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              nonVideoModels[index].name,
              style: TextStyle(fontSize: 24.0, color: Colors.orange[900]),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(nonVideoModels[index].detail),
          )
        ],
      ),
    );
  }

  Widget myDevider() {
    return Divider(
      height: 5.0,
      color: Colors.grey[600],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: nonVideoModels.length,
        itemBuilder: (context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    showImage(index),
                    showText(index),
                  ],
                ),
                myDevider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
