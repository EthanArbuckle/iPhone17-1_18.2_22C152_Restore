@interface UIBezierPath(TextInputUI)
+ (id)_bezierPathRect:()TextInputUI topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:;
@end

@implementation UIBezierPath(TextInputUI)

+ (id)_bezierPathRect:()TextInputUI topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  double MinY = CGRectGetMinY(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  double MaxY = CGRectGetMaxY(v26);
  id v17 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  objc_msgSend(v17, "moveToPoint:");
  objc_msgSend(v17, "addLineToPoint:", MaxX - a6, MinY);
  objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX - a6, MinY + a6, a6, 4.71238898, 0.0);
  objc_msgSend(v17, "addLineToPoint:", MaxX, MaxY - a7);
  objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX - a7, MaxY - a7, a7, 0.0, 1.57079633);
  objc_msgSend(v17, "addLineToPoint:", MinX + a8, MaxY);
  objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX + a8, MaxY - a8, a8, 1.57079633, 3.14159265);
  objc_msgSend(v17, "addLineToPoint:", MinX, MinY + a5);
  objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX + a5, MinY + a5, a5, 3.14159265, 4.71238898);
  [v17 closePath];
  return v17;
}

@end