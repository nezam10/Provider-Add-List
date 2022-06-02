import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/providers/itemAddNotifier.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({Key? key}) : super(key: key);
  final String title = "Add Item";
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<ItemAddNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _itemNameController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(15.0), hintText: "Add Name"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: "Add Description"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () {
                if (_itemNameController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  postData.addItem(
                      _itemNameController.text, _descriptionController.text);
                  Navigator.pop(context);
                } else {
                  print("No Data");
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
