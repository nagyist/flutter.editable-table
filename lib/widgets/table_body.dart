import 'package:flutter/material.dart';
import 'editable_theme.dart';

class RowBuilder extends StatefulWidget {
  ///Builds row elements for the table
  /// its properties are not nullable
  const RowBuilder({
    Key? key,
    this.tdAlignment,
    this.tdStyle,
    double? trHeight,
    Color? borderColor,
    double? borderWidth,
    required this.cellData,
    required this.index,
    required this.col,
    double? this.tdPaddingLeft,
    double? this.tdPaddingTop,
    double? this.tdPaddingBottom,
    double? this.tdPaddingRight,
    int? this.tdEditableMaxLines,
    required this.onSubmitted,
    required this.onChanged,
    required this.widthRatio,
    required this.isEditable,
    Color? this.stripeColor1,
    Color? this.stripeColor2,
    bool? this.zebraStripe,
    this.focusedBorder,
  })   : _trHeight = trHeight,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        super(key: key);

  /// Table row height
  final double? _trHeight;
  final Color? _borderColor;
  final double? _borderWidth;
  final cellData;
  final double? widthRatio;
  final bool isEditable;
  final TextAlign? tdAlignment;
  final TextStyle? tdStyle;
  final int index;
  final col;
  final double? tdPaddingLeft;
  final double? tdPaddingTop;
  final double? tdPaddingBottom;
  final double? tdPaddingRight;
  final int? tdEditableMaxLines;
  final Color? stripeColor1;
  final Color? stripeColor2;
  final bool? zebraStripe;
  final InputBorder? focusedBorder;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String> onChanged;

  @override
  _RowBuilderState createState() => _RowBuilderState();
}

class _RowBuilderState extends State<RowBuilder> {
  @override
  Widget build(BuildContext context) {
    final theme = EditableTheme.of(context);
    double width = MediaQuery.of(context).size.width;
    final trHeight = widget._trHeight ?? theme.trHeight;
    final borderColor = widget._borderColor ?? theme.borderColor;
    final borderWidth = widget._borderWidth ?? theme.borderWidth;
    final tdAlignment = widget.tdAlignment ?? theme.tdAlignment;
    final tdStyle = widget.tdStyle ?? theme.tdStyle;
    final tdPaddingLeft = widget.tdPaddingLeft ?? theme.tdPaddingLeft;
    final tdPaddingTop = widget.tdPaddingTop ?? theme.tdPaddingTop;
    final tdPaddingRight = widget.tdPaddingRight ?? theme.tdPaddingRight;
    final tdPaddingBottom = widget.tdPaddingBottom ?? theme.tdPaddingBottom;
    final tdEditableMaxLines =
        widget.tdEditableMaxLines ?? theme.tdEditableMaxLines;
    final stripeColor1 = widget.stripeColor1 ?? theme.stripeColor1;
    final stripeColor2 = widget.stripeColor2 ?? theme.stripeColor2;
    final zebraStripe = widget.zebraStripe ?? theme.zebraStripe;
    final focusedBorder = widget.focusedBorder ?? theme.focusedBorder;
    return Flexible(
      fit: FlexFit.loose,
      flex: 6,
      child: Container(
        height: trHeight < 40 ? 40 : trHeight,
        width: width * widget.widthRatio!,
        decoration: BoxDecoration(
            color: !zebraStripe
                ? null
                : (widget.index % 2 == 1.0
                    ? stripeColor2
                    : stripeColor1),
            border: Border.all(
                color: borderColor, width: borderWidth)),
        child: widget.isEditable
            ? TextFormField(
                textAlign: tdAlignment,
                style: tdStyle,
                initialValue: widget.cellData.toString(),
                onFieldSubmitted: widget.onSubmitted,
                onChanged: widget.onChanged,
                textAlignVertical: TextAlignVertical.center,
                maxLines: tdEditableMaxLines,
                decoration: InputDecoration(
                  filled: zebraStripe,
                  fillColor: widget.index % 2 == 1.0
                      ? stripeColor2
                      : stripeColor1,
                  contentPadding: EdgeInsets.only(
                      left: tdPaddingLeft,
                      right: tdPaddingRight,
                      top: tdPaddingTop,
                      bottom: tdPaddingBottom),
                  border: InputBorder.none,
                  focusedBorder: focusedBorder,
                ),
              )
            : Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: tdPaddingLeft,
                  right: tdPaddingRight,
                  // top: tdPaddingTop,
                  // bottom: tdPaddingBottom,
                ),
                decoration: BoxDecoration(
                  color: !zebraStripe
                      ? null
                      : (widget.index % 2 == 1.0
                          ? stripeColor2
                          : stripeColor1),
                ),
                child: Text(
                  widget.cellData.toString(),
                  textAlign: tdAlignment,
                  style: tdStyle ??
                      TextStyle(
                          fontSize: 16),
                ),
              ),
      ),
    );
  }
}
