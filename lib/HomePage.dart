import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String _bankChoose;
  BankListDataModel _bankChoose;


  List<BankListDataModel> bankDataList=[
    BankListDataModel("SBI","https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png"),
    BankListDataModel("HDFC","https://www.pngix.com/pngfile/big/12-123534_download-hdfc-bank-hd-png-download.png"),
    BankListDataModel("ICICI","https://www.searchpng.com/wp-content/uploads/2019/01/ICICI-Bank-PNG-Icon-715x715.png"),
    //BankListDataModel("Canara","https://bankforms.org/wp-content/uploads/2019/10/Canara-Bank.png")
  ];
  @override
  void initState() {
    super.initState();
    _bankChoose = bankDataList[0];
  }
  void _onDropDownItemSelected(BankListDataModel newSelectedBank) {
    setState(() {
      _bankChoose = newSelectedBank;
    });
  }
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        body: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Container(
                  height: 40,width: 100,
                  color: Colors.amber,
                  child: Center(
                    child: RichText(

                      text:
                      TextSpan(
                         // U+20B9
                          text: '\u{20B9} ',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16,fontFeatures: [
                            FontFeature.superscripts()
                          ],
                          ),
                          children: <TextSpan>[
                      TextSpan(text: '1,500', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22),
                      )

                      ]
                    ),
                    ),
                  ),
                ),*/
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(12, 10, 20, 20),
                            // labelText: "hi",
                            // labelStyle: textStyle,
                            // labelText: _dropdownValue == null
                            //     ? 'Where are you from'
                            //     : 'From',
                            errorText: "Wrong Choice",
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<BankListDataModel>(

                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "verdana_regular",
                            ),
                            hint: Text(
                              "Select Bank",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                              ),
                            ),
                            items: bankDataList
                                .map<DropdownMenuItem<BankListDataModel>>(
                                    (BankListDataModel value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        new CircleAvatar(
                                          backgroundImage: new NetworkImage(
                                              value.bank_logo),
                                        ),
                                        // Icon(valueItem.bank_logo),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(value.bank_name),
                                      ],
                                    ),
                                  );
                                }).toList(),

                            isExpanded: true,
                            isDense: true,
                            onChanged: (BankListDataModel newSelectedBank) {
                              _onDropDownItemSelected(newSelectedBank);
                            },
                            value: _bankChoose,

                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class BankListDataModel{
  String bank_name;
  String bank_logo;
  BankListDataModel(this.bank_name,this.bank_logo);
}