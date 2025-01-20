@interface MailTrackingProtectionOnboardingViewControllerValues
- (UIButton)learnMoreButton;
- (UIColor)secondaryTextPropertiesColor;
- (UIFont)primaryTextFont;
- (UIFont)secondaryTextPropertiesFont;
- (UIImage)icon;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (UIListContentConfiguration)cellConfiguration;
- (double)topConstant;
- (double)widthConstant;
@end

@implementation MailTrackingProtectionOnboardingViewControllerValues

- (UIImage)icon
{
  if (+[UIDevice mf_isPad])
  {
    v2 = +[UIImage imageNamed:@"envelope"];
  }
  else
  {
    v2 = 0;
  }

  return (UIImage *)v2;
}

- (UIButton)learnMoreButton
{
  v2 = +[UIButtonConfiguration plainButtonConfiguration];
  v3 = +[UIColor systemBlueColor];
  [v2 setBaseForegroundColor:v3];

  v4 = +[OBHeaderAccessoryButton accessoryButton];

  return (UIButton *)v4;
}

- (UIFont)primaryTextFont
{
  return (UIFont *)+[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightBold];
}

- (UIListContentConfiguration)cellConfiguration
{
  return +[UIListContentConfiguration subtitleCellConfiguration];
}

- (UIColor)secondaryTextPropertiesColor
{
  return +[UIColor secondaryLabelColor];
}

- (UIFont)secondaryTextPropertiesFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

- (double)widthConstant
{
  return 50.0;
}

- (double)topConstant
{
  return 0.0;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:35.0];
}

@end