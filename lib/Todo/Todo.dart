import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:async';
import 'dart:convert';

/// GET Api Sample ///
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(
      {required this.userId,
        required this.id,
        required this.title,
        required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"]);
  }
}

var logger = Logger();

Future<Todo> fetchTodo() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    dynamic body = json.decode(response.body);
    print('킷타');
    logger.d(body);
    return Todo.fromJson(body);
  } else {
    throw Exception('실패');
  }
}