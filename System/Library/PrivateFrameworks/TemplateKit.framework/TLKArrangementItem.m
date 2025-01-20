@interface TLKArrangementItem
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)size;
- (double)effectiveBaselineOffsetFromContentBottom;
- (double)effectiveFirstBaselineOffsetFromContentTop;
- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3;
- (float)contentHuggingPriorityForAxis:(int64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TLKArrangementItem

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 0;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  return 0.0;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  return 0.0;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  return 999.0;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  return 999.0;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

@end