@interface UIImage(IMAdditions)
+ (CGContext)makeDottedLineImageinRect:()IMAdditions;
+ (id)colorSliceImageWithColor:()IMAdditions height:;
+ (id)image:()IMAdditions inRect:withBacking:;
+ (id)image:()IMAdditions inRect:withBacking:opaque:scale:;
+ (id)imageWithSolidColor:()IMAdditions atSize:;
+ (id)roundedCornerRectangleWithColor:()IMAdditions;
+ (id)roundedCornerRectangleWithColorNoTemplate:()IMAdditions;
+ (id)scaledImageWithData:()IMAdditions;
+ (id)uncachedImageNamed:()IMAdditions;
- (id)im_flatImageWithColor:()IMAdditions;
- (id)im_imageWithBackgroundColor:()IMAdditions;
- (id)imageByRemovingPath:()IMAdditions;
- (id)imageMaskWithColor:()IMAdditions;
- (id)imageWithComposite:()IMAdditions blendMode:;
- (id)imageWithComposite:()IMAdditions blendMode:dstRect:;
- (id)imageWithCropRect:()IMAdditions;
- (id)imageWithGradientAngle:()IMAdditions startColor:endColor:;
- (id)imageWithSize:()IMAdditions resizeOptions:;
- (id)imageWithTint:()IMAdditions;
- (id)imageWithWidth:()IMAdditions leftCapWidth:rightCapWidth:;
- (id)mirroredImage;
- (id)squareImage;
- (id)stretchableMirroredImage;
- (uint64_t)colorAtPixelX:()IMAdditions y:;
- (uint64_t)imageWithMaxBounds:()IMAdditions;
- (uint64_t)imageWithSize:()IMAdditions;
- (uint64_t)imageWithWidth:()IMAdditions leftCapWidth:;
- (void)debugShowInKeyWindow;
- (void)dumpAsPNGToCachesNamed:()IMAdditions;
@end

@implementation UIImage(IMAdditions)

- (uint64_t)imageWithSize:()IMAdditions
{
  return objc_msgSend(a1, "imageWithSize:resizeOptions:", 1);
}

