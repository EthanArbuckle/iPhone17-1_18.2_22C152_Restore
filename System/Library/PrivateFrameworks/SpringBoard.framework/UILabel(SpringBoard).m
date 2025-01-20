@interface UILabel(SpringBoard)
- (double)sb_yPositionForLayoutAfterLabel:()SpringBoard baselineOffset:;
- (uint64_t)sb_yPositionForLabelWithContainerBounds:()SpringBoard baselineOffset:font:;
- (uint64_t)sb_yPositionForLabelWithContainerBounds:()SpringBoard lineHeight:baselineOffset:font:;
@end

@implementation UILabel(SpringBoard)

- (uint64_t)sb_yPositionForLabelWithContainerBounds:()SpringBoard lineHeight:baselineOffset:font:
{
  id v11 = a7;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
  [v11 descender];

  return SBFloatRoundForScale();
}

- (uint64_t)sb_yPositionForLabelWithContainerBounds:()SpringBoard baselineOffset:font:
{
  id v11 = a7;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
  [v11 ascender];

  return SBFloatRoundForScale();
}

- (double)sb_yPositionForLayoutAfterLabel:()SpringBoard baselineOffset:
{
  id v4 = a3;
  [v4 frame];
  CGRectGetMaxY(v9);
  [v4 _baselineOffsetFromBottom];

  v5 = [a1 font];
  [v5 ascender];
  SBFloatRoundForScale();
  double v7 = v6;

  return v7;
}

@end