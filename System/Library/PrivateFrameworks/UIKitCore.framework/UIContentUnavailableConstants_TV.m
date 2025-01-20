@interface UIContentUnavailableConstants_TV
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

@implementation UIContentUnavailableConstants_TV

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_109;
  if (!sharedConstants___sharedConstants_109)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_109;
    sharedConstants___sharedConstants_109 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_109;
  }
  return v3;
}

- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:80.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (id)defaultLoadingImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:64.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (id)defaultEmptyImageTintColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultLoadingImageTintColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultEmptyTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedHeadline" compatibleWithTraitCollection:a3];
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:a3];
}

- (id)defaultEmptyTextColorForTraitCollection:(id)a3
{
  return +[UIColor labelColor];
}

- (id)defaultLoadingTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultEmptySecondaryTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:a3];
}

- (id)defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)defaultButtonConfigurationForTraitCollection:(id)a3
{
  id v3 = +[UIButtonConfiguration borderedButtonConfiguration];
  [v3 setButtonSize:1];
  [v3 setTitleAlignment:2];
  [v3 _setAlwaysApplyTitleAlignment:1];
  return v3;
}

- (BOOL)prefersSideBySideButtonAndSecondaryButton
{
  return 0;
}

- (double)defaultEmptyImageToTextPaddingForTraitCollection:(id)a3
{
  return 32.0;
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 16.0;
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  return 3.0;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  return 32.0;
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 20.0;
}

- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
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

- (int64_t)defaultUserInterfaceRenderingMode
{
  return 0;
}

@end