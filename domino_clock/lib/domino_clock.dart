// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:ui';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "dart:math";

import 'bone.dart';

enum _Element {
  background,
  pipOff,
  boneBackground,
  dividerColor,
  shadowColor,
}

final _lightTheme = {
  _Element.background: Colors.white70,
  _Element.pipOff: Color(0xFFffeed6),
  _Element.boneBackground: Color(0xFFfff5e8),
  _Element.dividerColor: Colors.brown[200],
  _Element.shadowColor: Colors.brown[200],
};

final _darkTheme = {
  _Element.background: Colors.grey[900],
  _Element.pipOff: Colors.grey[900],
  _Element.boneBackground: Colors.black,
  _Element.dividerColor: Colors.white70,
  _Element.shadowColor: Color(0xFF383838),
};

var _darkThemeRandomColors = [
  Colors.yellowAccent,
  Colors.greenAccent,
  Colors.lightBlueAccent,
  Colors.redAccent
];
var _lightThemeRandomColors = [
  Colors.yellow[800],
  Colors.green[600],
  Colors.blue[700],
  Colors.red
];

/// A Dominoes Clock.
class DominoClock extends StatefulWidget {
  const DominoClock(this.model);
  final ClockModel model;

  @override
  _DominoClockState createState() => _DominoClockState();
}

class _DominoClockState extends State<DominoClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DominoClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      /// Update once per minute
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );

      /// Update once per second
//       _timer = Timer(
//         Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
//         _updateTime,
//       );
    });
  }

  Widget _cornerWidget(String text, Alignment _alignment, TextStyle _style) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: _alignment,
        child: Text(
          text,
          style: _style,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    var _lightRandomColor = _lightThemeRandomColors[
        _random.nextInt(_lightThemeRandomColors.length)];
    var _darkRandomColor =
        _darkThemeRandomColors[_random.nextInt(_darkThemeRandomColors.length)];
    var _pipOnColor = Theme.of(context).brightness == Brightness.light
        ? _lightRandomColor
        : _darkRandomColor;
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final cornerTextStyle = TextStyle(
      color: _pipOnColor.withOpacity(0.7),
      fontSize: MediaQuery.of(context).size.width / 50,
      fontWeight: FontWeight.w800,
      fontFamily: 'Quicksand',
      decoration: TextDecoration.overline,
    );

    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final intHour = int.parse(hour);
    final hour0 = int.parse(hour.substring(0, 1));
    final hour1 = int.parse(hour.substring(1, 2));
    final min0 = int.parse(minute.substring(0, 1));
    final min1 = int.parse(minute.substring(1, 2));

    /// MIN : SEC clock
//    final second = DateFormat('ss').format(_dateTime);
//    final sec0 = int.parse(second.substring(0,1));
//    final sec1 = int.parse(second.substring(1,2));

    return Container(
      color: colors[_Element.background],
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _cornerWidget(
            widget.model.location,
            Alignment.bottomLeft,
            cornerTextStyle,
          ),
          _cornerWidget(
            widget.model.temperatureString,
            Alignment.topRight,
            cornerTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.model.is24HourFormat
                  ? Bone(
                      number: hour0,
                      pipOnColor: _pipOnColor,
                      pipOffColor: colors[_Element.pipOff],
                      boneBgColor: colors[_Element.boneBackground],
                      dividerColor: colors[_Element.dividerColor],
                      shadowColor: colors[_Element.shadowColor],
                    )
                  : Container(),
              widget.model.is24HourFormat
                  ? SizedBox(
                      width: 18.0,
                    )
                  : Container(),
              widget.model.is24HourFormat
                  ? Bone(
                      number: hour1,
                      pipOnColor: _pipOnColor,
                      pipOffColor: colors[_Element.pipOff],
                      boneBgColor: colors[_Element.boneBackground],
                      dividerColor: colors[_Element.dividerColor],
                      shadowColor: colors[_Element.shadowColor],
                    )
                  : Bone(
                      number: intHour,
                      pipOnColor: _pipOnColor,
                      pipOffColor: colors[_Element.pipOff],
                      boneBgColor: colors[_Element.boneBackground],
                      dividerColor: colors[_Element.dividerColor],
                      shadowColor: colors[_Element.shadowColor],
                    ),
              SizedBox(
                width: widget.model.is24HourFormat ? 30.0 : 50.0,
              ),
              Bone(
                number: min0,
                pipOnColor: _pipOnColor,
                pipOffColor: colors[_Element.pipOff],
                boneBgColor: colors[_Element.boneBackground],
                dividerColor: colors[_Element.dividerColor],
                shadowColor: colors[_Element.shadowColor],
              ),
              SizedBox(
                width: 18.0,
              ),
              Bone(
                number: min1,
                pipOnColor: _pipOnColor,
                pipOffColor: colors[_Element.pipOff],
                boneBgColor: colors[_Element.boneBackground],
                dividerColor: colors[_Element.dividerColor],
                shadowColor: colors[_Element.shadowColor],
              ),

              /// MIN : SEC clock
//            Bone(number: min0, pipOnColor: colors[_Element.pipOn], pipOffColor: colors[_Element.pipOff], boneBgColor: colors[_Element.boneBackground], dividerColor: colors[_Element.dividerColor],),
//            SizedBox(width: 8.0,),
//            Bone(number: min1, pipOnColor: colors[_Element.pipOn], pipOffColor: colors[_Element.pipOff], boneBgColor: colors[_Element.boneBackground], dividerColor: colors[_Element.dividerColor],),
//            SizedBox(width: 35.0,),
//            Bone(number: sec0, pipOnColor: colors[_Element.pipOn], pipOffColor: colors[_Element.pipOff], boneBgColor: colors[_Element.boneBackground], dividerColor: colors[_Element.dividerColor],),
//            SizedBox(width: 8.0,),
//            Bone(number: sec1, pipOnColor: colors[_Element.pipOn], pipOffColor: colors[_Element.pipOff], boneBgColor: colors[_Element.boneBackground], dividerColor: colors[_Element.dividerColor],),
            ],
          ),
        ],
      ),
    );
  }
}
