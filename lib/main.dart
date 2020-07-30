import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Calculator'),
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

  String output = "0";

  String newoutput ="0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    
    if(buttonText == "CLEAR"){

      newoutput ="0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    }else if(buttonText == "+" || buttonText=="-" || buttonText=="/" || buttonText=="*"){

      num1 = double.parse(output);
      operand = buttonText;
      newoutput = "0";

    }else if(buttonText == "."){

      if(newoutput.contains(".")){
        print("Already Contains a decimal");
        return;
      }else{
        newoutput = newoutput + buttonText;
      }

    }else if(buttonText == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        newoutput = (num1+num2).toString();
      }else if(operand == "-"){
        newoutput = (num1-num2).toString();
      }else if(operand == "/"){
        newoutput = (num1/num2).toString();
      }else if(operand == "*"){
        newoutput = (num1*num2).toString();
      }
      num1= 0.0;
      num2=0.0;
      operand = "";

    }else{
      newoutput = newoutput + buttonText;
    }

    print(output);

    setState(() {
      output = double.parse(newoutput).toString();
    });

  }

  Widget buildButton(String buttonText){
    return Expanded(
      child: new MaterialButton(
      padding: new EdgeInsets.all(24.0),
      child: new Text(buttonText,
      style: TextStyle(
        fontSize: 20
        ),
      ),
      onPressed:()=>
        buttonPressed(buttonText)
      ,
      color: Colors.pink[300],
      textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: new Text(output,style: TextStyle(
              fontSize:50,
              fontWeight: FontWeight.bold,
              ),)
          ),

          new Expanded(
            child: new Divider(),
          ),

          new Column(
            children: [
              new Row(
                children:[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ]), 
                new Row(
                children:[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*")
                ]), 
                new Row(
                children:[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ]), 
                new Row(
                children:[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("+")
                ]), 
                new Row(
                children:[
                  buildButton("CLEAR"),
                  buildButton("=")
                ]), 
            ]),
        ],),
      )
    );
  }
}
