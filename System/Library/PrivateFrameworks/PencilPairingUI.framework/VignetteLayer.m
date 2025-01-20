@interface VignetteLayer
- (UIEdgeInsets)insets;
- (double)blurRadius;
- (void)drawInContext:(CGContext *)a3;
- (void)setBlurRadius:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
@end

@implementation VignetteLayer

- (void)drawInContext:(CGContext *)a3
{
  [(VignetteLayer *)self setMasksToBounds:0];
  v35.receiver = self;
  v35.super_class = (Class)VignetteLayer;
  [(VignetteLayer *)&v35 drawInContext:a3];
  [(VignetteLayer *)self insets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(VignetteLayer *)self bounds];
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  CGFloat v17 = CGRectGetWidth(v37) - v8 - v12;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat v18 = CGRectGetHeight(v38) - v6 - v10;
  v19 = (void *)MEMORY[0x263F1C478];
  [(VignetteLayer *)self cornerRadius];
  v21 = objc_msgSend(v19, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v17, v18, v20);
  v36.CGFloat width = width;
  v36.CGFloat height = height;
  UIGraphicsBeginImageContext(v36);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v23 = v21;
  CGContextAddPath(CurrentContext, (CGPathRef)[v23 CGPath]);
  id v24 = [MEMORY[0x263F1C550] blackColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);

  CGContextFillPath(CurrentContext);
  v25 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v26 = [MEMORY[0x263F00640] gaussianBlurFilter];
  v27 = (void *)MEMORY[0x263F00650];
  id v28 = v25;
  v29 = objc_msgSend(v27, "imageWithCGImage:", objc_msgSend(v28, "CGImage"));
  [v26 setValue:v29 forKey:*MEMORY[0x263F00968]];

  v30 = NSNumber;
  [(VignetteLayer *)self blurRadius];
  v31 = objc_msgSend(v30, "numberWithDouble:");
  [v26 setValue:v31 forKey:*MEMORY[0x263F00980]];

  v32 = [v26 outputImage];
  id v33 = objc_alloc_init(MEMORY[0x263F00628]);
  [v32 extent];
  v34 = (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v32);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGContextDrawImage(a3, v39, v34);
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

@end