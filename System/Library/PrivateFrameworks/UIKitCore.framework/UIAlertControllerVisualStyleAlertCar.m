@interface UIAlertControllerVisualStyleAlertCar
- (BOOL)placementAvoidsKeyboard;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (double)marginBelowMessageLabelLastBaseline;
- (id)messageLabelFont;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (int64_t)maximumNumberOfLinesInMessageLabel;
- (int64_t)maximumNumberOfLinesInTitleLabel;
@end

@implementation UIAlertControllerVisualStyleAlertCar

- (id)titleLabelFont
{
  return (id)[off_1E52D39B8 boldSystemFontOfSize:16.0];
}

- (id)titleLabelColor
{
  return +[UIColor labelColor];
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 1;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasMessage];

  double result = 22.0;
  if ((v4 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAlertControllerVisualStyleAlertCar;
    [(UIAlertControllerVisualStyleAlert *)&v6 marginAboveTitleLabelFirstBaseline];
  }
  return result;
}

- (double)marginBelowLastLabelLastBaseline
{
  v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasMessage];

  double result = 14.0;
  if ((v4 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAlertControllerVisualStyleAlertCar;
    [(UIAlertControllerVisualStyleAlert *)&v6 marginBelowLastLabelLastBaseline];
  }
  return result;
}

- (double)marginBelowMessageLabelLastBaseline
{
  v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasTitle];

  double result = 14.0;
  if ((v4 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAlertControllerVisualStyleAlertCar;
    [(UIAlertControllerVisualStyleAlert *)&v6 marginBelowMessageLabelLastBaseline];
  }
  return result;
}

- (id)messageLabelFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:16.0];
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 2;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  id v3 = a3;
  [v3 safeAreaInsets];
  double v5 = v4;
  [v3 safeAreaInsets];
  double v7 = v5 + v6;
  [v3 bounds];
  CGFloat Width = CGRectGetWidth(v21);
  double v9 = fmax((Width - v7 - fmin(Width - v7, 420.0)) * 0.5, 8.0);
  double v10 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(v3, 8.0, v9, 8.0, v9);
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

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

@end