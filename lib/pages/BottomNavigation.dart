import 'package:flutter/material.dart';
import 'package:nikaat/json/JsonParser.dart';
import 'package:nikaat/pages/Login.dart';
import 'package:nikaat/pages/Picture_from_Gallery.dart';

class BattomNavigation extends StatefulWidget {
  @override
  _BattomNavigationState createState() => _BattomNavigationState();
}

class _BattomNavigationState extends State<BattomNavigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  Tab tab(String text, Icon icon) {
    return Tab(
      icon: icon,
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          Container(child: JsonParser(),),
          Container(child: Picture(),),
          Container(
            child: Login(),
          ),
        ],
        controller: controller,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TabBar(
          indicatorColor: Colors.black,
          controller: controller,
          tabs: <Widget>[
            tab("News", Icon(Icons.list)),
            tab("Photo", Icon(Icons.photo_size_select_actual)),
            tab("Login", Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
