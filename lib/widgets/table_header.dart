import 'package:flutter/material.dart';
import 'editable_theme.dart';

class THeader extends StatelessWidget {
  ///Builds elements for the table headers
  const THeader(
      {Key? key,
      this.thPaddingLeft,
      this.thPaddingTop,
      this.thPaddingBottom,
      this.thPaddingRight,
      required List? headers,
      this.thAlignment,
      this.thStyle,
      FontWeight? thWeight,
      double? thSize,
      required double? widthRatio,
      required int index})
      : _headers = headers,
        _thWeight = thWeight,
        _thSize = thSize,
        _index = index,
        _widthRatio = widthRatio,
        super(key: key);

  final double? thPaddingLeft;
  final double? thPaddingTop;
  final double? thPaddingBottom;
  final double? thPaddingRight;
  final List? _headers;
  final TextAlign? thAlignment;
  final TextStyle? thStyle;
  final FontWeight? _thWeight;
  final double? _thSize;
  final int _index;
  final double? _widthRatio;
  @override
  Widget build(BuildContext context) {
    final theme = EditableTheme.of(context);
    double width = MediaQuery.of(context).size.width;
    final paddingLeft = thPaddingLeft ?? theme.thPaddingLeft;
    final paddingTop = thPaddingTop ?? theme.thPaddingTop;
    final paddingBottom = thPaddingBottom ?? theme.thPaddingBottom;
    final paddingRight = thPaddingRight ?? theme.thPaddingRight;
    final textAlign = thAlignment ?? theme.thAlignment;
    final style = thStyle ??
        TextStyle(
            fontWeight: _thWeight ?? theme.thWeight,
            fontSize: _thSize ?? theme.thSize);
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        width: width * _widthRatio!,
        child: Padding(
          padding: EdgeInsets.only(
              left: paddingLeft,
              top: paddingTop,
              bottom: paddingBottom,
              right: paddingRight),
          child: Text(
            _headers != null || _headers!.isNotEmpty
                ? _headers![_index]['title']
                : '',
            style: style,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
