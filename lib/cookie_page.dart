import 'package:cookie_app/cookie_detail.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CookiePage({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFCFAFB),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              // children: <Widget>[
              //   _buildCard('Cookie Mint', '\$3.99', 'assets/Daco_62023.png',
              //       true, false, context),
              //   _buildCard('Cookie Mint', '\$10.00', 'assets/Daco_1425780.png',
              //       false, true, context),
              //   _buildCard('Cookie Mint', '\$6.70', 'assets/Daco_1426667.png',
              //       false, true, context),
              //   _buildCard('Cookie Mint', '\$8.99', 'assets/Daco_4493811.png',
              //       true, false, context),
              // ],
              children: <Widget>[
                ...items.map(
                  (e) {
                    return _buildCard(
                      e['name'],
                      '\$${e['price']}',
                      e['image'],
                      e['added'],
                      e['favourite'],
                      context,
                    );
                  },
                ).toList()
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CookieDetails(
                assetPath: imgPath,
                cookiePrice: price,
                cookieName: name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5,
                )
              ],
              color: Colors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    isFavorite
                        ? Icon(Icons.favorite, color: Color(0XFFEF7532))
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0XFFEF7532),
                          )
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          imgPath,
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(
                price,
                style: TextStyle(color: Color(0XFFCC8053), fontSize: 14),
              ),
              Text(
                name,
                style: TextStyle(color: Color(0XFF575E67), fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Color(0XFFEBEBEB),
                  height: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (!added) ...[
                      Icon(
                        Icons.shopping_basket,
                        color: Color(0XFFD17E50),
                        size: 12,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Color(0XFFD17E50),
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (added) ...[
                      Icon(
                        Icons.remove_circle_outline,
                        color: Color(0XFfD17E50),
                        size: 12,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                          color: Color(0XFFD17E50),
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(0XFfD17E50),
                        size: 12,
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
