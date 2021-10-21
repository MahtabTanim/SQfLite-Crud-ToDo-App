import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  String _priority = 'Low';
  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat("MMM dd, yyyy");
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  DateTime _date = DateTime.now();

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "New Note",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        TextFormField(
                          autocorrect: false,
                          enableSuggestions: false,
                          maxLength: 100,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Enter Your Title Here",
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            labelText: "Title",
                          ),
                          textAlign: TextAlign.left,
                          validator: (value) {
                            if (value == null ||
                                value == "" ||
                                value.length <= 3) {
                              return "value must be > 3 characters";
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          onTap: _handleDatePicker,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "Date",
                              // border: InputBorder.none,
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              hintText: _dateFormatter.format(_date)),
                          textAlign: TextAlign.left,
                          validator: (value) {},
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField(
                          value: _priority,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _priority = value.toString();
                            });
                          },
                          items: _priorities.map((priority) {
                            return DropdownMenuItem(
                              value: priority,
                              child: Text(priority),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Material(
                              elevation: 2,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.white,
                              child: ElevatedButton(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("SUBMIT",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
