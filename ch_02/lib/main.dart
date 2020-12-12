import 'package:flutter/material.dart';
import 'utils/conver_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  double _numberFrom;
  double _result;
  String _startMeasure;
  String _convertedMeasure;
  String _resultMessage;

  @override
  void initState() {
    _numberFrom = 0;
    _result = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Measures Converter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Meassures Converter'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Value',
                    style: labelStyle,
                  ),
                  TextField(
                    style: inputStyle,
                    decoration: InputDecoration(
                      hintText: "Please insert the measure to be converted",
                    ),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberFrom = rv;
                        });
                      }
                    },
                  ),
                  Text(
                    'From',
                    style: labelStyle,
                  ),
                  DropdownButton(
                    isExpanded: true,
                    style: inputStyle,
                    value: _startMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onStartMeasureChanged(value);
                    },
                  ),
                  Text(
                    'To',
                    style: labelStyle,
                  ),
                  DropdownButton(
                    isExpanded: true,
                    style: inputStyle,
                    value: _convertedMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onConvertedMeasureChanged(value);
                    },
                  ),
                  RaisedButton(
                    child: Text('Convert', style: inputStyle),
                    onPressed: () => convert(),
                  ),
                  Text(
                    _resultMessage,
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void onStartMeasureChanged(String value) {
    setState(() {
      _startMeasure = value;
    });
  }

  void onConvertedMeasureChanged(String value) {
    setState(() {
      _convertedMeasure = value;
    });
  }

  void convert() {
    if (_startMeasure.isEmpty ||
        _convertedMeasure.isEmpty ||
        _numberFrom == 0) {
      return;
    }
    Conversion c = Conversion();
    double result = c.convert(_numberFrom, _startMeasure, _convertedMeasure);
    setState(() {
      _result = result;
      if (result == 0) {
        _resultMessage = 'This conversion cannot be performed';
      } else {
        _resultMessage =
            '${_numberFrom.toString()} $_startMeasure are ${_result.toString()} $_convertedMeasure';
      }
    });
  }
}

final TextStyle inputStyle = TextStyle(
  fontSize: 20,
  color: Colors.blue[900],
);

final TextStyle labelStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
);
