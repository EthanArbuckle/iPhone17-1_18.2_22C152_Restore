@interface PUIDiscreteGradientVariatedCustomStyle
+ (BOOL)supportsSecureCoding;
+ (double)hueForLegacyVariation:(double)a3;
+ (double)legacyLuminanceForLuminanceValue:(double)a3;
+ (double)luminanceForLegacyLuminance:(double)a3;
+ (double)maxLuminanceForStyle:(id)a3;
+ (double)minLuminanceForStyle:(id)a3;
+ (double)variationForHue:(double)a3;
+ (id)discreteGradientVariatedColors;
+ (id)variatedColorForVariation:(double)a3 fromColors:(id)a4 usingSaturation:(id)a5;
+ (unint64_t)currentVersion;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isEqualToStyle:(id)a3;
- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (NSArray)colors;
- (NSArray)variationAppliedColors;
- (NSString)identifier;
- (NSString)localizedName;
- (PUIDiscreteGradientVariatedCustomStyle)init;
- (PUIDiscreteGradientVariatedCustomStyle)initWithCoder:(id)a3;
- (PUIDiscreteGradientVariatedCustomStyle)initWithHue:(double)a3 saturation:(double)a4 luminanceValue:(double)a5;
- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3;
- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3 luminance:(double)a4;
- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3 luminance:(double)a4 saturation:(double)a5;
- (UIColor)luminanceAppliedColor;
- (UIColor)vibrancyEffectColor;
- (double)hue;
- (double)luminance;
- (double)luminanceValue;
- (double)maxVariation;
- (double)minVariation;
- (double)saturation;
- (double)variation;
- (id)copyWithLuminance:(double)a3;
- (id)copyWithLuminance:(double)a3 saturation:(double)a4;
- (id)copyWithResetSaturation;
- (id)copyWithVariatedColor:(id)a3;
- (id)copyWithVariation:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)lutIdentifier;
- (id)nonVariatedIdentifier;
- (id)variatedColorResettingSaturation:(BOOL)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIDiscreteGradientVariatedCustomStyle

+ (unint64_t)currentVersion
{
  return 1;
}

+ (id)discreteGradientVariatedColors
{
  v11[7] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C550] colorWithRed:0.917647059 green:0.258823529 blue:0.231372549 alpha:1.0];
  v3 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.960784314, 0.882352941, 0.333333333, 1.0, v2);
  v11[1] = v3;
  v4 = [MEMORY[0x263F1C550] colorWithRed:0.458823529 green:0.984313725 blue:0.568627451 alpha:1.0];
  v11[2] = v4;
  v5 = [MEMORY[0x263F1C550] colorWithRed:0.435294118 green:0.937254902 blue:0.968627451 alpha:1.0];
  v11[3] = v5;
  v6 = [MEMORY[0x263F1C550] colorWithRed:0.0392156863 green:0.549019608 blue:0.960784314 alpha:1.0];
  v11[4] = v6;
  v7 = [MEMORY[0x263F1C550] colorWithRed:0.756862745 green:0.392156863 blue:0.945098039 alpha:1.0];
  v11[5] = v7;
  v8 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.298039216 blue:0.262745098 alpha:1.0];
  v11[6] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:7];

  return v9;
}

+ (double)minLuminanceForStyle:(id)a3
{
  id v3 = a3;
  v4 = [v3 variationAppliedColors];
  v5 = [v4 firstObject];

  objc_msgSend(v5, "pui_minLuminance");
  double v7 = v6;
  [v3 luminance];
  double v9 = v8;

  if (v9 < v7)
  {
    objc_msgSend(&unk_27081B570, "bs_CGFloatValue");
    if (BSFloatGreaterThanOrEqualToFloat()) {
      double v7 = v9;
    }
  }

  return v7;
}

