
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

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
      body: notesList.isEmpty ? const Center(child: Text('No Notes..')) : ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                /// Update
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(51),bottom: Radius.circular(51)),
                    ),
                    context: context,
                    builder: (_){
                      return customBottomSheet(isUpdate: true, updateIndex: index);
                    }
                );
                
              },
              title: Text(notesList[index]['title'].toString()),
              subtitle: Text(notesList[index]['desc'].toString()),
              trailing: IconButton(
                  onPressed: (){
                    notesList.removeAt(index);
                    setState(() {

                    });
                  }, icon: const Icon(Icons.delete,color: Colors.red)
              ),
            );
          }) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleController.clear();
          descController.clear();
          
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(51),bottom: Radius.circular(51)),
            ),
              context: context,
              builder: (_){
                return customBottomSheet();
              }
          );
         
        },
        child: const Icon(Icons.add),
        
      ),
    );
  }
  
  
  
  /// Custom Function
  Widget customBottomSheet({bool isUpdate = false, int updateIndex = -1}){
    return Container(
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.vertical(top: Radius.circular(51),bottom: Radius.circular(51))
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isUpdate ? 'Update Notes' : 'Add Notes' ),
            TextField(
                controller: titleController,
                decoration: const InputDecoration()),
            const SizedBox(height: 20),
            TextField(
                controller: descController,
                decoration: const InputDecoration()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  if (!isUpdate){ /// not update 
                    notesList.add({
                      'title': titleController.text,
                      'desc': descController.text
                    });
                  }else{
                    /// Yes update 
                    notesList[updateIndex] = {
                      'title': titleController.text,
                      'desc': descController.text
                    };
                  }

                  setState(() {

                  });
                  Navigator.pop(context);
                }, child: Text(isUpdate ? 'Update Notes' : 'Add Notes')),

                ElevatedButton(onPressed: (){

                  setState(() {

                  });
                  Navigator.pop(context);
                }, child: const Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
