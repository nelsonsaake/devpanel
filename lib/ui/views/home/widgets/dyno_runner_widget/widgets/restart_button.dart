import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

class RestartButton extends ViewModelWidget<HomeViewModel> {
  const RestartButton({
    super.key,
    required this.runner,
  });

  final DynoRunner runner;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(180 / 360),
      child: IconButton(
        icon: Icon(
          TablerIcons.rotate,
          color: runner.isActive ? kcYellow600 : kcStone500,
        ),
        onPressed: () => viewModel.dynoRunnerRestart(runner),
      ),
    );
  }
}
