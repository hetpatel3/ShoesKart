import 'package:flutter/material.dart';
import 'package:shoes_kart/global_variable.dart';
import 'package:shoes_kart/widgets/product_card.dart';
import 'package:shoes_kart/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {

  final List<String> filters = const ['All','Campus','Bata','Adidas','Nike'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225,225,225,1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return 
      SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                // expandend widget is used to take the remaining space
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: GestureDetector(
                        onTap: (){
                          setState(() { 
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(  
                          backgroundColor: selectedFilter == filter? Theme.of(context).colorScheme.primary : Colors.grey[200],
                          label: Text(filter),
                          labelStyle: TextStyle(
                            fontSize: filter == 'All' ? 16 : 14,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(
                            color: const Color.fromRGBO(238, 238, 238, 1),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: size.width > 900 
              ? GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: size.width > 1200 ? 2 : (size.width > 1110 ? 1.70 : 1.5),
                ),
                itemBuilder: (context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return ProductDetailsPage(product: product);
                          } 
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] != null ? product['imageUrl'] as String : '',
                      backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 250, 253, 1),
                    ),
                  );
                },
              )
              : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return ProductDetailsPage(product: product);
                          } 
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] != null ? product['imageUrl'] as String : '',
                      backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 250, 253, 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}