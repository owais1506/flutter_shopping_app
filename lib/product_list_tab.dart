import 'package:first_flutter_app/product_row_item.dart';
import 'package:first_flutter_app/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';



class ProductListTab extends StatelessWidget {
  const ProductListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel()..loadProducts(),
      child : Consumer<AppStateModel>(
      builder: (context,model,child)
      {
      //final model = Provider.of<AppStateModel>(context);
      final products = model.getProducts();
      print("Products$products");
      return CustomScrollView(
        semanticChildCount: products.length,
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Cupertino Store'),
          ),
          SliverSafeArea(   // BEGINNING OF NEW CONTENT
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < products.length) {
                    return ProductRowItem(
                      product: products[index],
                      lastItem: index == products.length - 1,
                    );
                  }
                  return null;
                },
              ),
            ),
          )     // END OF NEW CONTENT
        ],
      );
     }
   )
   );
  }
}