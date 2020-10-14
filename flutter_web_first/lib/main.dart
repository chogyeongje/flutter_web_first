import 'package:flutter/material.dart';

void main() {
  runApp(FirstWebUI());
}

class FirstWebUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreyImageBackground(
        image: 'images/background.jpg',
        opacity: 0.5,
        appBar: WebAppBar(
          titleIcon: CircleIcon(
            iconData: Icons.airplanemode_active,
            iconSize: 30,
            padding: 10,
          ),
          title: 'Travelography',
          menus: ['Trips', 'Blog', 'Contact'],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Need travel Plans",
                  style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Text("Find out what's happening now in a city near you",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                child: Text(
                  'Yes! Show me the goodies',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'SUBSCRIBE', style: TextStyle(color: Colors.white,),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}

class GreyImageBackground extends StatelessWidget {

  final String image;
  final double opacity;
  final Widget appBar;
  final Widget body;

  const GreyImageBackground({
    Key key,
    this.image,
    this.opacity,
    this.appBar,
    this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image:
            DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(opacity),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            appBar,
            Expanded(
              child: body,
            )
          ],
        )
      ],
    );
  }
}

class WebAppBar extends StatelessWidget {

  final Widget titleIcon;
  final String title;
  final List<String> menus;

  const WebAppBar({
    Key key,
    this.titleIcon,
    this.title,
    this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          titleIcon,
          titleIcon == null ? SizedBox(width: 0,) : SizedBox(width: 10,),
          Text(
            title, style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (String menu in menus) ...[
                    FlatButton(
                      child: Text(
                        menu,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ]
                ],
              )
          )
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final double padding;

  const CircleIcon({Key key, this.iconData, this.iconSize, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(padding),
        child: Icon(
          iconData,
          color: Colors.black45,
          size: iconSize,
        ),
      ),
    );
  }
}
