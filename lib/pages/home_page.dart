import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/dash_counter.dart';
import '../logic/dash_purchases.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 2,
          child: DashClickerWidget(),
        ),
        Expanded(child: UpgradeList()),
      ],
    );
  }
}

class DashClickerWidget extends StatelessWidget {
  const DashClickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CounterStateWidget(),
          InkWell(
            // Don't listen as we don't need a rebuild when the count changes
            onTap: Provider.of<DashCounter>(context, listen: false).increment,
            child: Image.asset(context.read<DashPurchases>().beautifiedDash
                ? 'assets/dash.png'
                : 'assets/dash_old.png'),
          )
        ],
      ),
    );
  }
}

class CounterStateWidget extends StatelessWidget {
  const CounterStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget is the only widget that directly listens to the counter
    // and is thus updated almost every frame. Keep this as small as possible.
    var counter = context.watch<DashCounter>();
    return RichText(
      text: TextSpan(
        text: 'You have tapped Dash ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: counter.countString,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: ' times!'),
        ],
      ),
    );
  }
}

class UpgradeList extends StatelessWidget {
  const UpgradeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
