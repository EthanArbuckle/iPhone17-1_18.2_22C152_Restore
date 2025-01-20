@interface SBStackedFloatingSwitcherModifier
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation SBStackedFloatingSwitcherModifier

- (double)scaleForIndex:(unint64_t)a3
{
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  v6 = [(SBStackedFloatingSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 indexOfObject:v5];

  double result = dbl_1D8FD2010[v7 == 1];
  if (!v7) {
    return 0.0;
  }
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double result = 0.0;
  if (!a4) {
    return 1.0;
  }
  return result;
}

@end