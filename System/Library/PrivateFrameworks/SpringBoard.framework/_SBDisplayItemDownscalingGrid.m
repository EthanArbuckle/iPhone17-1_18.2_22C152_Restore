@interface _SBDisplayItemDownscalingGrid
- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4;
@end

@implementation _SBDisplayItemDownscalingGrid

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)_SBDisplayItemDownscalingGrid;
  -[_SBDisplayItemSingleSizeGrid nearestGridSizeForSize:countOnStage:](&v10, sel_nearestGridSizeForSize_countOnStage_, a4);
  if (v7 > height || v6 > width)
  {
    double v9 = height / v7;
    if (height / v7 > width / v6) {
      double v9 = width / v6;
    }
    if (v9 < 0.7) {
      double v9 = 0.7;
    }
    double v6 = v6 * v9;
    double v7 = v7 * v9;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

@end