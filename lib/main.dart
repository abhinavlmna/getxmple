import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmple/ApiProducts.dart';
import 'package:getxmple/Products.dart';
import 'package:http/http.dart';

import 'apiservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final controller=Get.put(Productsapi());

  @override
  Widget build(BuildContext context) {
    final Productsapi controller = Get.put(Productsapi());
    controller.fetch();
    return Scaffold(
        appBar: AppBar(title: Text("Users")),
        body:Obx(()=>ListView.builder(
          itemCount: controller.pr.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage('${controller.pr[index].images}'),),
              title: Text('${controller.pr[index].title}'),
              subtitle: Text("${controller.pr[index].description}"),
              trailing: Text('${controller.pr[index].price}'),
            );
          },)
      ));
  }
}
class Productsapi extends GetxController{
  RxList<Products>pr = <Products>[].obs;
  Apiservice apiservice=Apiservice();

  //create object of api service
   Future<void> fetch() async {
  var List= await apiservice.fetchdata();
  pr.assignAll(List as Iterable<Products>);
  update();
    // fetch data and update pr
    //call update
  }
}  