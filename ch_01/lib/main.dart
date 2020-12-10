import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World Travel Title",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World Travel App"),
          backgroundColor: Colors.purple,
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Hello World Travel',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Discover the World',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                        height: 350,
                      ),
                    ),
                    RaisedButton(
                      child: Text('Contact us'),
                      onPressed: () => contactUs(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void contactUs(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at hello@world.com'),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'))
          ],
        );
      });
}
