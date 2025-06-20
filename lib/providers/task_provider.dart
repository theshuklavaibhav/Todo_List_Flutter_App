import 'package:flutter/material.dart';

import 'package:todoapp/models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  // get tasks in a list

  List<Task> get tasks => _tasks;

  // add task in list

  void addTask(String title) {
    _tasks.add(Task(task: title));
    notifyListeners();
  }

  //------------Remove Task form list Event ----------------|

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
  
  //|---------Tasks Toogle event function --------------------|

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
