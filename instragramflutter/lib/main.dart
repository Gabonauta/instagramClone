import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
    );
  }
}

final currenDate = Provider<DateTime>(
  (ref) => DateTime.now(),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currenDate);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Hooks Riverpod')),
      ),
      body: Center(
        child: Text(
          date.toIso8601String(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
