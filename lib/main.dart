import 'package:flutter/material.dart';
import 'package:untitled1/models/cart.dart';
import 'package:untitled1/models/item.dart';
import 'package:untitled1/screens/checkout_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> items = [
    Item(title: 'laptop ', price: 500.0),
    Item(title: 'iphone x ', price: 400.0),
    Item(title: 'keyboard ', price: 40.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Shopping cart'),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutPage()));
                    },
                  ),
                  Text(cart.count.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].price.toString()),
              trailing: Icon(Icons.add),
              onTap: () {
                cart.add(items[index]);
              },
            );
          },
        ),
      );
    });
  }
}
