@interface UIImage(PKUIUtilities)
+ (id)imageWithPKImage:()PKUIUtilities;
+ (id)pkui_imageWithColor:()PKUIUtilities;
+ (id)pkui_imageWithColor:()PKUIUtilities scale:;
- (double)pkui_alignmentSize;
- (double)pkui_alignmentSizeThatFills:()PKUIUtilities maximumScale:;
- (double)pkui_alignmentSizeThatFits:()PKUIUtilities maximumScale:;
- (id)pkui_firstPixelColor;
- (id)pkui_imageOverlaidWithColor:()PKUIUtilities;
- (id)pkui_imageWithAlpha:()PKUIUtilities;
- (uint64_t)pkui_alignmentSizeThatFills:()PKUIUtilities;
- (uint64_t)pkui_alignmentSizeThatFits:()PKUIUtilities;
- (uint64_t)pkui_resizableImageByTilingCenterPixel;
- (uint64_t)pkui_resizableImageByTilingHorizontally;
- (uint64_t)pkui_resizableImageByTilingVertically;
@end

@implementation UIImage(PKUIUtilities)

- (uint64_t)pkui_resizableImageByTilingCenterPixel
{
  [a1 alignmentRectInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [a1 scale];
  double v11 = 1.0 / v10;
  [a1 size];
  double v13 = v12 - (v5 + v9);
  double v15 = v14 - (v3 + v7);
  double v16 = floor((v13 - v11) * 0.5);
  double v17 = floor((v15 - v11) * 0.5);
  double v18 = v7 + v15 - (v11 + v17);
  double v19 = v9 + v13 - (v11 + v16);

  return objc_msgSend(a1, "resizableImageWithCapInsets:", v3 + v17, v5 + v16, v18, v19);
}

- (uint64_t)pkui_resizableImageByTilingHorizontally
{
  [a1 alignmentRectInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [a1 scale];
  double v11 = 1.0 / v10;
  [a1 size];
  double v13 = v12 - (v3 + v7);
  double v14 = floor((v13 - v11) * 0.5);
  double v15 = v3 + v14;
  double v16 = v7 + v13 - (v11 + v14);

  return objc_msgSend(a1, "resizableImageWithCapInsets:", v15, v5, v16, v9);
}

+ (id)imageWithPKImage:()PKUIUtilities
{
  id v3 = a3;
  double v4 = v3;
  if (!v3)
  {
    double v10 = 0;
    goto LABEL_10;
  }
  unint64_t v5 = [v3 orientation] - 1;
  if (v5 >= 8) {
    unint64_t v5 = 0;
  }
  uint64_t v6 = _UIImageOrientationForPKImageOrientation___orientationMapping[v5];
  id v7 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v8 = v4;
  uint64_t v9 = [v8 imageRef];
  [v8 scale];
  double v10 = objc_msgSend(v7, "initWithCGImage:scale:orientation:", v9, v6);
  if ([v8 tiles])
  {
    [v8 capInsets];
    uint64_t v11 = objc_msgSend(v10, "resizableImageWithCapInsets:");
  }
  else
  {
    if (![v8 stretches]) {
      goto LABEL_10;
    }
    [v8 capInsets];
    uint64_t v11 = objc_msgSend(v10, "_stretchableImageWithCapInsets:");
  }
  double v12 = (void *)v11;

  double v10 = v12;
LABEL_10:

  return v10;
}

- (id)pkui_imageWithAlpha:()PKUIUtilities
{
  [a1 size];
  double v5 = v4;
  double v7 = v6;
  id v8 = objc_alloc(MEMORY[0x1E4FB17D8]);
  uint64_t v9 = [a1 imageRendererFormat];
  double v10 = objc_msgSend(v8, "initWithSize:format:", v9, v5, v7);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__UIImage_PKUIUtilities__pkui_imageWithAlpha___block_invoke;
  v15[3] = &unk_1E59CEE18;
  v15[4] = a1;
  *(double *)&v15[5] = a2;
  uint64_t v11 = [v10 imageWithActions:v15];
  [a1 alignmentRectInsets];
  double v12 = objc_msgSend(v11, "imageWithAlignmentRectInsets:");
  double v13 = objc_msgSend(v12, "imageWithRenderingMode:", objc_msgSend(a1, "renderingMode"));

  return v13;
}

+ (id)pkui_imageWithColor:()PKUIUtilities
{
  uint64_t v4 = qword_1EB545B60;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB545B60, &__block_literal_global_219);
  }
  double v6 = objc_msgSend(a1, "pkui_imageWithColor:scale:", v5, *(double *)&qword_1EB545B58);

  return v6;
}

