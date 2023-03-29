import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  return runApp(SpecialDatesCellCustomization());
}

class SpecialDatesCellCustomization extends StatefulWidget {
  @override
  BlackoutDates createState() => BlackoutDates();
}

class BlackoutDates extends State<SpecialDatesCellCustomization> {
  late List<DateTime> _specialDates;

  @override
  void initState() {
    _specialDates = <DateTime>[
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().add(const Duration(days: 3)),
      DateTime.now().add(const Duration(days: 6)),
      DateTime.now().add(const Duration(days: 7)),
      DateTime.now().add(const Duration(days: -2)),
      DateTime.now().add(const Duration(days: -3)),
      DateTime.now().add(const Duration(days: -6)),
      DateTime.now().add(const Duration(days: -7))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Card(
            margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.single,
              monthViewSettings:
              DateRangePickerMonthViewSettings(specialDates: _specialDates),
              cellBuilder: cellBuilder,
            )),
      ),
    );
  }

  Widget cellBuilder(BuildContext context, DateRangePickerCellDetails details) {
    DateTime visibleDates = details.date;
    if (isSpecialDate(visibleDates)) {
      return Column(
        children: [
          Text(
            details.date.day.toString(),
            textAlign: TextAlign.center,
          ),
          const Divider(
            color: Colors.white,
            height: 5,
          ),
          const Icon(
            Icons.celebration,
            size: 13,
            color: Colors.red,
          ),
        ],
      );
    } else {
      return Container(
        child: Text(
          details.date.day.toString(),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  bool isSpecialDate(DateTime date) {
    for (int j = 0; j < _specialDates.length; j++) {
      if (date.year == _specialDates[j].year &&
          date.month == _specialDates[j].month &&
          date.day == _specialDates[j].day) {
        return true;
      }
    }
    return false;
  }
}