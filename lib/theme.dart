import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle, random }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(light);

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == dark ? light : dark;
        break;
      case ThemeEvent.random:
        final random = Random();
        yield state.copyWith(
          backgroundColor: Color.fromARGB(nextInt(random), nextInt(random), nextInt(random), nextInt(random)),
          cardColor: Color.fromARGB(nextInt(random), nextInt(random), nextInt(random), nextInt(random)),
        );
        break;
    }
  }

  int nextInt(Random random) => random.nextInt(255);

  bool get isDark => state == dark;

  static ThemeData get light => ThemeData.light().copyWith(visualDensity: VisualDensity.adaptivePlatformDensity);

  static ThemeData get dark => ThemeData.dark().copyWith(visualDensity: VisualDensity.adaptivePlatformDensity);
}
