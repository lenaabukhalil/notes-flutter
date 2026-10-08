import "package:flutter/material.dart";

Color mainColor = Color(0xff5b5bd6);
Color bgColor = Color(0xfff6f7fb);
Color darkText = Color(0xff1b2140);
Color greyText = Color(0xff7a8099);
Color borderColor = Color(0xffdde1f0);

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: bgColor,
  colorScheme: ColorScheme.fromSeed(seedColor: mainColor, primary: mainColor),

  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),

  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1.3,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: darkText),
    bodySmall: TextStyle(fontSize: 12, color: greyText),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: greyText),
    prefixIconColor: greyText,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: mainColor, width: 1.5),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: Colors.white,
      minimumSize: Size(double.infinity, 50),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
);
