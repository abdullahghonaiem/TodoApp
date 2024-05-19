import 'package:flutter/material.dart';

import 'addTask.dart';
import 'editTask.dart';

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List<Task> tasks = []; // List to store tasks

  // Function to add task to the list
  void addTask(String task) {
    setState(() {
      tasks.add(Task(name: task));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 123,
                decoration: const BoxDecoration(
                  color: Color(0XFF3556AB),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/ProfilePic.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Abdallah',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            'Abdullahghonaiem@gmail.com',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Go Pro');
                },
                child: Container(
                  height: 116,
                  decoration: const BoxDecoration(color: Color(0XFFCDE53D)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 28.0,
                          left: 26.0,
                        ),
                        child: Image.asset(
                          'images/Prize.png',
                          width: 53.1,
                          height: 40.89,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Go Pro (No Ads)',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0XFF071D55),
                                  fontFamily: 'Roboto'),
                            ),
                            Text(
                              'No fuss, no ads, for only \$1 a ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF071D55),
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Text(
                              'month',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF071D55),
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 66.11,
                            height: 71,
                            color: const Color(0XFF071D55),
                            child: const Center(
                                child: Text(
                              '\$1',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0XFFF2C94C),
                                  fontFamily: 'Roboto'),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    Task task = tasks[index]; // Get the current task

                    return SizedBox(
                      width: 382,
                      height: 91,
                      child: Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: ListTile(
                            leading: InkWell(
                              onTap: () {
                                setState(() {
                                  task.isCompleted = !task
                                      .isCompleted; // Toggle completion state
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: task.isCompleted
                                          ? const Color(0xFF49C25D)
                                          : const Color(0XFF071D55),
                                      width: 1.5),
                                  color: task.isCompleted
                                      ? const Color(0XFF53DA69)
                                      : null,
                                ),
                                child: task.isCompleted
                                    ? const Icon(Icons.check,
                                        size: 20, color: Color(0XFF399649))
                                    : null,
                              ),
                            ),
                            title: Text(
                              task.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: task.isCompleted
                                    ? Colors.grey
                                    : const Color(0XFF071D55), // grey when completed
                              ),
                            ),
                            trailing: InkWell(
                              onTap: () async {
                                final updatedTask = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit_Task(
                                          initialTaskName: tasks[index].name)),
                                );
                                if (updatedTask != null) {
                                  setState(() {
                                    tasks[index].name = updatedTask;
                                  });
                                }
                              },
                              child: Container(
                                width: 51,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: const Color(0XFF071D55)),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Color(0XFF071D55),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0XFF123EB1), // border color
              width: 3.0,
            ),
          ),
          child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () async {
                final task = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Add_Task()),
                );
                // Check if a task was returned
                if (task != null) {
                  print('Task added: $task');
                  addTask(task);
                }
              },
              backgroundColor: const Color(0XFF3556AB),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ));
  }
}
