

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  double _finalResult = 0.0;
  int radioValue = 0;
  String _formattedText = "";
  bool flag=false;
  void weightInKg(){
    setState(() {
      flag=!flag;
      if(flag) _finalResult=_finalResult*0.454;
      else _finalResult=_finalResult/0.454;
      if(radioValue==0){
        _formattedText=" Your Weight on  Pluto is ${_finalResult.toStringAsFixed(1)}";
      }
      if(radioValue==1){
        _formattedText=" Your Weight on  Mars is ${_finalResult.toStringAsFixed(1)}";
      }
      if(radioValue==2){
       _formattedText= " Your Weight on  Pluto is ${_finalResult.toStringAsFixed(1)}";
      }

    });

  }

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText =
              " Your Weight on  Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              " Your Weight on  Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText =
              " Your Weight on  Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(6.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttons
                      new Radio<int>(
                          activeColor: Colors.white,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "pluto",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "mars",
                        style: new TextStyle(color: Colors.red),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(8.0)),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                   // new  Radio( groupValue: radioValue2, onChanged: ,value: radioValue2,),
                      RaisedButton(onPressed: weightInKg,
                      child:Text(" Your Weight in kg"),
                      ),
                    ],
                  ),
                  //Result text
                  new Padding(padding: EdgeInsets.all(24.0)),
                  new Text(
                    _weightController.text.isEmpty? "Please Enter your weight":(flag==false? _formattedText + "lbs":_formattedText+"KG"),

                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 19.5,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * (multiplier);
    } else {
      print("Wrong!!");
      return int.parse("180") * 0.38;
    }
  }
}
