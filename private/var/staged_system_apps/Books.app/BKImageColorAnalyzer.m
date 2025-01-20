@interface BKImageColorAnalyzer
+ (BOOL)isDarkColor:(CGColor *)a3;
+ (double)colorLuminance:(CGColor *)a3;
+ (id)analyzeColor:(id)a3;
@end

@implementation BKImageColorAnalyzer

+ (id)analyzeColor:(id)a3
{
  v3 = (CGImage *)[a3 CGImage];
  size_t Width = CGImageGetWidth(v3);
  size_t Height = CGImageGetHeight(v3);
  v6 = 0;
  if (Width && Height)
  {
    v7 = (CGColorSpace *)sub_1000E4708();
    if (v7)
    {
      CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v3, v7);
      v9 = CopyWithColorSpace;
      if (CopyWithColorSpace) {
        v3 = CopyWithColorSpace;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = (CGContext *)TSDBitmapContextCreate();
    CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
    if (v10)
    {
      v14.origin.x = CGPointZero.x;
      v14.origin.y = CGPointZero.y;
      v14.size.width = 22.0;
      v14.size.height = 22.0;
      CGContextDrawImage(v10, v14, v3);
    }
    if (v9) {
      CGImageRelease(v9);
    }
    sub_100156194(v12);
    if (sub_100165508((BOOL)v10, (uint64_t)v12))
    {
      v6 = +[UIColor colorWithRed:v12[0] green:v12[1] blue:v12[2] alpha:v12[3]];
      if (!v10) {
        goto LABEL_17;
      }
    }
    else
    {
      v6 = 0;
      if (!v10) {
        goto LABEL_17;
      }
    }
    CGContextRelease(v10);
  }
LABEL_17:

  return v6;
}

+ (BOOL)isDarkColor:(CGColor *)a3
{
  sub_10009BC84((int)v4, a3);
  return sub_100165694(v4[0], v4[1], v4[2], v4[3]);
}

+ (double)colorLuminance:(CGColor *)a3
{
  sub_10009BC84((int)v4, a3);
  sub_10009BFD8(v4);
  return result;
}

@end