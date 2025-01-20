@interface SUUISizeToFitImageDataConsumer
+ (id)consumerWithConstraintSize2:(CGSize)a3;
+ (id)consumerWithConstraintSize:(CGSize)a3;
- (CGSize)constraintSize;
- (UIColor)gradientEndColor;
- (double)gradientHeight;
- (id)imageForImage:(id)a3;
- (void)_drawGradientWithContext:(CGContext *)a3 imageRect:(CGRect)a4;
- (void)setConstraintSize:(CGSize)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientHeight:(double)a3;
@end

@implementation SUUISizeToFitImageDataConsumer

+ (id)consumerWithConstraintSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id result = (id)[a1 consumer];
  *((CGFloat *)result + 1) = width;
  *((CGFloat *)result + 2) = height;
  return result;
}

+ (id)consumerWithConstraintSize2:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id result = (id)[a1 consumer];
  *((CGFloat *)result + 1) = width;
  *((CGFloat *)result + 2) = height;
  *((unsigned char *)result + 24) = 1;
  return result;
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_custom)
  {
    [v4 size];
    double width = self->_constraintSize.width;
    double height = self->_constraintSize.height;
    if (height == 0.0)
    {
      if (width == 0.0)
      {
        id v15 = v5;
        goto LABEL_11;
      }
    }
    else if (width <= height)
    {
      float v17 = v13 * (height / v14);
      double width = floorf(v17);
      goto LABEL_9;
    }
    float v16 = v14 * (width / v13);
    double height = floorf(v16);
LABEL_9:
    [v5 scale];
    CGFloat v19 = v18;
    v23.double width = width;
    v23.double height = height;
    UIGraphicsBeginImageContextWithOptions(v23, 0, v19);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
    goto LABEL_10;
  }
  v21.double width = 0.0;
  v21.double height = 0.0;
  [v4 size];
  SUUIIconFrameForIconSize(&v21.width, 0, v6, v7, self->_constraintSize.width, self->_constraintSize.height, 0.0);
  v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  UIGraphicsBeginImageContextWithOptions(v21, 0, v9);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
  double width = v21.width;
  double height = v21.height;
LABEL_10:
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, width, height);
  -[SUUISizeToFitImageDataConsumer _drawGradientWithContext:imageRect:](self, "_drawGradientWithContext:imageRect:", CurrentContext, 0.0, 0.0, width, height);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_11:

  return v15;
}

- (void)_drawGradientWithContext:(CGContext *)a3 imageRect:(CGRect)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_gradientEndColor)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_2568A0CA0;
    id v11 = [(UIColor *)self->_gradientEndColor colorWithAlphaComponent:0.0];
    v15[1] = -[UIColor CGColor](self->_gradientEndColor, "CGColor", [v11 CGColor]);

    CFArrayRef v12 = CFArrayCreate(0, v15, 2, MEMORY[0x263EFFF70]);
    double v13 = CGGradientCreateWithColors(DeviceRGB, v12, locations);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat v14 = CGRectGetMaxY(v20) - self->_gradientHeight;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    v19.CGFloat y = CGRectGetMaxY(v21);
    v18.CGFloat x = 0.0;
    v19.CGFloat x = 0.0;
    v18.CGFloat y = v14;
    CGContextDrawLinearGradient(a3, v13, v18, v19, 0);
    CGGradientRelease(v13);
    CFRelease(v12);
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (CGSize)constraintSize
{
  double width = self->_constraintSize.width;
  double height = self->_constraintSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setConstraintSize:(CGSize)a3
{
  self->_constraintSize = a3;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (void).cxx_destruct
{
}

@end