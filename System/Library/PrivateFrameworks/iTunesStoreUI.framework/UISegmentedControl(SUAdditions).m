@interface UISegmentedControl(SUAdditions)
- (uint64_t)sizeToFitWithMinimumSegmentWidth:()SUAdditions maximumTotalWidth:;
@end

@implementation UISegmentedControl(SUAdditions)

- (uint64_t)sizeToFitWithMinimumSegmentWidth:()SUAdditions maximumTotalWidth:
{
  [a1 sizeToFit];
  [a1 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (a2 > 0.00000011920929)
  {
    unint64_t v14 = [a1 numberOfSegments];
    if (v11 < (double)v14 * a2) {
      double v11 = (double)v14 * a2;
    }
  }
  if (v11 >= a3) {
    double v15 = a3;
  }
  else {
    double v15 = v11;
  }
  if (a3 <= 0.00000011920929) {
    double v16 = v11;
  }
  else {
    double v16 = v15;
  }

  return objc_msgSend(a1, "setFrame:", v7, v9, v16, v13);
}

@end