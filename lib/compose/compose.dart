import "package:flutter/material.dart";

class Compose extends StatefulWidget {
  @override
  _ComposePageState createState() => _ComposePageState();
}

class _ComposePageState extends State<Compose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text(
        'Compose',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.attachment,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.send,
          ),
          onPressed: () {},
        ),
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Schedule send"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Add from Contacts"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Confidential mode"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Save draft"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Discard"),
            ),
            PopupMenuItem(
              textStyle: TextStyle(
                color: Colors.black,
              ),
              child: Text("Settings"),
            ),
          ];
        }),
      ],
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            margin: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "testtest2424@gmail.com",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Container(
                        child: Transform(
                          transform: Matrix4.translationValues(0.0, 13.0, 0.0),
                          child: Text(
                            "To",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Subject",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Compose email",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
