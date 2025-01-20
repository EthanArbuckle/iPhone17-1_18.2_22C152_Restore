@interface NavSignLayoutBase
- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4;
- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4;
- (BOOL)shouldAlignMinorToMajorLabelLeadingForSign:(id)a3;
- (BOOL)shouldAlignMinorToMajorLabelTrailingForSign:(id)a3;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)contentSideMarginForSign:(id)a3;
- (double)labelBaselineToInlineShieldTopForSign:(id)a3;
- (double)minimumHeightForSign:(id)a3;
- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4;
- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4;
- (double)navSignView:(id)a3 textTrailingMarginForMajorText:(BOOL)a4;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4;
- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithPreferredFontForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4;
- (int64_t)navSignView:(id)a3 textAlignmentForMajorText:(BOOL)a4;
@end

@implementation NavSignLayoutBase

- (double)minimumHeightForSign:(id)a3
{
  return 0.0;
}

- (double)contentSideMarginForSign:(id)a3
{
  return 17.5;
}

- (double)textTopMarginForSign:(id)a3
{
  return 48.0;
}

- (double)textBottomMarginForSign:(id)a3
{
  return 27.0;
}

- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4
{
  return 17.5;
}

- (double)navSignView:(id)a3 textTrailingMarginForMajorText:(BOOL)a4
{
  return 17.5;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  return 37.0;
}

- (double)labelBaselineToInlineShieldTopForSign:(id)a3
{
  return 10.0;
}

- (BOOL)shouldAlignMinorToMajorLabelLeadingForSign:(id)a3
{
  return 1;
}

- (BOOL)shouldAlignMinorToMajorLabelTrailingForSign:(id)a3
{
  return 0;
}

- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4
{
  return a4;
}

- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4
{
  return 1;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  v4 = &UIFontWeightHeavy;
  if (!a4) {
    v4 = &UIFontWeightMedium;
  }
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, 30.0, *v4);
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  double v4 = 27.0;
  if (a4) {
    double v4 = 30.0;
  }
  v5 = &UIFontWeightHeavy;
  if (!a4) {
    v5 = &UIFontWeightMedium;
  }
  v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, v4, *v5);

  return v6;
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  double result = 33.0;
  if (!a4) {
    return 30.0;
  }
  return result;
}

- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithPreferredFontForMajorText:(BOOL)a4
{
  return 1;
}

- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4
{
  return 2;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 0;
}

- (int64_t)navSignView:(id)a3 textAlignmentForMajorText:(BOOL)a4
{
  return 4;
}

- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4
{
  return 6;
}

@end