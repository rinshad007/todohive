import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todohive/data/databasetodo.dart';
import 'package:todohive/utilities/dilogbox.dart';
import 'package:todohive/utilities/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _mybox=Hive.box('mybox');
  Database db=Database();
  
  final _controller=TextEditingController();
  // List todoList=[
  //   ['Make tutorials',false],
  //   ['Hello world',false],
  //
  // ];
  @override
  void initState() {
    if(_mybox.get('TODOLIST')==null){
      db.createinitialdata();
    }
    else{
      db.loaddata();
    }
    super.initState();
  }

  void deletetask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updatedatabase();
  }
  void saveNewtask()
  {
    setState(() {
      db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();

  }

  void checkboxchanged(bool? value,int index){
    setState(() {
      db.todoList[index][1]=!db.todoList[index][1];
    });
    db.updatedatabase();
  }
  void createnewtask(){
    showDialog(context: context, builder: (context){
      return dialogbox(controller:_controller ,oncancel:()=>Navigator.of(context).pop(),onsave:saveNewtask ,);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: createnewtask,
        child: Icon(Icons.add),),
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Text('To Do'),
        elevation: 0,
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return TodoTile(
deletefun: (context) =>deletetask(index) ,
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) =>checkboxchanged(value, index) ,


        );
      },itemCount: db.todoList.length,
      )

    );
  }
}
