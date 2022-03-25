import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/todo_model.dart';
import 'package:http/http.dart' as http;

class ExploringTodosApi extends StatefulWidget {
  const ExploringTodosApi({Key? key}) : super(key: key);

  @override
  State<ExploringTodosApi> createState() => _ExploringTodosApiState();
}

class _ExploringTodosApiState extends State<ExploringTodosApi> {
  final List<Todos> _todos = [];
  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<List<Todos>> _fetchTodos() async {
    final http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      var parsedJson = jsonDecode(response.body.toString());

      for (Map<String, dynamic> json in parsedJson) {
        setState(() {
          _todos.add(
            Todos.fromJson(json),
          );
        });
      }
      return _todos;
    } else {
      throw Exception('Unable to load todos...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exploring Todos Api'),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text(_todos[index].id.toString()),
                title: Text(_todos[index].title),
                trailing: Icon(
                  Icons.check_box,
                  color: _todos[index].completed ? Colors.green : Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
