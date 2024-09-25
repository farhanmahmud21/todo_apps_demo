import 'package:flutter/material.dart';
import './to_do.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<To_Do> to_do = [To_Do('Farhan', 'WORK', false)];
  TextEditingController _titleEdController = TextEditingController();
  TextEditingController _DescriptionController = TextEditingController();

  GlobalKey<FormState> todoForm = GlobalKey<FormState>();

  void show_sheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Form(
            key: todoForm,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Add New To DO '),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _titleEdController,
                    decoration: const InputDecoration(
                        label: Text('Title'),
                        hintText: 'Title',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 10, color: Colors.black))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _DescriptionController,
                    decoration: const InputDecoration(
                        label: Text('Description'),
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 10, color: Colors.black))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Ente your description';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (todoForm.currentState!.validate()) {
                        to_do.add(To_Do(_titleEdController.text.trim(),
                            _DescriptionController.text.trim(), false));

                        _titleEdController.clear();
                        _DescriptionController.clear();
                        Navigator.pop(context);
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: const Text("Add"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To Do App',
          style: TextStyle(),
        ),
        backgroundColor: Colors.tealAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mounted) {
            show_sheet();
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: to_do.length,
          itemBuilder: (context, index) =>
              //
              ListTile(
                onLongPress: () {
                  if (mounted) {
                    setState(() {});
                  }

                  to_do[index].isDone = !to_do[index].isDone;
                },
                leading: Visibility(
                    visible: to_do[index].isDone,
                    replacement: const Icon(Icons.close),
                    child: const Icon(Icons.done_outline_outlined)),
                title: Text(to_do[index].title),
                subtitle: Text(to_do[index].description),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {});
                      to_do.removeAt(index);
                    },
                    icon: const Icon(Icons.delete)),
              )),
    );
  }
}
