// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:salespro_admin/model/transition_model.dart';

import '../../model/add_to_cart_model.dart';

class GenerateInvoice extends StatefulWidget {
  const GenerateInvoice({super.key, required this.saleTransactionModel});

  final SaleTransactionModel saleTransactionModel;

  @override
  State<GenerateInvoice> createState() => _GenerateInvoiceState();
}

class _GenerateInvoiceState extends State<GenerateInvoice> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        generatePdf(widget.saleTransactionModel!);
      },
      child: Text(
        "View Invoice",
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  Future<void> generatePdf(SaleTransactionModel saleTransactionModel) async {
    final pdf = pw.Document(
      title: "Order Invoice",
    );
    // int qty = saleTransactionModel.productList
    //     .fold(0, (int accumulator, OrderItem e) => accumulator + e.qty);

    // DeliveryAddress address = saleTransactionModel.deliveryAddress;
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(288, getInvoiceHeight(saleTransactionModel), marginAll: 0),
        build: (pw.Context context) {
          pw.TextStyle keyStyle = pw.TextStyle(
            fontSize: 9.5,
            color: PdfColor.fromHex("#000000"),
            fontWeight: pw.FontWeight.bold,
          );
          pw.TextStyle valueStyle = pw.TextStyle(
            fontSize: 10,
            color: PdfColor.fromHex("#000000"),
            fontWeight: pw.FontWeight.normal,
          );
          return pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Container(
                  height: 40,
                  padding: const pw.EdgeInsets.all(0),
                  child: pw.Text(
                    "ARV Exclusive",
                    maxLines: 1,
                    style: pw.TextStyle(
                      fontSize: 20,
                      color: PdfColor.fromHex("#000000"),
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.all(0),
                  padding: const pw.EdgeInsets.all(0),
                  color: PdfColor.fromHex("#050505"),
                  width: 300,
                  height: 0.01,
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  margin: const pw.EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text(
                        "39 TVR Road, ThiruthuraiPoondi",
                        maxLines: 1,
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColor.fromHex("#000000"),
                          fontWeight: pw.FontWeight.normal,
                          lineSpacing: 2.5,
                          height: 2.5,
                        ),
                      ),
                      pw.Text(
                        "GSTIN: 33AAKFA8216G1ZN",
                        maxLines: 1,
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColor.fromHex("#000000"),
                          fontWeight: pw.FontWeight.normal,
                          lineSpacing: 2.5,
                          height: 2.5,
                        ),
                      ),
                      pw.Text(
                        "Contact: 9489222702",
                        maxLines: 1,
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColor.fromHex("#000000"),
                          fontWeight: pw.FontWeight.normal,
                          lineSpacing: 2.5,
                          height: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.all(0),
                  padding: const pw.EdgeInsets.all(0),
                  color: PdfColor.fromHex("#050505"),
                  width: 300,
                  height: 0.01,
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  margin: const pw.EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                        child: buildInvoiceRow(
                          "Invoice Number",
                          saleTransactionModel.invoiceNumber,
                          keyStyle,
                          valueStyle,
                        ),
                      ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Name",
                      //     address.name,
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Phone",
                      //     address.phone,
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                        child: buildInvoiceRow(
                          "Date",
                          saleTransactionModel.purchaseDate,
                          keyStyle,
                          valueStyle,
                        ),
                      ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Address",
                      //     "${getText(address.addressLine1)}${getText(address.addressLine2)}${getText(address.area)}${getText(address.pinCode)}${getText(address.state)}.",
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Landmark",
                      //     "${address.landMark}.",
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.all(0),
                  padding: const pw.EdgeInsets.all(0),
                  color: PdfColor.fromHex("#050505"),
                  width: 300,
                  height: 0.01,
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  margin: const pw.EdgeInsets.all(10),
                  child: pw.Text(
                    "Order List",
                    maxLines: 1,
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: pw.ListView.builder(
                    itemCount: saleTransactionModel.productList!.length,
                    itemBuilder: (context, index) {
                      AddToCartModel saleTransactionModelItem = saleTransactionModel.productList![index];
                      return pw.Column(
                        children: [
                          pw.Container(
                            padding: pw.EdgeInsets.zero,
                            child: pw.Row(
                              children: [
                                pw.SizedBox(
                                  width: 190,
                                  child: pw.Text(
                                    "${index + 1}. ${saleTransactionModel.productList![index].productName}",
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromHex("#000000"),
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                    maxLines: 1,
                                    overflow: pw.TextOverflow.clip,
                                  ),
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  '${saleTransactionModel.productList![index].quantity} x Rs. ${saleTransactionModelItem.productPurchasePrice}',
                                  style: pw.TextStyle(
                                    fontSize: 9,
                                    color: PdfColor.fromHex("#000000"),
                                    fontWeight: pw.FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // pw.Container(
                          //   padding: pw.EdgeInsets.zero,
                          //   child: pw.Row(
                          //     children: [
                          //       pw.SizedBox(
                          //         width: 190,
                          //         child: pw.Text(
                          //           'Variant : ${saleTransactionModel.productList[index].variant ?? "-"}',
                          //           style: pw.TextStyle(
                          //             fontSize: 10,
                          //             color: PdfColor.fromHex("#000000"),
                          //             fontWeight: pw.FontWeight.normal,
                          //           ),
                          //         ),
                          //       ),
                          //       pw.Spacer(),
                          //     ],
                          //   ),
                          // ),
                          pw.SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                pw.Container(
                  height: 250,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Container(
                        color: PdfColor.fromHex("#050505"),
                        width: 300,
                        height: 0.5,
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                        child: buildInvoiceRow(
                          "Total Item ",
                          ": ${saleTransactionModel.productList!.length}.",
                          keyStyle,
                          valueStyle,
                        ),
                      ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Total Quantity ",
                      //     ": $qty.",
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Delivery charge ",
                      //     ": Rs. ${saleTransactionModel.deliveryCharge}.",
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                        child: buildInvoiceRow(
                          "Grand Total ",
                          ": Rs. ${saleTransactionModel.totalAmount}.",
                          pw.TextStyle(
                            fontSize: 12,
                            color: PdfColor.fromHex("#000000"),
                            fontWeight: pw.FontWeight.bold,
                          ),
                          pw.TextStyle(
                            fontSize: 12,
                            color: PdfColor.fromHex("#000000"),
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                        child: buildInvoiceRow(
                          "Paid By ",
                          ": Cash On Delivery",
                          keyStyle,
                          valueStyle,
                        ),
                      ),
                      pw.Container(
                        color: PdfColor.fromHex("#050505"),
                        width: 300,
                        height: 0.01,
                      ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Delivery Person Name : ",
                      //     saleTransactionModel.deliveryMan?.name ?? "",
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      // pw.Container(
                      //   padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      //   child: buildInvoiceRow(
                      //     "Contact : ",
                      //     saleTransactionModel.deliveryMan?.phone ?? "",
                      //     keyStyle,
                      //     valueStyle,
                      //   ),
                      // ),
                      pw.Container(
                        color: PdfColor.fromHex("#050505"),
                        width: 300,
                        height: 0.01,
                      ),
                      pw.Center(
                        child: pw.Text(
                          "Thank You !",
                          maxLines: 1,
                          style: pw.TextStyle(
                            fontSize: 12,
                            color: PdfColor.fromHex("#000000"),
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Container(
                        color: PdfColor.fromHex("#050505"),
                        width: 300,
                        height: 0.01,
                      ),
                      pw.Center(
                        child: pw.Text(
                          "\u00a9 ${DateTime.now().year} ARV Exclusive, All right reserved",
                          maxLines: 1,
                          style: pw.TextStyle(
                            fontSize: 7.5,
                            color: PdfColor.fromHex("#000000"),
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    final pdfBytes = await pdf.save();
    final blob = html.Blob([Uint8List.fromList(pdfBytes)], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.window.open(url, '_blank');
  }

  double getInvoiceHeight(SaleTransactionModel saleTransactionModel) {
    var saleTransactionModelHeight = saleTransactionModel.productList!.length * 0.5;
    return (530.0 + (saleTransactionModelHeight * MediaQuery.of(context).size.height) * 0.099);
  }

  String getText(String text) =>
      [null, "", "-", " - "].contains(text) ? "" : '$text, ';

  pw.Row buildInvoiceRow(String key, String value, pw.TextStyle keyStyle,
      pw.TextStyle valueStyle) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Container(
          width: 85,
          child: pw.Text(
            key,
            maxLines: 1,
            style: keyStyle,
          ),
        ),
        pw.SizedBox(width: 15),
        pw.Container(
          width: 140,
          child: pw.Text(
            value,
            maxLines: 3,
            softWrap: true,
            style: valueStyle,
          ),
        )
      ],
    );
  }

  Future<Uint8List> getLogoImage() async {
    final ByteData data = await rootBundle.load("assets/images/playstore.png");
    return data.buffer.asUint8List();
  }

  Row buildRowText(String key, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          key,
          style: TextStyle(
            color:  Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            color:  Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  // double getPriceByVariant(Product product, String? variant) {
  //   return product.productVariants
  //       .where((e) => e.productVariant == variant)
  //       .first
  //       .price;
  // }
}
