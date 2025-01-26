// State management is used to manage a state in your application. we use setState until single page application but for multiple page application we use state management. we have different state management techniques like provider, bloc, getx, riverpod, etc. we use provider in this project and it is an inherited widget 

// inherited widget creates a store house at the top of widget tree. from where anyone can access the data. it is a global data.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_kart/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart =  context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          final cartItem = cart[index];

          return ListTile(
            // leading is the first widget in the list tile. circle avatar is used to show the image in circular form.
            leading: CircleAvatar(
              // assetImage is used to show the image from the assets folder.
              // we use image.assets but it is a widget where AssetImage is a class.
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
              radius: 26,
              backgroundColor: Colors.grey[300],
            ),
            trailing: IconButton(
              onPressed: (){
                FocusScope.of(context).unfocus();
                showDialog(
                  barrierDismissible: false,
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text(
                          'Are you sure you want to delete this product?',
                          style: Theme.of(context).textTheme.bodySmall, 
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Navigator.pop is used to close the dialog box.
                              Navigator.of(context).pop();
                            }, 
                            child: const Text(
                              'No', 
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            )
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<CartProvider>().removeProduct(cartItem);
                              Navigator.of(context).pop();
                            }, 
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              )
                            ),
                        ],
                      );
                    },
                  );
              }, 
              icon: Icon(Icons.delete, color: Colors.red),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['sizes']}'.toString()),
          );
        
        },
      ),
    );
  }
}