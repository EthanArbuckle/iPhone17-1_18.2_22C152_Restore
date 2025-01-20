@interface PKPeerPaymentTheme
+ (id)backgroundColor;
+ (id)disabledTextColor;
+ (id)platterColor;
+ (id)platterPressedColor;
+ (id)primaryTextColor;
+ (id)secondaryButtonTextColor;
+ (id)secondaryButtonTextPressedColor;
+ (id)secondaryTextColor;
+ (id)separatorColor;
@end

@implementation PKPeerPaymentTheme

+ (id)primaryTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (id)secondaryTextColor
{
  v2 = [a1 primaryTextColor];
  v3 = [v2 colorWithAlphaComponent:0.5];

  return v3;
}

+ (id)secondaryButtonTextColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.75 alpha:1.0];
}

+ (id)secondaryButtonTextPressedColor
{
  v2 = [a1 secondaryButtonTextColor];
  v3 = [v2 colorWithAlphaComponent:0.3];

  return v3;
}

+ (id)disabledTextColor
{
  v2 = [a1 primaryTextColor];
  v3 = [v2 colorWithAlphaComponent:0.3];

  return v3;
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.07 green:0.07 blue:0.07 alpha:1.0];
}

+ (id)platterColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.453 green:0.453 blue:0.5 alpha:0.18];
}

+ (id)platterPressedColor
{
  v2 = [a1 platterColor];
  v3 = [v2 colorWithAlphaComponent:0.8];

  return v3;
}

+ (id)separatorColor
{
  v2 = [a1 primaryTextColor];
  v3 = [v2 colorWithAlphaComponent:0.07];

  return v3;
}

@end