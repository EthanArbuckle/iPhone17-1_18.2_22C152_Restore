@interface SBPrototypeHeightFittingSizeView
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation SBPrototypeHeightFittingSizeView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = a3.height + -16.0;
  double v4 = a3.height + -16.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end