@interface SUFrameAdjustmentImageModifier
- (BOOL)isEqual:(id)a3;
- (BOOL)scalesImage;
- (BOOL)shouldSizeDownToFit;
- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)result finalSize:(CGSize)a5;
- (unint64_t)sizingMask;
- (void)setShouldSizeDownToFit:(BOOL)a3;
- (void)setSizingMask:(unint64_t)a3;
@end

@implementation SUFrameAdjustmentImageModifier

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(SUFrameAdjustmentImageModifier *)self sizingMask];
  return v5 == [a3 sizingMask];
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)result finalSize:(CGSize)a5
{
  double v5 = a5.height / result.size.height;
  if (a5.height / result.size.height >= a5.width / result.size.width) {
    double v5 = a5.width / result.size.width;
  }
  if (self->_shouldSizeDownToFit && v5 < 1.0)
  {
    float v6 = result.size.height * v5;
    result.size.height = ceilf(v6);
    float v7 = result.size.width * v5;
    result.size.width = ceilf(v7);
  }
  unint64_t sizingMask = self->_sizingMask;
  if ((sizingMask & 4) != 0) {
    result.origin.x = 0.0;
  }
  double v9 = a5.width - result.size.width;
  if (sizingMask) {
    result.origin.x = v9;
  }
  double v10 = floor(v9 * 0.5);
  if ((sizingMask & 5) != 0) {
    result.origin.x = v10;
  }
  if ((sizingMask & 0x20) != 0) {
    result.origin.y = 0.0;
  }
  if ((sizingMask & 8) != 0) {
    result.origin.y = a5.height - result.size.height;
  }
  double v11 = floor((a5.height - result.size.height) * 0.5);
  if ((sizingMask & 0x28) != 0) {
    result.origin.y = v11;
  }
  return result;
}

- (BOOL)scalesImage
{
  return 1;
}

- (unint64_t)sizingMask
{
  return self->_sizingMask;
}

- (void)setSizingMask:(unint64_t)a3
{
  self->_unint64_t sizingMask = a3;
}

- (BOOL)shouldSizeDownToFit
{
  return self->_shouldSizeDownToFit;
}

- (void)setShouldSizeDownToFit:(BOOL)a3
{
  self->_shouldSizeDownToFit = a3;
}

@end