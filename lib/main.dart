import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/simple/custom_toolbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'extended_text_field demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('主页')),
        body: ListView(children: [
          ListTile(
            title: Text('Custom ToolBar'),
            onTap: () => Get.to<dynamic>(CustomToolBar()),
          ),
        ]),
      ),
    );
  }
}
