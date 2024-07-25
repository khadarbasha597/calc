import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';
  String expression = '';
  double numOne = 0;
  double numTwo = 0;
  String result = '';
  String operator = '';
  String previousOperator = '';

  Widget calcButton(String buttonText, Color buttonColor, Color textColor) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(buttonText),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 35, color: textColor),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        expression = '';
        displayText = '0';
        numOne = 0;
        numTwo = 0;
        result = '';
        operator = '';
        previousOperator = '';
      } else if (buttonText == 'DEL') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
        if (result.isNotEmpty) {
          result = result.substring(0, result.length - 1);
          displayText = result.isEmpty ? '0' : result;
        }
      } else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
        if (numOne == 0) {
          numOne = double.parse(result);
        } else {
          numTwo = double.parse(result);
        }

        if (operator == '+') {
          result = (numOne + numTwo).toString();
        } else if (operator == '-') {
          result = (numOne - numTwo).toString();
        } else if (operator == 'x') {
          result = (numOne * numTwo).toString();
        } else if (operator == '/') {
          result = (numOne / numTwo).toString();
        }

        previousOperator = operator;
        operator = buttonText;
        displayText = result;
        expression += ' $buttonText ';
        result = '';
      } else if (buttonText == '=') {
        if (numOne != 0 && numTwo == 0) {
          numTwo = double.parse(result);
        }

        if (operator == '+') {
          result = (numOne + numTwo).toString();
        } else if (operator == '-') {
          result = (numOne - numTwo).toString();
        } else if (operator == 'x') {
          result = (numOne * numTwo).toString();
        } else if (operator == '/') {
          result = (numOne / numTwo).toString();
        }

        previousOperator = operator;
        operator = '';
        numOne = 0;
        numTwo = 0;
        expression = '';
        displayText = result;
      } else if (buttonText == '.') {
        if (!result.contains('.')) {
          result += '.';
        }
        displayText = result;
        expression += buttonText;
      } else if (buttonText == '+/-') {
        if (result.startsWith('-')) {
          result = result.substring(1);
        } else {
          result = '-' + result;
        }
        displayText = result;
      } else if (buttonText == '%') {
        result = (double.parse(result) / 100).toString();
        displayText = result;
        expression = displayText;
      } else {
        result += buttonText;
        displayText = result;
        expression += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      expression,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      displayText,
                      style: TextStyle(color: Colors.white, fontSize: 80),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('7', Colors.grey, Colors.white),
                calcButton('8', Colors.grey, Colors.white),
                calcButton('9', Colors.grey, Colors.white),
                calcButton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('4', Colors.grey, Colors.white),
                calcButton('5', Colors.grey, Colors.white),
                calcButton('6', Colors.grey, Colors.white),
                calcButton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('1', Colors.grey, Colors.white),
                calcButton('2', Colors.grey, Colors.white),
                calcButton('3', Colors.grey, Colors.white),
                calcButton('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10), backgroundColor: Colors.grey,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () => onButtonPressed('0'),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                calcButton('.', Colors.grey, Colors.white),
                calcButton('DEL', Colors.grey, Colors.black),
                calcButton('=', Colors.amber, Colors.white),

              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
