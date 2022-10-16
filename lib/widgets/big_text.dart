import 'package:flutter/material.dart';
import 'package:food_delivery_app/colors.dart';

class BigText extends StatelessWidget {
  BigText({Key? key,
    required this.text,
    this.size = 20,
    this.color =  const Color(0xff332d2b),
  }) : super(key: key);
final String text;
double size ;
Color? color;
TextOverflow overflow = TextOverflow.ellipsis;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
        overflow: overflow,
        maxLines: 1,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
    )
    );
  }
}
