import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts_json extends StatefulWidget {
  @override
  _Charts_jsonState createState() => _Charts_jsonState();
}

class _Charts_jsonState extends State<Charts_json> {

  List<SalesData> chartData = [];

  Future<String> _loadSalesDataAsset() async {
    return await rootBundle.loadString('json/sale.json');
  }
  Future loadSalesData() async {
    String jsonString = await _loadSalesDataAsset();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      for(Map i in jsonResponse) {
        chartData.add(SalesData.fromJson(i));
      }
    });
  }
  @override
  void initState() {
    super.initState();
    loadSalesData();
  }
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Chart Form Json'),
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;

  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['year'].toString(),
      parsedJson['sales'] as double,
    );
  }
}
