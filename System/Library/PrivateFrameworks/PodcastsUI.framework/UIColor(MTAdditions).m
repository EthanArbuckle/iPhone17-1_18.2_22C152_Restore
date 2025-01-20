@interface UIColor(MTAdditions)
+ (id)appTintColor;
+ (id)cellEmpahsisBackgroundColor;
+ (id)cellEmpahsisSwitchBorderColor;
+ (id)primaryTextColorForDarkBackground:()MTAdditions;
+ (id)secondaryTextColorForDarkBackground:()MTAdditions;
+ (uint64_t)artworkBorderColor;
+ (uint64_t)artworkBorderColorForDarkBackground:()MTAdditions;
+ (uint64_t)backgroundColor;
+ (uint64_t)blueTextColor;
+ (uint64_t)buttonBackgroundColorForDarkBackground:()MTAdditions;
+ (uint64_t)cellDetailTextColor;
+ (uint64_t)cellHighlightedColor;
+ (uint64_t)cellSecondaryTextColor;
+ (uint64_t)cellSelectedBackgroundColor;
+ (uint64_t)cellSeparatorColor;
+ (uint64_t)cellTextColor;
+ (uint64_t)dividerColor;
+ (uint64_t)goneDarkColor;
+ (uint64_t)markPlayedGrayColor;
+ (uint64_t)markUnplayedBlueColor;
+ (uint64_t)newEpisodeBackgroundColor;
+ (uint64_t)newEpisodeBorderColor;
+ (uint64_t)refreshControlTextColor;
+ (uint64_t)separatorColorForDarkBackground:()MTAdditions;
+ (uint64_t)tvGutterDark;
+ (uint64_t)tvGutterLight;
+ (uint64_t)unplayedBlueColor;
+ (uint64_t)viewDarkBackgroundColor;
+ (uint64_t)viewLightBackgroundColor;
- (uint64_t)isBlackColor;
@end

@implementation UIColor(MTAdditions)

+ (id)appTintColor
{
  if ([MEMORY[0x1E4F91FC8] isRunningOnTV])
  {
    v0 = 0;
  }
  else
  {
    if (appTintColor_onceToken != -1) {
      dispatch_once(&appTintColor_onceToken, &__block_literal_global_16);
    }
    v0 = [MEMORY[0x1E4FB1618] _dynamicColorWithColorsByTraitCollection:appTintColor_colorsByTraitCollection];
  }

  return v0;
}

+ (uint64_t)backgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)unplayedBlueColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.160784314 green:0.635294118 blue:1.0 alpha:1.0];
}

+ (uint64_t)cellSelectedBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
}

+ (id)cellEmpahsisBackgroundColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIColor_MTAdditions__cellEmpahsisBackgroundColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellEmpahsisBackgroundColor_onceToken != -1) {
    dispatch_once(&cellEmpahsisBackgroundColor_onceToken, block);
  }
  v1 = (void *)cellEmpahsisBackgroundColor_color;

  return v1;
}

+ (id)cellEmpahsisSwitchBorderColor
{
  if (cellEmpahsisSwitchBorderColor_onceToken != -1) {
    dispatch_once(&cellEmpahsisSwitchBorderColor_onceToken, &__block_literal_global_9_0);
  }
  v0 = (void *)cellEmpahsisSwitchBorderColor_color;

  return v0;
}

+ (uint64_t)cellSeparatorColor
{
  return [MEMORY[0x1E4FB1618] separatorColor];
}

+ (uint64_t)cellDetailTextColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
}

+ (uint64_t)cellTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)cellSecondaryTextColor
{
  return [MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (uint64_t)artworkBorderColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.18];
}

+ (uint64_t)goneDarkColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
}

+ (uint64_t)dividerColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
}

+ (uint64_t)cellHighlightedColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.91372549 green:0.941176471 blue:0.980392157 alpha:1.0];
}

+ (uint64_t)viewLightBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.959999979 alpha:1.0];
}

+ (uint64_t)viewDarkBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.157000005 alpha:1.0];
}

+ (uint64_t)blueTextColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.156862751 green:0.274509817 blue:0.450980395 alpha:1.0];
}

+ (uint64_t)markUnplayedBlueColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.137254902 green:0.588235294 blue:0.941176471 alpha:1.0];
}

+ (uint64_t)markPlayedGrayColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.501960784 green:0.501960784 blue:0.501960784 alpha:1.0];
}

- (uint64_t)isBlackColor
{
  v2 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v3 = [v2 isEqual:a1];

  return v3;
}

+ (uint64_t)newEpisodeBackgroundColor
{
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)newEpisodeBorderColor
{
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)tvGutterDark
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
}

+ (uint64_t)tvGutterLight
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
}

+ (uint64_t)refreshControlTextColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
}

+ (id)primaryTextColorForDarkBackground:()MTAdditions
{
  if (a3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v3;
}

+ (id)secondaryTextColorForDarkBackground:()MTAdditions
{
  if (a3)
  {
    double v3 = 0.3;
    double v4 = 1.0;
  }
  else
  {
    double v3 = 0.4;
    double v4 = 0.0;
  }
  v5 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:v3];

  return v5;
}

+ (uint64_t)artworkBorderColorForDarkBackground:()MTAdditions
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 1.0;
  }
  return [MEMORY[0x1E4FB1618] colorWithWhite:v3 alpha:0.18];
}

+ (uint64_t)separatorColorForDarkBackground:()MTAdditions
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 1.0;
  }
  return [MEMORY[0x1E4FB1618] colorWithWhite:v3 alpha:0.2];
}

+ (uint64_t)buttonBackgroundColorForDarkBackground:()MTAdditions
{
  double v3 = 0.74;
  if (a3) {
    double v3 = 0.2;
  }
  return [MEMORY[0x1E4FB1618] colorWithWhite:v3 alpha:1.0];
}

@end