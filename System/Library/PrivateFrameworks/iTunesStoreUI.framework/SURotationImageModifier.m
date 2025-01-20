@interface SURotationImageModifier
- (BOOL)isEqual:(id)a3;
- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (float)degrees;
- (int64_t)orientation;
- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)setDegrees:(float)a3;
- (void)setOrientation:(int64_t)a3;
@end

@implementation SURotationImageModifier

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t v5 = [(SURotationImageModifier *)self orientation];
  if (v5 != [a3 orientation]) {
    return 0;
  }
  [(SURotationImageModifier *)self degrees];
  float v7 = v6;
  [a3 degrees];
  return v7 == v8;
}

- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat v10 = *MEMORY[0x263F001B0];
  CGFloat v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  switch([(SURotationImageModifier *)self orientation])
  {
    case 1:
      double v11 = 0.0;
      if (width > height)
      {
        double v11 = 1.57079633;
        CGFloat v10 = height;
      }
      break;
    case 2:
    case 4:
      double v11 = 0.0;
      if (height > width) {
        double v11 = -1.57079633;
      }
      break;
    case 3:
      double v11 = 0.0;
      if (height > width) {
        double v11 = 1.57079633;
      }
      break;
    default:
      [(SURotationImageModifier *)self degrees];
      double v11 = v12 * 0.0174532925;
      break;
  }
  CGContextTranslateCTM(a3, v10, v9);

  CGContextRotateCTM(a3, v11);
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  objc_msgSend(a3, "size", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  double v11 = v10;
  double v13 = v12;
  int64_t v14 = [(SURotationImageModifier *)self orientation];
  if ((unint64_t)(v14 - 1) >= 2)
  {
    if ((unint64_t)(v14 - 3) <= 1 && v13 > v11) {
      goto LABEL_4;
    }
LABEL_6:
    double v15 = width;
    CGFloat width = height;
    goto LABEL_7;
  }
  if (v11 <= v13) {
    goto LABEL_6;
  }
LABEL_4:
  double v15 = height;
LABEL_7:
  double v16 = x;
  double v17 = y;
  double v18 = width;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (float)degrees
{
  return self->_degrees;
}

- (void)setDegrees:(float)a3
{
  self->_degrees = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

@end