import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart';

class ReplyText extends SpecialText {
  ReplyText(
    TextStyle? textStyle, {
    this.start,
    SpecialTextGestureTapCallback? onTap,
  }) : super(
          ReplyText.flag,
          '/>',
          textStyle,
          onTap: onTap,
        );

  static const String flag = '<reply';
  final int? start;
  String? _userId;
  String? _nickname;

  String? get userId => _userId;

  String? get nickname => _nickname;

  @override
  InlineSpan finishText() {
    ///content already has endflag '/'
    final String text = toString();

    ///'<img src='$url'/>'
//    var index1 = text.indexOf(''') + 1;
//    var index2 = text.indexOf(''', index1);
//
//    var url = text.substring(index1, index2);
//
    ////'<img src='$url' width='${item.imageSize.width}' height='${item.imageSize.height}'/>'
    final Document html = parse(text);

    final Element $el = html.getElementsByTagName('reply').first;
    _nickname = $el.attributes['nickname']!;
    _userId = $el.attributes['user-id']!;

    return SpecialTextSpan(
        text: '回复 $nickname',
        actualText: text,
        start: start!,
        style: TextStyle(color: Colors.blue),
        recognizer: (TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) {
              onTap!(this);
            }
          }));
  }
}
