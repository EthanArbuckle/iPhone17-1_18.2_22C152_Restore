@interface UIColor
+ (id)_colorForUserInterfaceStyle:(int64_t)a3 fromColor:(id)a4 forTraitCollection:(id)a5;
+ (id)bc_booksAXSeparatorColor;
+ (id)bc_booksBackground;
+ (id)bc_booksBlack;
+ (id)bc_booksBlue;
+ (id)bc_booksBrickBackground;
+ (id)bc_booksChevronColor;
+ (id)bc_booksCyan;
+ (id)bc_booksGray;
+ (id)bc_booksGreen;
+ (id)bc_booksGroupedBackground;
+ (id)bc_booksIconBackgroundColor;
+ (id)bc_booksKeyColor;
+ (id)bc_booksLabelColor;
+ (id)bc_booksMagenta;
+ (id)bc_booksNestedIconGlyphColor;
+ (id)bc_booksOpaqueSecondaryLabelColor;
+ (id)bc_booksOrange;
+ (id)bc_booksPurple;
+ (id)bc_booksQuaternaryLabelColor;
+ (id)bc_booksRed;
+ (id)bc_booksSecondaryBackground;
+ (id)bc_booksSecondaryGroupedBackground;
+ (id)bc_booksSecondaryIconBackgroundColor;
+ (id)bc_booksSecondaryLabelColor;
+ (id)bc_booksSeparatorColor;
+ (id)bc_booksTableSelectionColor;
+ (id)bc_booksTertiaryBackground;
+ (id)bc_booksTertiaryLabelColor;
+ (id)bc_booksTransportControlsColor;
+ (id)bc_booksWhite;
+ (id)bc_booksWidgetBackgroundOverlayBottom;
+ (id)bc_booksWidgetBackgroundOverlayTop;
+ (id)bc_colorWithARGBHexValue:(unint64_t)a3;
+ (id)bc_colorWithSRGBDescription:(id)a3;
+ (id)bc_darkSystemBackgroundForTraitCollection:(id)a3;
+ (id)bc_darkerTexturedBackgroundColor;
+ (id)bc_dynamicColorWithLightColor:(id)a3 darkColor:(id)a4;
+ (id)bc_nowPlayingVibrantPrimary;
+ (id)bc_nowPlayingVibrantQuaternary;
+ (id)bc_nowPlayingVibrantSecondary;
+ (id)bc_nowPlayingVibrantTertiary;
+ (id)bc_welcomeButtonColor;
- (NSString)bc_hexValue;
- (NSString)bc_rgbaHexValue;
- (NSString)bc_rgbaString;
- (UIColor)bc_invertedDynamicColor;
- (double)bc_brightness;
- (double)defaultBrightnessAdjustment;
- (id)bc_darkenedColorByFactor:(double)a3;
- (id)bc_resaturatedColorByFactor:(double)a3;
- (id)bkaxAdjustedDarkerForIncreaseContrast;
- (id)bkaxAdjustedForIncreaseContrast;
- (id)bkaxAdjustedForIncreaseContrastAdjustingDarker:(BOOL)a3;
- (id)bkaxAdjustedLighterForIncreaseContrast;
- (unint64_t)bc_ARGBHexValue;
@end

@implementation UIColor

- (id)bc_darkenedColorByFactor:(double)a3
{
  v4 = self;
  if (sub_12FA4(v4))
  {
    double v10 = 0.0;
    double v11 = 0.0;
    if (![(UIColor *)v4 getWhite:&v11 alpha:&v10]) {
      goto LABEL_7;
    }
    double v11 = (1.0 - a3) * v11;
    uint64_t v5 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    uint64_t v8 = 0;
    double v9 = 0.0;
    if (![(UIColor *)v4 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8])goto LABEL_7; {
    double v9 = (1.0 - a3) * v9;
    }
    double v10 = v10 + (1.0 - v10) * a3;
    uint64_t v5 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v11);
  }
  v6 = (UIColor *)v5;

  v4 = v6;
LABEL_7:

  return v4;
}

- (id)bc_resaturatedColorByFactor:(double)a3
{
  v4 = self;
  if ((sub_12FA4(v4) & 1) == 0)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if ([(UIColor *)v4 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v7])
    {
      double v9 = v9 * a3;
      uint64_t v5 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v10);

      v4 = (UIColor *)v5;
    }
  }

  return v4;
}

