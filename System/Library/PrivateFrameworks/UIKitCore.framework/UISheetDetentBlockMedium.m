@interface UISheetDetentBlockMedium
@end

@implementation UISheetDetentBlockMedium

double _UISheetDetentBlockMedium_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 containerTraitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  if (v4 == 1)
  {
    double v5 = 1.79769313e308;
  }
  else
  {
    [v2 maximumDetentValue];
    double v7 = v6;
    [v2 _containerBounds];
    double v5 = v7 * dbl_186B9D640[CGRectGetHeight(v9) > 568.0];
  }

  return v5;
}

@end