+ (double)maxLuminanceForStyle:(id)a3
{
  id v3 = [a3 variationAppliedColors];
  v4 = [v3 firstObject];

  objc_msgSend(v4, "pui_maxLuminance");
  double v6 = v5;

  return v6;
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self initWithVariation:a3 luminance:0.5];
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3 luminance:(double)a4
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self initWithVariation:a3 luminance:a4 saturation:1.0];
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithVariation:(double)a3 luminance:(double)a4 saturation:(double)a5
{
  [(id)objc_opt_class() hueForLegacyVariation:a3];
  double v9 = v8;
  [(id)objc_opt_class() luminanceForLegacyLuminance:a4];
  return [(PUIDiscreteGradientVariatedCustomStyle *)self initWithHue:v9 saturation:a5 luminanceValue:v10];
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithHue:(double)a3 saturation:(double)a4 luminanceValue:(double)a5
{
  double v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  v17.receiver = self;
  v17.super_class = (Class)PUIDiscreteGradientVariatedCustomStyle;
  v11 = [(PUIStyleCustom *)&v17 initWithIdentifier:v10 localizedName:@"Gradient Variated Custom Style Localized Name"];

  if (v11)
  {
    uint64_t v12 = [(id)objc_opt_class() discreteGradientVariatedColors];
    colors = v11->_colors;
    v11->_colors = (NSArray *)v12;

    v11->_hue = a3;
    v11->_luminanceValue = a5;
    v11->_saturation = a4;
    [(id)objc_opt_class() variationForHue:a3];
    v11->_variation = v14;
    [(id)objc_opt_class() legacyLuminanceForLuminanceValue:v11->_luminanceValue];
    v11->_luminance = v15;
    v11->_version = [(id)objc_opt_class() currentVersion];
  }
  return v11;
}

- (PUIDiscreteGradientVariatedCustomStyle)init
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self initWithVariation:0.0];
}

- (BOOL)isEqual:(id)a3
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self isEqual:a3 ignoringVariation:0];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self isEqualToStyle:a3 ignoringVariation:0];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (PUIDiscreteGradientVariatedCustomStyle *)a3;
  if (v6 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIDiscreteGradientVariatedCustomStyle *)self isEqualToStyle:v6 ignoringVariation:v4];
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (PUIDiscreteGradientVariatedCustomStyle *)a3;
  BOOL v7 = v6;
  if (v6 == self)
  {
    char v11 = 1;
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    if (!_PUIStyleCompareUsingIdentifiers(self, v6, v4)) {
      goto LABEL_8;
    }
    double v8 = [(PUIDiscreteGradientVariatedCustomStyle *)self colors];
    double v9 = [(PUIDiscreteGradientVariatedCustomStyle *)v7 colors];
    int v10 = [v8 isEqualToArray:v9];

    if (!v10) {
      goto LABEL_8;
    }
    [(PUIDiscreteGradientVariatedCustomStyle *)self hue];
    [(PUIDiscreteGradientVariatedCustomStyle *)v7 hue];
    if (BSFloatEqualToFloat()
      && ([(PUIDiscreteGradientVariatedCustomStyle *)self luminanceValue],
          [(PUIDiscreteGradientVariatedCustomStyle *)v7 luminanceValue],
          BSFloatEqualToFloat()))
    {
      [(PUIDiscreteGradientVariatedCustomStyle *)self saturation];
      [(PUIDiscreteGradientVariatedCustomStyle *)v7 saturation];
      char v11 = BSFloatEqualToFloat();
    }
    else
    {
LABEL_8:
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)[v3 appendObject:self->_colors];
  id v5 = (id)[v3 appendCGFloat:self->_hue];
  id v6 = (id)[v3 appendCGFloat:self->_luminanceValue];
  id v7 = (id)[v3 appendUnsignedInteger:self->_version];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)nonVariatedIdentifier
{
  id v3 = NSStringFromPUIStyleType([(PUIDiscreteGradientVariatedCustomStyle *)self type]);
  id v4 = [(PUIDiscreteGradientVariatedCustomStyle *)self colors];
  id v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_313);
  id v6 = [v5 componentsJoinedByString:@"_"];
  id v7 = [NSNumber numberWithDouble:self->_hue];
  unint64_t v8 = [NSNumber numberWithDouble:self->_luminanceValue];
  double v9 = [NSNumber numberWithDouble:self->_saturation];
  int v10 = [v3 stringByAppendingFormat:@"-%@-hue-%@-lum%@-sat%@", v6, v7, v8, v9];

  return v10;
}

uint64_t __63__PUIDiscreteGradientVariatedCustomStyle_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)localizedName
{
  return 0;
}

- (unint64_t)type
{
  return 999;
}

- (NSArray)colors
{
  return self->_colors;
}

- (UIColor)luminanceAppliedColor
{
  v2 = [[PUIColorValues alloc] initWithHue:self->_hue saturation:self->_saturation luminance:self->_luminanceValue alpha:1.0];
  uint64_t v3 = [(PUIColorValues *)v2 color];

  return (UIColor *)v3;
}

