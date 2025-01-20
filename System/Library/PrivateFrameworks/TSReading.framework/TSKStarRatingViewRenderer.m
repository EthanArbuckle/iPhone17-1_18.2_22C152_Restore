@interface TSKStarRatingViewRenderer
+ (CGPath)newStarPath:(double)a3;
+ (void)renderRating:(int64_t)a3 intoContext:(CGContext *)a4 rect:(CGRect)a5 style:(int)a6 showDots:(BOOL)a7 color:(id)a8;
- (TSKStarRatingViewRenderer)init;
@end

@implementation TSKStarRatingViewRenderer

- (TSKStarRatingViewRenderer)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSKStarRatingViewRenderer;
  return [(TSKStarRatingViewRenderer *)&v3 init];
}

+ (CGPath)newStarPath:(double)a3
{
  double v4 = a3 * 0.381966011;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, -a3);
  CGPathAddLineToPoint(Mutable, 0, v4 * -0.587785252, v4 * -0.809016994);
  CGPathAddLineToPoint(Mutable, 0, a3 * -0.951056516, a3 * -0.309016994);
  CGPathAddLineToPoint(Mutable, 0, v4 * -0.951056516, v4 * 0.309016994);
  CGPathAddLineToPoint(Mutable, 0, a3 * -0.587785252, a3 * 0.809016994);
  CGPathAddLineToPoint(Mutable, 0, v4 * 6.123234e-17, a3 * 0.381966011);
  CGPathAddLineToPoint(Mutable, 0, a3 * 0.587785252, a3 * 0.809016994);
  CGPathAddLineToPoint(Mutable, 0, v4 * 0.951056516, v4 * 0.309016994);
  CGPathAddLineToPoint(Mutable, 0, a3 * 0.951056516, a3 * -0.309016994);
  CGPathAddLineToPoint(Mutable, 0, v4 * 0.587785252, v4 * -0.809016994);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

+ (void)renderRating:(int64_t)a3 intoContext:(CGContext *)a4 rect:(CGRect)a5 style:(int)a6 showDots:(BOOL)a7 color:(id)a8
{
  rect[2] = a8;
  BOOL v8 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v38 = *MEMORY[0x263EF8340];
  CGContextSaveGState(a4);
  double v17 = width / 5.0;
  if (width / 5.0 >= height) {
    double v18 = height;
  }
  else {
    double v18 = width / 5.0;
  }
  v19 = (const CGPath *)[a1 newStarPath:v18 / 2.5];
  CGContextSetRGBStrokeColor(a4, 0.4, 0.4, 0.4, 1.0);
  CGContextSetLineWidth(a4, fmax(v18 / 20.0, 1.0));
  v45.origin.double x = x;
  v45.origin.CGFloat y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v45);
  CGContextTranslateCTM(a4, x + v17 * 0.5, MidY + v18 * 0.05);
  for (int64_t i = 0; i != 5; ++i)
  {
    CGContextBeginPath(a4);
    if (i < a3)
    {
      CGContextAddPath(a4, v19);
      if (a6 != 2)
      {
        if (a6 != 1)
        {
          CGContextSetFillColorWithColor(a4, (CGColorRef)[rect[2] CGColor]);
          CGContextFillPath(a4);
          goto LABEL_20;
        }
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        *(_OWORD *)components = xmmword_223838150;
        long long v37 = unk_223838160;
        v23 = CGColorCreate(DeviceRGB, components);
        *(_OWORD *)&rect[3] = xmmword_223838170;
        long long v35 = unk_223838180;
        CGColorRef v24 = CGColorCreate(DeviceRGB, (const CGFloat *)&rect[3]);
        v25 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v23, v24, 0), 0);
        CFRelease(DeviceRGB);
        CGContextSaveGState(a4);
        CGContextClip(a4);
        v39.double x = x;
        v39.CGFloat y = v18 * -0.5;
        v42.double x = x;
        v42.CGFloat y = v18;
        CGContextDrawLinearGradient(a4, v25, v39, v42, 3u);
        CGContextRestoreGState(a4);
        CGGradientRelease(v25);
        CGColorRelease(v23);
        v26 = v24;
        goto LABEL_17;
      }
      v27 = CGColorSpaceCreateDeviceRGB();
      *(_OWORD *)components = xmmword_223838190;
      long long v37 = unk_2238381A0;
      v28 = CGColorCreate(v27, components);
      *(_OWORD *)&rect[3] = xmmword_2238381B0;
      long long v35 = unk_2238381C0;
      CGColorRef v29 = CGColorCreate(v27, (const CGFloat *)&rect[3]);
      v30 = CGGradientCreateWithColors(v27, (CFArrayRef)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v28, v29, 0), 0);
      CFRelease(v27);
      CGContextSaveGState(a4);
      CGContextClip(a4);
      v40.double x = x;
      v40.CGFloat y = v18 * -0.5;
      v43.double x = x;
      v43.CGFloat y = v18 * 0.5;
      CGContextDrawLinearGradient(a4, v30, v40, v43, 3u);
      CGContextBeginPath(a4);
      CGContextAddPath(a4, v19);
      CGContextSetRGBStrokeColor(a4, 0.164705882, 0.274509804, 0.164705882, 1.0);
      CGContextSetLineWidth(a4, 2.0);
      CGContextStrokePath(a4);
      CGContextRestoreGState(a4);
      v31 = v30;
