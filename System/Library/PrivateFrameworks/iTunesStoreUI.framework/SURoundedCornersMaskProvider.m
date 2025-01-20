@interface SURoundedCornersMaskProvider
- (CGPath)copyPathForMaskWithSize:(CGSize)a3;
- (double)cornerRadius;
- (void)setCornerRadius:(double)a3;
@end

@implementation SURoundedCornersMaskProvider

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = (void *)MEMORY[0x263F1C478];
  [(SURoundedCornersMaskProvider *)self cornerRadius];
  result = (CGPath *)objc_msgSend((id)objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v6), "CGPath");
  if (result)
  {
    return CGPathRetain(result);
  }
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

@end