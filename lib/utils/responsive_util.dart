import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUtil {
  // Convert font size to responsive size
  static double fontSize(double size) => size.sp;
  
  // Convert width to responsive width
  static double width(double width) => width.w;
  
  // Convert height to responsive height
  static double height(double height) => height.h;
  
  // Convert radius to responsive radius
  static double radius(double radius) => radius.r;
}