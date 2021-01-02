import "package:flutter/material.dart";
import 'package:myProject/argumList.dart';
import 'package:myProject/dbList.dart';
import "dart:math";

class Messpage extends StatefulWidget {
  static const route = "/messPage";
  @override
  _MesspageState createState() => _MesspageState();
}

class _MesspageState extends State<Messpage> {
  List<Map<String, dynamic>> widgetsList = [];
  @override
  Widget build(BuildContext context) {
    ScreenArguments argum = ModalRoute.of(context).settings.arguments;
    newMessagesBox.map((value) {
      if (value["id"] == argum.name) {
        widgetsList = [
          {
            "id": value["id"],
            "title": value["title"],
            "gmail": value["gmail"],
            "text": value["text"],
            "date": value["date"],
          }
        ];
      }
    }).toList();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 10.0,
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      actions: [
        IconButton(
          icon: Icon(
            Icons.move_to_inbox,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.delete_outline,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.email,
          ),
          onPressed: () {},
        ),
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Move to"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Snooze"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Change labels"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Mark important"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Mute"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Print"),
            ),
          ];
        }),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children:
            widgetsList.map<Widget>((item) => _itemMessage(item)).toList(),
      ),
    );
  }

  _itemMessage(Map<String, dynamic> item) {
    String myAdress = myAccountadress[0]["address"];
    Color myHexColor3 = Color(colorlist[Random().nextInt(colorlist.length)]);
    String iconGmail = item["gmail"].substring(0, 1);
    return Container(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.only(left: 13, top: 30, right: 25),
            child: Text(
              item["text"],
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 12, top: 25),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: myHexColor3,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    iconGmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 21,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Text(
                        item["gmail"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(-38.3, 4.0, 0.0),
                        child: PopupMenuButton(
                            child: Row(
                              children: [
                                Text(
                                  "to me",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  child: Text("from: ${item['gmail']}"),
                                ),
                                PopupMenuItem(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  child: Text("To: {$myAdress}"),
                                ),
                                PopupMenuItem(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  child: Text("date: ${item['date']} 2020"),
                                ),
                                PopupMenuItem(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  child: Text("Standart encryption(TLS)"),
                                ),
                              ];
                            }),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(left: 21),
                  child: Icon(
                    Icons.reply,
                    size: 40.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14, right: 2),
                  child: PopupMenuButton(itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        child: Text("Reply all"),
                      ),
                      PopupMenuItem(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        child: Text("Forward"),
                      ),
                      PopupMenuItem(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        child: Text("Add star"),
                      ),
                      PopupMenuItem(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        child: Text("Print"),
                      ),
                      PopupMenuItem(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        child: Text("Mark unread from here"),
                      ),
                      PopupMenuItem(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        child: Text("Block 'The Quora Team'"),
                      ),
                    ];
                  }),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
              ),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 40, left: 7, right: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: myHexColor3,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: 220,
                  ),
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    item["text"],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 105,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.reply,
                        size: 30,
                        color: Colors.grey,
                      ),
                      Text("Reply"),
                    ],
                  ),
                ),
                Container(
                  width: 105,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.reply_all,
                        size: 30,
                        color: Colors.grey,
                      ),
                      Text("Reply all"),
                    ],
                  ),
                ),
                Container(
                  width: 105,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.redo,
                        size: 30,
                        color: Colors.grey,
                      ),
                      Text("Forward"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
