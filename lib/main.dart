// import 'dart:js';

import 'package:cookie_app/bottom_bar.dart';
import 'package:cookie_app/categories.dart';
import 'package:cookie_app/cookie_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Map<String, dynamic>> _list = [
    {
      "name": "Cookie Mint",
      "price": "3.99",
      "image": "assets/Daco_62023.png",
      "added": false,
      "favourite": true,
    },
    {
      "name": "Cookie Mint",
      "price": "5.09",
      "image": "assets/Daco_1425780.png",
      "added": true,
      "favourite": false,
    },
    {
      "name": "Cookie Mint",
      "price": "20",
      "image": "assets/Daco_1426667.png",
      "added": false,
      "favourite": true,
    },
    {
      "name": "Cookie Mint",
      "price": "8",
      "image": "assets/Daco_4493811.png",
      "added": true,
      "favourite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Pickup',
          style: TextStyle(fontSize: 20.0, color: Color(0xFF545D68)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[
          SizedBox(height: 15),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0XFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45),
            unselectedLabelColor: Color(0XFFCDCDCD),
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Cookies',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              Tab(
                child: Text(
                  'Ice Cream',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              Tab(
                child: Text(
                  'Cookie Cake',
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 40,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                CookiePage(items: _list),
                CookiePage(items: _list),
                CookiePage(items: _list)
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Category(
                images: _list.map((e) => e['image']).toList(),
                prices: _list.map((e) => e['price']).toList(),
              ),
            ),
          );
        },
        backgroundColor: Color(0XFFF17532),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
