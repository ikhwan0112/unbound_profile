import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final String text1;
  final String text;
  const UserDetail({
    Key key,
    @required this.text,
    this.text1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              text1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF606060),
              ),
            ),
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF606060),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