LABEL_16:
      CGGradientRelease(v31);
      CGColorRelease(v28);
      v26 = v29;
LABEL_17:
      CGColorRelease(v26);
      goto LABEL_20;
    }
    if (!v8) {
      goto LABEL_20;
    }
    if (a6 == 2)
    {
      v32 = CGColorSpaceCreateDeviceRGB();
      *(_OWORD *)components = xmmword_2238381D0;
      long long v37 = unk_2238381E0;
      v28 = CGColorCreate(v32, components);
      *(_OWORD *)&rect[3] = xmmword_2238381F0;
      long long v35 = unk_223838200;
      CGColorRef v29 = CGColorCreate(v32, (const CGFloat *)&rect[3]);
      v33 = CGGradientCreateWithColors(v32, (CFArrayRef)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v28, v29, 0), 0);
      CFRelease(v32);
      CGContextSaveGState(a4);
      v46.origin.double x = v18 / 3.0 * -0.5;
      v46.origin.CGFloat y = v46.origin.x;
      v46.size.double width = v18 / 3.0;
      v46.size.double height = v18 / 3.0;
      CGContextAddEllipseInRect(a4, v46);
      CGContextClip(a4);
      v41.double x = x;
      v41.CGFloat y = v18 * -0.5;
      v44.double x = x;
      v44.CGFloat y = v18;
      CGContextDrawLinearGradient(a4, v33, v41, v44, 3u);
      CGContextBeginPath(a4);
      v47.origin.double x = v18 / 3.0 * -0.5;
      v47.origin.CGFloat y = v47.origin.x;
      v47.size.double width = v18 / 3.0;
      v47.size.double height = v18 / 3.0;
      CGContextAddEllipseInRect(a4, v47);
      CGContextSetRGBStrokeColor(a4, 0.164705882, 0.274509804, 0.164705882, 0.5);
      CGContextSetLineWidth(a4, 1.0);
      CGContextStrokePath(a4);
      CGContextRestoreGState(a4);
      v31 = v33;
      goto LABEL_16;
    }
    if (a6 == 1) {
      CGContextSetRGBFillColor(a4, 0.75, 0.75, 0.75, 1.0);
    }
    else {
      CGContextSetFillColorWithColor(a4, (CGColorRef)[rect[2] CGColor]);
    }
    v48.origin.double x = v18 * 0.25 * -0.5;
    v48.origin.CGFloat y = v48.origin.x;
    v48.size.double width = v18 * 0.25;
    v48.size.double height = v18 * 0.25;
    CGContextFillEllipseInRect(a4, v48);
    CGContextDrawPath(a4, kCGPathFillStroke);
LABEL_20:
    CGContextTranslateCTM(a4, v17, 0.0);
  }
  CGPathRelease(v19);
  CGContextRestoreGState(a4);
}

@end