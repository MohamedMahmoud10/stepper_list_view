import 'package:flutter/material.dart';
import '../stepper_list_view.dart';

class StepperListView extends StatelessWidget {
  const StepperListView({
    super.key,
    required this.stepperData,
    required this.stepAvatar,
    this.avatarRadius,
    this.stepWidget,
    this.stepSize,
    required this.stepContentWidget,
    this.stepperThemeData,
    this.controller,
    this.physics,
    this.shrinkWrap,
    this.addAutomaticKeepAlive,
    this.addSemanticIndexes,
    this.reverse,
    this.showStepperInLast,
    this.customWidget,
  });

  final List<StepperItemData> stepperData;
  final StepperAvatarBuilder stepAvatar;
  final double? avatarRadius;
  final StepperWidgetBuilder? stepWidget;
  final Size? stepSize;
  final StepperContentBuilder stepContentWidget;
  final StepperThemeData? stepperThemeData;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final bool? addAutomaticKeepAlive;
  final bool? addSemanticIndexes;
  final bool? reverse;
  final bool? showStepperInLast;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap ?? false,
      itemCount: stepperData.length,
      addAutomaticKeepAlives: addAutomaticKeepAlive ?? true,
      addSemanticIndexes: addSemanticIndexes ?? true,
      reverse: reverse ?? false,
      itemBuilder: (_, index) {
        return StepperWidget(
          stepperData[index],
          isLast: (showStepperInLast ?? true)
              ? false
              : stepperData.last == stepperData[index],
          stepperWidgetBuilder: (_, data) {
            return stepWidget != null
                ? PreferredSize(
                    preferredSize: stepSize ?? const Size.fromWidth(20),
                    child: stepWidget!(context, data),
                  )
                : const PreferredSize(
                    preferredSize: Size.zero,
                    child: SizedBox(),
                  );
          },
          stepperAvatarBuilder: (context, data) {
            return stepAvatar(context, data);
          },
          stepperContentBuilder: (_, data) {
            return stepContentWidget(context, data);
          },
          stepperThemeData: stepperThemeData,
          customWidget: customWidget,
        );
      },
    );
  }
}