- (NSArray)variationAppliedColors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(PUIDiscreteGradientVariatedCustomStyle *)self variatedColorResettingSaturation:0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (id)variatedColorResettingSaturation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_class();
  id v6 = v5;
  double variation = self->_variation;
  colors = self->_colors;
  if (v3)
  {
    double v9 = [v5 variatedColorForVariation:self->_colors fromColors:0 usingSaturation:self->_variation];
  }
  else
  {
    int v10 = [NSNumber numberWithDouble:self->_saturation];
    double v9 = [v6 variatedColorForVariation:colors fromColors:v10 usingSaturation:variation];
  }
  return v9;
}

+ (id)variatedColorForVariation:(double)a3 fromColors:(id)a4 usingSaturation:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 count];
  double v10 = (a3 + 1.0) * 0.5 + 0.0;
  uint64_t v11 = vcvtmd_s64_f64(v10 / (float)(1.0 / (float)(unint64_t)(v9 - 1)));
  if (v9 - 1 <= (unint64_t)v11)
  {
    v16 = objc_msgSend(v7, "objectAtIndexedSubscript:");
  }
  else
  {
    double v28 = 0.0;
    double v29 = 0.0;
    double v12 = (v10 - (double)v11 / (double)(unint64_t)(v9 - 1))
        / (((double)v11 + 1.0) / (double)(unint64_t)(v9 - 1) - (double)v11 / (double)(unint64_t)(v9 - 1))
        + 0.0;
    double v27 = 0.0;
    v13 = [v7 objectAtIndexedSubscript:v11];
    [v13 getRed:&v29 green:&v28 blue:&v27 alpha:0];
    double v25 = 0.0;
    double v26 = 0.0;
    double v24 = 0.0;
    double v14 = [v7 objectAtIndexedSubscript:v11 + 1];
    [v14 getRed:&v26 green:&v25 blue:&v24 alpha:0];
    id v15 = (id)[objc_alloc(MEMORY[0x263F1C550]) initWithRed:v12 * v26 + (1.0 - v12) * v29 green:v12 * v25 + (1.0 - v12) * v28 blue:v12 * v24 + (1.0 - v12) * v27 alpha:1.0];
    v16 = v15;
    if (v8)
    {
      objc_super v17 = [[PUIColorValues alloc] initWithColor:v15];
      v18 = [(PUIColorValues *)v17 hslValues];
      [v18 luminance];
      double v20 = v19;
      objc_msgSend(v8, "bs_CGFloatValue");
      id v22 = [(PUIColorValues *)v17 copyWithLuminance:v20 saturation:v21];

      v16 = [v22 color];
    }
  }

  return v16;
}

- (BOOL)allowsVariation
{
  return 1;
}

- (double)maxVariation
{
  return 1.0;
}

- (double)minVariation
{
  return -1.0;
}

- (double)variation
{
  return self->_variation;
}

- (id)copyWithVariation:(double)a3
{
  [(id)objc_opt_class() hueForLegacyVariation:a3];
  double v5 = v4;
  id v6 = [PUIDiscreteGradientVariatedCustomStyle alloc];
  double saturation = self->_saturation;
  double luminanceValue = self->_luminanceValue;
  return [(PUIDiscreteGradientVariatedCustomStyle *)v6 initWithHue:v5 saturation:saturation luminanceValue:luminanceValue];
}

- (id)copyWithLuminance:(double)a3
{
  return [(PUIDiscreteGradientVariatedCustomStyle *)self copyWithLuminance:a3 saturation:self->_saturation];
}

- (id)copyWithLuminance:(double)a3 saturation:(double)a4
{
  id v7 = [PUIDiscreteGradientVariatedCustomStyle alloc];
  double hue = self->_hue;
  return [(PUIDiscreteGradientVariatedCustomStyle *)v7 initWithHue:hue saturation:a4 luminanceValue:a3];
}

- (id)copyWithResetSaturation
{
  BOOL v3 = [(PUIDiscreteGradientVariatedCustomStyle *)self variatedColorResettingSaturation:1];
  double v4 = objc_msgSend(v3, "pui_hslValues");
  [v4 saturation];
  double v6 = v5;

  id v7 = [[PUIDiscreteGradientVariatedCustomStyle alloc] initWithHue:self->_hue saturation:v6 luminanceValue:self->_luminanceValue];
  return v7;
}

