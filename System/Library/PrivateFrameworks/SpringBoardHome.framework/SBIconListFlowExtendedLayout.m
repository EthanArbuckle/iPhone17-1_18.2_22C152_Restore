@interface SBIconListFlowExtendedLayout
- (CGSize)iconSpacingForOrientation:(int64_t)a3;
@end

@implementation SBIconListFlowExtendedLayout

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  v5 = [(SBIconListGridLayout *)self layoutConfiguration];
  [v5 listSizeForIconSpacingCalculation];
  if ((unint64_t)(a3 - 3) >= 2) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  if ((unint64_t)(a3 - 3) < 2) {
    double v7 = v6;
  }
  CGFloat v9 = SBHIconListLayoutListIconSpacingForListSize(self, a3, v8, v7);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

@end