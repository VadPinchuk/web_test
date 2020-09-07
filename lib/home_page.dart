import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_test/theme.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.bloc<ThemeBloc>().add(ThemeEvent.random),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(12.0),
            child: Image.asset(
              'colored_line.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          body: PickedImageWidget(),
          floatingActionButton: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 12.0,
            children: [
              FloatingActionButton(
                onPressed: () => context.bloc<ThemeBloc>().add(ThemeEvent.toggle),
                tooltip: 'Change theme',
                child: Icon(
                  FontAwesomeIcons.random,
                  color: context.bloc<ThemeBloc>().isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
}

class PickedImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeBloc, ThemeData>(
        builder: (_, data) => Container(
          color: data.cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Card(
              elevation: 6.0,
              color: data.backgroundColor,
              child: const Center(
                child: Text('Hey there'),
              ),
            ),
          ),
        ),
      );
}
