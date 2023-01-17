import 'package:bmi_calculator/resusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultDescription});
  final String bmiResult;
  final String resultText;
  final String resultDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result ',
                  style: resultTitleTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  clr: activeCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          resultText,
                          style: resultTextStyle,
                        ),
                        Text(
                          bmiResult.toString(),
                          style: resultBMITextStyle,
                        ),
                        Text(
                          resultDescription,
                          textAlign: TextAlign.center,
                          style: resultDescTextStyle,
                        )
                      ]),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    height: bottomCardHeight,
                    child: Center(
                      child: Text(
                        'RE-CALCULATE BMI',
                        style: bottomButtonTextStyle,
                      ),
                    )))
          ],
        ));
  }
}
