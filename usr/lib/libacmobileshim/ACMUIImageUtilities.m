@interface ACMUIImageUtilities
+ (id)cropLocalImage:(id)a3 bySize:(CGSize)a4;
+ (id)cropServerImage:(id)a3 bySize:(CGSize)a4;
+ (id)transparentImageWithSize:(CGSize)a3;
+ (int)imageResolutionFactor;
@end

@implementation ACMUIImageUtilities

+ (int)imageResolutionFactor
{
  [((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen")) scale];
  if (v2 <= 1.00999999) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  [[[MEMORY[0x263F1C5C0] currentDevice] systemVersion] floatValue];
  if (v4 >= 8.0)
  {
    [[(id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen") scale];
    if (v5 > 2.00999999) {
      return 3;
    }
  }
  return v3;
}

+ (id)transparentImageWithSize:(CGSize)a3
{
  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

+ (id)cropServerImage:(id)a3 bySize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  int v7 = [a1 imageResolutionFactor];
  double v8 = width * (double)v7;
  double v9 = height * (double)v7;
  [a3 size];
  CGFloat v10 = v8 + 0.0;
  CGFloat v11 = v9 + 0.0;
  CGFloat v13 = v12 + v8 * -2.0;
  CGFloat v15 = v14 + v9 * -2.0;
  v16 = (CGImage *)[a3 CGImage];
  v20.origin.x = v10;
  v20.origin.y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  v17 = CGImageCreateWithImageInRect(v16, v20);
  v18 = (void *)[MEMORY[0x263F1C6B0] imageWithCGImage:v17];
  CGImageRelease(v17);
  return v18;
}

+ (id)cropLocalImage:(id)a3 bySize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [a3 size];
  double v9 = v8;
  double v11 = v10;
  int v12 = [a1 imageResolutionFactor];
  CGFloat v13 = (double)v12 * width + 0.0;
  CGFloat v14 = (double)v12 * height + 0.0;
  CGFloat v15 = (v9 + width * -2.0) * (double)v12;
  CGFloat v16 = (v11 + height * -2.0) * (double)v12;
  v17 = (CGImage *)[a3 CGImage];
  v21.origin.x = v13;
  v21.origin.y = v14;
  v21.size.double width = v15;
  v21.size.double height = v16;
  v18 = CGImageCreateWithImageInRect(v17, v21);
  v19 = (void *)[MEMORY[0x263F1C6B0] imageWithCGImage:v18];
  CGImageRelease(v18);
  return v19;
}

@end