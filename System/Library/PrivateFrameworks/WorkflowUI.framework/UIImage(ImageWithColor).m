@interface UIImage(ImageWithColor)
+ (id)wf_imageWithColor:()ImageWithColor;
@end

@implementation UIImage(ImageWithColor)

+ (id)wf_imageWithColor:()ImageWithColor
{
  id v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v7;
}

@end