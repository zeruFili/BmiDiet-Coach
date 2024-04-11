import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  Reusable({required this.colored, this.card, onpress});
  final Color colored;
  final Widget? card;
  Function? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress as void Function()?,
      child: Container(
        child: card,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colored,
        ),
      ),
    );
  }
}
