import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printer_app/constants/colors.dart';
import 'package:printing/printing.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
   nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.blueColor,
        title: Center(child: const Text("Printing")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 50),
            child: Text("Name",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),

            ),
          ),
          SizedBox(height: 5,),
          Align(
          alignment: Alignment.center,
            child: Container(
              width: 325,
              height: 50,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                  border: Border.all(color:Colors.black38)),
              child: Row(
                children: [

                  SizedBox(
                    width: 270,
                    height: 50,
                    child:  TextField(
                      cursorColor: Colors.black38,
                      controller: nameController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintStyle:  TextStyle(
                            color: Colors.black38.withOpacity(0.2)
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      autocorrect: false,

                    ),
                  )
                ],
              ),
            ),
          ),
  SizedBox(height: 200,),
          Align(
            alignment: Alignment.center,
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: AppColors.blueColor, ),
              onPressed: _createPdf,

              child: Text('Print name',),
            ),
          ),

        ],
      ),
    );
  }

  /// create PDF & print it
  void _createPdf() async {
    final doc = pw.Document();

    /// for using an image from assets
    // final image = await imageFromAssetBundle('assets/image.png');

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          // Center
          return pw.Center(
            child: pw.Column(
                children: [
                  pw.Text(nameController.text, style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 50,
                  ),
                  ),
                  pw.Text(nameController.text, style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 40,

                  )),
                  pw.Text(nameController.text, style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 30,

                  )),
                  pw.Text(nameController.text, style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 20,

                  )),
                ]
            )
          );
        },
      ),
    ); // Page

    /// print the document using the iOS or Android print service:
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());

    /// share the document to other applications:
    // await Printing.sharePdf(bytes: await doc.save(), filename: 'my-document.pdf');

  }



}