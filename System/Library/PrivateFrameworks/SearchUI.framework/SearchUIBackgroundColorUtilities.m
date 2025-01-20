@interface SearchUIBackgroundColorUtilities
+ (BOOL)backgroundColorPrefersWhiteForegroundText:(id)a3;
+ (BOOL)isDefaultUIColorInUIColors:(id)a3;
+ (UIColor)defaultBackgroundColor;
+ (double)tintedRGBValueForValue:(double)a3 isLight:(BOOL)a4 colorTintStyle:(int)a5;
+ (id)averageColorOfUIColors:(id)a3;
+ (id)colorWithHexString:(id)a3;
+ (id)disambiguationInnerPlatterColor;
+ (id)hexStringFromColor:(id)a3;
+ (id)randomColor;
+ (id)rgbCompatibleColorForColor:(id)a3;
+ (id)tintedUIColorsFromUIColors:(id)a3 withColorRequest:(id)a4 tintStyle:(int)a5;
+ (void)computeResolvedColoringForColorRequest:(id)a3 completionHandler:(id)a4;
+ (void)overrideAppearance:(id)a3 onView:(id)a4;
+ (void)resolvedColoringForColorRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUIBackgroundColorUtilities

+ (void)resolvedColoringForColorRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = resolvedColoringForColorRequest_completionHandler__onceToken;
  id v6 = a4;
  id v7 = a3;
  id v9 = v7;
  if (v5 == -1)
  {
    id v8 = v7;
  }
  else
  {
    dispatch_once(&resolvedColoringForColorRequest_completionHandler__onceToken, &__block_literal_global_34);
    id v8 = v9;
  }
  [(id)resolvedColoringForColorRequest_completionHandler__colorCache getObjectForKey:v8 completionHandler:v6];
}

uint64_t __86__SearchUIBackgroundColorUtilities_resolvedColoringForColorRequest_completionHandler___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = resolvedColoringForColorRequest_completionHandler__colorCache;
  resolvedColoringForColorRequest_completionHandler__colorCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)computeResolvedColoringForColorRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 appearance];
  uint64_t v10 = [v9 isDark];

  if (v10)
  {
    v4 = [v7 sfColor];
    uint64_t v11 = [v4 darkModeColor];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v7 sfColor];
      v14 = [v13 darkModeColor];

LABEL_5:
      goto LABEL_6;
    }
  }
  v14 = [v7 sfColor];
  if (v10) {
    goto LABEL_5;
  }
LABEL_6:
  v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "searchUI_colorGeneratorClass")), "initWithSFColor:", v14);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__SearchUIBackgroundColorUtilities_computeResolvedColoringForColorRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E6E74148;
  id v24 = v8;
  id v25 = a1;
  id v21 = v7;
  id v22 = v15;
  char v26 = v10;
  id v23 = v14;
  id v16 = v8;
  id v17 = v14;
  id v18 = v15;
  id v19 = v7;
  [v18 generateUIColorsIsDark:v10 completionHandler:v20];
}

void __93__SearchUIBackgroundColorUtilities_computeResolvedColoringForColorRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 64) isDefaultUIColorInUIColors:v3];
  uint64_t v5 = [*(id *)(a1 + 32) sfColor];
  uint64_t v6 = [v5 colorTintStyle];

  if (!v6) {
    uint64_t v6 = [*(id *)(a1 + 40) defaultTintStyle];
  }
  id v7 = [*(id *)(a1 + 64) tintedUIColorsFromUIColors:v3 withColorRequest:*(void *)(a1 + 32) tintStyle:v6];
  id v8 = [*(id *)(a1 + 64) averageColorOfUIColors:v7];
  if (v6 == 1)
  {
    if (([*(id *)(a1 + 64) backgroundColorPrefersWhiteForegroundText:v8] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  else if (!*(unsigned char *)(a1 + 72))
  {
LABEL_6:
    uint64_t v9 = 0;
    BOOL v10 = 0;
    goto LABEL_9;
  }
  double v18 = 0.0;
  [v8 getHue:0 saturation:0 brightness:&v18 alpha:0];
  BOOL v10 = v18 < 0.02;
  uint64_t v9 = 1;
LABEL_9:
  double v17 = 0.0;
  double v18 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  [v8 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
  if (v15 == 1.0)
  {
    if (v18 == 0.0 && v17 == 0.0 && v16 == 0.0)
    {
      uint64_t v11 = 0;
    }
    else
    {
      BOOL v12 = v18 != 1.0;
      if (v17 != 1.0) {
        BOOL v12 = 1;
      }
      uint64_t v11 = v16 != 1.0 || v12;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }
  v13 = objc_opt_new();
  [v13 setTintedUIColors:v7];
  [v13 setOriginalUIColors:v3];
  if (v4) {
    [MEMORY[0x1E4FAE060] bestAppearanceForSystem];
  }
  else {
  v14 = [MEMORY[0x1E4FAE060] appearanceWithVibrancyEnabled:v11 isDark:v9];
  }
  [v13 setBestForegroundAppearanceForBackgroundColors:v14];

  [v13 setColorRequest:*(void *)(a1 + 32)];
  [v13 setPreferKeylineForShadowBasedViews:v10];
  [v13 setTintStyle:v6];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)overrideAppearance:(id)a3 onView:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4FAE060] bestAppearanceForView:v6];
  id v8 = [v6 backgroundColor];
  uint64_t v9 = [a1 defaultBackgroundColor];
  int v10 = [v8 isEqual:v9];

  uint64_t v11 = [MEMORY[0x1E4FAE060] bestAppearanceForSystem];
  int v12 = [v7 isEqual:v11];

  if (![v7 isEqual:v13] || ((v10 ^ 1 | v12) & 1) == 0)
  {
    [MEMORY[0x1E4FAE060] disableAppearanceOverrideForView:v6];
    [v13 overrideAppearanceForView:v6];
  }
}

+ (UIColor)defaultBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (BOOL)backgroundColorPrefersWhiteForegroundText:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  uint64_t v5 = [v3 whiteColor];
  [v4 _colorDifferenceFromColor:v5];
  double v7 = v6;

  return v7 > 1.15;
}

