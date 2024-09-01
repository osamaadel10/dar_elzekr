// ignore_for_file: use_super_parameters
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constant/styles/colors.dart';
import 'language_sheet.dart';


class AppbarW extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;
  final bool hasTrackingButton;
  final bool hasLang;
  final bool hasfingerPrint;
  final TextStyle? titleTextStyle;
  final double titlePadding;

  const AppbarW({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.hasBackButton = false,
    this.hasTrackingButton = false,
    this.hasLang = false,
    this.hasfingerPrint = false,
    this.titlePadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Language().changeDirection(),
      child: Container(
          decoration: const BoxDecoration(color:primaryColor),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 40,
                  bottom: 15,
                ),
                child: Row(children: [
                  hasBackButton
                      ? Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InkWell(
                            onTap: (() {
                              Get.back();
                            }),
                            child: Icon(
                              CupertinoIcons.back,
                              size: 28.h,
                              color: Colors.white,
                            ),
                          ),
                      )
                      : const SizedBox(),
                  SizedBox(
                    width: 25.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: titlePadding,right: titlePadding,top: 5),
                    child: Text(
                      title.tr,
                      style:TextStyle(fontSize: 22.sp,
                            color: const Color(0xffBDEBFB))
                    ),
                  ),
                  const Spacer(),
                  hasLang
                      ? Padding(
                        padding: const EdgeInsets.only(top: 5.0,left: 5),
                        child: InkWell(
                            onTap: () {
                              changeLangeSheet(context);
                            },
                            child: const Icon(
                              Icons.language_rounded,
                              color: Color(0xffBDEBFB),
                              size: 28,
                            ),
                          ),
                      )
                      : const SizedBox()
                ])),
          ])),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}