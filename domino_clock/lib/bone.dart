import 'package:flutter/material.dart';

final tileWeights = [
  [
    false, false, false, // 0
    false, false, false,
    false, false, false,
    false, false, false,
    false, false, false,
    false, false, false,
  ],
  [
    false, false, false, // 1
    false, false, false,
    false, false, false,
    false, false, false,
    false, true, false,
    false, false, false,
  ],
  [
    false, false, false, // 2
    false, true, false,
    false, false, false,
    false, false, false,
    false, true, false,
    false, false, false,
  ],
  [
    false, false, false, // 3
    false, true, false,
    false, false, false,
    true, false, false,
    false, false, false,
    false, false, true,
  ],
  [
    true, false, false, // 4
    false, false, false,
    false, false, true,
    true, false, false,
    false, false, false,
    false, false, true,
  ],
  [
    true, false, false, // 5
    false, false, false,
    false, false, true,
    true, false, false,
    false, true, false,
    false, false, true,
  ],
  [
    true, false, false, // 6
    false, true, false,
    false, false, true,
    true, false, false,
    false, true, false,
    false, false, true,
  ],
  [
    true, false, false, // 7
    false, true, false,
    false, false, true,
    true, false, true,
    false, false, false,
    true, false, true,
  ],
  [
    true, false, true, // 8
    false, false, false,
    true, false, true,
    true, false, true,
    false, false, false,
    true, false, true,
  ],
  [
    true, false, true, // 9
    false, false, false,
    true, false, true,
    true, false, true,
    false, true, false,
    true, false, true,
  ],
  [
    true, false, true, // 10
    false, true, false,
    true, false, true,
    true, false, true,
    false, true, false,
    true, false, true,
  ],
  [
    true, false, true, // 11
    false, true, false,
    true, false, true,
    true, false, true,
    true, false, true,
    true, false, true,
  ],
  [
    true, false, true, // 12
    true, false, true,
    true, false, true,
    true, false, true,
    true, false, true,
    true, false, true,
  ]
];

class Bone extends StatefulWidget {
  const Bone(
      {Key key,
      this.number,
      this.pipOnColor,
      this.pipOffColor,
      this.boneBgColor,
      this.dividerColor,
      this.shadowColor})
      : super(key: key);
  final int number;
  final Color pipOnColor;
  final Color pipOffColor;
  final Color boneBgColor;
  final Color dividerColor;
  final Color shadowColor;

  @override
  _BoneState createState() => _BoneState();
}

class _BoneState extends State<Bone> {
  var _circleAvatarRadius;

  Widget _boneLayout() {
    setState(() {
      _circleAvatarRadius = MediaQuery.of(context).size.width / 90;
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][0]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][1]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][2]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][3]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][4]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][5]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][6]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][7]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][8]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
          ],
        ),
        Divider(
          thickness: 3.0,
          color: widget.dividerColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][9]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][10]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][11]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][12]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][13]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][14]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][15]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][16]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
            CircleAvatar(
              backgroundColor: tileWeights[widget.number][17]
                  ? widget.pipOnColor
                  : widget.pipOffColor,
              radius: _circleAvatarRadius,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5.8,
      height: MediaQuery.of(context).size.width / 2.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor,
            offset: Offset(4, 4),
            blurRadius: 8.0, // 5
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: widget.boneBgColor,
            offset: Offset(-2, -2),
            blurRadius: 5.0, // 5
            spreadRadius: 1.0,
          ),
        ],
        color: widget.boneBgColor,
      ),
      padding: EdgeInsets.all(10.0),
      child: _boneLayout(),
    );
  }
}
