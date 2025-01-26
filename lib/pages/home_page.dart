import 'package:flutter/material.dart';
import 'package:shoes_kart/pages/cart_page.dart';
import 'package:shoes_kart/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // indexedStack widget keeps every thing in memory. if you have a lots of pages, and you just switch from one page to another and again come to page then it shows pages where you just left it. can't start from scratch.
      body:IndexedStack(
        index: currentPage,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26,
        // if you don't want to use label but it requires and it takes space so, you can just use selectedFontSize and unselectedFontSize to 0 to hide it.
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
        ]
      ),
    );
  }
}
