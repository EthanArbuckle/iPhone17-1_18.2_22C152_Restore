@interface UIImage(circleImageWithRadius)
+ (id)circleImageWithDiameter:()circleImageWithRadius color:;
@end

@implementation UIImage(circleImageWithRadius)

+ (id)circleImageWithDiameter:()circleImageWithRadius color:
{
  v5 = (void *)MEMORY[0x1E4F42D90];
  id v6 = a4;
  v7 = [v5 mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v16.width = a1;
  v16.height = a1;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v9);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  id v11 = v6;
  v12 = (CGColor *)[v11 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v12);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = a1;
  v17.size.height = a1;
  CGContextFillEllipseInRect(CurrentContext, v17);
  CGContextRestoreGState(CurrentContext);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v13;
}

@end