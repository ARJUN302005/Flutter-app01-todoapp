import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_02_todolist/tasklist.dart';
import 'package:app_02_todolist/tasktile.dart';

class Taskspage extends StatefulWidget {
  const Taskspage({super.key});

  @override
  State<Taskspage> createState() => _TaskspageState();
}

class _TaskspageState extends State<Taskspage> {
  Color filledcolor = const Color.fromARGB(255, 100, 97, 97);
  TextEditingController taskcontroller = TextEditingController();
  void addtask() {
    tasklist.add({"task": taskcontroller.text, "done": false});
  }

  void removetask(int index) {
    setState(() {
      tasklist.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasklist.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "ToDoList",
            style: GoogleFonts.italiana(
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Tasktile(
                    remove: () {
                      removetask(index);
                    },
                    task: tasklist[index]["task"],
                    isdone: tasklist[index]["done"],
                    onchanged: (value) {
                      setState(() {
                        tasklist[index]["done"] = value!;
                      });
                    },
                  );
                },
              ),
            ),

            // Align(
            //   alignment: AlignmentGeometry.xy(-0.5, 3),
            // child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,

                  child: TextField(
                    controller: taskcontroller,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        filledcolor = const Color.fromARGB(255, 128, 127, 127);
                      });
                    },

                    decoration: InputDecoration(
                      hintText: "Enter Task...",
                      filled: true,

                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700,
                      ),

                      suffixIcon: Icon(
                        Icons.task,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      fillColor: filledcolor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addtask();
                      taskcontroller.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(14),
                    ),
                    elevation: 10,
                    backgroundColor: const Color.fromARGB(255, 57, 56, 56),
                  ),
                  child: Icon(
                    Icons.add_task,
                    size: 30,
                    color: const Color.fromARGB(255, 241, 240, 240),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
