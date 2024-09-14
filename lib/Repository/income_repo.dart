import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:salespro_admin/model/income_modle.dart';

import '../constant.dart';

class IncomeRepo {
  Future<List<IncomeModel>> getAllIncome() async {
    List<IncomeModel> allIncome = [];

    await FirebaseDatabase.instance.ref(await getUserID()).child('Income').orderByKey().get().then((value) {
      for (var element in value.children) {
        var data = IncomeModel.fromJson(jsonDecode(jsonEncode(element.value)));
        allIncome.add(data);
      }
    });
    return allIncome;
  }
}

class PurchaseModel {
  Future<bool> isActiveBuyer() async {
    final response =
    await http.get(Uri.parse('https://api.envato.com/v3/market/author/sale?code=$purchaseCode'), headers: {'Authorization': 'Bearer orZoxiU81Ok7kxsE0FvfraaO0vDW5tiz'});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
