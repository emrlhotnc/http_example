import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo/data/data.api/category_api.dart';
import 'package:http_demo/modals/category.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];

  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: categoryWidgets),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getCategoriesFromApi() async {
    print('before resp');
    final response = await CategoryApi.getCategories();
    print('after response');
    setState(() {
      final list = json.decode(response.data);
      print(list);
      this.categories =
          list.map((category) => Category.fromJson(category)).toList();
      getCagtegoryWidgets();
    });
  }

  List<Widget> getCagtegoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCagtegoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCagtegoryWidget(Category category) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          category.products[0].productName,
          style: TextStyle(color: Colors.blueGrey),
        ));
    //  shape: RoundedRectangleBorder(
    //      borderRadius: BorderRadius.circular(15.0),
    //      side: BorderSide(color: Colors.lightGreenAccent)),
    //);
  }
}