+ (id)bc_colorWithSRGBDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"a"];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 floatValue];
      double v9 = v8;
    }
    else
    {
      double v9 = 1.0;
    }
    double v11 = [v5 objectForKey:@"w"];
    v12 = v11;
    if (v11)
    {
      double v10 = objc_msgSend(a1, "colorWithWhite:alpha:", (double)(int)objc_msgSend(v11, "intValue") / 255.0, v9);
    }
    else
    {
      v13 = [v5 objectForKey:@"r"];
      v14 = v13;
      double v15 = 0.0;
      double v16 = 0.0;
      if (v13) {
        double v16 = (double)(int)[v13 intValue] / 255.0;
      }
      v17 = [v5 objectForKey:@"g"];
      v18 = v17;
      if (v17) {
        double v15 = (double)(int)[v17 intValue] / 255.0;
      }
      v19 = [v5 objectForKey:@"b"];
      v20 = v19;
      if (v19) {
        double v21 = (double)(int)[v19 intValue] / 255.0;
      }
      else {
        double v21 = 0.0;
      }
      double v10 = [a1 colorWithRed:v16 green:v15 blue:v21 alpha:v9];
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

+ (id)bc_welcomeButtonColor
{
  v2 = +[UIColor systemBlackColor];
  v3 = +[UIColor tertiarySystemBackgroundColor];
  id v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_colorWithARGBHexValue:(unint64_t)a3
{
  return +[UIColor colorWithRed:(float)((float)BYTE2(a3) / 255.0) green:(float)((float)BYTE1(a3) / 255.0) blue:(float)((float)a3 / 255.0) alpha:(float)((float)BYTE3(a3) / 255.0)];
}

- (unint64_t)bc_ARGBHexValue
{
  unint64_t result = [(UIColor *)self CGColor];
  if (result)
  {
    v3 = (CGColor *)result;
    size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)result);
    Components = CGColorGetComponents(v3);
    if (NumberOfComponents == 4)
    {
      float64x2_t v7 = *(float64x2_t *)Components;
      double v6 = Components[2];
      uint64_t v8 = 3;
    }
    else
    {
      if (NumberOfComponents != 2)
      {
        float64x2_t v7 = 0uLL;
        float v9 = 0.0;
        double v6 = 0.0;
        goto LABEL_8;
      }
      double v6 = *Components;
      float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(void *)Components, 0);
      uint64_t v8 = 1;
    }
    float v9 = Components[v8] * 255.0;
LABEL_8:
    int32x2_t v10 = (int32x2_t)vshl_u32((uint32x2_t)vcvt_s32_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v7, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL))))), (uint32x2_t)0x800000010);
    float v11 = v6 * 255.0;
    return (int)(vorr_s8((int8x8_t)vdup_lane_s32(v10, 1), (int8x8_t)v10).u32[0] | llroundf(v11) | (llroundf(v9) << 24));
  }
  return result;
}

+ (id)bc_darkerTexturedBackgroundColor
{
  return +[UIColor colorWithRed:0.219607843 green:0.231372549 blue:0.258823529 alpha:1.0];
}

- (NSString)bc_hexValue
{
  v2 = [(UIColor *)self CGColor];
  Components = (uint64_t *)CGColorGetComponents(v2);
  if (CGColorGetNumberOfComponents(v2) <= 2)
  {
    long long v4 = *(_OWORD *)Components;
    v10[0] = vdupq_lane_s64(*Components, 0);
    v10[1] = v4;
    Components = (uint64_t *)v10;
  }
  uint64_t v5 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  do
  {
    float v6 = *(double *)&Components[v5] * 255.0;
    *((_DWORD *)&v8 + v5++) = (uint64_t)rintf(v6);
  }
  while (v5 != 3);
  return +[NSString stringWithFormat:@"%02X%02X%02X", 255.0, v8, HIDWORD(v8), v9];
}

- (NSString)bc_rgbaString
{
  v2 = [(UIColor *)self CGColor];
  if (v2)
  {
    v3 = v2;
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v2);
    Components = CGColorGetComponents(v3);
    if (NumberOfComponents == 4)
    {
      double v6 = *Components;
      double v7 = Components[1];
      uint64_t v10 = 3;
      double v8 = Components[2];
    }
    else
    {
      double v6 = 0.0;
      double v7 = 0.0;
      double v8 = 0.0;
      CGFloat v9 = 0.0;
      if (NumberOfComponents != 2)
      {
LABEL_7:
        v2 = +[NSString stringWithFormat:@"rgba(%.6g%%,%.6g%%,%.6g%%,%.6g)", v6 * 100.0, v7 * 100.0, v8 * 100.0, *(void *)&v9];
        goto LABEL_8;
      }
      double v6 = *Components;
      uint64_t v10 = 1;
      double v7 = *Components;
      double v8 = *Components;
    }
    CGFloat v9 = Components[v10];
    goto LABEL_7;
  }
LABEL_8:

  return (NSString *)v2;
}

- (NSString)bc_rgbaHexValue
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  double v4 = 0.0;
  [(UIColor *)self getRed:&v7 green:&v6 blue:&v5 alpha:&v4];
  v2 = +[NSString stringWithFormat:@"%02X%02X%02X%02X", (int)(v7 * 255.0), (int)(v6 * 255.0), (int)(v5 * 255.0), (int)(v4 * 255.0)];

  return (NSString *)v2;
}

