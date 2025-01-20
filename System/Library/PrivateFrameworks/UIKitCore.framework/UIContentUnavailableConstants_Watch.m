@interface UIContentUnavailableConstants_Watch
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

@implementation UIContentUnavailableConstants_Watch

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_105;
  if (!sharedConstants___sharedConstants_105)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_105;
    sharedConstants___sharedConstants_105 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_105;
  }
  return v3;
}

- (id)defaultEmptyImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:24.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (id)defaultLoadingImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:32.0];
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
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedCallout" compatibleWithTraitCollection:a3];
}

- (id)defaultLoadingTextFontForTraitCollection:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote" compatibleWithTraitCollection:a3];
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
  return 15.0;
}

- (double)defaultLoadingImageToTextPaddingForTraitCollection:(id)a3
{
  return 15.0;
}

- (double)defaultEmptyTextToSecondaryTextPaddingForTraitCollection:(id)a3
{
  return 3.0;
}

- (double)defaultEmptyTextToButtonPaddingForTraitCollection:(id)a3
{
  return 20.0;
}

- (double)defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:(id)a3
{
  return 15.0;
}

- (NSDirectionalEdgeInsets)defaultDirectionalLayoutMarginsForTraitCollection:(id)a3
{
  double v3 = 8.0;
  double v4 = 8.0;
  double v5 = 8.0;
  double v6 = 8.0;
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