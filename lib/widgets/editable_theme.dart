import 'dart:ui';

import 'package:flutter/material.dart';

class EditableThemeData extends ThemeExtension<EditableThemeData> {
  const EditableThemeData({
    this.columnRatio = 0.20,
    this.borderColor = Colors.grey,
    this.borderWidth = 0.5,
    this.tdPaddingLeft = 8.0,
    this.tdPaddingTop = 8.0,
    this.tdPaddingRight = 8.0,
    this.tdPaddingBottom = 12.0,
    this.thPaddingLeft = 8.0,
    this.thPaddingTop = 0.0,
    this.thPaddingRight = 8.0,
    this.thPaddingBottom = 0.0,
    this.trHeight = 50.0,
    this.thWeight = FontWeight.w600,
    this.thSize = 18,
    this.tdAlignment = TextAlign.start,
    this.tdStyle,
    this.tdEditableMaxLines = 1,
    this.thAlignment = TextAlign.start,
    this.thStyle,
    this.thVertAlignment = CrossAxisAlignment.center,
    this.stripeColor1 = Colors.white,
    this.stripeColor2 = Colors.black12,
    this.zebraStripe = false,
    this.focusedBorder,
  });

  final double columnRatio;
  final Color borderColor;
  final double borderWidth;
  final double tdPaddingLeft;
  final double tdPaddingTop;
  final double tdPaddingRight;
  final double tdPaddingBottom;
  final TextAlign tdAlignment;
  final TextStyle? tdStyle;
  final int tdEditableMaxLines;
  final double thPaddingLeft;
  final double thPaddingTop;
  final double thPaddingRight;
  final double thPaddingBottom;
  final TextAlign thAlignment;
  final TextStyle? thStyle;
  final FontWeight thWeight;
  final CrossAxisAlignment thVertAlignment;
  final double thSize;
  final double trHeight;
  final Color stripeColor1;
  final Color stripeColor2;
  final bool zebraStripe;
  final InputBorder? focusedBorder;

  EditableThemeData copyWith({
    double? columnRatio,
    Color? borderColor,
    double? borderWidth,
    double? tdPaddingLeft,
    double? tdPaddingTop,
    double? tdPaddingRight,
    double? tdPaddingBottom,
    TextAlign? tdAlignment,
    TextStyle? tdStyle,
    int? tdEditableMaxLines,
    double? thPaddingLeft,
    double? thPaddingTop,
    double? thPaddingRight,
    double? thPaddingBottom,
    TextAlign? thAlignment,
    TextStyle? thStyle,
    FontWeight? thWeight,
    CrossAxisAlignment? thVertAlignment,
    double? thSize,
    double? trHeight,
    Color? stripeColor1,
    Color? stripeColor2,
    bool? zebraStripe,
    InputBorder? focusedBorder,
  }) {
    return EditableThemeData(
      columnRatio: columnRatio ?? this.columnRatio,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      tdPaddingLeft: tdPaddingLeft ?? this.tdPaddingLeft,
      tdPaddingTop: tdPaddingTop ?? this.tdPaddingTop,
      tdPaddingRight: tdPaddingRight ?? this.tdPaddingRight,
      tdPaddingBottom: tdPaddingBottom ?? this.tdPaddingBottom,
      tdAlignment: tdAlignment ?? this.tdAlignment,
      tdStyle: tdStyle ?? this.tdStyle,
      tdEditableMaxLines: tdEditableMaxLines ?? this.tdEditableMaxLines,
      thPaddingLeft: thPaddingLeft ?? this.thPaddingLeft,
      thPaddingTop: thPaddingTop ?? this.thPaddingTop,
      thPaddingRight: thPaddingRight ?? this.thPaddingRight,
      thPaddingBottom: thPaddingBottom ?? this.thPaddingBottom,
      thAlignment: thAlignment ?? this.thAlignment,
      thStyle: thStyle ?? this.thStyle,
      thWeight: thWeight ?? this.thWeight,
      thVertAlignment: thVertAlignment ?? this.thVertAlignment,
      thSize: thSize ?? this.thSize,
      trHeight: trHeight ?? this.trHeight,
      stripeColor1: stripeColor1 ?? this.stripeColor1,
      stripeColor2: stripeColor2 ?? this.stripeColor2,
      zebraStripe: zebraStripe ?? this.zebraStripe,
      focusedBorder: focusedBorder ?? this.focusedBorder,
    );
  }

