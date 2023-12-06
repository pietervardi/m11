import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:minggu_11/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _appLocale = const Locale('en', 'US'); // Default locale

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _appLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('id', 'ID'),
        Locale('it', 'IT'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      locale: _appLocale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        return const Locale('en', 'US');
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(changeLanguage: _changeLanguage),
      debugShowCheckedModeBanner: false,
    );
  }
}