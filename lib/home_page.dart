import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Eudeka! Flutter Basic'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: <Widget>[
            TextField(
              controller: editingController,
            ),
            RaisedButton(
              child: Text('CETAK'),
              onPressed: () {
                globalKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text(editingController.text),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}