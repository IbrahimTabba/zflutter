import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zflutter/src/widgets/group.dart';
import 'package:zflutter/zflutter.dart';

class ZBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? depth;

  final double stroke;
  final bool fill;

  final Color? color;
  final bool? visible;

  final Color? frontColor;
  final Color? rearColor;
  final Color? leftColor;
  final Color? rightColor;
  final Color? topColor;
  final Color? bottomColor;

  ZBox({
    this.width,
    this.height,
    this.depth,
    this.stroke = 1,
    this.fill = true,
    this.color,
    this.visible,
    this.frontColor,
    this.rearColor,
    this.leftColor,
    this.rightColor,
    this.topColor,
    this.bottomColor,
  });

  Widget get frontFace => ZPositioned(
        translate: ZVector.only(z: depth! / 2),
        child: ZRect(
          color: frontColor ?? color,
          fill: fill,
          stroke: stroke,
          width: width!,
          height: height!,
        ),
      );

  Widget get rearFace => ZPositioned(
        translate: ZVector.only(z: -depth! / 2),
        rotate: ZVector.only(y: tau / 2),
        child: ZRect(
          width: width!,
          height: height!,
          color: rearColor ?? color,
          fill: fill,
          stroke: stroke,
        ),
      );

  Widget get leftFace => ZPositioned(
        translate: ZVector.only(x: -width! / 2),
        rotate: ZVector.only(y: -tau / 4),
        child: ZRect(
          width: depth!,
          height: height!,
          stroke: stroke,
          color: leftColor ?? color,
          fill: fill,
        ),
      );

  Widget get rightFace => ZPositioned(
        translate: ZVector.only(x: width! / 2),
        rotate: ZVector.only(y: tau / 4),
        child: ZRect(
          width: depth!,
          color: rightColor ?? color,
          height: height!,
          stroke: stroke,
          fill: fill,
        ),
      );

  Widget get topFace => ZPositioned(
        translate: ZVector.only(y: -height! / 2),
        rotate: ZVector.only(x: -tau / 4),
        child: ZRect(
          width: width!,
          color: topColor ?? color,
          height: depth!,
          stroke: stroke,
          fill: fill,
        ),
      );

  Widget get bottomFace => ZPositioned(
        translate: ZVector.only(y: height! / 2),
        rotate: ZVector.only(x: tau / 4),
        child: ZRect(
          width: width!,
          color: bottomColor ?? color,
          stroke: stroke,
          fill: fill,
          height: depth!,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ZGroup(
      children: [
        frontFace,
        rearFace,
        leftFace,
        rightFace,
        topFace,
        bottomFace,
      ],
    );
  }
}
