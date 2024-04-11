import 'package:flutter/material.dart';
import 'brain.dart';

const TextStyle stylea = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class Result extends StatelessWidget {
  final String bmi;
  final String result;
  final String inter;
  Result(this.bmi, this.result, this.inter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculated Result'),
          backgroundColor: Color(0xFF1D1E33),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 15,
            ),
            Text('Your Result', style: stylea),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1E33),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 24.0),
                      ),
                      Text(
                        bmi,
                        style: stylea,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Text(
                          inter,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(color: Color(0xFFEB1555)),
                height: 80.0,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 15),
                child: Center(
                  child: Text(
                    'RE-Calaculate',
                    style: stylea,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
