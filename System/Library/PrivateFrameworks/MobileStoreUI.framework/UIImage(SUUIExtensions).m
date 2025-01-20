@interface UIImage(SUUIExtensions)
+ (id)resizeImage:()SUUIExtensions toSize:;
+ (id)singlePointImageWithColor:()SUUIExtensions;
@end

@implementation UIImage(SUUIExtensions)

+ (id)singlePointImageWithColor:()SUUIExtensions
{
  v3 = (void *)MEMORY[0x263F82B60];
  id v4 = a3;
  v5 = [v3 mainScreen];
  [v5 scale];
  CGFloat v7 = v6;
  v14.width = 1.0;
  v14.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v7);

  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v4;
  v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = 1.0;
  v15.size.height = 1.0;
  CGContextFillRect(CurrentContext, v15);
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)resizeImage:()SUUIExtensions toSize:
{
  id v7 = a5;
  v11.width = a1;
  v11.height = a2;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a1, a2);

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

@end