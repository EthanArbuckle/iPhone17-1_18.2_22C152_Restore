@interface UIFocusRegionMapSnapshot
@end

@implementation UIFocusRegionMapSnapshot

uint64_t __72___UIFocusRegionMapSnapshot__sortedEligibleFocusContainerGuidesInArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 axisAlignedDistanceFromFocusedRect];
  double v7 = v6;
  [v5 axisAlignedDistanceFromFocusedRect];
  if (vabdd_f64(v7, v8) <= 2.22044605e-16)
  {
    uint64_t v12 = 0;
  }
  else
  {
    [v4 axisAlignedDistanceFromFocusedRect];
    double v10 = v9;
    [v5 axisAlignedDistanceFromFocusedRect];
    if (v10 >= v11) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
  }

  return v12;
}

@end