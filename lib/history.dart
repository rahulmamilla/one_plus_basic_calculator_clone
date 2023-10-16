import '../providers/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculationProvider>(
      builder: (context, calc, child) => Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          actions: [
            IconButton(
                onPressed: () => calc.clearHistory(),
                icon: const Icon(Icons.clear_all))
          ],
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: calc.getHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.calculate),
                title: Text(calc.getHistory.keys.elementAt(index)),
                trailing: Text(calc.getHistory.values.elementAt(index)),
              );
            }),
      ),
    );
  }
}
