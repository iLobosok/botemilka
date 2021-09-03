import 'package:flutter/material.dart';
import '../Tools/Helper.dart';
class Counter extends StatelessWidget {
  final int stars;
  Counter({required this.stars});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Helper.getWidth(context: context, factor: 0.16),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text('Очки: ', style:TextStyle(fontSize: 15, color:Colors.black),),
              ),
              Container(
                child: Text('$stars'),
              )
            ],
          ),
        )
    );
  }
}