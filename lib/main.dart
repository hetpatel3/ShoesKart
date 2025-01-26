import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_kart/providers/cart_provider.dart';
import 'package:shoes_kart/pages/home_page.dart';
void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // type of Provider is:
  // Provider : you can only read the data
  // ChangeNotifierProvider : you can read and write the data and also nofiy the listeners
  // FutureProvider : it provides a future
  // StreamProvider : it provides a stream

  @override
  Widget build(BuildContext context) {
    // provider store the data at the top of the widget tree.
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shoes Kart App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        
        debugShowCheckedModeBanner: false,
        home: Provider(create: (context) => 'hello' ,child: HomePage()),
      ),
    );
  }
}