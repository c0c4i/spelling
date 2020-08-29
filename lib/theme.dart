import 'package:flutter/material.dart';

class CustomColors {
  static Color primaryColor = const Color(0xFFED7E47);
  static Color customGreyNigthMode = const Color(0xff828282);
}

// idk these is all essential for the design because I copy from my other project Treninoo
class CustomTheme {
  static ThemeData defaultMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryColor,
    accentColor: CustomColors.primaryColor,
    buttonColor: CustomColors.primaryColor,
    iconTheme: IconThemeData(
      color: CustomColors.primaryColor,
    ),
    errorColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: CustomColors.primaryColor,
      shape: RoundedRectangleBorder(),
    ),
    hintColor: CustomColors.primaryColor,
    primaryTextTheme:
        TextTheme(body1: TextStyle(color: CustomColors.primaryColor)),
    cursorColor: CustomColors.primaryColor,
    textSelectionHandleColor: CustomColors.primaryColor,
    textTheme: TextTheme(
      display1: TextStyle(
        color: CustomColors.primaryColor,
        fontSize: 25,
      ),
      display2: TextStyle(fontSize: 25, color: Colors.white),
      display3: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    ),
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CustomColors.customGreyNigthMode,
    accentColor: CustomColors.customGreyNigthMode,
    focusColor: CustomColors.customGreyNigthMode,
    primaryTextTheme: TextTheme(body1: TextStyle(color: Colors.white)),
    scaffoldBackgroundColor: Color(0xff333333),
    iconTheme: IconThemeData(color: Colors.white),
    buttonColor: CustomColors.customGreyNigthMode,
    cursorColor: CustomColors.customGreyNigthMode,
    textSelectionHandleColor: CustomColors.customGreyNigthMode,
    textTheme: TextTheme(
      display1: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
      display2: TextStyle(fontSize: 25, color: Colors.white),
      display3: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    ),
  );
}
