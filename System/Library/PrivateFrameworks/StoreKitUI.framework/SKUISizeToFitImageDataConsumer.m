@interface SKUISizeToFitImageDataConsumer
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

@implementation SKUISizeToFitImageDataConsumer

+ (id)consumerWithConstraintSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = [a1 consumer];
  v14[1] = width;
  v14[2] = height;

  return v14;
}

+ (id)consumerWithConstraintSize2:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize2:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  uint64_t v14 = [a1 consumer];
  *(CGFloat *)(v14 + 8) = width;
  *(CGFloat *)(v14 + 16) = height;
  *(unsigned char *)(v14 + 24) = 1;

  return (id)v14;
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISizeToFitImageDataConsumer imageForImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (!self->_custom)
  {
    [v4 size];
    double width = self->_constraintSize.width;
    double height = self->_constraintSize.height;
    if (height == 0.0)
    {
      if (width == 0.0)
      {
        id v22 = v4;
        goto LABEL_15;
      }
    }
    else if (width <= height)
    {
      float v24 = v20 * (height / v21);
      double width = floorf(v24);
      goto LABEL_13;
    }
    float v23 = v21 * (width / v20);
    double height = floorf(v23);
LABEL_13:
    [v4 scale];
    CGFloat v26 = v25;
    v30.double width = width;
    v30.double height = height;
    UIGraphicsBeginImageContextWithOptions(v30, 0, v26);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
    goto LABEL_14;
  }
  v28.double width = 0.0;
  v28.double height = 0.0;
  [v4 size];
  SKUIIconFrameForIconSize(&v28.width, 0, v13, v14, self->_constraintSize.width, self->_constraintSize.height, 0.0);
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  UIGraphicsBeginImageContextWithOptions(v28, 0, v16);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
  double width = v28.width;
  double height = v28.height;
LABEL_14:
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, width, height);
  -[SKUISizeToFitImageDataConsumer _drawGradientWithContext:imageRect:](self, "_drawGradientWithContext:imageRect:", CurrentContext, 0.0, 0.0, width, height);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_15:

  return v22;
}

- (void)_drawGradientWithContext:(CGContext *)a3 imageRect:(CGRect)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_gradientEndColor)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1C1CCB440;
    id v11 = [(UIColor *)self->_gradientEndColor colorWithAlphaComponent:0.0];
    v15[1] = -[UIColor CGColor](self->_gradientEndColor, "CGColor", [v11 CGColor]);

    CFArrayRef v12 = CFArrayCreate(0, v15, 2, MEMORY[0x1E4F1D510]);
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

+ (void)consumerWithConstraintSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)consumerWithConstraintSize2:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end