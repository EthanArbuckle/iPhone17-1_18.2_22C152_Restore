@interface NavDrivingSignLayoutSecondary
+ (id)sharedDrivingSecondarySignLayout;
- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewArrowMetricsForSign:(SEL)a3;
- (BOOL)forceHideShieldViewForSign:(id)a3;
- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4;
- (CGSize)maneuverViewSizeForSign:(id)a3;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)minimumHeightForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4;
- (int64_t)maneuverViewPositionForSign:(id)a3;
- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithPreferredFontForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4;
@end

@implementation NavDrivingSignLayoutSecondary

+ (id)sharedDrivingSecondarySignLayout
{
  if (qword_101610E28 != -1) {
    dispatch_once(&qword_101610E28, &stru_101320A58);
  }
  v2 = (void *)qword_101610E20;

  return v2;
}

- (double)minimumHeightForSign:(id)a3
{
  return 53.0;
}

- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4
{
  return 0;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  v4 = &UIFontWeightHeavy;
  if (!a4) {
    v4 = &UIFontWeightMedium;
  }
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, 21.0, *v4);
}

- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithPreferredFontForMajorText:(BOOL)a4
{
  return 1;
}

- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4
{
  return 1;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 1;
}

- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4
{
  return 5;
}

- (double)textTopMarginForSign:(id)a3
{
  return 34.0;
}

- (double)textBottomMarginForSign:(id)a3
{
  return 19.0;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  return 27.0;
}

- (CGSize)maneuverViewSizeForSign:(id)a3
{
  double v3 = 24.0;
  double v4 = 31.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 1;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewArrowMetricsForSign:(SEL)a3
{
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 1, 0, 31.0, 31.0);
}

- (int64_t)maneuverViewPositionForSign:(id)a3
{
  return 1;
}

@end