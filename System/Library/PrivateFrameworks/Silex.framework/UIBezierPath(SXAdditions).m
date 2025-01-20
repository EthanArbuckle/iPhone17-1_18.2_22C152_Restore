@interface UIBezierPath(SXAdditions)
+ (id)sx_bezierPathWithNonContinuousRoundedRect:()SXAdditions byRoundingCorners:cornerRadius:;
+ (id)sx_bezierPathWithRect:()SXAdditions byRoundingCorners:cornerRadius:continuousCorners:;
@end

@implementation UIBezierPath(SXAdditions)

+ (id)sx_bezierPathWithRect:()SXAdditions byRoundingCorners:cornerRadius:continuousCorners:
{
  if (a5 > 0.0)
  {
    if (a9) {
      objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a1, a2, a3, a4, a5, a5);
    }
    else {
    v9 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithNonContinuousRoundedRect:byRoundingCorners:cornerRadius:");
    }
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:");
  }
  return v9;
}

+ (id)sx_bezierPathWithNonContinuousRoundedRect:()SXAdditions byRoundingCorners:cornerRadius:
{
  if ((~a8 & 5) == 0 || (a8 & 0xA) == 0xALL)
  {
    double v14 = CGRectGetHeight(*(CGRect *)&a1) * 0.5;
    if (v14 <= a5) {
      a5 = v14;
    }
  }
  if ((~a8 & 3) == 0 || (a8 & 0xC) == 0xCLL)
  {
    v46.origin.x = a1;
    v46.origin.y = a2;
    v46.size.width = a3;
    v46.size.height = a4;
    double v15 = CGRectGetWidth(v46) * 0.5;
    if (a5 >= v15) {
      a5 = v15;
    }
  }
  v47.origin.x = a1;
  v47.origin.y = a2;
  v47.size.width = a3;
  v47.size.height = a4;
  double Width = CGRectGetWidth(v47);
  v48.origin.x = a1;
  v48.origin.y = a2;
  v48.size.width = a3;
  v48.size.height = a4;
  double Height = CGRectGetHeight(v48);
  if (Width < Height) {
    double Height = Width;
  }
  if (a5 >= Height) {
    a5 = Height;
  }
  Mutable = CGPathCreateMutable();
  double v19 = 0.0;
  if (a8) {
    double v20 = a5;
  }
  else {
    double v20 = 0.0;
  }
  if ((a8 & 2) != 0) {
    double v21 = a5;
  }
  else {
    double v21 = 0.0;
  }
  if ((a8 & 8) != 0) {
    double v22 = a5;
  }
  else {
    double v22 = 0.0;
  }
  if ((a8 & 4) != 0) {
    double v19 = a5;
  }
  double v43 = v19;
  v49.origin.x = a1;
  v49.origin.y = a2;
  v49.size.width = a3;
  v49.size.height = a4;
  double v44 = v20;
  CGFloat v23 = CGRectGetMinX(v49) + v20;
  v50.origin.x = a1;
  v50.origin.y = a2;
  v50.size.width = a3;
  v50.size.height = a4;
  CGFloat MinY = CGRectGetMinY(v50);
  CGPathMoveToPoint(Mutable, 0, v23, MinY);
  v51.origin.x = a1;
  v51.origin.y = a2;
  v51.size.width = a3;
  v51.size.height = a4;
  CGFloat v25 = CGRectGetMaxX(v51) - v21;
  v52.origin.x = a1;
  v52.origin.y = a2;
  v52.size.width = a3;
  v52.size.height = a4;
  CGFloat v26 = CGRectGetMinY(v52);
  CGPathAddLineToPoint(Mutable, 0, v25, v26);
  if (v21 > 0.0)
  {
    v53.origin.x = a1;
    v53.origin.y = a2;
    v53.size.width = a3;
    v53.size.height = a4;
    CGFloat v27 = CGRectGetMaxX(v53) - a5;
    v54.origin.x = a1;
    v54.origin.y = a2;
    v54.size.width = a3;
    v54.size.height = a4;
    CGFloat v28 = CGRectGetMinY(v54);
    CGPathAddArc(Mutable, 0, v27, a5 + v28, a5, 4.71238898, 6.28318531, 0);
  }
  v55.origin.x = a1;
  v55.origin.y = a2;
  v55.size.width = a3;
  v55.size.height = a4;
  CGFloat MaxX = CGRectGetMaxX(v55);
  v56.origin.x = a1;
  v56.origin.y = a2;
  v56.size.width = a3;
  v56.size.height = a4;
  CGFloat MaxY = CGRectGetMaxY(v56);
  CGPathAddLineToPoint(Mutable, 0, MaxX, MaxY - v22);
  if (v22 > 0.0)
  {
    v57.origin.x = a1;
    v57.origin.y = a2;
    v57.size.width = a3;
    v57.size.height = a4;
    CGFloat v31 = CGRectGetMaxX(v57) - a5;
    v58.origin.x = a1;
    v58.origin.y = a2;
    v58.size.width = a3;
    v58.size.height = a4;
    CGFloat v32 = CGRectGetMaxY(v58);
    CGPathAddArc(Mutable, 0, v31, v32 - a5, a5, 0.0, 1.57079633, 0);
  }
  v59.origin.x = a1;
  v59.origin.y = a2;
  v59.size.width = a3;
  v59.size.height = a4;
  CGFloat v33 = v43 + CGRectGetMinX(v59);
  v60.origin.x = a1;
  v60.origin.y = a2;
  v60.size.width = a3;
  v60.size.height = a4;
  CGFloat v34 = CGRectGetMaxY(v60);
  CGPathAddLineToPoint(Mutable, 0, v33, v34);
  if (v43 > 0.0)
  {
    v61.origin.x = a1;
    v61.origin.y = a2;
    v61.size.width = a3;
    v61.size.height = a4;
    CGFloat v35 = a5 + CGRectGetMinX(v61);
    v62.origin.x = a1;
    v62.origin.y = a2;
    v62.size.width = a3;
    v62.size.height = a4;
    CGFloat v36 = CGRectGetMaxY(v62);
    CGPathAddArc(Mutable, 0, v35, v36 - a5, a5, 1.57079633, 3.14159265, 0);
  }
  v63.origin.x = a1;
  v63.origin.y = a2;
  v63.size.width = a3;
  v63.size.height = a4;
  CGFloat MinX = CGRectGetMinX(v63);
  v64.origin.x = a1;
  v64.origin.y = a2;
  v64.size.width = a3;
  v64.size.height = a4;
  CGFloat v38 = CGRectGetMinY(v64);
  CGPathAddLineToPoint(Mutable, 0, MinX, v44 + v38);
  if (v44 > 0.0)
  {
    v65.origin.x = a1;
    v65.origin.y = a2;
    v65.size.width = a3;
    v65.size.height = a4;
    CGFloat v39 = a5 + CGRectGetMinX(v65);
    v66.origin.x = a1;
    v66.origin.y = a2;
    v66.size.width = a3;
    v66.size.height = a4;
    CGFloat v40 = CGRectGetMinY(v66);
    CGPathAddArc(Mutable, 0, v39, a5 + v40, a5, 3.14159265, 4.71238898, 0);
  }
  v41 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithCGPath:", Mutable, *(void *)&v43);
  CFRelease(Mutable);
  return v41;
}

@end