+ (id)randomColor
{
  v2 = objc_opt_new();
  [v2 setRedComponent:(double)(arc4random() % 0xFF) / 255.0];
  [v2 setGreenComponent:(double)(arc4random() % 0xFF) / 255.0];
  [v2 setBlueComponent:(double)(arc4random() % 0xFF) / 255.0];
  return v2;
}

+ (id)disambiguationInnerPlatterColor
{
  v2 = objc_opt_new();
  [v2 setColorTintStyle:1];
  [v2 setRedComponent:1.0];
  [v2 setGreenComponent:1.0];
  [v2 setBlueComponent:1.0];
  [v2 setAlphaComponent:1.0];
  id v3 = objc_opt_new();
  [v2 setDarkModeColor:v3];

  id v4 = [v2 darkModeColor];
  [v4 setColorTintStyle:1];

  uint64_t v5 = [v2 darkModeColor];
  [v5 setRedComponent:0.99];

  double v6 = [v2 darkModeColor];
  [v6 setGreenComponent:0.98];

  double v7 = [v2 darkModeColor];
  [v7 setBlueComponent:1.0];

  id v8 = [v2 darkModeColor];
  [v8 setAlphaComponent:0.12];

  return v2;
}

+ (id)tintedUIColorsFromUIColors:(id)a3 withColorRequest:(id)a4 tintStyle:(int)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 appearance];
  int v10 = [v9 isDark];

  if (a5 == 2)
  {
    int v16 = [MEMORY[0x1E4FAE198] isPhone];
    double v17 = 0.85;
    double v18 = 0.7;
    if (v16) {
      double v17 = 0.7;
    }
    else {
      double v18 = 0.5;
    }
    if (v10) {
      double v11 = v18;
    }
    else {
      double v11 = v17;
    }
    double v12 = v11;
  }
  else
  {
    double v11 = 0.0;
    if (a5 == 3)
    {
      if (v10) {
        double v12 = 0.8;
      }
      else {
        double v12 = 0.92;
      }
      if (v10) {
        double v11 = 0.32;
      }
      else {
        double v11 = 0.35;
      }
      if ([v8 count] == 1)
      {
        id v13 = [v8 firstObject];
        v14 = (void *)[v13 copy];
        uint64_t v15 = [v8 arrayByAddingObject:v14];

        id v8 = (id)v15;
      }
    }
    else
    {
      double v12 = 0.0;
    }
  }
  id v19 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__SearchUIBackgroundColorUtilities_tintedUIColorsFromUIColors_withColorRequest_tintStyle___block_invoke;
  v25[3] = &unk_1E6E74170;
  int v31 = a5;
  char v32 = v10 ^ 1;
  id v28 = a1;
  id v26 = v8;
  double v29 = v12;
  double v30 = v11;
  id v20 = v19;
  id v27 = v20;
  id v21 = v8;
  [v21 enumerateObjectsUsingBlock:v25];
  id v22 = v27;
  id v23 = v20;

  return v23;
}

