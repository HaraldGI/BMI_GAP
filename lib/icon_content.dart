import 'package:flutter/material.dart';

class InfoCards extends StatelessWidget {
  InfoCards({@required this.farge, this.cardChild, this.onPress});
  // @required betyr at farge må spesifiseres.

  final Color farge;
  final Widget cardChild;
  final Function onPress;

  // final betyr at fargen som er spesifisert når man caller classen
  // ikke kan forandre seg.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: farge,
          // farge er spesifisert som Color.
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
