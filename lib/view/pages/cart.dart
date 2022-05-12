import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iide_project/model/size_config.dart';
import '../../controller/get_controller.dart';
import '../../utils/constants.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GetController getController = Get.find<GetController>();
  late GetController gc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gc = Get.put(GetController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child:Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 2.h,bottom: 2.h),
                  child: Text("Details List ",style: TextStyle(fontSize: 2.t,fontWeight:FontWeight.w500),),
                ),

                // Obx(() => Text("${getController.selectedItem.length}"),),
                Obx(() =>  Container(
                  height: 90.h,
                  child: ListView.builder(
                      shrinkWrap: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: getController.selectedItem.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            alignment: Alignment.topRight,
                            width: double.infinity,
                            child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 1.h, bottom: 2.2.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 4.w,right: 8.w),
                                      child: Text("${getController.selectedItem[index].name}",style: TextStyle(
                                          color: Constant.black
                                      ),),
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
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
