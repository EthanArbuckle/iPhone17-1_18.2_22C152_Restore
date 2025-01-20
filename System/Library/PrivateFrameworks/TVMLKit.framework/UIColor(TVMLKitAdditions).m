@interface UIColor(TVMLKitAdditions)
+ (id)tv_opacityColorForType:()TVMLKitAdditions userInterfaceStyle:;
+ (id)tvmlkit_keyColor;
@end

@implementation UIColor(TVMLKitAdditions)

+ (id)tvmlkit_keyColor
{
  v0 = [MEMORY[0x263F1C550] colorWithRed:0.109803922 green:0.733333333 blue:1.0 alpha:1.0];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    id v1 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.556862745 blue:0.756862745 alpha:1.0];
  }
  else
  {
    id v1 = v0;
  }
  v2 = v1;

  return v2;
}

+ (id)tv_opacityColorForType:()TVMLKitAdditions userInterfaceStyle:
{
  double v4 = 0.0;
  if (a4 == 2)
  {
    if (a3 <= 2) {
      double v4 = dbl_230C37F18[a3];
    }
    v5 = (void *)MEMORY[0x263F1C550];
    double v6 = 1.0;
  }
  else
  {
    if (a3 <= 2) {
      double v4 = dbl_230C37F30[a3];
    }
    v5 = (void *)MEMORY[0x263F1C550];
    double v6 = 0.0;
  }
  v7 = [v5 colorWithWhite:v6 alpha:v4];
  return v7;
}

@end