void __90__SearchUIBackgroundColorUtilities_tintedUIColorsFromUIColors_withColorRequest_tintStyle___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  double v22 = 0.0;
  double v23 = 0.0;
  double v21 = 0.0;
  if ((*(_DWORD *)(a1 + 72) & 0xFFFFFFFE) == 2)
  {
    double v6 = [*(id *)(a1 + 48) rgbCompatibleColorForColor:v5];
    double v19 = 0.0;
    double v20 = 0.0;
    double v18 = 0.0;
    [v6 getRed:&v20 green:&v19 blue:&v18 alpha:0];
    [*(id *)(a1 + 48) tintedRGBValueForValue:*(unsigned __int8 *)(a1 + 76) isLight:*(unsigned int *)(a1 + 72) colorTintStyle:v20];
    double v20 = v7;
    [*(id *)(a1 + 48) tintedRGBValueForValue:*(unsigned __int8 *)(a1 + 76) isLight:*(unsigned int *)(a1 + 72) colorTintStyle:v19];
    double v19 = v8;
    [*(id *)(a1 + 48) tintedRGBValueForValue:*(unsigned __int8 *)(a1 + 76) isLight:*(unsigned int *)(a1 + 72) colorTintStyle:v18];
    int v10 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", v20, v19, v9, 1.0, *(void *)&v9);

    [v10 getHue:&v23 saturation:&v22 brightness:&v21 alpha:0];
    double v11 = dbl_1E46B69B0[*(unsigned char *)(a1 + 76) == 0];
    double v12 = 0.5;
    if (!*(unsigned char *)(a1 + 76)) {
      double v12 = 0.0;
    }
    if (*(_DWORD *)(a1 + 72) == 3) {
      double v11 = v12;
    }
    double v22 = v22 / (1.0 - (v11 - v22 * v11));

    id v5 = v10;
  }
  uint64_t v13 = [*(id *)(a1 + 32) count];
  double v14 = *(double *)(a1 + 56);
  if (v13 != 1)
  {
    if (v14 == 0.0 && *(double *)(a1 + 64) == 0.0)
    {
      double v14 = 0.0;
    }
    else
    {
      uint64_t v15 = [*(id *)(a1 + 32) count];
      double v14 = *(double *)(a1 + 64) * ((double)a3 / (double)(unint64_t)(v15 - 1))
          + *(double *)(a1 + 56) * (1.0 - (double)a3 / (double)(unint64_t)(v15 - 1));
    }
  }
  if (*(_DWORD *)(a1 + 72) == 1)
  {
    id v16 = v5;
  }
  else
  {
    id v16 = [MEMORY[0x1E4FB1618] colorWithHue:v23 saturation:v22 brightness:v21 alpha:v14];
  }
  double v17 = v16;
  [*(id *)(a1 + 40) addObject:v16];
}

+ (BOOL)isDefaultUIColorInUIColors:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    double v6 = [a1 defaultBackgroundColor];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)hexStringFromColor:(id)a3
{
  if (a3)
  {
    Components = CGColorGetComponents((CGColorRef)[a3 CGColor]);
    float v5 = *Components * 255.0;
    unint64_t v6 = llroundf(v5);
    float v7 = Components[1] * 255.0;
    unint64_t v8 = llroundf(v7);
    float v9 = Components[2] * 255.0;
    unint64_t v12 = llroundf(v9);
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX%02lX", v6, v8, v12, v12);
  }
  else
  {
    int v10 = 0;
  }
  return v10;
}

+ (id)colorWithHexString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"#"])
  {
    uint64_t v4 = [v3 substringFromIndex:1];

    id v3 = (id)v4;
  }
  int v8 = 0;
  float v5 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
  [v5 setScanLocation:0];
  [v5 scanHexInt:&v8];
  unint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:(double)BYTE2(v8) / 255.0 green:(double)BYTE1(v8) / 255.0 blue:(double)v8 / 255.0 alpha:1.0];

  return v6;
}

+ (double)tintedRGBValueForValue:(double)a3 isLight:(BOOL)a4 colorTintStyle:(int)a5
{
  BOOL v5 = a4;
  if (a5 == 3)
  {
    double v7 = 0.6;
    if (a4) {
      double v7 = 0.67;
    }
    double v8 = 0.33;
    if (!a4) {
      double v8 = 0.0;
    }
    return v8 + v7 * a3;
  }
  else
  {
    int v10 = [MEMORY[0x1E4FAE198] isPhone];
    double v11 = 0.85;
    if (v10) {
      double v11 = 0.4;
    }
    double v12 = 0.6;
    if (!v10) {
      double v12 = 0.25;
    }
    if (!v5) {
      double v11 = v12;
    }
    return (1.0 - v11) * a3 + v11 * (double)v5;
  }
}

+ (id)rgbCompatibleColorForColor:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)averageColorOfUIColors:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = [a1 rgbCompatibleColorForColor:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        double v19 = 0.0;
        double v20 = 0.0;
        double v17 = 0.0;
        double v18 = 0.0;
        [v13 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];
        double v11 = v11 + v20;
        double v10 = v10 + v19;
        double v9 = v9 + v18;
        double v8 = v8 + v17;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
  }
  unint64_t v14 = [v4 count];
  uint64_t v15 = [MEMORY[0x1E4FB1618] colorWithRed:v11 / (double)v14 green:v10 / (double)v14 blue:v9 / (double)v14 alpha:v8 / (double)v14];

  return v15;
}

@end