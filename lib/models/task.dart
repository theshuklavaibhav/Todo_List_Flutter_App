class Task {
  String task;
  bool isDone;

  Task({required this.task, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
