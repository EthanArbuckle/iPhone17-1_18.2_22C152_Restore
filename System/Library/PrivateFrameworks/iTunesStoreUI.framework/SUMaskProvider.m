@interface SUMaskProvider
- (CGPath)copyPathForMaskWithSize:(CGSize)a3;
- (id)copyMaskImageWithSize:(CGSize)a3;
@end

@implementation SUMaskProvider

- (id)copyMaskImageWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id result = -[SUMaskProvider copyPathForMaskWithSize:](self, "copyPathForMaskWithSize:");
  if (result)
  {
    v6 = (const CGPath *)result;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    CGFloat v8 = v7;
    v11.CGFloat width = width;
    v11.CGFloat height = height;
    UIGraphicsBeginImageContextWithOptions(v11, 0, v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(CurrentContext, v6);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "blackColor"), "CGColor"));
    CGContextFillPath(CurrentContext);
    v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGPathRelease(v6);
    return v10;
  }
  return result;
}

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  return 0;
}

@end