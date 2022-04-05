library switch_button;

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatelessWidget {

  const SwitchButton({
    Key? key,
    required this.value,
    required this.onToggle,
    required this.child,
    this.backgroundColor,
    this.toggleColor,
    this.activeColor,
    this.inactiveColor,
    this.borderRadius = 15,
  }) : super(key: key);

  /// Determines if the switch is on or off.
  ///
  /// This property is required.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// This property is required.
  ///
  /// [onToggle] should update the state of the parent [StatefulWidget]
  /// using the [setState] method, so that the parent gets rebuilt; for example:
  ///
  /// ```dart
  /// SwitchButton(
  ///   value: _status,
  ///   onToggle: (val) {
  ///     setState(() {
  ///        _status = val;
  ///     });
  ///   },
  /// ),
  /// ```
  final ValueChanged<bool> onToggle;

  final Widget child;

  /// SwitchButton background color.
  ///
  /// Defaults to [Colors.white].
  final Color? backgroundColor;

  /// The color to use on the toggle of the switch.
  ///
  /// Defaults to [Colors.white].
  final Color? toggleColor;

  /// The color to use on the switch when the switch is on.
  ///
  /// Defaults to [Colors.blue].
  final Color? activeColor;

  /// The color to use on the switch when the switch is off.
  ///
  /// Defaults to [Colors.grey].
  final Color? inactiveColor;

  /// The border radius of the switch button.
  ///
  /// Defaults to the value of 15.0.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () {
          onToggle.call(!value);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              child,
              const SizedBox(
                width: 10,
              ),
              FlutterSwitch(
                width: 60.0,
                height: 30.0,
                value: value,
                borderRadius: 30.0,
                padding: 4.0,
                onToggle: onToggle,
                toggleColor: toggleColor ?? Colors.white,
                activeColor: activeColor ?? Colors.blue,
                inactiveColor: inactiveColor ?? Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