  @override
  EditableThemeData lerp(ThemeExtension<EditableThemeData>? other, double t) {
    if (other is! EditableThemeData) {
      return this;
    }
    return EditableThemeData(
      columnRatio: lerpDouble(columnRatio, other.columnRatio, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      tdPaddingLeft: lerpDouble(tdPaddingLeft, other.tdPaddingLeft, t)!,
      tdPaddingTop: lerpDouble(tdPaddingTop, other.tdPaddingTop, t)!,
      tdPaddingRight: lerpDouble(tdPaddingRight, other.tdPaddingRight, t)!,
      tdPaddingBottom: lerpDouble(tdPaddingBottom, other.tdPaddingBottom, t)!,
      tdAlignment: t < 0.5 ? tdAlignment : other.tdAlignment,
      tdStyle: TextStyle.lerp(tdStyle, other.tdStyle, t),
      tdEditableMaxLines: t < 0.5 ? tdEditableMaxLines : other.tdEditableMaxLines,
      thPaddingLeft: lerpDouble(thPaddingLeft, other.thPaddingLeft, t)!,
      thPaddingTop: lerpDouble(thPaddingTop, other.thPaddingTop, t)!,
      thPaddingRight: lerpDouble(thPaddingRight, other.thPaddingRight, t)!,
      thPaddingBottom: lerpDouble(thPaddingBottom, other.thPaddingBottom, t)!,
      thAlignment: t < 0.5 ? thAlignment : other.thAlignment,
      thStyle: TextStyle.lerp(thStyle, other.thStyle, t),
      thWeight: t < 0.5 ? thWeight : other.thWeight,
      thVertAlignment: t < 0.5 ? thVertAlignment : other.thVertAlignment,
      thSize: lerpDouble(thSize, other.thSize, t)!,
      trHeight: lerpDouble(trHeight, other.trHeight, t)!,
      stripeColor1: Color.lerp(stripeColor1, other.stripeColor1, t)!,
      stripeColor2: Color.lerp(stripeColor2, other.stripeColor2, t)!,
      zebraStripe: t < 0.5 ? zebraStripe : other.zebraStripe,
      focusedBorder: t < 0.5 ? focusedBorder : other.focusedBorder,
    );
  }

  EditableThemeData merge(EditableThemeData? other) {
    if (other == null) return this;
    return copyWith(
      columnRatio: other.columnRatio,
      borderColor: other.borderColor,
      borderWidth: other.borderWidth,
      tdPaddingLeft: other.tdPaddingLeft,
      tdPaddingTop: other.tdPaddingTop,
      tdPaddingRight: other.tdPaddingRight,
      tdPaddingBottom: other.tdPaddingBottom,
      tdAlignment: other.tdAlignment,
      tdStyle: other.tdStyle,
      tdEditableMaxLines: other.tdEditableMaxLines,
      thPaddingLeft: other.thPaddingLeft,
      thPaddingTop: other.thPaddingTop,
      thPaddingRight: other.thPaddingRight,
      thPaddingBottom: other.thPaddingBottom,
      thAlignment: other.thAlignment,
      thStyle: other.thStyle,
      thWeight: other.thWeight,
      thVertAlignment: other.thVertAlignment,
      thSize: other.thSize,
      trHeight: other.trHeight,
      stripeColor1: other.stripeColor1,
      stripeColor2: other.stripeColor2,
      zebraStripe: other.zebraStripe,
      focusedBorder: other.focusedBorder,
    );
  }
}

class EditableTheme extends InheritedWidget {
  const EditableTheme({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  final EditableThemeData data;

  static EditableThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<EditableTheme>()?.data;
    final ThemeData materialTheme = Theme.of(context);
    final EditableThemeData defaults =
        materialTheme.extension<EditableThemeData>() ?? const EditableThemeData();
    return defaults.merge(theme);
  }

  @override
  bool updateShouldNotify(EditableTheme oldWidget) => data != oldWidget.data;
}

extension EditableThemeGetter on ThemeData {
  EditableThemeData get editableTheme =>
      extension<EditableThemeData>() ?? const EditableThemeData();
}
