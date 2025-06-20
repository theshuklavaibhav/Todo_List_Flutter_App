import 'package:todoapp/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController inputTask = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDO List',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 232, 21, 255),
      ),

      //--------------------Task Title------------------------|
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              'Task List',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            //|--------------------------------Input Field ---------------------------------|
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: inputTask,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Task'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            FloatingActionButton(
              
              onPressed: () {
                if (inputTask.text.trim().isNotEmpty) {
                  taskProvider.addTask(inputTask.text);
                  inputTask.clear();
                }
              },
              child: Icon(Icons.add),
            ),

            //|-------------------------- show tasks in the list view format---------------------------|
            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return ListTile(
                    title: Text(
                      task.task,
                      style: TextStyle(
                        decoration:
                            task.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),

                    tileColor: Color.fromARGB(173, 190, 190, 198),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 2,
                        color: Color.fromARGB(176, 43, 1, 106),
                      ),
                    ),

                    //|--------------------------Checkbox to Mark Task Done------------------------------|
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (_) {
                        taskProvider.toggleTask(index);
                      },
                    ),

                    //-------------------------Task Remove Button--------------------------------------------|
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        taskProvider.removeTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

