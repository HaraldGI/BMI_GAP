import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  // Denne er false.
  // Gender sier at vi bruker enum.
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          // For å sentrere AppBar'en.
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // Expanded slik at hele raden fyller skjermen.
            child: Row(
              children: <Widget>[
                Expanded(
                  // Expanded slik at kortet fyller sin plass i raden i forhold
                  // til den andre raden.
                  // InfoCards er en class som returnerer Container med gitte
                  // parametre.
                  child: InfoCards(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    farge: selectedGender == Gender.male
                        // Hvis selectedGender == Gender.male er true skift til
                        // reusableCardColor, hvis ovenfor er false, skift til
                        // inactiveCardColor.
                        ? kReusableCardColor
                        : kInactiveCardColor,
                    cardChild: GenderChoice(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
                Expanded(
                  child: InfoCards(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    farge: selectedGender == Gender.female
                        ? kReusableCardColor
                        : kInactiveCardColor,
                    cardChild: GenderChoice(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InfoCards(
              farge: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kDigitNumber,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8DE98),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InfoCards(
                    farge: kReusableCardColor,
                  ),
                ),
                Expanded(
                  child: InfoCards(
                    farge: kReusableCardColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: kBottomBarColor,
            margin: kBottomBarMargin,
            width: kBottomBarWidth,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
