import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day4/chart_line.dart';

import 'Chart_blend.dart';
import 'Chart_circie.dart';
import 'Chart_json.dart';
import 'chart_line.dart';
import 'chart_rods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  final List _pagesclass = [
    StackedAreaLineChart.withSampleData(),
    GroupedFillColorBarChart.withSampleData(),
    DonutAutoLabelChart.withSampleData(),
    NumericComboLineBarChart.withSampleData(),
    Charts_json()
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    //read_json();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Chart'),
      ),
      body: _pagesclass.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.save),
              title: Text('Chart Line'),
              backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart),
              title: Text('Chart Rods'),
              backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Chart circle'),
              backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('Chart Blend'),
              backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.eject),
              title: Text('Chart Json'),
              backgroundColor: Colors.deepPurpleAccent),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}