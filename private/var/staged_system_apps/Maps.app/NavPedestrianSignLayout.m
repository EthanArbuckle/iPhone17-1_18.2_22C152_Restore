@interface NavPedestrianSignLayout
+ (id)sharedPedestrianSignLayout;
- (BOOL)forceHideShieldViewForSign:(id)a3;
- (CGSize)maneuverViewSizeForSign:(id)a3;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)labelBaselineToInlineShieldTopForSign:(id)a3;
- (double)maneuverViewTopMarginForSign:(id)a3;
- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4;
- (double)shieldViewTopMarginForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4;
- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4;
@end

@implementation NavPedestrianSignLayout

+ (id)sharedPedestrianSignLayout
{
  if (qword_101610DC8 != -1) {
    dispatch_once(&qword_101610DC8, &stru_101320998);
  }
  v2 = (void *)qword_101610DC0;

  return v2;
}

- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4
{
  return 1;
}

- (double)textTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  [(NavManeverSignLayoutBase *)&v5 textTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)textBottomMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  [(NavManeverSignLayoutBase *)&v5 textBottomMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  [(NavManeverSignLayoutBase *)&v5 baselineMarginBetweenLabelsForSign:a3];
  return v3 * 0.800000012;
}

- (double)labelBaselineToInlineShieldTopForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  [(NavSignLayoutBase *)&v5 labelBaselineToInlineShieldTopForSign:a3];
  return v3 * 0.800000012;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NavPedestrianSignLayout;
  v4 = [(NavManeverSignLayoutBase *)&v10 navSignView:a3 preferredFontForMajorText:a4];
  objc_super v5 = v4;
  if (v4)
  {
    v6 = [v4 fontDescriptor];
    [v5 pointSize];
    v8 = +[UIFont fontWithDescriptor:v6 size:v7 * 0.829999983];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NavPedestrianSignLayout;
  v4 = [(NavManeverSignLayoutBase *)&v10 navSignView:a3 alternateFontForMajorText:a4];
  objc_super v5 = v4;
  if (v4)
  {
    v6 = [v4 fontDescriptor];
    [v5 pointSize];
    v8 = +[UIFont fontWithDescriptor:v6 size:v7 * 0.829999983];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NavPedestrianSignLayout;
  [(NavSignLayoutBase *)&v6 navSignView:a3 alternateFontLineSpacingForMajorText:a4];
  return v4 * 0.800000012;
}

- (CGSize)maneuverViewSizeForSign:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavPedestrianSignLayout;
  [(NavManeverSignLayoutBase *)&v7 maneuverViewSizeForSign:a3];
  double v4 = v3 * 0.800000012;
  double v6 = v5 * 0.800000012;
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  [(NavManeverSignLayoutBase *)&v5 maneuverViewTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  [(NavManeverSignLayoutBase *)&v5 shieldViewTopMarginForSign:a3];
  return v3 * 0.800000012;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 1;
}

@end