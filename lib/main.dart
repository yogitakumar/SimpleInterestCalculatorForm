import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutterproject.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:MyHomePage(),
      //home:firstflutter(),
      home: SimpleInterest(),
    );
  }
}

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  var _formKey = GlobalKey<FormState>();

  var _currencies = ['£', "\$", 'Rs'];
  var _cureentCurrency = '';
  String _displayResult = '';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cureentCurrency = _currencies[0];
  }

  void _onDropDownItemSelected(String newSelectedCurrency) {
    setState(() {
      this._cureentCurrency = newSelectedCurrency;
    });
  }

  String _calculateSI() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * roi * term) / 100;

    String result =
        'Total amount after $term years with $roi rate is $totalAmount $_cureentCurrency';
    return result;
  }

  void _resetAll() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    _displayResult = '';
    _cureentCurrency = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("Simple Interest Calculator"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: AssetImage('images/saving.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    controller: principalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter principal amount';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        hintText: 'Enter principal amount',
                        errorStyle:
                            TextStyle(color: Colors.yellowAccent, fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    controller: roiController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter rate of interest';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Rate Of Interest',
                        hintText: 'In percent',
                        errorStyle:
                            TextStyle(color: Colors.yellowAccent, fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          controller: termController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter term in years';
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'In years',
                              errorStyle: TextStyle(
                                  color: Colors.yellowAccent, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _cureentCurrency,
                          onChanged: (String newSelectedCurrency) {
                            _onDropDownItemSelected(newSelectedCurrency);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text(
                            'Calculate',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this._displayResult = _calculateSI();
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: RaisedButton(
                          child: Text(
                            'Reset',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              _resetAll();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    _displayResult,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
