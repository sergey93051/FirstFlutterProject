import "package:flutter/material.dart";
import "dart:math";
import "package:myProject/messagePage/messpage.dart";
import 'package:myProject/argumList.dart';
import 'package:myProject/dbList.dart';
import 'package:myProject/compose/compose.dart';

int countSocial = 0;

class SocialState extends StatefulWidget {
  @override
  _SocialStateState createState() => _SocialStateState();
}

class _SocialStateState extends State<SocialState> {
  List<Map<String, dynamic>> widgetsListitem;
  @override
  Widget build(BuildContext context) {
    widgetsListitem = [];
    newMessagesBox.map((value) {
      if (value["id"] % 2 == 0) {
        widgetsListitem.addAll({value});
      }
    }).toList();
    return Scaffold(
      body: _body(),
      floatingActionButton: _actionButton(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children:
            widgetsListitem.map<Widget>((item) => _bodymessage(item)).toList(),
      ),
    );
  }

  _bodymessage(Map<String, dynamic> item) {
    Color myHexColor2 = Color(colorlist[Random().nextInt(colorlist.length)]);
    String iconTitle = item["title"].substring(0, 1);
    countSocial = widgetsListitem.length;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Messpage.route,
            arguments: ScreenArguments(name: item["id"]));
      },
      child: Container(
        margin: EdgeInsets.only(top: 18, left: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: myHexColor2,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    iconTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            item["title"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            item["text"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 6, left: 6),
                  child: Text(
                    item["date"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton() {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Compose();
            },
          ),
        );
      },
      child: Image.asset("asset/03.jpg", width: 25, height: 25),
    );
  }
}
