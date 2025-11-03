import 'package:calculator_app/widget/buildButton.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}
class _CalculatorPageState extends State<CalculatorPage> {

  String _output = '0';
  String _input = '0';
  String _ope = '0';
  double _num1 = 0;
  double _num2 = 0;

  void ButtonPress(String value){
    print(value);
    setState(() {
      if(value == 'C'){
        _input = '0';
        _output = '0';
        _ope = '';
        _num1 = 0;
        _num2 = 0;
      }else if(value == '='){
        _num2 = double.parse(_input);
        if(_ope == '+'){
          _output = (_num1+_num2).toString();
        }else if(_ope == '-'){
          _output = (_num1-_num2).toString();
        }else if(_ope == '*'){
          _output = (_num1*_num2).toString();
        }else if(_ope == '/'){
          _output = ( _num2 !=0) ? (_num1/_num2).toString(): 'Error';
        }
        _input = _output;
      }else if(['+','-','*','/',].contains(value)){
        _num1 = double.parse(_input);
        _ope = value;
        _input = '';
      }else{
        if(_input == '0'){
          _input = value;
        }else{
          _input += value;
        }
        _output = _input;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(25),
              child: Text(
                _output,
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              buildButton(onClick: ()=>ButtonPress('7'), text: '7',),
              buildButton(onClick: ()=>ButtonPress('8'), text: '8',),
              buildButton(onClick: ()=>ButtonPress('9'), text: '9',),
              buildButton(onClick: ()=>ButtonPress('/'),text: '/',color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              buildButton(onClick: ()=>ButtonPress('4'), text: '4',),
              buildButton(onClick: ()=>ButtonPress('5'), text: '5',),
              buildButton(onClick: ()=>ButtonPress('6'), text: '6',),
              buildButton(onClick: ()=>ButtonPress('*'), text: '*',color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              buildButton(onClick: ()=>ButtonPress('1'), text: '1',),
              buildButton(onClick: ()=>ButtonPress('2'), text: '2',),
              buildButton(onClick: ()=>ButtonPress('3'), text: '3',),
              buildButton(onClick: ()=>ButtonPress('-'), text: '-',color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              buildButton(onClick: ()=>ButtonPress('C'), text: 'C',color: Colors.red,),
              buildButton(onClick: ()=>ButtonPress('0'), text: '0',),
              buildButton(onClick: ()=>ButtonPress('='), text: '=',color: Colors.green,),
              buildButton(onClick: ()=>ButtonPress('+'), text: '+',color: Colors.orange,),
            ],
          ),
        ],
      ),
    );
  }
}

