@interface MapsAutolayoutLabel
- (BOOL)shouldInsetAlignmentToAscender;
- (UIEdgeInsets)alignmentRectInsets;
- (void)setShouldInsetAlignmentToAscender:(BOOL)a3;
@end

@implementation MapsAutolayoutLabel

- (UIEdgeInsets)alignmentRectInsets
{
  CGFloat left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  CGFloat right = UIEdgeInsetsZero.right;
  if ([(MapsAutolayoutLabel *)self shouldInsetAlignmentToAscender])
  {
    v6 = [(MapsAutolayoutLabel *)self font];
    [v6 lineHeight];
    [v6 ascender];
    UIRoundToViewScale();
    CGFloat top = v7;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
  }
  double v9 = top;
  double v10 = left;
  double v11 = bottom;
  double v12 = right;
  result.CGFloat right = v12;
  result.CGFloat bottom = v11;
  result.CGFloat left = v10;
  result.CGFloat top = v9;
  return result;
}

- (BOOL)shouldInsetAlignmentToAscender
{
  return self->_shouldInsetAlignmentToAscender;
}

- (void)setShouldInsetAlignmentToAscender:(BOOL)a3
{
  self->_shouldInsetAlignmentToAscender = a3;
}

@end