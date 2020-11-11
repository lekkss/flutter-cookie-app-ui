import 'package:cookie_app/categories.dart';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class CookieDetails extends StatelessWidget {
  final assetPath, cookiePrice, cookieName;

  CookieDetails({this.assetPath, this.cookiePrice, this.cookieName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Cookie',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0XFFF17532),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Hero(
            tag: assetPath,
            child: Image.asset(
              assetPath,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              cookiePrice,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFF17532)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              cookieName,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFF17532)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                'Cold, creamy ice cream sandwiched between delicious delicacies that atstes so good and is very affordable',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFFB4B8B9),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0XFFF17532),
              ),
              child: Center(
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Category(),
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
