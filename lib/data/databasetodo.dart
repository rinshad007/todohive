import 'package:hive/hive.dart';

class Database{

  List todoList=[];


  final _mybox=Hive.box('mybox');
  void createinitialdata(){
    List todoList=[
      ['make tutorials', false],
      ['do execises' ,false]

    ];
  }
  void loaddata(){
todoList=_mybox.get('TODOLIST');
  }

  void updatedatabase(){
    _mybox.put('TODOLIST', todoList);
  }
}