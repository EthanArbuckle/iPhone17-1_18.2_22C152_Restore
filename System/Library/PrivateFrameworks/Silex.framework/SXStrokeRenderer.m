@interface SXStrokeRenderer
- (CGContext)newContextForFrame:(double)a3;
- (double)phaseForBorderWidth:(int)a3 style:(double *)a4 borderSide:(double)a5 length:(double)a6 startingGap:;
- (id)imageFromContext:(uint64_t)a1;
- (id)initWithComponentView:(id *)a1;
- (id)lineForStyle:(double)a3 andFrame:(double)a4;
@end

@implementation SXStrokeRenderer

- (id)initWithComponentView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SXStrokeRenderer;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (CGContext)newContextForFrame:(double)a3
{
  if (!a1) {
    return 0;
  }
  v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v9 = v8;

  CGFloat v10 = a5 * v9;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGBitmapContextCreate(0, (unint64_t)(a4 * v9), (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(a4 * v9, 2uLL), DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextTranslateCTM(v12, 0.0, v10);
  v13 = [MEMORY[0x263F1C920] mainScreen];
  [v13 scale];
  CGFloat v15 = v14;
  v16 = [MEMORY[0x263F1C920] mainScreen];
  [v16 scale];
  CGContextScaleCTM(v12, v15, -v17);

  return v12;
}

- (id)imageFromContext:(uint64_t)a1
{
  if (a1)
  {
    Image = CGBitmapContextCreateImage(context);
    id v3 = (void *)MEMORY[0x263F1C6B0];
    v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    v5 = objc_msgSend(v3, "imageWithCGImage:scale:orientation:", Image, 0);

    CGImageRelease(Image);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)lineForStyle:(double)a3 andFrame:(double)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (a1)
  {
    v12 = [MEMORY[0x263F1C550] blackColor];
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      double v14 = [WeakRetained unitConverter];
      uint64_t v15 = [v11 width];
      objc_msgSend(v14, "convertValueToPoints:", v15, v16);
      double v18 = v17;

      uint64_t v19 = [v11 color];

      int v20 = [v11 style];
      v12 = (void *)v19;
    }
    else
    {
      double v18 = 1.0;
      int v20 = 1;
    }
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 0.0, v18 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, a5, v18 * 0.5);
    v22 = -[SXStrokeRenderer newContextForFrame:]((uint64_t)a1, a3, a4, a5, a6);
    if ((v20 & 0xFFFFFFFE) == 2)
    {
      uint64_t v26 = 0;
      double v23 = -[SXStrokeRenderer phaseForBorderWidth:style:borderSide:length:startingGap:]((uint64_t)a1, v20, 1, (double *)&v26, v18, a5);
      if (v20 == 2)
      {
        CGFloat lengths = v18 * 3.0;
        double v28 = v18 * 3.0;
        CGContextSetLineDash(v22, v23, &lengths, 2uLL);
      }
      else
      {
        CGFloat lengths = 0.0;
        double v28 = v18 * 3.0 + v18 * 3.0;
        CGContextSetLineDash(v22, v23, &lengths, 2uLL);
        CGContextSetLineCap(v22, kCGLineCapRound);
      }
    }
    CGContextAddPath(v22, Mutable);
    CGContextSetLineWidth(v22, v18);
    id v24 = v12;
    CGContextSetStrokeColorWithColor(v22, (CGColorRef)[v24 CGColor]);
    CGContextStrokePath(v22);
    CGPathRelease(Mutable);
    -[SXStrokeRenderer imageFromContext:]((uint64_t)a1, v22);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    CGContextRelease(v22);
  }
  return a1;
}

- (double)phaseForBorderWidth:(int)a3 style:(double *)a4 borderSide:(double)a5 length:(double)a6 startingGap:
{
  if (!a1) {
    return 0.0;
  }
  if (a2 == 2) {
    double v6 = a5 * 3.0;
  }
  else {
    double v6 = a5;
  }
  double v7 = v6 + v6;
  double v8 = a6 / (v6 + v6) - (double)(int)(a6 / (v6 + v6));
  if (v8 >= 0.5) {
    double v8 = v8 + -1.0;
  }
  float v9 = v6 - v7 * v8;
  double v10 = roundf(v9) * 0.5;
  if ((a3 - 1) <= 1 && v6 - v10 < a5)
  {
    if (a4)
    {
      float v11 = v6 - v10;
      *a4 = floorf(v11);
    }
    double v10 = v6 + v10;
  }
  float v12 = v10;
  float v13 = v7;
  return fmodf(roundf(v12), v13);
}

- (void).cxx_destruct
{
}

@end