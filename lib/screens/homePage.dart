import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gofashion/model/testjs.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future fetchNotes()async{
    var url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));
    var noteJson = <Note>[];
    if(response.statusCode == 200){
      var notes = json.decode(response.body);
      for(var noteJson in notes){

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
