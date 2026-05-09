import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tasktile extends StatefulWidget {
  const Tasktile({
    required this.remove,
    required this.onchanged,
    required this.task,
    required this.isdone,
    super.key,
  });
  final String task;
  final bool isdone;
  final Function(bool?) onchanged;
  final void Function() remove;

  @override
  State<Tasktile> createState() => _TasktileState();
}

class _TasktileState extends State<Tasktile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 400,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color.fromARGB(255, 133, 138, 235),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 37, 11, 62),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.isdone,
                onChanged: widget.onchanged,
                shape: CircleBorder(side: BorderSide(color: Colors.black)),
              ),
              Expanded(
                child: Text(
                  widget.task,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 241, 240, 241),
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    decoration: widget.isdone == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.remove();
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: const Color.fromARGB(255, 113, 93, 211),
                ),
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: const Color.fromARGB(255, 111, 16, 9),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
