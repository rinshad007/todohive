import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deletefun;

   TodoTile({super.key, required this.taskName, required this.taskCompleted,required this.onChanged,required this.deletefun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.only(bottom:25 ,left: 25,top:25 ,right:25 ),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deletefun,
          icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),

          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black,
                  value: taskCompleted, onChanged: onChanged),
              Text(
                  taskName,style: TextStyle(decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none),),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
