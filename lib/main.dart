import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_test/home_page.dart';
import 'package:web_test/observer.dart';
import 'package:web_test/theme.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(CameraAreaApp());
}

class CameraAreaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (_, theme) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Web Random',
            theme: theme,
            home: MyHomePage(),
          ),
        ),
      );
}
