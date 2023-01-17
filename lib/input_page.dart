import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    child: ReusableCard(
                      clr: selectedGender == Gender.MALE
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderCard(
                          gender: Gender.MALE.name,
                          icon: FontAwesomeIcons.mars),
                    )),
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      child: ReusableCard(
                        clr: selectedGender == Gender.FEMALE
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: GenderCard(
                            gender: Gender.FEMALE.name,
                            icon: FontAwesomeIcons.venus),
                      )))
            ],
          )),
          Expanded(child: ReusableCard(clr: activeCardColor)),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(clr: activeCardColor)),
              Expanded(child: ReusableCard(clr: activeCardColor))
            ],
          )),
          // Expanded(
          Container(
            color: Colors.red,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 80,
          )
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  GenderCard({@required this.gender, @required this.icon});
  final String gender;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.clr, this.cardChild});
  final Color clr;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: cardChild,
      decoration:
          BoxDecoration(color: clr, borderRadius: BorderRadius.circular(10)),
    );
  }
}
