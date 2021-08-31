import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  TextEditingController value = new TextEditingController();
  String result = '';
  // var arr = new List(10);
  List<String> arr = [];

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter First Number",
                    hintText: "Enter First Number",
                  ),
                  controller: num1,
                )),
            new Text(
              result,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter 2nd number',
                  hintText: 'Enter 2nd number',
                ),
                controller: num2,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Text',
                  hintText: 'Enter Your Text',
                ),
                controller: value,
              ),
            ),
            RaisedButton(
                child: Text('submit'),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    arr.add(value.text);
                  });
                }),
            arr.isNotEmpty ? new Text(arr[index]) : Text('Empty'),
            RaisedButton(
                color: Colors.yellow[100],
                child: Text(
                  result.isEmpty ? 'ADD' : result,
                ),
                onPressed: () {
                  setState(() {
                    int sum = int.parse(num1.text) + int.parse(num2.text);
                    result = sum.toString();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
