@interface NavDrivingSignLayoutCompactWidth
+ (id)sharedDrivingCompactWidthSignLayout;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)laneGuidanceViewVerticalScaleForSign:(id)a3;
- (double)maneuverViewTopMarginForSign:(id)a3;
- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4;
- (double)shieldViewTopMarginForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4;
- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4;
@end

@implementation NavDrivingSignLayoutCompactWidth

+ (id)sharedDrivingCompactWidthSignLayout
{
  if (qword_101610E38 != -1) {
    dispatch_once(&qword_101610E38, &stru_101320A78);
  }
  v2 = (void *)qword_101610E30;

  return v2;
}

- (double)textTopMarginForSign:(id)a3
{
  id v4 = a3;
  if ([(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:v4])
  {
    v5 = [v4 primaryDrivingSign];
    [(NavDrivingSignLayout *)self laneGuidanceViewInternalEdgeInsetsForSign:v5];
    double v7 = v6 + 100.0;
  }
  else
  {
    double v7 = 42.0;
  }

  return v7;
}

- (double)textBottomMarginForSign:(id)a3
{
  unsigned int v3 = [(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:a3];
  double result = 22.0;
  if (v3) {
    return 20.0;
  }
  return result;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  unsigned int v3 = [(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:a3];
  double result = 32.0;
  if (v3) {
    return 34.0;
  }
  return result;
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  double result = 27.0;
  if (a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)NavDrivingSignLayoutCompactWidth;
    -[NavSignLayoutBase navSignView:alternateFontLineSpacingForMajorText:](&v5, "navSignView:alternateFontLineSpacingForMajorText:", a3, 1, 27.0);
  }
  return result;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  id v4 = &UIFontWeightHeavy;
  if (!a4) {
    id v4 = &UIFontWeightMedium;
  }
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, 27.0, *v4);
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  double v4 = 25.0;
  if (a4) {
    double v4 = 27.0;
  }
  objc_super v5 = &UIFontWeightHeavy;
  if (!a4) {
    objc_super v5 = &UIFontWeightMedium;
  }
  double v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, v4, *v5);

  return v6;
}

- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4
{
  return 5;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  return 17.5;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  id v4 = a3;
  if ([(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:v4])
  {
    objc_super v5 = [v4 primaryDrivingSign];
    [(NavDrivingSignLayout *)self laneGuidanceViewInternalEdgeInsetsForSign:v5];
    double v7 = v6 + 75.5;
  }
  else
  {
    double v7 = 17.5;
  }

  return v7;
}

- (double)laneGuidanceViewVerticalScaleForSign:(id)a3
{
  return 0.850000024;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 0;
}

@end