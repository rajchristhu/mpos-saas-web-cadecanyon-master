class ProductModel {
  late String productName,
      productCategory,
      size,
      color,
      weight,
      capacity,
      type,
      warranty,
      brandName,
      productCode,
      productStock,
      productUnit,
      productSalePrice,
      productPurchasePrice,
      productDiscount,
      productWholeSalePrice,
      productDealerPrice,
      productManufacturer,
      productPicture,
      gst,
      discount,
      mrp,
      nsnSAC;
  List<String?> serialNumber = [];

  ProductModel({
    required this.productName,
    required this.mrp,
    required this.productCategory,
    required this.size,
    required this.color,
    required this.discount,
    required this.weight,
    required this.capacity,
    required this.type,
    required this.warranty,
    required this.brandName,
    required this.productCode,
    required this.productStock,
    required this.productUnit,
    required this.productSalePrice,
    required this.productPurchasePrice,
    required this.productDiscount,
    required this.gst,
    required this.productWholeSalePrice,
    required this.productDealerPrice,
    required this.productManufacturer,
    required this.productPicture,
    required this.serialNumber,
    required this.nsnSAC,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    productName = json['productName'] as String;
    discount = json['discount'] as String;
    mrp = json['mrp'] as String;
    productCategory = json['productCategory'].toString();
    size = json['size'].toString();
    gst = json['gst'].toString();
    color = json['color'].toString();
    weight = json['weight'].toString();
    capacity = json['capacity'].toString();
    type = json['type'].toString();
    warranty = json['warranty'].toString();
    brandName = json['brandName'].toString();
    productCode = json['productCode'].toString();
    productStock = json['productStock'].toString();
    productUnit = json['productUnit'].toString();
    productSalePrice = json['productSalePrice'].toString();
    productPurchasePrice = json['productPurchasePrice'].toString();
    productDiscount = json['productDiscount'].toString();
    productWholeSalePrice = json['productWholeSalePrice'].toString();
    productDealerPrice = json['productDealerPrice'].toString();
    productManufacturer = json['productManufacturer'].toString();
    productPicture = json['productPicture'].toString();
    nsnSAC = json['NSNSAC'].toString();
    if (json['serialNumber'] != null) {
      serialNumber = <String>[];
      json['serialNumber'].forEach((v) {
        serialNumber.add(v);
      });
    }
  }

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'productName': productName,
        'productCategory': productCategory,
        'size': size,
        'discount': discount,
        'color': color,
        'gst': gst,
        'weight': weight,
        'capacity': capacity,
        'type': type,
        'warranty': warranty,
        'brandName': brandName,
        'productCode': productCode,
        'mrp': mrp,
        'productStock': productStock,
        'productUnit': productUnit,
        'productSalePrice': productSalePrice,
        'productPurchasePrice': productPurchasePrice,
        'productDiscount': productDiscount,
        'productWholeSalePrice': productWholeSalePrice,
        'productDealerPrice': productDealerPrice,
        'productManufacturer': productManufacturer,
        'productPicture': productPicture,
        'NSNSAC': nsnSAC,
        'serialNumber': serialNumber.map((e) => e).toList(),
      };
}
