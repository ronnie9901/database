import 'package:database/Habit_traker/Modal/habit.dart';
import 'package:database/Habit_traker/Provider/Provider.dart';
import 'package:database/Habit_traker/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await  HabitDataBase.initialize();
     await HabitDataBase.saveFirstLaunchDate();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HabitDataBase(),)

  ],child:MyApp() ,)  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),

    );

  }
}

