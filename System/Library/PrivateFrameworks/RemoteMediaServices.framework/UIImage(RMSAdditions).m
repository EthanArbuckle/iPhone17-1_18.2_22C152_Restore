@interface UIImage(RMSAdditions)
- (id)rms_jpegDataScaledToSize:()RMSAdditions compressionQuality:;
@end

@implementation UIImage(RMSAdditions)

- (id)rms_jpegDataScaledToSize:()RMSAdditions compressionQuality:
{
  [a1 size];
  double v10 = a2 / v8;
  if (a2 / v8 >= a3 / v9) {
    double v10 = a3 / v9;
  }
  v20.CGFloat width = v8 * v10;
  CGFloat width = v20.width;
  v20.CGFloat height = v9 * v10;
  CGFloat height = v20.height;
  UIGraphicsBeginImageContextWithOptions(v20, 1, 1.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, height);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  id v14 = [MEMORY[0x263F1C550] blackColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v14 CGColor]);

  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v21);
  v15 = (CGImage *)[a1 CGImage];
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGContextDrawImage(CurrentContext, v22, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v17 = UIImageJPEGRepresentation(v16, a4);

  return v17;
}

@end