- (id)copyWithVariatedColor:(id)a3
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  double v4 = (void *)MEMORY[0x263F1C550];
  id v5 = a3;
  double v6 = [(PUIDiscreteGradientVariatedCustomStyle *)self colors];
  objc_msgSend(v4, "pui_determineVarianceAndLuminanceForColor:amongstColors:minLuminance:maxLuminance:outHue:outSaturation:outLuminance:", v5, v6, 0, 0, &v11, &v9, &v10);

  id v7 = [PUIDiscreteGradientVariatedCustomStyle alloc];
  return [(PUIDiscreteGradientVariatedCustomStyle *)v7 initWithHue:v11 saturation:v9 luminanceValue:v10];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[PUIDiscreteGradientVariatedCustomStyle allocWithZone:a3];
  double hue = self->_hue;
  double saturation = self->_saturation;
  double luminanceValue = self->_luminanceValue;
  return [(PUIDiscreteGradientVariatedCustomStyle *)v4 initWithHue:hue saturation:saturation luminanceValue:luminanceValue];
}

- (BOOL)isSupportedSystemStyle
{
  return 0;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 0;
}

- (BOOL)desiresVibrancyEffectView
{
  return 0;
}

- (int64_t)vibrancyEffectType
{
  return 0;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (id)lutIdentifier
{
  return 0;
}

+ (double)luminanceForLegacyLuminance:(double)a3
{
  return (a3 + -2.0) * -0.25 + 0.0;
}

+ (double)hueForLegacyVariation:(double)a3
{
  id v5 = [a1 discreteGradientVariatedColors];
  double v6 = [a1 variatedColorForVariation:v5 fromColors:0 usingSaturation:a3];

  id v7 = objc_msgSend(v6, "pui_hslValues");
  [v7 hue];
  double v9 = v8;

  return v9;
}

+ (double)variationForHue:(double)a3
{
  double v4 = (void *)MEMORY[0x263F1C550];
  id v5 = [a1 discreteGradientVariatedColors];
  objc_msgSend(v4, "pui_determineVarianceForHue:forColors:", v5, a3);
  double v7 = v6;

  return v7;
}

+ (double)legacyLuminanceForLuminanceValue:(double)a3
{
  return a3 * -4.0 + 2.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIDiscreteGradientVariatedCustomStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_version"];
  double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hue"];
  double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_luminanceValue"];
  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_saturation"];
  objc_msgSend(v7, "bs_CGFloatValue");
  double v10 = v9;
  objc_msgSend(v8, "bs_CGFloatValue");
  double v12 = v11;
  objc_msgSend(v6, "bs_CGFloatValue");
  if (v5)
  {
    double v14 = v13;
  }
  else
  {
    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_variation"];
    objc_msgSend(v15, "bs_CGFloatValue");
    double v17 = v16;
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_luminance"];
    objc_msgSend(v18, "bs_CGFloatValue");
    double v20 = v19;
    [(id)objc_opt_class() hueForLegacyVariation:v17];
    double v14 = v21;
    [(id)objc_opt_class() luminanceForLegacyLuminance:v20];
    double v10 = v22;
  }
  v23 = [(PUIDiscreteGradientVariatedCustomStyle *)self initWithHue:v14 saturation:v12 luminanceValue:v10];

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t version = self->_version;
  id v6 = a3;
  double v7 = [v4 numberWithUnsignedInteger:version];
  [v6 encodeObject:v7 forKey:@"_version"];

  double v8 = [NSNumber numberWithDouble:self->_hue];
  [v6 encodeObject:v8 forKey:@"_hue"];

  double v9 = [NSNumber numberWithDouble:self->_luminanceValue];
  [v6 encodeObject:v9 forKey:@"_luminanceValue"];

  double v10 = [NSNumber numberWithDouble:self->_luminance];
  [v6 encodeObject:v10 forKey:@"_luminance"];

  id v11 = [NSNumber numberWithDouble:self->_saturation];
  [v6 encodeObject:v11 forKey:@"_saturation"];
}

- (double)hue
{
  return self->_hue;
}

- (double)luminanceValue
{
  return self->_luminanceValue;
}

- (double)luminance
{
  return self->_luminance;
}

- (double)saturation
{
  return self->_saturation;
}

- (void).cxx_destruct
{
}

@end