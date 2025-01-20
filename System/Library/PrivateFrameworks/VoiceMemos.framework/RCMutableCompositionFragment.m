@interface RCMutableCompositionFragment
- (BOOL)intersectWithTimeRange:(id)a3;
@end

@implementation RCMutableCompositionFragment

- (BOOL)intersectWithTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(RCCompositionFragment *)self timeRangeInComposition];
  double v7 = v6;
  double v9 = RCTimeRangeIntersectTimeRange(v6, v8, var0, var1);
  double v11 = v10;
  double v12 = RCTimeRangeDeltaWithExactPrecision(v9, v10);
  if (v12 > 0.00000011920929)
  {
    [(RCCompositionFragment *)self timeRangeInContentToUse];
    double v15 = RCTimeRangeInset(v13, v14, v9 - v7);
    double v17 = v16;
    -[RCCompositionFragment setTimeRangeInComposition:](self, "setTimeRangeInComposition:", v9, v11);
    -[RCCompositionFragment setTimeRangeInContentToUse:](self, "setTimeRangeInContentToUse:", v15, v17);
  }
  return v12 > 0.00000011920929;
}

@end