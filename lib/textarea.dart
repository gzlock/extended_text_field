import 'package:example/special_text/my_extended_text_selection_controls.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextArea extends FormField<String> {
  TextArea({
    Key? key,
    String? initialValue,
    FormFieldValidator<String?>? validator,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextEditingController? controller,
    TextStyle? style,
    int? minLines,
    int? maxLines,
    List<TextInputFormatter>? inputFormatters,
    Color? bgColor,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    AppPrivateCommandCallback? onAppPrivateCommand,
    TextInputAction? textInputAction,
    bool autofocus = false,
    bool autocorrect = false,
    bool enableInteractiveSelection = true,
    bool enableSuggestions = true,
    SpecialTextSpanBuilder? specialTextSpanBuilder,
  }) : super(
          key: key,
          initialValue: initialValue,
          validator: validator,
          builder: (FormFieldState<String?> field) {
            final _decoration = decoration ?? InputDecoration();
            return ExtendedTextField(
              specialTextSpanBuilder: specialTextSpanBuilder,
              controller: controller,
              maxLines: null,
              decoration: _decoration.copyWith(
                fillColor: bgColor ?? Colors.white,
                filled: true,
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onChanged: onChanged,
              enableSuggestions: enableSuggestions,
              enableInteractiveSelection: enableInteractiveSelection,
              autofocus: autofocus,
              autocorrect: autocorrect,
              // StrutStyle get strutStyle {
              //   if (_strutStyle == null) {
              //     return StrutStyle.fromTextStyle(style, forceStrutHeight: true);
              //   }
              //   return _strutStyle!.inheritFromTextStyle(style);
              // }
              // default strutStyle is not good for WidgetSpan
              // shouldShowSelectionHandles: _shouldShowSelectionHandles,
              // textSelectionGestureDetectorBuilder: ({
              //   required ExtendedTextSelectionGestureDetectorBuilderDelegate
              //       delegate,
              //   required Function showToolbar,
              //   required Function hideToolbar,
              //   required Function? onTap,
              //   required BuildContext context,
              //   required Function? requestKeyboard,
              // }) {
              //   return MyCommonTextSelectionGestureDetectorBuilder(
              //     delegate: delegate,
              //     showToolbar: showToolbar,
              //     hideToolbar: hideToolbar,
              //     onTap: onTap,
              //     context: context,
              //     requestKeyboard: requestKeyboard,
              //   );
              // },
            );
            return ExtendedTextField(
              style: style,
              selectionControls: MyTextSelectionControls(),
              textInputAction: textInputAction,
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              decoration: _decoration.copyWith(
                fillColor: bgColor ?? Colors.white,
                filled: true,
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              minLines: minLines,
              maxLines: maxLines,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              onSubmitted: onSubmitted,
              onAppPrivateCommand: onAppPrivateCommand,
              specialTextSpanBuilder: specialTextSpanBuilder,
              autofocus: autofocus,
              autocorrect: autocorrect,
              enableInteractiveSelection: enableInteractiveSelection,
              enableSuggestions: enableSuggestions,
            );
          },
        );
}
