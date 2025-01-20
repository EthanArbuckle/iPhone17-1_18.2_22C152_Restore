@interface UIColor(MobileSafariExtras)
+ (id)safari_labelColorFromNumber:()MobileSafariExtras;
+ (id)sf_alternateLabelColor;
+ (id)sf_alternateSecondaryLabelColor;
+ (id)sf_colorNamed:()MobileSafariExtras;
+ (uint64_t)safari_scribbleThemeColor;
+ (uint64_t)sf_barHairlineOutlineColor;
+ (uint64_t)sf_barHairlineShadowColor;
+ (uint64_t)sf_defaultWebContentBackgroundColor;
+ (uint64_t)sf_safariAccentColor;
+ (uint64_t)sf_secondaryBarHairlineOutlineColor;
+ (uint64_t)sf_separateTabBarHighlightColor;
+ (uint64_t)sf_tabSeparatorColor;
+ (uint64_t)sf_transparentBarHairlineColor;
- (id)sf_brightenedColor;
- (id)sf_darkenedColor;
- (id)sf_muchBrightenedColor;
- (id)sf_muchDarkenedColor;
- (id)sf_slightlyDarkenedColor;
- (uint64_t)sf_isDarkColor;
@end

@implementation UIColor(MobileSafariExtras)

+ (id)sf_colorNamed:()MobileSafariExtras
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = objc_msgSend(v4, "sf_mobileSafariFrameworkBundle");
  v7 = [a1 colorNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

+ (uint64_t)sf_safariAccentColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"AccentColor");
}

+ (uint64_t)sf_transparentBarHairlineColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"TransparentBarHairlineColor");
}

- (uint64_t)sf_isDarkColor
{
  double v2 = 0.0;
  LODWORD(result) = [a1 getWhite:&v2 alpha:0];
  if (v2 < 0.6) {
    return result;
  }
  else {
    return 0;
  }
}

+ (id)sf_alternateLabelColor
{
  v0 = (void *)sf_alternateLabelColor_alternateLabelColor;
  if (!sf_alternateLabelColor_alternateLabelColor)
  {
    v1 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v2 = dynamicAlteranteColor(v1);
    v3 = (void *)sf_alternateLabelColor_alternateLabelColor;
    sf_alternateLabelColor_alternateLabelColor = v2;

    v0 = (void *)sf_alternateLabelColor_alternateLabelColor;
  }

  return v0;
}

+ (uint64_t)sf_separateTabBarHighlightColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"SeparateTabBarHighlightColor");
}

+ (uint64_t)sf_barHairlineShadowColor
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_21];
}

+ (uint64_t)sf_defaultWebContentBackgroundColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"DefaultWebContentBackground");
}

+ (uint64_t)sf_barHairlineOutlineColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"BarHairlineOutlineColor");
}

+ (uint64_t)sf_secondaryBarHairlineOutlineColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"SecondaryBarHairlineOutlineColor");
}

+ (uint64_t)sf_tabSeparatorColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"TabSeparatorColor");
}

+ (id)sf_alternateSecondaryLabelColor
{
  v0 = (void *)sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor;
  if (!sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor)
  {
    v1 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v2 = dynamicAlteranteColor(v1);
    v3 = (void *)sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor;
    sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor = v2;

    v0 = (void *)sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor;
  }

  return v0;
}

- (id)sf_darkenedColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ([a1 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4])
  {
    id v2 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:v6 brightness:v5 * 0.75 alpha:v4];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)sf_slightlyDarkenedColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ([a1 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4])
  {
    id v2 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:v6 brightness:v5 * 0.9 alpha:v4];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)sf_brightenedColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ([a1 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4])
  {
    id v2 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:v6 brightness:v5 * 1.25 alpha:v4];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)sf_muchBrightenedColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ([a1 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4])
  {
    id v2 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:v6 brightness:v5 * 1.5 alpha:v4];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)sf_muchDarkenedColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ([a1 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4])
  {
    id v2 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:v6 brightness:v5 * 0.5 alpha:v4];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

+ (id)safari_labelColorFromNumber:()MobileSafariExtras
{
  uint64_t v3 = [a3 integerValue];
  if (v3 == 2)
  {
    double v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  else if (v3 == 1)
  {
    double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else
  {
    if (v3) {
      [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    }
    else {
    double v4 = [MEMORY[0x1E4FB1618] labelColor];
    }
  }

  return v4;
}

+ (uint64_t)safari_scribbleThemeColor
{
  return objc_msgSend(a1, "sf_colorNamed:", @"ScribbleThemeColor");
}

@end