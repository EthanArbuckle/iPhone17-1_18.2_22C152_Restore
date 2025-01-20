@interface NavDrivingSignLayoutMinimized
+ (id)sharedDrivingMinimizedSignLayout;
- (BOOL)shouldTransformLaneViewsForSign:(id)a3;
- (CGAffineTransform)navSignView:(SEL)a3 transformForSubview:(id)a4;
- (UIEdgeInsets)laneGuidanceViewInternalEdgeInsetsForSign:(id)a3;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)labelBaselineToInlineShieldTopForSign:(id)a3;
- (double)laneGuidanceViewTopMarginForSign:(id)a3;
- (double)laneGuidanceViewVerticalScaleForSign:(id)a3;
- (double)maneuverViewTopMarginForSign:(id)a3;
- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4;
- (double)shieldViewTopMarginForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4;
@end

@implementation NavDrivingSignLayoutMinimized

+ (id)sharedDrivingMinimizedSignLayout
{
  if (qword_101610E18 != -1) {
    dispatch_once(&qword_101610E18, &stru_101320A38);
  }
  v2 = (void *)qword_101610E10;

  return v2;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 0;
}

- (double)textTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavDrivingSignLayout *)&v5 textTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)textBottomMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavDrivingSignLayout *)&v5 textBottomMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavManeverSignLayoutBase *)&v5 baselineMarginBetweenLabelsForSign:a3];
  return v3 * 0.800000012;
}

- (double)labelBaselineToInlineShieldTopForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavSignLayoutBase *)&v5 labelBaselineToInlineShieldTopForSign:a3];
  return v3 * 0.800000012;
}

- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4
{
  BOOL v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NavDrivingSignLayoutMinimized;
  id v5 = a3;
  [(NavSignLayoutBase *)&v15 navSignView:v5 textLeadingMarginForMajorText:v4];
  double v7 = v6;
  v8 = [v5 maneuverSign];

  v9 = [v8 maneuverView];

  unsigned __int8 v10 = [v9 isHidden];
  double v11 = 0.0;
  if ((v10 & 1) == 0)
  {
    [v9 intrinsicContentSize];
    double v11 = v12 * 0.199999988;
  }
  double v13 = v7 - v11;

  return v13;
}

- (CGAffineTransform)navSignView:(SEL)a3 transformForSubview:(id)a4
{
  id v17 = a4;
  id v8 = a5;
  uint64_t v9 = [v17 majorLabel];
  if ((id)v9 == v8)
  {
  }
  else
  {
    unsigned __int8 v10 = (void *)v9;
    id v11 = [v17 minorLabel];

    if (v11 != v8)
    {
      double v12 = [v17 maneuverSign];
      id v13 = [v12 maneuverView];

      if (v13 == v8)
      {
        if ((id)[(NavManeverSignLayoutBase *)self maneuverViewPositionForSign:v12] == (id)2)
        {
          if (v8)
          {
            [v8 _maps_transformScaledToTopAndLeadingAtScale:0.800000012];
            goto LABEL_18;
          }
        }
        else if (v8)
        {
          [v8 _maps_transformScaledToLeadingAtScale:0.800000012];
          goto LABEL_18;
        }
      }
      else
      {
        id v14 = [v12 shieldView];

        if (v14 != v8)
        {
          long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
          *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
          *(_OWORD *)&retstr->c = v15;
          *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
LABEL_18:

          goto LABEL_19;
        }
        if (v8)
        {
          [v8 _maps_transformScaledToTopAndTrailingAtScale:0.899999976];
          goto LABEL_18;
        }
      }
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
      goto LABEL_18;
    }
  }
  if (v8)
  {
    [v8 _maps_transformScaledToLeadingAtScale:0.829999983];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
LABEL_19:

  return result;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavManeverSignLayoutBase *)&v5 maneuverViewTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavDrivingSignLayout *)&v5 shieldViewTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)laneGuidanceViewTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavDrivingSignLayout *)&v5 laneGuidanceViewTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)laneGuidanceViewVerticalScaleForSign:(id)a3
{
  return 0.800000012;
}

- (BOOL)shouldTransformLaneViewsForSign:(id)a3
{
  return 1;
}

- (UIEdgeInsets)laneGuidanceViewInternalEdgeInsetsForSign:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NavDrivingSignLayoutMinimized;
  [(NavDrivingSignLayout *)&v9 laneGuidanceViewInternalEdgeInsetsForSign:a3];
  double v6 = v5 * 0.800000012;
  double v8 = v7 * 0.800000012;
  result.right = v4;
  result.bottom = v8;
  result.left = v3;
  result.top = v6;
  return result;
}

@end