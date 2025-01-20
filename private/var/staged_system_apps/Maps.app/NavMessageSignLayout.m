@interface NavMessageSignLayout
+ (id)sharedMessageSignLayout;
- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4;
- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4;
- (BOOL)shouldAlignMinorToMajorLabelLeadingForSign:(id)a3;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4;
- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4;
- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 textAlignmentForMajorText:(BOOL)a4;
@end

@implementation NavMessageSignLayout

+ (id)sharedMessageSignLayout
{
  if (qword_101610DA8 != -1) {
    dispatch_once(&qword_101610DA8, &stru_101320958);
  }
  v2 = (void *)qword_101610DA0;

  return v2;
}

- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4
{
  double result = 15.0;
  if (!a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)NavMessageSignLayout;
    -[NavSignLayoutBase navSignView:textLeadingMarginForMajorText:](&v5, "navSignView:textLeadingMarginForMajorText:", a3, 0, 15.0);
  }
  return result;
}

- (double)textTopMarginForSign:(id)a3
{
  unsigned int v3 = [a3 hasOnlySingleLineText];
  double result = 41.0;
  if (v3) {
    return 50.0;
  }
  return result;
}

- (double)textBottomMarginForSign:(id)a3
{
  unsigned int v3 = [a3 hasOnlySingleLineText];
  double result = 23.0;
  if (v3) {
    return 30.0;
  }
  return result;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  return 32.0;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  v4 = &UIFontWeightHeavy;
  if (!a4) {
    v4 = &UIFontWeightMedium;
  }
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, 27.0, *v4);
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  double v4 = 24.0;
  if (a4) {
    double v4 = 27.0;
  }
  objc_super v5 = &UIFontWeightHeavy;
  if (!a4) {
    objc_super v5 = &UIFontWeightMedium;
  }
  v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, v4, *v5);

  return v6;
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  double result = 32.0;
  if (!a4) {
    return 27.0;
  }
  return result;
}

- (BOOL)shouldAlignMinorToMajorLabelLeadingForSign:(id)a3
{
  return 0;
}

- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [a3 hasMinorText];
  }
}

- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [a3 hasMinorText];
  }
}

- (int64_t)navSignView:(id)a3 textAlignmentForMajorText:(BOOL)a4
{
  if (a4) {
    return 4;
  }
  else {
    return 1;
  }
}

@end