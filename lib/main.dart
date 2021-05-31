import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "flutter demo",
    home: Scaffold(
      appBar: AppBar(
        title: Text("List Shown"),
      ),
      body: (getListView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("calling");
        },
        child: Icon(Icons.add),
        tooltip: 'add one',
      ),
    ),
  ));
}

void ShowSnackBar(BuildContext context, String item) {
  var snackbar = SnackBar(
    content: Text("you tabbed $item"),
    action: SnackBarAction(
      onPressed: () {
        debugPrint('printing');
      },
      label: "UNDO",
    ),
  );
  // ignore: deprecated_member_use
  Scaffold.of(context).showSnackBar(snackbar);
}

List<String> getListElement() {
  var items = List<String>.generate(1000, (counter) => "Items $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElement();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        ShowSnackBar(context, listItems[index]);
      },
    );
  });
  return listView;
}