- (id)imageWithSize:()IMAdditions resizeOptions:
{
  if (a5)
  {
    [a1 size];
    double v10 = v9;
    [a1 size];
    double v12 = a2 / a3 - v10 / v11;
    if (v12 < 0.0) {
      double v12 = -v12;
    }
    if (v12 > 0.00000011920929)
    {
      [a1 size];
      double v14 = a2 / v13;
      [a1 size];
      double v16 = a3 / v15;
      if (a5 == 1)
      {
        if (v14 >= v16) {
          double v17 = a3 / v15;
        }
        else {
          double v17 = v14;
        }
      }
      else
      {
        double v17 = 1.0;
        if (a5 == 2)
        {
          if (v14 >= v16) {
            double v17 = v14;
          }
          else {
            double v17 = v16;
          }
        }
      }
      [a1 size];
      a2 = v17 * v18;
      [a1 size];
      a3 = v17 * v19;
    }
  }
  if (IMAdjustToScale_onceToken_0 != -1) {
    dispatch_once(&IMAdjustToScale_onceToken_0, &__block_literal_global_14);
  }
  double v20 = ceil(a2 * *(double *)&IMAdjustToScale___s_0) / *(double *)&IMAdjustToScale___s_0;
  double v21 = ceil(a2);
  if (*(double *)&IMAdjustToScale___s_0 == 1.0) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
  double v23 = ceil(a3 * *(double *)&IMAdjustToScale___s_0) / *(double *)&IMAdjustToScale___s_0;
  double v24 = ceil(a3);
  if (*(double *)&IMAdjustToScale___s_0 == 1.0) {
    CGFloat v25 = v24;
  }
  else {
    CGFloat v25 = v23;
  }
  [a1 size];
  if (v22 <= v26 && ([a1 size], v25 <= v27))
  {
    v47.origin.CGFloat x = 0.0;
    v47.origin.CGFloat y = 0.0;
    v47.size.CGFloat width = v22;
    v47.size.CGFloat height = v25;
    CGRect v48 = CGRectIntegral(v47);
    CGFloat x = v48.origin.x;
    CGFloat y = v48.origin.y;
    CGFloat width = v48.size.width;
    CGFloat height = v48.size.height;
    id v36 = a1;
    v37 = (CGImage *)[v36 CGImage];
    v46.CGFloat width = v22;
    v46.CGFloat height = v25;
    UIGraphicsBeginImageContextWithOptions(v46, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v25);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    CGContextDrawImage(CurrentContext, v49, v37);
    Image = CGBitmapContextCreateImage(CurrentContext);
    v40 = (void *)MEMORY[0x1E4FB1818];
    [v36 scale];
    objc_msgSend(v40, "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v36, "imageOrientation"), v41);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    CGImageRelease(Image);
  }
  else
  {
    v28 = [MEMORY[0x1E4F91F10] sharedLogger];
    [a1 size];
    v29 = NSStringFromCGSize(v44);
    v45.CGFloat width = v22;
    v45.CGFloat height = v25;
    v30 = NSStringFromCGSize(v45);
    [v28 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Extensions/UIKit/UIImage+IMAdditions.m", 58, @"Ignoring attempt to upscale image (from %@ to %@)", v29, v30 lineNumber format];

    id v31 = a1;
  }

  return v31;
}

- (uint64_t)imageWithMaxBounds:()IMAdditions
{
  return objc_msgSend(a1, "imageWithSize:resizeOptions:", 1);
}

- (uint64_t)imageWithWidth:()IMAdditions leftCapWidth:
{
  return objc_msgSend(a1, "imageWithWidth:leftCapWidth:rightCapWidth:", a3, a3);
}

- (id)imageWithWidth:()IMAdditions leftCapWidth:rightCapWidth:
{
  if (a5 | a4)
  {
    double v9 = a2 - (double)(a5 + a4);
    if (v9 >= 0.0)
    {
      [a1 size];
      double v13 = v12;
      double v14 = v11;
      double v15 = (double)a4;
      double v16 = (double)a5;
      if (v12 >= a2)
      {
        double v22 = v9 + v15;
        double v17 = objc_msgSend(a1, "imageWithCropRect:", 0.0, 0.0, v22, v11);
        double v18 = objc_msgSend(a1, "imageWithCropRect:", v13 - v16, 0.0, v16, v14);
        [a1 scale];
        CGFloat v24 = v23;
        v28.CGFloat width = a2;
        v28.CGFloat height = v14;
        IMGraphicsBeginImageContextWithOptions(v28, 0, v24);
        objc_msgSend(v17, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
        objc_msgSend(v18, "drawAtPoint:", v22, 0.0);
        UIGraphicsGetImageFromCurrentImageContext();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
      }
      else
      {
        double v17 = objc_msgSend(a1, "imageWithCropRect:", 0.0, 0.0, (double)a4, v11);
        double v18 = objc_msgSend(a1, "imageWithCropRect:", (double)a4, 0.0, v13 - v15 - v16, v14);
        double v19 = objc_msgSend(a1, "imageWithCropRect:", v13 - v16, 0.0, v16, v14);
        [a1 scale];
        CGFloat v21 = v20;
        v27.CGFloat width = a2;
        v27.CGFloat height = v14;
        IMGraphicsBeginImageContextWithOptions(v27, 0, v21);
        objc_msgSend(v17, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
        objc_msgSend(v18, "drawAsPatternInRect:", v15, 0.0, v9, v14);
        objc_msgSend(v19, "drawAtPoint:", a2 - v16, 0.0);
        UIGraphicsGetImageFromCurrentImageContext();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = a1;
  }

  return v10;
}

- (id)imageWithCropRect:()IMAdditions
{
  v5 = 0;
  if (a4 != 0.0)
  {
    double v6 = a5;
    if (a5 != 0.0)
    {
      double v7 = a4;
      [a1 scale];
      double v12 = v11;
      BOOL v13 = v11 == 1.0;
      double v14 = a2 * v11;
      if (v12 != 1.0) {
        a2 = v14;
      }
      if (!v13)
      {
        a3 = a3 * v12;
        double v7 = v7 * v12;
        double v6 = v6 * v12;
      }
      id v15 = a1;
      double v16 = (CGImage *)[v15 CGImage];
      v20.origin.CGFloat x = a2;
      v20.origin.CGFloat y = a3;
      v20.size.CGFloat width = v7;
      v20.size.CGFloat height = v6;
      double v17 = CGImageCreateWithImageInRect(v16, v20);
      v5 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v12);
      CGImageRelease(v17);
    }
  }

  return v5;
}

- (id)squareImage
{
  [a1 size];
  if (v2 == v3)
  {
    id v13 = a1;
  }
  else
  {
    CGFloat v4 = v2;
    CGFloat v5 = v3;
    if (v2 >= v3) {
      CGFloat v6 = v2;
    }
    else {
      CGFloat v6 = v3;
    }
    int v7 = [a1 colorAtPixelX:(unint64_t)(v2 + -1.0) y:0];
    v8 = [MEMORY[0x1E4FB1618] colorWithRed:(float)((float)BYTE2(v7) / 255.0) green:(float)((float)BYTE1(v7) / 255.0) blue:(float)((float)v7 / 255.0) alpha:(float)((float)HIBYTE(v7) / 255.0)];
    CGFloat v9 = *MEMORY[0x1E4F1DAD8];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [a1 scale];
    CGFloat v12 = v11;
    v16.CGFloat width = v6;
    v16.CGFloat height = v6;
    UIGraphicsBeginImageContextWithOptions(v16, 1, v12);
    [v8 set];
    v17.origin.CGFloat x = v9;
    v17.origin.CGFloat y = v10;
    v17.size.CGFloat width = v6;
    v17.size.CGFloat height = v6;
    UIRectFill(v17);
    objc_msgSend(a1, "drawInRect:blendMode:alpha:", 0, CGRectCenterRectInRect(v9, v10, v4, v5, v9, v10, v6, v6));
    UIGraphicsGetImageFromCurrentImageContext();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v13;
}

- (id)imageWithTint:()IMAdditions
{
  id v4 = a3;
  [a1 size];
  double v6 = v5;
  [a1 size];
  double v8 = v7;
  [a1 size];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [a1 scale];
  CGFloat v14 = v13;
  v18.CGFloat width = v10;
  v18.CGFloat height = v12;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v14);
  [v4 set];

  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v6;
  v19.size.CGFloat height = v8;
  UIRectFill(v19);
  objc_msgSend(a1, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v6, v8, 1.0);
  objc_msgSend(a1, "drawInRect:blendMode:alpha:", 1, 0.0, 0.0, v6, v8, 1.0);
  id v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)imageMaskWithColor:()IMAdditions
{
  id v4 = a3;
  [a1 size];
  CGFloat v6 = v5;
  [a1 size];
  CGFloat v8 = v7;
  [a1 size];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [a1 scale];
  CGFloat v14 = v13;
  v23.CGFloat width = v10;
  v23.CGFloat height = v12;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [a1 size];
  CGContextTranslateCTM(CurrentContext, 0.0, -v16);
  CGContextSaveGState(CurrentContext);
  CGRect v17 = (CGImage *)[a1 CGImage];
  v24.origin.CGFloat x = 0.0;
  v24.origin.CGFloat y = 0.0;
  v24.size.CGFloat width = v6;
  v24.size.CGFloat height = v8;
  CGContextClipToMask(CurrentContext, v24, v17);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  id v18 = v4;
  CGRect v19 = (CGColor *)[v18 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v19);
  v25.origin.CGFloat x = 0.0;
  v25.origin.CGFloat y = 0.0;
  v25.size.CGFloat width = v6;
  v25.size.CGFloat height = v8;
  CGContextFillRect(CurrentContext, v25);
  CGContextRestoreGState(CurrentContext);
  CGRect v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

+ (id)image:()IMAdditions inRect:withBacking:
{
  id v13 = a8;
  id v14 = a7;
  v33.CGFloat width = a3;
  v33.CGFloat height = a4;
  UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -a4);
  CGContextSaveGState(CurrentContext);
  id v16 = v13;
  CGRect v17 = (CGColor *)[v16 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v17);
  v34.origin.CGFloat x = 0.0;
  v34.origin.CGFloat y = 0.0;
  v34.size.CGFloat width = a3;
  v34.size.CGFloat height = a4;
  CGContextFillRect(CurrentContext, v34);
  v35.origin.CGFloat x = a1;
  v35.origin.CGFloat y = a2;
  v35.size.CGFloat width = a3;
  v35.size.CGFloat height = a4;
  double MidX = CGRectGetMidX(v35);
  [v14 size];
  CGFloat v20 = round(MidX - v19 * 0.5);
  v36.origin.CGFloat x = a1;
  v36.origin.CGFloat y = a2;
  v36.size.CGFloat width = a3;
  v36.size.CGFloat height = a4;
  double MidY = CGRectGetMidY(v36);
  [v14 size];
  CGFloat v23 = round(MidY - v22 * 0.5);
  [v14 size];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  id v28 = v14;
  v29 = (CGImage *)[v28 CGImage];

  v37.origin.CGFloat x = v20;
  v37.origin.CGFloat y = v23;
  v37.size.CGFloat width = v25;
  v37.size.CGFloat height = v27;
  CGContextDrawImage(CurrentContext, v37, v29);
  CGContextRestoreGState(CurrentContext);
  v30 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v30;
}

+ (id)image:()IMAdditions inRect:withBacking:opaque:scale:
{
  id v17 = a9;
  id v18 = a8;
  v37.CGFloat width = a3;
  v37.CGFloat height = a4;
  UIGraphicsBeginImageContextWithOptions(v37, a10, a5);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -a4);
  CGContextSaveGState(CurrentContext);
  id v20 = v17;
  CGFloat v21 = (CGColor *)[v20 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v21);
  v38.origin.CGFloat x = 0.0;
  v38.origin.CGFloat y = 0.0;
  v38.size.CGFloat width = a3;
  v38.size.CGFloat height = a4;
  CGContextFillRect(CurrentContext, v38);
  v39.origin.CGFloat x = a1;
  v39.origin.CGFloat y = a2;
  v39.size.CGFloat width = a3;
  v39.size.CGFloat height = a4;
  double MidX = CGRectGetMidX(v39);
  [v18 size];
  CGFloat v24 = round(MidX - v23 * 0.5);
  v40.origin.CGFloat x = a1;
  v40.origin.CGFloat y = a2;
  v40.size.CGFloat width = a3;
  v40.size.CGFloat height = a4;
  double MidY = CGRectGetMidY(v40);
  [v18 size];
  CGFloat v27 = round(MidY - v26 * 0.5);
  [v18 size];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  id v32 = v18;
  CGSize v33 = (CGImage *)[v32 CGImage];

  v41.origin.CGFloat x = v24;
  v41.origin.CGFloat y = v27;
  v41.size.CGFloat width = v29;
  v41.size.CGFloat height = v31;
  CGContextDrawImage(CurrentContext, v41, v33);
  CGContextRestoreGState(CurrentContext);
  CGRect v34 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v34;
}

+ (id)imageWithSolidColor:()IMAdditions atSize:
{
  id v7 = a5;
  v14.CGFloat width = a1;
  v14.CGFloat height = a2;
  UIGraphicsBeginImageContext(v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v7;
  CGFloat v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.CGFloat x = 0.0;
  v15.origin.CGFloat y = 0.0;
  v15.size.CGFloat width = a1;
  v15.size.CGFloat height = a2;
  CGContextFillRect(CurrentContext, v15);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)imageWithGradientAngle:()IMAdditions startColor:endColor:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  [a1 size];
  CGFloat v11 = v10;
  [a1 size];
  CGFloat v13 = v12;
  [a1 size];
  UIGraphicsBeginImageContext(v53);
  CurrentContext = UIGraphicsGetCurrentContext();
  double v15 = 1.0;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [a1 size];
  CGContextTranslateCTM(CurrentContext, 0.0, -v16);
  CGRectEdgePointAtAngle(0.0, 0.0, v11, v13, a2);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGRectEdgePointAtAngle(0.0, 0.0, v11, v13, a2 + 3.14159265);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v26 = v9;
  CGFloat v27 = CGColorGetComponents((CGColorRef)[v26 CGColor]);
  id v28 = v26;
  CGFloat v29 = (CGColor *)[v28 CGColor];

  size_t NumberOfComponents = CGColorGetNumberOfComponents(v29);
  *(_OWORD *)components = *(_OWORD *)v27;
  uint64_t v45 = *((void *)v27 + 2);
  double v31 = 1.0;
  if (NumberOfComponents == 4) {
    double v31 = v27[3];
  }
  double v46 = v31;
  id v32 = v8;
  CGSize v33 = CGColorGetComponents((CGColorRef)[v32 CGColor]);
  id v34 = v32;
  CGRect v35 = (CGColor *)[v34 CGColor];

  size_t v36 = CGColorGetNumberOfComponents(v35);
  uint64_t v47 = *(void *)v33;
  uint64_t v48 = *((void *)v33 + 1);
  uint64_t v49 = *((void *)v33 + 2);
  if (v36 == 4) {
    double v15 = v27[3];
  }
  double v50 = v15;
  long long v43 = xmmword_1E3E85470;
  CGSize v37 = CGGradientCreateWithColorComponents(DeviceRGB, components, (const CGFloat *)&v43, 2uLL);
  CGContextSaveGState(CurrentContext);
  id v38 = a1;
  CGRect v39 = (CGImage *)[v38 CGImage];
  v56.origin.CGFloat x = 0.0;
  v56.origin.CGFloat y = 0.0;
  v56.size.CGFloat width = v11;
  v56.size.CGFloat height = v13;
  CGContextClipToMask(CurrentContext, v56, v39);
  CGRect v40 = (CGImage *)[v38 CGImage];
  v57.origin.CGFloat x = 0.0;
  v57.origin.CGFloat y = 0.0;
  v57.size.CGFloat width = v11;
  v57.size.CGFloat height = v13;
  CGContextDrawImage(CurrentContext, v57, v40);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  v54.CGFloat x = v18;
  v54.CGFloat y = v20;
  v55.CGFloat x = v22;
  v55.CGFloat y = v24;
  CGContextDrawLinearGradient(CurrentContext, v37, v54, v55, 3u);
  CGContextRestoreGState(CurrentContext);
  CGGradientRelease(v37);
  CGColorSpaceRelease(DeviceRGB);
  CGRect v41 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v41;
}

- (id)im_imageWithBackgroundColor:()IMAdditions
{
  id v4 = a3;
  [a1 size];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [a1 scale];
  CGFloat v10 = v9;
  v19.CGFloat width = v6;
  v19.CGFloat height = v8;
  UIGraphicsBeginImageContextWithOptions(v19, 1, v10);
  [v4 set];

  uint64_t v11 = [a1 size];
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v20.origin.CGFloat x = CGRectMakeWithOriginSize(v11, *MEMORY[0x1E4F1DAD8], v13, v14, v15);
  UIRectFill(v20);
  objc_msgSend(a1, "drawAtPoint:", v12, v13);
  double v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)imageWithComposite:()IMAdditions blendMode:
{
  id v6 = a3;
  [a1 size];
  double v8 = v7;
  [a1 size];
  CGFloat v10 = objc_msgSend(a1, "imageWithComposite:blendMode:dstRect:", v6, a4, 0.0, 0.0, v8, v9);

  return v10;
}

- (id)imageWithComposite:()IMAdditions blendMode:dstRect:
{
  id v14 = a7;
  [a1 size];
  CGFloat v16 = v15;
  [a1 size];
  CGFloat v18 = v17;
  [a1 size];
  UIGraphicsBeginImageContextWithOptions(v29, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [a1 size];
  CGContextTranslateCTM(CurrentContext, 0.0, -v20);
  v30.origin.CGFloat x = 0.0;
  v30.origin.CGFloat y = 0.0;
  v30.size.CGFloat width = v16;
  v30.size.CGFloat height = v18;
  double Height = CGRectGetHeight(v30);
  v31.origin.CGFloat x = a2;
  v31.origin.CGFloat y = a3;
  v31.size.CGFloat width = a4;
  v31.size.CGFloat height = a5;
  CGFloat v22 = Height - CGRectGetMaxY(v31);
  CGContextSaveGState(CurrentContext);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  double v23 = (CGImage *)[a1 CGImage];
  v32.origin.CGFloat x = 0.0;
  v32.origin.CGFloat y = 0.0;
  v32.size.CGFloat width = v16;
  v32.size.CGFloat height = v18;
  CGContextDrawImage(CurrentContext, v32, v23);
  CGContextSetBlendMode(CurrentContext, a8);
  id v24 = v14;
  CGFloat v25 = (CGImage *)[v24 CGImage];

  v33.origin.CGFloat x = a2;
  v33.origin.CGFloat y = v22;
  v33.size.CGFloat width = a4;
  v33.size.CGFloat height = a5;
  CGContextDrawImage(CurrentContext, v33, v25);
  CGContextRestoreGState(CurrentContext);
  id v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v26;
}

- (id)imageByRemovingPath:()IMAdditions
{
  id v4 = a3;
  id v5 = a1;
  id v6 = (CGImage *)[v5 CGImage];
  double Width = (double)CGImageGetWidth(v6);
  double Height = (double)CGImageGetHeight(v6);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGFloat v10 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, vcvtd_n_u64_f64(Width, 2uLL), DeviceRGB, 0x2002u);
  if (v10)
  {
    uint64_t v11 = v10;
    CGContextSaveGState(v10);
    v19.origin.CGFloat x = 0.0;
    v19.origin.CGFloat y = 0.0;
    v19.size.CGFloat width = Width;
    v19.size.CGFloat height = Height;
    CGContextDrawImage(v11, v19, v6);
    [v5 scale];
    CGFloat v13 = v12;
    CGContextScaleCTM(v11, 1.0, -1.0);
    CGContextTranslateCTM(v11, 0.0, -Height);
    CGAffineTransformMakeScale(&v17, v13, v13);
    [v4 applyTransform:&v17];
    CGContextAddPath(v11, (CGPathRef)[v4 CGPath]);
    CGContextSetBlendMode(v11, kCGBlendModeClear);
    CGContextFillPath(v11);
    CGContextRestoreGState(v11);
    Image = CGBitmapContextCreateImage(v11);
    CGContextRelease(v11);
    double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:scale:orientation:", Image, objc_msgSend(v5, "imageOrientation"), v13);
    CGImageRelease(Image);
  }
  else
  {
    double v15 = 0;
  }
  CGColorSpaceRelease(DeviceRGB);

  return v15;
}

- (id)stretchableMirroredImage
{
  double v2 = [a1 mirroredImage];
  [a1 size];
  id v4 = [v2 stretchableImageWithLeftCapWidth:(uint64_t)v3 topCapHeight:0];

  return v4;
}

- (id)mirroredImage
{
  [a1 size];
  double v3 = v2;
  double height = v10.height;
  v10.CGFloat width = v2 + v2;
  CGFloat width = v10.width;
  IMGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v3, height);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, -1.0, 1.0);
  objc_msgSend(a1, "drawInRect:", -width, 0.0, v3, height);
  double v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

- (uint64_t)colorAtPixelX:()IMAdditions y:
{
  [a1 scale];
  double v8 = v7;
  double v9 = (CGImage *)[a1 CGImage];
  v16.origin.CGFloat x = v8 * (double)a3;
  v16.origin.CGFloat y = v8 * (double)a4;
  v16.size.CGFloat width = 1.0;
  v16.size.double height = 1.0;
  CGImageRef v10 = CGImageCreateWithImageInRect(v9, v16);
  if (!v10) {
    return -1;
  }
  uint64_t v11 = v10;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGFloat v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4002u);
  v17.origin.CGFloat x = 0.0;
  v17.origin.CGFloat y = 0.0;
  v17.size.CGFloat width = 1.0;
  v17.size.double height = 1.0;
  CGContextDrawImage(v13, v17, v11);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v13);
  CGImageRelease(v11);
  return bswap32(data);
}

- (void)debugShowInKeyWindow
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:a1];
  NSLog(&cfstr_ImageviewCallV.isa, v3, v3);
  v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v2 = [v1 keyWindow];

  [v2 center];
  objc_msgSend(v3, "setCenter:");
  [v2 addSubview:v3];
}

