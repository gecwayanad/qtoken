import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/hostque.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HostDetails extends StatefulWidget {
  @override
  _HostDetailsState createState() => _HostDetailsState();
}

class _HostDetailsState extends State<HostDetails> {

  TextEditingController nameOfOrg = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController nameque = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: nameOfOrg,
                decoration:InputDecoration(
                  labelText: "user organisation",

                ),
              ),
                TextFormField(
                  controller: discription,
                decoration:InputDecoration(
                  labelText: "discription",
                  
                )
                ),TextFormField(
                  controller: nameque,
                decoration:InputDecoration(
                  labelText: "name of que",
                  
                )
                ),
                RaisedButton(onPressed: ()async{
                  
                   DocumentReference ref = FirebaseFirestore.instance
                   .collection("organisations")
                   .doc("${nameOfOrg.text}");
                   ref.collection("que").doc(nameque.text).set({});
                   ref.set({
                     'name':'${nameOfOrg.text}',
                     'adress':'${discription.text}',
                     
                   },
                   
                   ).whenComplete((){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> HostQuePage(nameOforganiationtransfer: nameOfOrg.text,
                      nameOfQueTransfer: nameque.text,
                      )));
                   });
                  // User user = _auth.currentUser;
                  // try {
                  //    ref.doc("").set({
                  //   'name':'1',
                  //   'adress':'thacharuthodi'
                  // }).whenComplete((){
                  //   Navigator.push(context, MaterialPageRoute(builder: (_)=> HostQuePage()));
                  // });
                  // } catch (e) {
                  //   print(e);
                  // }

                },
                child: Text("submit"),
                )
              
              
            ],
          ),
        ),
      ),
    );
  }
}