import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePageJoine extends StatefulWidget {
  String organiisationNameToShow;
  String queueNameToShow;
  HomePageJoine({this.organiisationNameToShow, this.queueNameToShow});
  @override
  _HomePageJoineState createState() => _HomePageJoineState();
}

class _HomePageJoineState extends State<HomePageJoine> {
  @override
  Widget build(BuildContext context) {

    DocumentReference _reference = FirebaseFirestore.instance.collection('organisation').doc(widget.organiisationNameToShow);
    return Scaffold(
      appBar: AppBar(
        title: Text("joined ques"),

      ),
      body:  Container(
          child: StreamBuilder(
            stream: _reference.snapshots(),
            builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
              return ListView.builder( 
              itemCount: snapshot.hasData?snapshot.data.data().length:0,
              itemBuilder: (_, index){


                return Card(
                  
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(30),
                      // color: Colors.grey[200],
                    ),
                    margin: EdgeInsets.all(1),
                    // height: 200,
                    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                          child: Column(
                                            
                          
                          children: [
                            Text(snapshot.data[index].id, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
                            color: Colors.black
                            
                            ),),
                            SizedBox(height: 10,),
                            Text(snapshot.data[index].id, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, 
                            color: Colors.black87
                            
                            ),),

                          ],
                        ),
                      ),
                    ),
                  ),
                            );
              }
              );
            }
          ),
        )
    );
  }
}