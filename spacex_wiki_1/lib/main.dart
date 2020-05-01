import 'package:flutter/material.dart';
import 'package:spacex_wiki/models/UpcomingLaunches.dart';

import 'Services/ApiService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: upcomingLaunchesWidget());
  }

  Widget upcomingLaunchesWidget() {
    return FutureBuilder<List<UpcomingLaunches>>(
      future: ApiService().getRequest('launches/upcoming'),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data.length == 0) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(snapshot.data[index].missionName),
                  subtitle: Text(snapshot.data[index].launchDateUtc
                      .toString()
                      .substring(0, 19)),
                )
              ],
            );
          },
        );
      },
    );
  }
}
