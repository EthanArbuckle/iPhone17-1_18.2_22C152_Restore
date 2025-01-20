@interface _UIStatusBarActivityIndicator
- (BOOL)wantsCrossfade;
- (UIEdgeInsets)alignmentRectInsets;
- (void)applyStyleAttributes:(id)a3;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
@end

@implementation _UIStatusBarActivityIndicator

- (BOOL)wantsCrossfade
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = [a3 imageTintColor];
  [(UIActivityIndicatorView *)self setColor:v4];
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

@end