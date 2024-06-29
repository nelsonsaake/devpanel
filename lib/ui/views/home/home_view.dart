import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/dyno_runner_widget/dyno_runner_widget.dart';
import 'widgets/no_stream.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return LayoutData(
      isBusy: viewModel.isBusy,
      padding: kp0,
      useScroll: false,
      child: BaseLayout(
        children: [
          //...

          Container(
            padding: kp8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kcStone900,
              border: kb.b(),
            ),
            child: const Text("Dynos").fcStone300().fsXL().fwSemibold(),
          ),

          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kcStone900,
                      border: kb.r(),
                    ),
                    child: ListView.separated(
                      padding: kpt16,
                      itemCount: viewModel.dynoRunners.length,
                      separatorBuilder: (context, index) => const Space2(),
                      itemBuilder: (context, index) {
                        //...
                        return DynoRunnerWidget(
                          runner: viewModel.dynoRunners[index],
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: kcStone800,
                    child: Column(
                      children: [
                        // Header Section
                        Builder(builder: (context) {
                          //...

                          final runner = viewModel.selectedDynoRunner;

                          return Container(
                            padding: kp4,
                            margin: kp4,
                            decoration: BoxDecoration(
                              border: kb.b(),
                            ),
                            child: Text(
                              str(runner?.dyno.name ?? "no dyno available"),
                            ).fcStone600().fsXL().center(),
                          );
                        }),

                        // Output
                        Expanded(
                          child: Builder(builder: (context) {
                            //...

                            final out = viewModel.selectedDynoRunner?.out;

                            if (out?.isNotEmpty == true) {
                              return SingleChildScrollView(
                                child: Container(
                                  padding: kp4,
                                  alignment: Alignment.topLeft,
                                  child: Text(out!).fcStone300(),
                                ),
                              );
                            }

                            return const Center(
                              child: NoStream(),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) {
    return HomeViewModel();
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
