import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Edit_Task extends StatelessWidget {
  final String initialTaskName;
  final TextEditingController textFieldController;

  Edit_Task({required this.initialTaskName})
      : textFieldController = TextEditingController(text: initialTaskName);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0XFF3556AB),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Edit Task',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                color: Colors.white,
                shadows: [
                  Shadow(

                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 380,
                  height: 69,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9.0),
                    child: TextField(
                      controller: textFieldController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0XFFCBCBCB),
                          ),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: Container(
                      width: 335,
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF3556AB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                              color: Colors.black, // Border color
                              width: 2.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, textFieldController.text);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
