@interface _UIBackdropViewSettings(PKUIUtilities)
+ (void)pkui_createTransparentSettingsFromSettings:()PKUIUtilities;
@end

@implementation _UIBackdropViewSettings(PKUIUtilities)

+ (void)pkui_createTransparentSettingsFromSettings:()PKUIUtilities
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_20;
  }
  v5 = objc_msgSend(MEMORY[0x1E4FB1FE8], "settingsForPrivateStyle:graphicsQuality:", -2, objc_msgSend(v3, "graphicsQuality"));
  [v4 grayscaleTintAlpha];
  if (v6 > 0.0)
  {
    [v4 grayscaleTintLevel];
    objc_msgSend(v5, "setGrayscaleTintLevel:");
    [v5 setGrayscaleTintAlpha:0.0];
    [v4 grayscaleTintMaskAlpha];
    double v8 = v7;
    if (v7 <= 0.0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [v4 grayscaleTintMaskAlpha];
  double v8 = v9;
  if (v9 > 0.0)
  {
LABEL_7:
    v10 = [v4 grayscaleTintMaskImage];
    [v5 setGrayscaleTintMaskImage:v10];

    [v5 setGrayscaleTintMaskAlpha:v8];
LABEL_8:
    objc_msgSend(v5, "setLightenGrayscaleWithSourceOver:", objc_msgSend(v4, "lightenGrayscaleWithSourceOver"));
  }
  v11 = [v4 colorTint];
  [v5 setColorTint:v11];
  if (v11) {
    [v5 setColorTintAlpha:0.0];
  }
  [v4 colorBurnTintAlpha];
  if (v12 > 0.0)
  {
    [v4 colorBurnTintLevel];
    objc_msgSend(v5, "setColorBurnTintLevel:");
    [v5 setColorBurnTintAlpha:0.0];
  }
  [v4 darkeningTintAlpha];
  if (v13 > 0.0)
  {
    objc_msgSend(v5, "setDarkenWithSourceOver:", objc_msgSend(v4, "darkenWithSourceOver"));
    [v4 darkeningTintHue];
    objc_msgSend(v5, "setDarkeningTintHue:");
    [v4 darkeningTintSaturation];
    objc_msgSend(v5, "setDarkeningTintSaturation:");
    [v4 darkeningTintBrightness];
    objc_msgSend(v5, "setDarkeningTintBrightness:");
    [v5 setDarkeningTintAlpha:0.0];
  }
  [v4 filterMaskAlpha];
  if (v14 > 0.0)
  {
    double v15 = v14;
    v16 = [v4 filterMaskImage];
    [v5 setFilterMaskImage:v16];

    [v5 setFilterMaskAlpha:v15];
  }
  [v4 saturationDeltaFactor];
  if (v17 < 1.0) {
    [v5 setSaturationDeltaFactor:1.0];
  }
  v18 = [v4 legibleColor];
  [v5 setLegibleColor:v18];

LABEL_20:
  return v5;
}

@end