import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/todo_list.dart';
import 'package:todoapp/screens/add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todoList.items.length,
                itemBuilder: (context, index) {
                  final item = todoList.items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(item),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          todoList.removeItem(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, AddTodoScreen.routeName);
              },
              icon: const Icon(Icons.add),
              label: const Text('Add ToDo'),
            ),
          ],
        ),
      ),
    );
  }
}
