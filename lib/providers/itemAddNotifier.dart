import 'package:flutter/material.dart';
import 'package:state_management_provider/model/item.dart';

class ItemAddNotifier extends ChangeNotifier{
  List<Item> itemList = [];

  addItem(String itemName, String description){
    Item item = Item(itemName, description);
    itemList.add(item);
    notifyListeners();
  }
}