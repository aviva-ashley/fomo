import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class FomoAppBar extends AppBar {
  FomoAppBar() : super(
    centerTitle: true,
    title: Text('FOMO')
  );
}

class FomoEventCard extends Card {
  FomoEventCard(title) : super(
    child: Container(
      width: 175,
      child: Text(title)
    )
  );
}

class FomoEventCategory extends Column {
  FomoEventCategory(String title, List<FomoEventCard> events) : super(
    children: <Widget> [
      Padding(child: FomoEventCategoryHeader("Featured"), padding: EdgeInsets.only(top: 10.0)),
      Padding(child: FomoEventCardRow(events), padding:EdgeInsets.only(top: 10.0))
    ]
  );
}

class FomoEventCategoryHeader extends Row {
  FomoEventCategoryHeader(title) : super (
    children: <Widget> [
      FomoEventCategoryHeaderTitle("Featured"),
      Expanded(child: Container()),
      FomoViewAllButton()
    ],
    crossAxisAlignment: CrossAxisAlignment.end
  );
}

class FomoViewAllButton extends Container {
  FomoViewAllButton() : super (
    child: Text("View All >",
      style: TextStyle(
        color: Color(0xFF30302f),
        fontSize: 13.0,
        fontFamily: 'Raleway Heavy',
        fontWeight: FontWeight.w500,
      )
    )
  );
}

class FomoEventCategoryHeaderTitle extends Container {
  FomoEventCategoryHeaderTitle(title) : super (
    child: Text(title,
      style: TextStyle(
        color: Color(0xFF30302f),
        fontSize: 20.0,
        fontFamily: 'Raleway Heavy',
        fontWeight: FontWeight.w900,
      )
    )
  );
}

class FomoEventCardRow extends Container {
  FomoEventCardRow(List<FomoEventCard> events) : super(
    child : ListView(
      scrollDirection: Axis.horizontal,
      children: events
    ),
    height: 150.0
  );
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    List<FomoEventCard> events = [
      FomoEventCard("Taylor Swift"),
      FomoEventCard("Elvis Presly"),
      FomoEventCard("USH"),
      FomoEventCard("AFTM"),
      FomoEventCard("Josh Turner")
    ];
    return Scaffold(
      appBar: FomoAppBar(),
      body: Padding(padding: EdgeInsets.only(left:20.0, right:20.0, bottom:10.0),
        child: ListView(
          children: <Widget>[
            FomoEventCategory("Featured", events),
            FomoEventCategory("Featured", events),
            FomoEventCategory("Featured", events),
            FomoEventCategory("Featured", events),
          ],
        )
      )
    );
  }
}
