import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> notesList = [];
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notesList[index]['title'].toString()),
                    subtitle: Text(notesList[index]['desc'].toString()),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          if (titleController.text.isNotEmpty && descController.text.isNotEmpty){
            notesList.add({
              'title': titleController.text,
              'desc': descController.text
            });
            
          }
          
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
