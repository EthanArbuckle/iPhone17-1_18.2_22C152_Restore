@interface NavDrivingSignLayout
+ (id)sharedDrivingSignLayout;
- (BOOL)_shouldShowLaneGuidanceForSign:(id)a3;
- (BOOL)forceHideLaneGuidanceViewForSign:(id)a3;
- (BOOL)forceHideShieldViewForSign:(id)a3;
- (BOOL)shouldTransformLaneViewsForSign:(id)a3;
- (UIEdgeInsets)laneGuidanceViewInternalEdgeInsetsForSign:(id)a3;
- (double)laneGuidanceViewSideMarginForSign:(id)a3;
- (double)laneGuidanceViewTopMarginForSign:(id)a3;
- (double)laneGuidanceViewVerticalScaleForSign:(id)a3;
- (double)shieldViewTopMarginForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
@end

@implementation NavDrivingSignLayout

+ (id)sharedDrivingSignLayout
{
  if (qword_101610DE8 != -1) {
    dispatch_once(&qword_101610DE8, &stru_1013209D8);
  }
  v2 = (void *)qword_101610DE0;

  return v2;
}

- (BOOL)_shouldShowLaneGuidanceForSign:(id)a3
{
  v4 = [a3 primaryDrivingSign];
  v5 = [v4 laneGuidanceInfo];
  if (v5) {
    unsigned int v6 = ![(NavDrivingSignLayout *)self forceHideLaneGuidanceViewForSign:v4];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (double)textTopMarginForSign:(id)a3
{
  id v4 = a3;
  if ([(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:v4])
  {
    v5 = [v4 primaryDrivingSign];

    [(NavDrivingSignLayout *)self laneGuidanceViewInternalEdgeInsetsForSign:v5];
    double v7 = v6 + 108.0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NavDrivingSignLayout;
    [(NavManeverSignLayoutBase *)&v10 textTopMarginForSign:v4];
    double v7 = v8;
  }
  return v7;
}

- (double)textBottomMarginForSign:(id)a3
{
  id v4 = a3;
  double v5 = 22.0;
  if (![(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:v4])
  {
    double v6 = [v4 maneuverSign];
    id v7 = [v6 maneuverSignType];

    if (v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)NavDrivingSignLayout;
      [(NavManeverSignLayoutBase *)&v10 textBottomMarginForSign:v4];
      double v5 = v8;
    }
    else
    {
      double v5 = 27.0;
    }
  }

  return v5;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  id v4 = a3;
  if ([(NavDrivingSignLayout *)self _shouldShowLaneGuidanceForSign:v4])
  {
    double v5 = [v4 primaryDrivingSign];

    [(NavDrivingSignLayout *)self laneGuidanceViewInternalEdgeInsetsForSign:v5];
    double v7 = v6 + 82.5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NavDrivingSignLayout;
    [(NavManeverSignLayoutBase *)&v10 shieldViewTopMarginForSign:v4];
    double v7 = v8;
  }
  return v7;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 usePersistentDisplay];
  double v6 = [v4 primaryDrivingSign];
  double v7 = [v6 laneGuidanceInfo];
  if ([v7 isForMidStep]
    && ![(NavDrivingSignLayout *)self forceHideLaneGuidanceViewForSign:v6])
  {

    if ((v5 & 1) == 0)
    {
      BOOL v8 = 1;
      goto LABEL_5;
    }
  }
  else
  {
  }
  v10.receiver = self;
  v10.super_class = (Class)NavDrivingSignLayout;
  BOOL v8 = [(NavManeverSignLayoutBase *)&v10 forceHideShieldViewForSign:v4];
LABEL_5:

  return v8;
}

- (BOOL)forceHideLaneGuidanceViewForSign:(id)a3
{
  return [a3 highlightedLanesNotInVisibleRange];
}

- (double)laneGuidanceViewTopMarginForSign:(id)a3
{
  return 0.0;
}

- (double)laneGuidanceViewSideMarginForSign:(id)a3
{
  return 0.0;
}

- (double)laneGuidanceViewVerticalScaleForSign:(id)a3
{
  return 1.0;
}

- (BOOL)shouldTransformLaneViewsForSign:(id)a3
{
  return 0;
}

- (UIEdgeInsets)laneGuidanceViewInternalEdgeInsetsForSign:(id)a3
{
  double v3 = 15.0;
  double v4 = 10.0;
  double v5 = 0.0;
  double v6 = 10.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end