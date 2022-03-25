import 'package:flutter/material.dart';

import 'pages/exploring_todos_api.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exploring todos Api in Flutter',
      theme: ThemeData.dark(),
      home: const ExploringTodosApi(),
    );
  }
}
