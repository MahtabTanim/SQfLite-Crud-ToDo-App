import 'package:flutter/material.dart';
import 'package:your_tasks/screens/add_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget getNotes(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: Column(
        children: [
          ListTile(
            title: const Text("Note Title"),
            subtitle: const Text("Aug 16 ,2021 - high"),
            trailing: Checkbox(
              activeColor: Colors.redAccent,
              onChanged: (value) {
                setState(() {});
              },
              value: false,
            ),
          ),
          const Divider(
            height: 4,
            thickness: 2.0,
            color: Colors.deepPurple,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()));
        },
        child: const Icon(
          Icons.add,
          size: 20,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 80),
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "My Notes",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "0 of 10 ",
                    style: TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }
          return getNotes(index);
        },
      ),
    );
  }
}
