@interface UIContentUnavailableConstants_Mac
+ (id)sharedConstants;
- (BOOL)prefersSideBySideButtonAndSecondaryButton;
- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3;
- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3;
- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3;
- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3;
- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3;
- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3;
- (id)defaultButtonConfigurationForTraitCollection:(id)a3;
- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3;
- (id)defaultEmptyImageTintColor;
- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3;
- (id)defaultEmptyTextColorForTraitCollection:(id)a3;
- (id)defaultEmptyTextFontForTraitCollection:(id)a3;
- (id)defaultLoadingImageSymbolConfigurationForTraitCollection:(id)a3;
- (id)defaultLoadingImageTintColor;
- (id)defaultLoadingTextColor;
- (id)defaultLoadingTextFontForTraitCollection:(id)a3;
- (id)defaultSecondaryTextColor;
- (int64_t)defaultUserInterfaceRenderingMode;
@end

@implementation UIContentUnavailableConstants_Mac

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_101;
  if (!sharedConstants___sharedConstants_101)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_101;
    sharedConstants___sharedConstants_101 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_101;
  }
  return v3;
}

- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  if ([v3 horizontalSizeClass] == 2) {
    double v4 = 36.0;
  }
  else {
    double v4 = 52.0;
  }
  v5 = +[UIFontMetrics defaultMetrics];
  [v5 scaledValueForValue:v3 compatibleWithTraitCollection:v4];
  double v7 = v6;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v7];
}

- (id)defaultLoadingImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  double v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:32.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (id)defaultEmptyImageTintColor
{
  return +[UIColor tertiaryLabelColor];
}

- (id)defaultLoadingImageTintColor
{
  return +[UIColor tertiaryLabelColor];
}

- (id)defaultEmptyTextFontForTraitCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 horizontalSizeClass];
  double v5 = UIFontTextStyleEmphasizedLargeTitle;
  if (v4 != 2) {
    double v5 = UIFontTextStyleEmphasizedTitle2;
  }
  double v6 = [off_1E52D39B8 preferredFontForTextStyle:*v5 compatibleWithTraitCollection:v3];

  return v6;
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:a3];
}

- (id)defaultEmptyTextColorForTraitCollection:(id)a3
{
  if ([a3 horizontalSizeClass] == 2) {
    +[UIColor secondaryLabelColor];
  }
  else {
  id v3 = +[UIColor labelColor];
  }
  return v3;
}

- (id)defaultLoadingTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 horizontalSizeClass];
  double v5 = &UIFontTextStyleBody;
  if (v4 != 2) {
    double v5 = &UIFontTextStyleSubheadline;
  }
  double v6 = [off_1E52D39B8 preferredFontForTextStyle:*v5 compatibleWithTraitCollection:v3];

  return v6;
}

- (id)defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultButtonConfigurationForTraitCollection:(id)a3
{
  id v3 = +[UIButtonConfiguration plainButtonConfiguration];
  [v3 setButtonSize:1];
  [v3 setMacIdiomStyle:1];
  [v3 setTitleAlignment:2];
  [v3 _setAlwaysApplyTitleAlignment:1];
  return v3;
}

- (BOOL)prefersSideBySideButtonAndSecondaryButton
{
  return 1;
}

- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 horizontalSizeClass];
  double result = 10.0;
  if (v3 == 2) {
    return 22.0;
  }
  return result;
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 10.0;
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 horizontalSizeClass];
  double result = 3.0;
  if (v3 == 2) {
    return 12.0;
  }
  return result;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 horizontalSizeClass];
  double result = 10.0;
  if (v3 == 2) {
    return 12.0;
  }
  return result;
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 6.0;
}

- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3
{
  double v3 = 20.0;
  double v4 = 20.0;
  double v5 = 20.0;
  double v6 = 20.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (int64_t)defaultUserInterfaceRenderingMode
{
  return 0;
}

@end