- (double)bc_brightness
{
  char data = 0;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  double v4 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  if (v4)
  {
    CGContextSetFillColorWithColor(v4, [(UIColor *)self CGColor]);
    v8.origin.x = 0.0;
    v8.origin.y = 0.0;
    v8.size.width = 1.0;
    v8.size.height = 1.0;
    CGContextFillRect(v4, v8);
    CGContextRelease(v4);
  }
  else
  {
    NSLog(@"NULL context while testing color brightness");
  }
  LOBYTE(v5) = data;
  return (double)v5 / 255.0;
}

+ (id)bc_dynamicColorWithLightColor:(id)a3 darkColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
  v13[0] = v7;
  v14[0] = v6;
  CGRect v8 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  v13[1] = v8;
  v14[1] = v6;
  CGFloat v9 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v13[2] = v9;
  v14[2] = v5;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  float v11 = +[UIColor _dynamicColorWithColorsByTraitCollection:v10];

  return v11;
}

+ (id)bc_booksBackground
{
  return +[UIColor systemBackgroundColor];
}

+ (id)bc_booksSecondaryBackground
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)bc_booksTertiaryBackground
{
  return +[UIColor tertiarySystemBackgroundColor];
}

+ (id)bc_booksGroupedBackground
{
  return +[UIColor systemGroupedBackgroundColor];
}

+ (id)bc_booksSecondaryGroupedBackground
{
  return +[UIColor secondarySystemGroupedBackgroundColor];
}

