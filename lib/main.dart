import 'package:first_flutter_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';             // NEW

import 'package:first_flutter_app/app.dart';
import 'model/app_state_model.dart';                 // NEW

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(            // NEW
      create: (context) => AppStateModel()..loadProducts(), // NEW
      child: const MyFirstPage(),               // NEW
    ),
  );
}

