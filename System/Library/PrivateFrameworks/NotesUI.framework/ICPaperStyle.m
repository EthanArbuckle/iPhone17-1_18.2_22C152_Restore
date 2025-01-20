@interface ICPaperStyle
+ (id)linedPaperWithPaperStyleType:(unint64_t)a3;
+ (void)drawPaperStyleType:(unint64_t)a3 inRect:(CGRect)a4;
@end

@implementation ICPaperStyle

+ (id)linedPaperWithPaperStyleType:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F38E88] * 24.0 / 375.0;
  double v4 = *MEMORY[0x1E4F38E88] + v3 * -2.0;
  double v5 = v4 / 6.0;
  double v6 = v4 / 6.0 * 0.5;
  switch(a3)
  {
    case 2uLL:
      double v6 = v6 * 0.5;
      goto LABEL_3;
    case 3uLL:
LABEL_3:
      double v5 = v6;
      break;
    case 4uLL:
      double v6 = v4 / 6.0;
      break;
    case 5uLL:
      double v7 = 24.0;
      goto LABEL_8;
    case 6uLL:
      double v6 = v4 * 0.0625;
      double v5 = 0.0;
      break;
    case 7uLL:
      double v7 = 12.0;
LABEL_8:
      double v5 = 0.0;
      double v6 = v4 / v7;
      break;
    default:
      break;
  }
  if (v5 == *MEMORY[0x1E4F1DAD8] && v6 == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
    v8 = 0;
  }
  else {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F38E28]), "initWithLineSpacing:horizontalInset:", v5, v6, v3);
  }
  return v8;
}

+ (void)drawPaperStyleType:(unint64_t)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v8 = [a1 linedPaperWithPaperStyleType:a3];
  if (v8)
  {
    id v28 = v8;
    CurrentContext = UIGraphicsGetCurrentContext();
    double v10 = *MEMORY[0x1E4F38E88];
    [v28 horizontalInset];
    double v12 = width * v11 / v10;
    double v27 = v12;
    [v28 lineSpacing];
    double v14 = width * v13 / v10;
    [v28 lineSpacing];
    double v16 = x + v12;
    CGFloat v17 = x;
    double v18 = width * v15 / v10;
    v30.origin.double x = v17;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.CGFloat height = height;
    double v19 = CGRectGetMaxX(v30) - v27;
    v31.origin.double x = v17;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v31);
    double v21 = v19 + 1.0;
    if (v14 > 0.0 && v16 <= v21)
    {
      CGFloat v23 = v16;
      do
      {
        CGContextMoveToPoint(CurrentContext, v23, y);
        CGContextAddLineToPoint(CurrentContext, v23, MaxY);
        CGFloat v23 = v14 + v23;
      }
      while (v23 <= v21);
    }
    double v24 = MaxY + 1.0;
    if (v18 > 0.0 && y <= v24)
    {
      do
      {
        CGContextMoveToPoint(CurrentContext, v16, y);
        CGContextAddLineToPoint(CurrentContext, v19, y);
        double y = v18 + y;
      }
      while (y <= v24);
    }
    id v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.33];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v26 CGColor]);

    CGContextSetLineWidth(CurrentContext, 1.0);
    CGContextStrokePath(CurrentContext);
    v8 = v28;
  }
}

@end