- (void)dumpAsPNGToCachesNamed:()IMAdditions
{
  id v10 = a3;
  id v4 = [v10 lowercaseString];
  char v5 = [v4 hasSuffix:@"png"];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [v10 stringByAppendingPathExtension:@"png"];

    id v10 = (id)v6;
  }
  double v7 = [MEMORY[0x1E4FB1438] applicationCacheDirectory];
  double v8 = [v7 stringByAppendingPathComponent:v10];

  double v9 = UIImagePNGRepresentation(a1);
  [v9 writeToFile:v8 atomically:0];
}

+ (id)uncachedImageNamed:()IMAdditions
{
  id v3 = a3;
  id v4 = [v3 stringByDeletingPathExtension];
  char v5 = [v3 pathExtension];

  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  if ([(__CFString *)v5 length]) {
    double v7 = v5;
  }
  else {
    double v7 = @"png";
  }
  double v8 = [v6 pathForResource:v4 ofType:v7];

  double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithContentsOfFile:v8];

  return v9;
}

+ (CGContext)makeDottedLineImageinRect:()IMAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v9 = CGBitmapContextCreate(0, (int)a3, (int)a4, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v9)
  {
    UIGraphicsPushContext(v9);
    CGContextSaveGState(v9);
    CGContextSetLineWidth(v9, 1.0);
    id v10 = [MEMORY[0x1E4FB1618] grayColor];
    CGContextSetStrokeColorWithColor(v9, (CGColorRef)[v10 CGColor]);

    long long v14 = xmmword_1E3E85480;
    CGContextSetLineDash(v9, 1.0, (const CGFloat *)&v14, 2uLL);
    CGContextMoveToPoint(v9, a1, a2);
    CGContextAddLineToPoint(v9, a3, a4);
    CGContextStrokePath(v9);
    CGContextRestoreGState(v9);
    UIGraphicsPopContext();
    Image = CGBitmapContextCreateImage(v9);
    CGContextRelease(v9);
    v17.origin.CGFloat x = a1;
    v17.origin.CGFloat y = a2;
    v17.size.CGFloat width = a3;
    v17.size.double height = a4;
    double v12 = CGImageCreateWithImageInRect(Image, v17);
    CGImageRelease(Image);
    double v9 = [MEMORY[0x1E4FB1818] imageWithCGImage:v12];
    CGImageRelease(v12);
  }

  return v9;
}

