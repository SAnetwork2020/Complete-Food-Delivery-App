import 'package:flutter/material.dart';
import 'package:food_delivery_app/colors.dart';

class SmallText extends StatelessWidget {
  SmallText({Key? key,
    required this.text,
    this.size = 12,
    this.color =  const Color(0xffccc7c5),
  }) : super(key: key);

  final String text;
  double size ;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
        )
    );
  }
}
