import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:myProject/dbList.dart';
import 'package:myProject/drawerBody/primState.dart';
import 'package:myProject/drawerBody/Social.dart';
import 'package:myProject/drawerBody/promotions.dart';
import 'package:myProject/drawerBody/allmail.dart';

class MainPages extends StatefulWidget {
  static const route = "/";
  @override
  State<StatefulWidget> createState() {
    return _MainPagenew();
  }
}

class _MainPagenew extends State<MainPages> {
  int _itemIndex = 0;
  String _titlepage = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _appBar(),
        drawer: _drawerHeader(),
        body: _body(),
      ),
    );
  }

  Widget _appBar() {
    String iconTitleAccount = myAccountadress[0]["account"].substring(0, 1);
    Color myHexColor1 = Color(colorlist[Random().nextInt(colorlist.length)]);
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black54),
      toolbarHeight: 65.0,
      leadingWidth: 40.0,
      brightness: Brightness.light,
      title: Text(
        'Search mail',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            return _alertDialog(myHexColor1, iconTitleAccount);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: myHexColor1,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            margin: EdgeInsets.all(8),
            child: Text(
              "$iconTitleAccount",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _alertDialog(myHexColor1, iconTitleAccount) {
    var countmessage = newMessagesBox.length;
    return showDialog(
      useRootNavigator: true,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        content: Builder(
          builder: (context) {
            return Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: myHexColor1,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.only(top: 10, bottom: 0),
                            child: Text(
                              "$iconTitleAccount",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Transform(
                            transform:
                                Matrix4.translationValues(10.3, -18.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("$countmessage"),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                myAccountadress[0]['account'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                          Container(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              myAccountadress[0]['address'],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        child: Image.asset(
                          "asset/google.jpg",
                          width: 37,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Manage your Google Account",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.person_add_alt_1),
                        ),
                        Text(
                          "Add another account",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.engineering),
                        ),
                        Text(
                          "Manager account",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          ".",
                        ),
                        Text(
                          "Terms of Service",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _body() {
    switch (_itemIndex) {
      case 1:
        return PrimState();
        break;
      case 2:
        return SocialState();
        break;
      case 3:
        return PromotionsState();
        break;
      case 4:
        return Center(
          child: Column(
            children: [
              Image.asset("asset/01.jpg"),
              Text("Nothing in $_titlepage"),
            ],
          ),
        );
        break;
      case 5:
        return Center(
          child: Column(
            children: [
              Image.asset("asset/02.jpg"),
              Text("Nothing in $_titlepage"),
            ],
          ),
        );
        break;
      case 6:
        return Center(
          child: Column(
            children: [
              Image.asset("asset/02.jpg"),
              Text("Nothing in $_titlepage"),
            ],
          ),
        );
        break;
      case 7:
        return Center(
          child: Column(
            children: [
              Image.asset("asset/02.jpg"),
              Text("Nothing in $_titlepage"),
            ],
          ),
        );
        break;
      case 8:
        return Allmail();
        break;
      case 9:
        return Center(
          child: Column(
            children: [
              Image.asset("asset/02.jpg"),
              Text("Nothing in $_titlepage"),
            ],
          ),
        );
        break;
      default:
        return PrimState();
    }
  }

  Widget _drawerHeader() {
    return Drawer(
      elevation: 25.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: 295,
            height: 70.2,
            child: DrawerHeader(
              child: Text(
                'Gmail',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Column(
            children:
                newListTile.map<Widget>((item) => _drawerBody(item)).toList(),
          ),
        ],
      ),
    );
  }

  _drawerBody(Map<String, dynamic> item) {
    var countmessage2 = newMessagesBox.length;
    return Transform(
      transform: Matrix4.translationValues(0.0, -5, 0.0),
      child: ListTile(
        tileColor: item['id'] == 1 && _itemIndex == 1
            ? Color(0xFFFF6347)
            : item["id"] == 2 && _itemIndex == 2
                ? Color(0xFF4169E1)
                : item['id'] == 3 && _itemIndex == 3
                    ? Color(0xFF2E8B57)
                    : Color(0xFFFFFFFF),
        leading: Icon(item['icon']),
        title: Text(item['title']),
        subtitle: Align(
          alignment: Alignment.topRight,
          child: Transform(
            transform: Matrix4.translationValues(0.0, -15.0, 0.0),
            child: Text(
              item['id'] == 1
                  ? "$countprim"
                  : item['id'] == 2
                      ? "$countSocial"
                      : item['id'] == 3
                          ? "$countPromotions"
                          : item['id'] == 8 ? "$countmessage2" : '',
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop(
            setState(() {
              _itemIndex = item["id"];
              _titlepage = item["title"];
            }),
          );
        },
      ),
    );
  }
}
