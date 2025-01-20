@interface UIAlertControllerVisualStyleActionSheetCar
- (BOOL)placementAvoidsKeyboard;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (int64_t)maximumNumberOfLinesInMessageLabel;
- (int64_t)maximumNumberOfLinesInTitleLabel;
- (int64_t)permittedActionLayoutDirection;
@end

@implementation UIAlertControllerVisualStyleActionSheetCar

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  id v3 = a3;
  [v3 safeAreaInsets];
  double v5 = v4;
  [v3 safeAreaInsets];
  double v7 = v5 + v6;
  [v3 bounds];
  CGFloat Width = CGRectGetWidth(v21);
  double v9 = fmax((Width - v7 - fmin(Width - v7, 420.0)) * 0.5, 10.0);
  double v10 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(v3, 6.0, v9, 6.0, v9);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (id)titleLabelFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:16.0];
}

- (id)titleLabelColor
{
  return +[UIColor labelColor];
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 21.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 11.5;
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 1;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 2;
}

- (int64_t)permittedActionLayoutDirection
{
  return 1;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

@end