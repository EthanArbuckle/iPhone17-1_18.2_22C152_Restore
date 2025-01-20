@interface StoryChromeLayoutSpec
- (UIEdgeInsets)minimumMargins;
@end

@implementation StoryChromeLayoutSpec

- (UIEdgeInsets)minimumMargins
{
  double v2 = *(double *)self->minimumMargins;
  double v3 = *(double *)&self->minimumMargins[8];
  double v4 = *(double *)&self->minimumMargins[16];
  double v5 = *(double *)&self->minimumMargins[24];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end