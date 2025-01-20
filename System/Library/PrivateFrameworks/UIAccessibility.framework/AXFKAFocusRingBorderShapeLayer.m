@interface AXFKAFocusRingBorderShapeLayer
- (double)unscaledLineWidth;
- (unint64_t)ringPosition;
- (void)setRingPosition:(unint64_t)a3;
- (void)setUnscaledLineWidth:(double)a3;
@end

@implementation AXFKAFocusRingBorderShapeLayer

- (unint64_t)ringPosition
{
  return self->_ringPosition;
}

- (void)setRingPosition:(unint64_t)a3
{
  self->_ringPosition = a3;
}

- (double)unscaledLineWidth
{
  return self->_unscaledLineWidth;
}

- (void)setUnscaledLineWidth:(double)a3
{
  self->_unscaledLineWidth = a3;
}

@end