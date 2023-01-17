import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculate.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  Gender selectedGender;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                  clr: selectedGender == Gender.MALE
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: GenderCard(
                      gender: Gender.MALE.name, icon: FontAwesomeIcons.mars),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.FEMALE;
                  });
                },
                clr: selectedGender == Gender.FEMALE
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: GenderCard(
                    gender: Gender.FEMALE.name, icon: FontAwesomeIcons.venus),
              ))
            ],
          )),
          Expanded(
              child: ReusableCard(
            clr: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: numberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0X29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 250,
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                clr: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: null,
                          backgroundColor: Color(0xFF4C4F5E),
                          elevation: 6,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              weight = weight - 1;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        FloatingActionButton(
                          heroTag: null,
                          backgroundColor: Color(0xFF4C4F5E),
                          elevation: 6,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              weight = weight + 1;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                clr: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: labelTextStyle,
                    ),
                    Text(age.toString(), style: numberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: null,
                          backgroundColor: Color(0xFF4C4F5E),
                          elevation: 6,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              age = age - 1;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        FloatingActionButton(
                          heroTag: null,
                          backgroundColor: Color(0xFF4C4F5E),
                          elevation: 6,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              age = age + 1;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          // Expanded(
          GestureDetector(
              onTap: () {
                CalculateBMI calculateBMI =
                    CalculateBMI(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calculateBMI.calculateBMI(),
                              resultText: calculateBMI.getResult(),
                              resultDescription: calculateBMI.getDescription(),
                            )));
              },
              child: Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  height: bottomCardHeight,
                  child: Center(
                    child: Text(
                      'CALCULATE BMI',
                      style: bottomButtonTextStyle,
                    ),
                  )))
        ],
      ),
    );
  }
}
