import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class NumericComboLineBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;


  NumericComboLineBarChart(this.seriesList, {this.animate});
  factory NumericComboLineBarChart.withSampleData() {
    return new NumericComboLineBarChart(
      _createSampleData(),
      animate: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 20.0,
        margin: EdgeInsets.all(30.0),
        child: charts.NumericComboChart(seriesList,
            animate: animate,
            defaultRenderer: charts.LineRendererConfig(),
            customSeriesRenderers: [
              charts.BarRendererConfig(customRendererId: 'customBar')
            ]),
      ),
    );
  }
  static List<charts.Series<LinearSales, int>> _createSampleData() {

    final desktopSalesData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    final tableSalesData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    final mobileSalesData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: desktopSalesData,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tableSalesData,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: mobileSalesData),
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
