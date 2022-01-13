import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
 class CreditCardPage extends StatefulWidget{
   const CreditCardPage({Key? key}) : super(key: key);

   @override
   _CreditCardPageState createState() => _CreditCardPageState();
 }

class _CreditCardPageState  extends State<CreditCardPage>{
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber= creditCardModel.cardNumber;
      expiryDate= creditCardModel.expiryDate;
      cardHolderName= creditCardModel.cardHolderName;
      cvvCode= creditCardModel.cvvCode;
      isCvvFocused= creditCardModel.isCvvFocused;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Credit Card Input Exercise "),
      ),
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
              obscureCardCvv: true,
              obscureCardNumber: true,
              onCreditCardWidgetChange: (CreditCardBrand ) {  },
            ),
            Expanded(child: SingleChildScrollView(
              child:Column(
                children: [
                  CreditCardForm(cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: onCreditCardModelChange,
                      themeColor: Colors.blue,
                      formKey: formKey,
                    cardNumberDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'xxxx xxxx xxxx xxxx'
                    ),
                    expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expiry Date',
                        hintText: 'xx/xx'
                    ),
                    cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'xxx'
                    ),
                    cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          print('valid');
                        }
                        else{
                          print('invalid');
                  }
                  },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: const Text(
                            'Submit Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            package: 'flutter_credit_card'
                          ),
                        ),
                      ))
                ],
              ) ,))
          ],
        ),
      ),

    );
  }
}