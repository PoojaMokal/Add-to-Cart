import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iide_project/model/size_config.dart';
import 'package:iide_project/view/pages/cart.dart';

import '../../controller/get_controller.dart';
import '../../utils/constants.dart';
import '../../model/model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Item> itemList = [
    Item("Mango", 1, false),
    Item("Apple", 2, false),
    Item("Orange", 3, false),
    Item("Banana", 4, false),
    Item("Grapes", 5, false),
    Item("Lemon", 6, false),
    Item("Melon", 7, false),
    Item("Chikko", 8, false),
  ];
  List<Item> selectedList=[];
  late GetController gc;

  @override
  void initState() {
    super.initState();
    gc = Get.put(GetController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IIDE"),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 8.w),
            child: InkWell(
              onTap: (){
                setState(() {
                  Get.to(()=>Cart());
                });
              },
                child: Icon(Icons.shopping_cart,color: Colors.white,)),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:3.h),
            child: Column(
              children: [
                SizedBox(
                  height: 69.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: false,
                            physics: const AlwaysScrollableScrollPhysics(),
                            // physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: itemList.length,
                            itemBuilder: (BuildContext context, int index) =>
                               InkWell(
                                 onTap: (){
                                   setState(() {
                                     print("dfdsf");
                                     itemList[index].isSelected = !itemList[index].isSelected;
                                     if(itemList[index].isSelected == true){
                                       selectedList.add(Item(itemList[index].name, itemList[index].id, itemList[index].isSelected));
                                       gc.selectedItem.add(Item(itemList[index].name, itemList[index].id, itemList[index].isSelected));
                                       print(selectedList.length);
                                     }else{
                                       selectedList.removeWhere((element) => element.name == itemList[index].name);
                                       gc.selectedItem.removeWhere((element) => element.name == itemList[index].name);

                                     }
                                     print("Selected Item List ${selectedList.length}");
                                   });
                                 },
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    // height: 6.5.h,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 2.2.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         Container(
                                           margin: EdgeInsets.only(left: 4.w,right: 8.w),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text("${itemList[index].name}",style: TextStyle(
                                                 color: itemList[index].isSelected?Constant.primaryColor:Constant.black
                                               ),),

                                               Text("Add",style: TextStyle(
                                                 color: itemList[index].isSelected?Constant.primaryColor:Constant.black
                                               ),),

                                             ],
                                           ),
                                         ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Divider(
                                            thickness: 0.2,
                                            color: Theme.of(context).brightness ==
                                                Brightness.dark
                                                ? Constant.white
                                                : Constant.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
