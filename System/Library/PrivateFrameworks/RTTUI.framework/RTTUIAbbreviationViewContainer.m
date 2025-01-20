@interface RTTUIAbbreviationViewContainer
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation RTTUIAbbreviationViewContainer

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  v4 = objc_msgSend(MEMORY[0x263F1C738], "activeInstance", a3.width);
  [v4 frame];
  double v6 = v5;

  if (v6 == 0.0)
  {
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 bounds];
    double v6 = v8;
  }
  double v9 = v6;
  double v10 = height;
  result.CGFloat height = v10;
  result.width = v9;
  return result;
}

@end