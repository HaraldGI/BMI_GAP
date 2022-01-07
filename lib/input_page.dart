import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80;
const reusableCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomBarColor = Color(0xFFEB1555);
const bottomBarMargin = EdgeInsets.only(top: 50.0);
const bottomBarWidth = double.infinity;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          // For å sentrere AppBar'en.
          child: Text('BMI CALCULATOR TEST'),
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
                        ? reusableCardColor
                        : inactiveCardColor,
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
                        ? reusableCardColor
                        : inactiveCardColor,
                    cardChild: GenderChoice(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InfoCards(
                    farge: reusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InfoCards(
                    farge: reusableCardColor,
                  ),
                ),
                Expanded(
                  child: InfoCards(
                    farge: reusableCardColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: bottomBarColor,
            margin: bottomBarMargin,
            width: bottomBarWidth,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