- (id)im_flatImageWithColor:()IMAdditions
{
  id v4 = a3;
  [a1 size];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [a1 scale];
  CGFloat v10 = v9;
  v14.CGFloat width = v6;
  v14.double height = v8;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);
  if (UIGraphicsGetCurrentContext())
  {
    [v4 set];
    v15.origin.CGFloat x = 0.0;
    v15.origin.CGFloat y = 0.0;
    v15.size.CGFloat width = v6;
    v15.size.double height = v8;
    UIRectFill(v15);
    objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 22, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
    uint64_t v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    NSLog(&cfstr_Flatimagewithc.isa);
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)scaledImageWithData:()IMAdditions
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithData:");
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  if (objc_opt_respondsToSelector())
  {
    [v1 scale];
    double v3 = v2;
    if (v2 > 1.0)
    {
      id v4 = (void *)MEMORY[0x1E4FB1818];
      id v5 = v0;
      v0 = objc_msgSend(v4, "imageWithCGImage:scale:orientation:", objc_msgSend(v5, "CGImage"), objc_msgSend(v5, "imageOrientation"), v3);
    }
  }

  return v0;
}

+ (id)colorSliceImageWithColor:()IMAdditions height:
{
  id v5 = (void *)MEMORY[0x1E4FB1BA8];
  id v6 = a4;
  double v7 = [v5 mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v13.CGFloat width = 1.0;
  v13.double height = a1;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  [v6 setFill];
  v14.origin.CGFloat x = 0.0;
  v14.origin.CGFloat y = 0.0;
  v14.size.CGFloat width = 1.0;
  v14.size.double height = a1;
  UIRectFillUsingBlendMode(v14, kCGBlendModeNormal);
  CGFloat v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

+ (id)roundedCornerRectangleWithColor:()IMAdditions
{
  id v3 = a3;
  v10.CGFloat width = 11.0;
  v10.double height = 11.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  [v3 set];

  id v4 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.0, 11.0, 3.0);
  [v4 fill];
  id v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v6 = objc_msgSend(v5, "resizableImageWithCapInsets:", 5.0, 5.0, 5.0, 5.0);

  double v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

+ (id)roundedCornerRectangleWithColorNoTemplate:()IMAdditions
{
  id v3 = a3;
  v9.CGFloat width = 11.0;
  v9.double height = 11.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  [v3 set];

  id v4 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.0, 11.0, 3.0);
  [v4 fill];
  id v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v6 = objc_msgSend(v5, "resizableImageWithCapInsets:", 5.0, 5.0, 5.0, 5.0);

  return v6;
}

@end