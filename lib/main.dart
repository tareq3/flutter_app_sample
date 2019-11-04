import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: <Widget>[Header(), Title(), ActionButtons(), textSection],
        ),
      ),
    );
  }

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      height: 200,
      width: 600,
      fit: BoxFit.cover,
      image: NetworkImage(
          "https://www.atlasandboots.com/wp-content/uploads/2019/05/feat-image-1-most-beautiful-mountains-in-the-world.jpg"),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Kanderstage Switzerland',
                style: TextStyle(fontSize: 13, color: Colors.black45),
              ),
            ],
          ),
          Spacer(
            flex: 4,
          ),
          _FavoriteWidget()
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _button(Icons.call, "CALL"),
        _button(Icons.near_me, "ROUTE"),
        _button(Icons.share, "SHARE"),
      ],
    );
  }

  Widget _button(IconData icon, String txt) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        Text(
          '$txt',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class _FavoriteWidget extends StatefulWidget {
  @override
  __FavoriteWidgetState createState() => __FavoriteWidgetState();
}

class __FavoriteWidgetState extends State<_FavoriteWidget> {
  bool _isFavourate = true;
  int _counter = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: (_isFavourate ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.orange,
          onPressed: () {
            _toggleFavorite();
          },
        ),
        SizedBox(width: 18, child: Text("$_counter")),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if(_isFavourate){
        _isFavourate=false;
        _counter=40;
      }else{
        _isFavourate=true;
        _counter=41;
      }
    });
  }
}
