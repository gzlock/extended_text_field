// ignore_for_file: always_put_control_body_on_new_line

import 'package:example/special_text/my_extended_text_selection_controls.dart';
import 'package:example/special_text/my_special_text_span_builder.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';

///
///  create by zmtzawqlp on 2019/7/31
///

class CustomToolBar extends StatefulWidget {
  @override
  _CustomToolBarState createState() => _CustomToolBarState();
}

class _CustomToolBarState extends State<CustomToolBar> {
  final MyTextSelectionControls _myExtendedMaterialTextSelectionControls =
      MyTextSelectionControls();
  final MySpecialTextSpanBuilder _mySpecialTextSpanBuilder =
      MySpecialTextSpanBuilder(showAtBackground: true);
  final TextEditingController controller = TextEditingController()
    ..text = '[33]Extended text field help you to build rich text quickly. any special text you will have with extended text. this is demo to show how to create custom toolbar and handles.'
        '\n\nIt\'s my pleasure to invite you to join \$FlutterCandies\$ if you want to improve flutter .[36]'
        '\n\nif you meet any problem, please let me konw @zmtzawqlp333 .[44]\n'
        ' 123 <img src="https://www.dute.org/imgplaceholder/200x200?fontsize=30&text=100x100&bgcolor=333333" width="100" height="100"/> 123\n'
        '123123123 <reply nickname="nickname" user-id="1"/> 321321\n'
        '123123123 <reply nickname="nickname" user-id="2"/> 321321\n';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('custom selection toolbar handles'),
      ),
      body: ExtendedTextField(
        specialTextSpanBuilder: _mySpecialTextSpanBuilder,
        controller: controller,
        maxLines: null,
        decoration: const InputDecoration(
          labelText: 'LabelText',
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: (val) => print(val),
        strutStyle: const StrutStyle(),
        shouldShowSelectionHandles: _shouldShowSelectionHandles,
        textSelectionGestureDetectorBuilder: ({
          required ExtendedTextSelectionGestureDetectorBuilderDelegate delegate,
          required Function showToolbar,
          required Function hideToolbar,
          required Function? onTap,
          required BuildContext context,
          required Function? requestKeyboard,
        }) {
          return MyCommonTextSelectionGestureDetectorBuilder(
            delegate: delegate,
            showToolbar: showToolbar,
            hideToolbar: hideToolbar,
            onTap: onTap,
            context: context,
            requestKeyboard: requestKeyboard,
          );
        },
      ),
    );
  }

  bool _shouldShowSelectionHandles(
    SelectionChangedCause? cause,
    CommonTextSelectionGestureDetectorBuilder selectionGestureDetectorBuilder,
    TextEditingValue editingValue,
  ) {
    // When the text field is activated by something that doesn't trigger the
    // selection overlay, we shouldn't show the handles either.

    //
    // if (!selectionGestureDetectorBuilder.shouldShowSelectionToolbar)
    //   return false;

    if (cause == SelectionChangedCause.keyboard) return false;

    // if (widget.readOnly && _effectiveController.selection.isCollapsed)
    //   return false;

    // if (!_isEnabled) return false;

    if (cause == SelectionChangedCause.longPress) return true;

    if (editingValue.text.isNotEmpty) return true;

    return false;
  }
}

class MyCommonTextSelectionGestureDetectorBuilder
    extends CommonTextSelectionGestureDetectorBuilder {
  MyCommonTextSelectionGestureDetectorBuilder(
      {required ExtendedTextSelectionGestureDetectorBuilderDelegate delegate,
      required Function showToolbar,
      required Function hideToolbar,
      required Function? onTap,
      required BuildContext context,
      required Function? requestKeyboard})
      : super(
          delegate: delegate,
          showToolbar: showToolbar,
          hideToolbar: hideToolbar,
          onTap: onTap,
          context: context,
          requestKeyboard: requestKeyboard,
        );

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);

    /// always show toolbar
    shouldShowSelectionToolbar = true;
  }

  @override
  bool get showToolbarInWeb => true;
}
