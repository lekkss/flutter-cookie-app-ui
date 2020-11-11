import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final images, prices;

  Category({this.images, this.prices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF545D68),
                  ),
                ),
                // FlatButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: Icon(
                //     null,
                //     color: Color(0xFF545D68),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'All Categories Listed',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFF17532)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            images[index],
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    subtitle: Text('\$${prices[index]}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
