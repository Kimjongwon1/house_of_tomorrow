import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';

class ShoppingViewModel extends BaseViewModel {
  ShoppingViewModel({
    required this.productRepository,
  });
  List<Product> productList = [];
  final TextEditingController textController = TextEditingController();
  final ProductRepository productRepository;

  String get keyword => textController.text.trim();

  Future<void> searchProductList() async {
    isBusy = true;
    final results = await Future.wait([
      productRepository.searchProductList(keyword),
      Future.delayed(const Duration(milliseconds: 555)),
    ]);
    productList = results[0];
    isBusy = false;
  }
}
