@interface ICStoreArtworkGradientInfo
- (CGColor)color;
- (double)y1;
- (double)y2;
- (void)setColor:(CGColor *)a3;
- (void)setY1:(double)a3;
- (void)setY2:(double)a3;
@end

@implementation ICStoreArtworkGradientInfo

- (void)setColor:(CGColor *)a3
{
  self->_color = a3;
}

- (CGColor)color
{
  return self->_color;
}

- (void)setY2:(double)a3
{
  self->_y2 = a3;
}

- (double)y2
{
  return self->_y2;
}

- (void)setY1:(double)a3
{
  self->_y1 = a3;
}

- (double)y1
{
  return self->_y1;
}

@end