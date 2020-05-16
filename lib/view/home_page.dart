import 'package:flutter/material.dart';
import 'package:market_list/model/task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = List<Task>();
  TextEditingController _controller = TextEditingController();

  addItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        tasks.add(Task(task));
      });
    }
  }

  deleteItem(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Mercado'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 15),
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_shopping_cart, size: 20),
                hintText: 'Nova Tarefa',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _controller,
              onSubmitted: (String task) {
                addItem(task);
              },
            ),
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return buildList(tasks[index], index);
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget buildList(Task task, int index) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: IconButton(
          icon: Icon(
              task.checked ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.green),
          onPressed: () {
            setState(() {
              task.checked = true;
            });
          },
          iconSize: 30,
        ),
        title: Text(task.name, style: TextStyle(fontSize: 20)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteItem(index);
          },
          iconSize: 30,
        ),
      ),
    );
  }
}
