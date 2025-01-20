@interface UIColor(PosterUIFoundation)
+ (double)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:minLuminance:maxLuminance:outVariance:outLuminance:outSaturation:;
+ (double)pui_determineVarianceForHue:()PosterUIFoundation forColors:;
+ (id)pui_wallpaperColorForName:()PosterUIFoundation;
+ (uint64_t)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:outVariance:outLuminance:outSaturation:;
+ (void)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:;
- (double)pui_maxLuminance;
- (id)pui_hsbValues;
- (id)pui_hslValues;
- (id)pui_invertColor;
- (void)pui_minLuminance;
@end

@implementation UIColor(PosterUIFoundation)

+ (id)pui_wallpaperColorForName:()PosterUIFoundation
{
  v3 = [a3 stringByAppendingString:@"Color"];
  SEL v4 = NSSelectorFromString(v3);
  if (objc_opt_respondsToSelector())
  {
    v5 = [MEMORY[0x263F1C550] performSelector:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:outVariance:outLuminance:outSaturation:
{
  return objc_msgSend(a1, "pui_determineVarianceAndLuminanceForColor:amongstColors:minLuminance:maxLuminance:outVariance:outLuminance:outSaturation:", a3, a4, 0, 0, a5, a6, a7);
}

+ (double)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:minLuminance:maxLuminance:outVariance:outLuminance:outSaturation:
{
  double v11 = 0.0;
  objc_msgSend(a1, "pui_determineVarianceAndLuminanceForColor:amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:", a3, a4, a5, a6, &v11, a9, a8);
  if (a7)
  {
    double result = v11 * 4.0 / 0.1 + -2.0;
    *a7 = result;
  }
  return result;
}

+ (void)pui_determineVarianceAndLuminanceForColor:()PosterUIFoundation amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:
{
  if (a6) {
    v12 = a6;
  }
  else {
    v12 = &unk_27081B560;
  }
  id v13 = a5;
  id v14 = a3;
  objc_msgSend(v12, "bs_CGFloatValue");
  double v16 = v15;
  if (v13) {
    v17 = v13;
  }
  else {
    v17 = &unk_27081B570;
  }
  objc_msgSend(v17, "bs_CGFloatValue");
  double v19 = v18;

  v26 = [[PUIColorValues alloc] initWithColor:v14];
  v20 = [(PUIColorValues *)v26 hslValues];
  [v20 saturation];
  uint64_t v22 = v21;
  [v20 hue];
  uint64_t v24 = v23;
  [v20 luminance];
  if (a7) {
    *a7 = v24;
  }
  if (a8) {
    *a8 = v22;
  }
  if (a9) {
    *a9 = fmax(v19, fmin(v25, v16));
  }
}

+ (double)pui_determineVarianceForHue:()PosterUIFoundation forColors:
{
  id v5 = a4;
  unint64_t v6 = [v5 count];
  double v7 = -1.0;
  if (v6 >= 2)
  {
    char v8 = 0;
    unint64_t v9 = 0;
    unint64_t v30 = v6 - 1;
    while (1)
    {
      unint64_t v10 = v9 + 1;
      double v11 = [v5 objectAtIndexedSubscript:v9];
      v12 = [v5 objectAtIndexedSubscript:v9 + 1];
      id v13 = [[PUIColorValues alloc] initWithColor:v11];
      id v14 = [[PUIColorValues alloc] initWithColor:v12];
      double v15 = [(PUIColorValues *)v13 hslValues];
      [v15 hue];
      double v17 = v16;

      double v18 = [(PUIColorValues *)v14 hslValues];
      [v18 hue];
      double v20 = v19;

      BOOL v21 = v20 <= a1;
      if (v17 <= a1)
      {
        char v22 = 1;
      }
      else
      {
        BOOL v21 = 0;
        char v22 = 0;
      }
      if (v20 < a1) {
        char v22 = 0;
      }
      if (v17 < v20) {
        char v23 = v22;
      }
      else {
        char v23 = v21;
      }
      if (v17 >= v20) {
        char v8 = 1;
      }

      if (v23) {
        break;
      }
      ++v9;
      if (v30 == v10) {
        goto LABEL_22;
      }
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v24 = (a1 - v17) / (v20 - v17);
      double v25 = a1 + 1.0;
      if (v17 <= a1) {
        double v25 = a1;
      }
      double v26 = (v25 - v17) / (v20 + 1.0 - v17);
      if (v8) {
        double v24 = v26;
      }
      double v27 = (double)v9 / (double)v30;
      double v28 = (double)(v9 + 1) / (double)v30 - v27;
      double v7 = v27 + v28 * (v24 + 0.0) + v27 + v28 * (v24 + 0.0) + -1.0;
    }
  }
LABEL_22:

  return v7;
}

- (id)pui_hslValues
{
  v1 = [[PUIColorValues alloc] initWithColor:a1];
  v2 = [(PUIColorValues *)v1 hslValues];

  return v2;
}

- (id)pui_hsbValues
{
  v1 = [[PUIColorValues alloc] initWithColor:a1];
  v2 = [(PUIColorValues *)v1 hsbValues];

  return v2;
}

- (void)pui_minLuminance
{
  v1 = objc_msgSend(a1, "pui_hslValues");
  [v1 luminance];
}

- (double)pui_maxLuminance
{
  return 1.0;
}

- (id)pui_invertColor
{
  v9[1] = *MEMORY[0x263EF8340];
  v1 = (CGColor *)[a1 CGColor];
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v1);
  Components = CGColorGetComponents(v1);
  SEL v4 = (const CGFloat *)((char *)v9 - ((8 * NumberOfComponents + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((uint64_t)(NumberOfComponents - 1) >= 0)
  {
    do
    {
      v4[NumberOfComponents - 1] = 1.0 - Components[NumberOfComponents - 1];
      --NumberOfComponents;
    }
    while (NumberOfComponents);
  }
  ColorSpace = CGColorGetColorSpace(v1);
  unint64_t v6 = CGColorCreate(ColorSpace, v4);
  double v7 = [MEMORY[0x263F1C550] colorWithCGColor:v6];
  CGColorRelease(v6);
  return v7;
}

@end