+ (id)bc_booksWidgetBackgroundOverlayTop
{
  v2 = +[UIColor colorWithWhite:0.0 alpha:0.0];
  v3 = +[UIColor colorWithWhite:1.0 alpha:0.12];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksWidgetBackgroundOverlayBottom
{
  v2 = +[UIColor colorWithWhite:0.0 alpha:0.06];
  v3 = +[UIColor colorWithWhite:1.0 alpha:0.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksBrickBackground
{
  return +[UIColor tertiarySystemBackgroundColor];
}

+ (id)bc_booksKeyColor
{
  v2 = +[UIColor colorWithWhite:0.0 alpha:1.0];
  v3 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksLabelColor
{
  return +[UIColor labelColor];
}

+ (id)bc_booksSecondaryLabelColor
{
  return +[UIColor secondaryLabelColor];
}

+ (id)bc_booksOpaqueSecondaryLabelColor
{
  v2 = +[UIColor colorWithRed:0.525490196 green:0.525490196 blue:0.549019608 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.596078431 green:0.596078431 blue:0.623529412 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksTertiaryLabelColor
{
  return +[UIColor tertiaryLabelColor];
}

+ (id)bc_booksQuaternaryLabelColor
{
  return +[UIColor quaternaryLabelColor];
}

+ (id)bc_booksRed
{
  v2 = +[UIColor colorWithRed:0.784313725 green:0.235294118 blue:0.235294118 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.580392157 green:0.203921569 blue:0.203921569 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksOrange
{
  v2 = +[UIColor colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.701960784 green:0.364705882 blue:0.0705882353 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksGreen
{
  v2 = +[UIColor colorWithRed:0.211764706 green:0.580392157 blue:0.384313725 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.156862745 green:0.388235294 blue:0.274509804 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksCyan
{
  v2 = +[UIColor colorWithRed:0.0 green:0.615686275 blue:0.862745098 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.180392157 green:0.48627451 blue:0.721568627 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksBlue
{
  v2 = +[UIColor colorWithRed:0.0274509804 green:0.278431373 blue:0.556862745 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.11372549 green:0.274509804 blue:0.458823529 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksPurple
{
  v2 = +[UIColor colorWithRed:0.329411765 green:0.329411765 blue:0.580392157 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.247058824 green:0.247058824 blue:0.431372549 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksMagenta
{
  v2 = +[UIColor colorWithRed:0.937254902 green:0.152941176 blue:0.298039216 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.788235294 green:0.235294118 blue:0.301960784 alpha:1.0];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksGray
{
  return +[UIColor systemGrayColor];
}

+ (id)bc_booksBlack
{
  return +[UIColor systemBlackColor];
}

+ (id)bc_booksWhite
{
  return +[UIColor systemWhiteColor];
}

+ (id)bc_booksNestedIconGlyphColor
{
  return +[UIColor systemWhiteColor];
}

+ (id)bc_booksChevronColor
{
  return +[UIColor tertiaryLabelColor];
}

+ (id)bc_booksIconBackgroundColor
{
  v2 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.6];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksSecondaryIconBackgroundColor
{
  v2 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v3 = +[UIColor colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.22];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksSeparatorColor
{
  return +[UIColor separatorColor];
}

+ (id)bc_booksAXSeparatorColor
{
  v2 = +[UIColor colorWithRed:0.235294118 green:0.235294118 blue:0.262745098 alpha:0.45];
  v3 = +[UIColor colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.35];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksTableSelectionColor
{
  v2 = +[UIColor colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.15];
  v3 = +[UIColor colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.12];
  double v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

+ (id)bc_booksTransportControlsColor
{
  id v2 = [objc_alloc((Class)UIColor) initWithDynamicProvider:&stru_2CA250];

  return v2;
}

+ (id)bc_nowPlayingVibrantPrimary
{
  id v2 = +[UIColor whiteColor];
  v3 = [v2 colorWithAlphaComponent:0.94];

  return v3;
}

+ (id)bc_nowPlayingVibrantSecondary
{
  id v2 = +[UIColor whiteColor];
  v3 = [v2 colorWithAlphaComponent:0.45];

  return v3;
}

+ (id)bc_nowPlayingVibrantTertiary
{
  id v2 = +[UIColor whiteColor];
  v3 = [v2 colorWithAlphaComponent:0.18];

  return v3;
}

+ (id)bc_nowPlayingVibrantQuaternary
{
  id v2 = +[UIColor whiteColor];
  v3 = [v2 colorWithAlphaComponent:0.08];

  return v3;
}

+ (id)_colorForUserInterfaceStyle:(int64_t)a3 fromColor:(id)a4 forTraitCollection:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    CGRect v8 = v7;
    id v9 = a4;
  }
  else
  {
    id v10 = a4;
    CGRect v8 = objc_opt_new();
  }
  float v11 = +[UITraitCollection _currentTraitCollection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_155040;
  v17[3] = &unk_2C5C28;
  v17[4] = a3;
  v12 = [v8 traitCollectionByModifyingTraits:v17];
  +[UITraitCollection _setCurrentTraitCollection:v12];
  id v13 = a4;
  id v14 = [v13 CGColor];

  double v15 = +[UIColor colorWithCGColor:v14];
  +[UITraitCollection _setCurrentTraitCollection:v11];

  return v15;
}

+ (id)bc_darkSystemBackgroundForTraitCollection:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_class();
  id v5 = +[UIColor systemBackgroundColor];
  id v6 = [v4 _colorForUserInterfaceStyle:2 fromColor:v5 forTraitCollection:v3];

  return v6;
}

- (UIColor)bc_invertedDynamicColor
{
  id v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  double v4 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  id v5 = [(UIColor *)self resolvedColorWithTraitCollection:v3];
  id v6 = [(UIColor *)self resolvedColorWithTraitCollection:v4];
  if ([v5 isEqual:v6]) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/UIColor+BCAdditions.m", 479, (uint64_t)"-[UIColor(IMAdditions) bc_invertedDynamicColor]", (uint64_t)"![lightColor isEqual:darkColor]", @"Expected a dynamic color for invert to work!", v7, v8, v9, v14);
  }
  if ([v5 isEqual:v6])
  {
    id v10 = 0;
  }
  else
  {
    float v11 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
    v15[0] = v11;
    v15[1] = v3;
    v16[0] = v6;
    v16[1] = v6;
    v15[2] = v4;
    v16[2] = v5;
    v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    id v10 = +[UIColor _dynamicColorWithColorsByTraitCollection:v12];
  }

  return (UIColor *)v10;
}

- (id)bkaxAdjustedForIncreaseContrast
{
  id v3 = self;
  double v4 = self;
  id v5 = [v3 currentTraitCollection];
  id v6 = (char *)[v5 userInterfaceStyle];

  uint64_t v7 = &selRef_bkaxAdjustedLighterForIncreaseContrast;
  if (v6 != (unsigned char *)&def_7D91C + 2) {
    uint64_t v7 = &selRef_bkaxAdjustedDarkerForIncreaseContrast;
  }
  id v8 = [v4 *v7];

  return v8;
}

- (id)bkaxAdjustedLighterForIncreaseContrast
{
  id v2 = [(UIColor *)self bkaxAdjustedForIncreaseContrastAdjustingDarker:0];

  return v2;
}

- (id)bkaxAdjustedDarkerForIncreaseContrast
{
  id v2 = [(UIColor *)self bkaxAdjustedForIncreaseContrastAdjustingDarker:1];

  return v2;
}

- (id)bkaxAdjustedForIncreaseContrastAdjustingDarker:(BOOL)a3
{
  double v4 = self;
  v5.super.isa = UIColor.bkaxAdjustedForIncreaseContrast(darker:)(a3).super.isa;

  return v5.super.isa;
}

- (double)defaultBrightnessAdjustment
{
  return 0.2;
}

@end