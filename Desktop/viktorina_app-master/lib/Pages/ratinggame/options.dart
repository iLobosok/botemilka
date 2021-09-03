import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:viktorina_app/Tools/Helper.dart';
import 'package:viktorina_app/Tools/constants.dart';
import 'package:viktorina_app/data/capital_of_countries.dart';
import 'package:viktorina_app/data/health.dart';
import 'package:provider/provider.dart';
import 'game.dart';

class RatingGameOptions extends StatefulWidget {
  @override
  _RatingGameOptionsState createState() => _RatingGameOptionsState();
}

class _RatingGameOptionsState extends State<RatingGameOptions> {
    bool countryByPicture = false;
    bool capitalOfCountries = false;
    bool countryByFlag = false;
    bool countryBySight = false;
    Random random = Random();
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.blueAccent,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
              children: [
          Container(
          decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/bg1.jpg'),
          fit: BoxFit.cover,
        ),
            ),
            child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
            ),
            ),
            Align(
              alignment: Alignment(0,0),
            child:Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                   Padding(
                     padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Выбери категорию',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: CheckboxListTile(
                        value: countryByPicture,
                        onChanged: (bool? val){
                          setState(() {
                            countryByPicture = val!;
                            print(countryByPicture);
                          });
                        },
                        title: Text(
                          'Страны по картинке',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Угадайте страну по картинке',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: CheckboxListTile(
                        value: countryBySight,
                        onChanged: (bool? val){
                          setState(() {
                            countryBySight = val!;
                          });
                        },
                        title: Text(
                          'Популярные места',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Угадайте страну по достопримечательности',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: CheckboxListTile(
                        value: countryByFlag,
                        onChanged: (bool? val){
                          setState(() {
                            countryByFlag = val!;
                          });
                        },
                        title: Text(
                          'Hello world',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Hello world description',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: CheckboxListTile(
                        value: capitalOfCountries,
                        onChanged: (bool? val){
                          setState(() {
                            capitalOfCountries = val!;
                          });
                        },
                        title: Text(
                          'Столицы стран',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Угадайте столицу страны по картинке',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {
                          context.read<Health>().setHealth();
                        int r = random.nextInt(CapitalOfCountries().b.length);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => GamePage(questionNumber: r, questionList: CapitalOfCountries().b)
                            )
                        );},
                        child: Text('Играть'),
                  ),
                ),
              ],
            ),
          ),
            ),
        ]),
      ),
    );
  }
}
