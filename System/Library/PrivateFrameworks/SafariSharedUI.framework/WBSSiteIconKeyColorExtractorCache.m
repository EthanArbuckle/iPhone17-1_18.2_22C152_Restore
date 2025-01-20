@interface WBSSiteIconKeyColorExtractorCache
- (UIColor)color;
- (UIEdgeInsets)insets;
- (double)confidence;
- (double)nonTransparentConfidence;
- (void)setColor:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setNonTransparentConfidence:(double)a3;
@end

@implementation WBSSiteIconKeyColorExtractorCache

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
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

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)nonTransparentConfidence
{
  return self->_nonTransparentConfidence;
}

- (void)setNonTransparentConfidence:(double)a3
{
  self->_nonTransparentConfidence = a3;
}

- (void).cxx_destruct
{
}

@end