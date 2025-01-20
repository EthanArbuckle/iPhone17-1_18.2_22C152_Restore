@interface UIContentUnavailableConstants_IOS
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

@implementation UIContentUnavailableConstants_IOS

- (BOOL)prefersSideBySideButtonAndSecondaryButton
{
  return 0;
}

- (id)defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  return 3.0;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  return 20.0;
}

- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:a3];
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 15.0;
}

- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3
{
  v3 = [a3 preferredContentSizeCategory];
  NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(v3, &cfstr_Uictcontentsiz_9.isa);

  double v5 = 16.0;
  if (v4 == NSOrderedAscending) {
    double v5 = 32.0;
  }
  double v6 = 16.0;
  double v7 = 16.0;
  double v8 = v5;
  result.trailing = v8;
  result.bottom = v7;
  result.leading = v5;
  result.top = v6;
  return result;
}

- (id)defaultButtonConfigurationForTraitCollection:(id)a3
{
  v3 = +[UIButtonConfiguration plainButtonConfiguration];
  [v3 setButtonSize:1];
  [v3 setMacIdiomStyle:1];
  [v3 setTitleAlignment:2];
  [v3 _setAlwaysApplyTitleAlignment:1];
  return v3;
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:a3];
}

- (id)defaultLoadingTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 8.0;
}

- (id)defaultLoadingImageTintColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultLoadingImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  NSComparisonResult v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:32.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (id)defaultEmptyTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle2" compatibleWithTraitCollection:a3];
}

- (id)defaultEmptyTextColorForTraitCollection:(id)a3
{
  return +[UIColor labelColor];
}

- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3
{
  return 15.0;
}

- (id)defaultEmptyImageTintColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  NSComparisonResult v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:48.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (int64_t)defaultUserInterfaceRenderingMode
{
  return 0;
}

+ (id)sharedConstants
{
  NSComparisonResult v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"UIContentUnavailableConstants.m" lineNumber:48 description:@"Attempted to instantiate an instance of UIContentUnavailableConstants_IOS - use UIContentUnavailableConstants_Phone or UIContentUnavailableConstants_Pad instead"];

  return 0;
}

@end