import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  theme:ThemeData(
    brightness:Brightness.dark,
    primaryColor:Colors.blueGrey,
    accentColor:Colors.blueGrey,
  ),
  home:MyApp(),

));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List();
  String data ="";

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   todos.add("note 1");
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text("ToDo App"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder:(BuildContext context, int index){
            return Card(
              elevation: 8,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6)),
              child: ListTile(title:Text(todos[index]),),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_sharp),
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text("Add ToDo"),
              content: TextField(onChanged: (String input) {data=input;},),
              actions: <Widget>[FlatButton(
                onPressed: (){
                  setState(() {
                    todos.add(data);});
                  Navigator.of(context).pop();
                },
                child: Text("Add"),
              )],

            );
          },);
        },),
    );
  }
}