+ (id)pkui_imageWithColor:()PKUIUtilities scale:
{
  id v5 = a4;
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  if (a1 <= 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = 1.0 / a1;
  }
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v9 = objc_alloc(MEMORY[0x1E4FB17D8]);
  double v10 = [MEMORY[0x1E4FB17E0] preferredFormat];
  uint64_t v11 = objc_msgSend(v9, "initWithBounds:format:", v10, v7, v8, v6, v6);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__UIImage_PKUIUtilities__pkui_imageWithColor_scale___block_invoke;
  v16[3] = &unk_1E59CEDF0;
  id v17 = v5;
  double v18 = v7;
  double v19 = v8;
  double v20 = v6;
  double v21 = v6;
  id v12 = v5;
  double v13 = [v11 imageWithActions:v16];
  double v14 = objc_msgSend(v13, "pkui_resizableImageByTilingCenterPixel");

  return v14;
}

- (uint64_t)pkui_resizableImageByTilingVertically
{
  [a1 alignmentRectInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [a1 scale];
  double v11 = 1.0 / v10;
  [a1 size];
  double v13 = v12 - (v5 + v9);
  double v14 = floor((v13 - v11) * 0.5);

  return objc_msgSend(a1, "resizableImageWithCapInsets:", v3, v5 + v14, v7, v9 + v13 - (v11 + v14));
}

- (id)pkui_imageOverlaidWithColor:()PKUIUtilities
{
  id v4 = a3;
  [a1 size];
  CGFloat v6 = v5;
  [a1 size];
  CGFloat v8 = v7;
  [a1 scale];
  CGFloat v10 = v9;
  v15.width = v6;
  v15.height = v8;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  [v4 setFill];

  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v6;
  v16.size.height = v8;
  CGContextFillRect(CurrentContext, v16);
  double v12 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v12;
}

- (double)pkui_alignmentSize
{
  [a1 size];
  double v3 = v2;
  [a1 alignmentRectInsets];
  return v3 - (v4 + v5);
}

- (uint64_t)pkui_alignmentSizeThatFits:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_alignmentSizeThatFits:maximumScale:", a3, a4, 1.79769313e308);
}

- (double)pkui_alignmentSizeThatFits:()PKUIUtilities maximumScale:
{
  [a1 alignmentRectInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [a1 size];
  double v15 = v14 - (v9 + v13);
  double v22 = v7;
  double v17 = v16 - (v7 + v11);
  PKSizeScaleAspectFit();
  double v20 = fmin(v18 / v15, v19 / v17);
  if (v20 > a3)
  {
    double v20 = 1.0;
    double v18 = v15 * a3;
    double v19 = v17 * a3;
    if (a3 == 1.0)
    {
      double v18 = v15;
      double v19 = v17;
    }
    else
    {
      double v20 = a3;
    }
  }
  *a2 = v18;
  a2[1] = v19;
  double result = -(v22 * v20);
  a2[2] = result;
  a2[3] = -(v9 * v20);
  a2[4] = -(v11 * v20);
  a2[5] = -(v13 * v20);
  a2[6] = v20;
  return result;
}

- (uint64_t)pkui_alignmentSizeThatFills:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_alignmentSizeThatFills:maximumScale:", a3, a4, 1.79769313e308);
}

- (double)pkui_alignmentSizeThatFills:()PKUIUtilities maximumScale:
{
  [a1 alignmentRectInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [a1 size];
  double v15 = v14 - (v9 + v13);
  double v22 = v7;
  double v17 = v16 - (v7 + v11);
  PKSizeAspectFill();
  double v20 = fmin(v18 / v15, v19 / v17);
  if (v20 > a3)
  {
    double v20 = 1.0;
    double v18 = v15 * a3;
    double v19 = v17 * a3;
    if (a3 == 1.0)
    {
      double v18 = v15;
      double v19 = v17;
    }
    else
    {
      double v20 = a3;
    }
  }
  *a2 = v18;
  a2[1] = v19;
  double result = -(v22 * v20);
  a2[2] = result;
  a2[3] = -(v9 * v20);
  a2[4] = -(v11 * v20);
  a2[5] = -(v13 * v20);
  a2[6] = v20;
  return result;
}

- (id)pkui_firstPixelColor
{
  v1 = (CGImage *)[a1 CGImage];
  size_t Width = CGImageGetWidth(v1);
  size_t Height = CGImageGetHeight(v1);
  int data = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v5 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetBlendMode(v5, kCGBlendModeCopy);
  v14.size.width = (double)Width;
  v14.size.height = (double)Height;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  CGContextDrawImage(v5, v14, v1);
  CGContextRelease(v5);
  LOBYTE(v7) = BYTE1(data);
  LOBYTE(v6) = data;
  LOBYTE(v9) = HIBYTE(data);
  LOBYTE(v8) = BYTE2(data);
  double v10 = [MEMORY[0x1E4FB1618] colorWithRed:(double)v6 / 255.0 green:(double)v7 / 255.0 blue:(double)v8 / 255.0 alpha:(double)v9 / 255.0];

  return v10;
}

@end