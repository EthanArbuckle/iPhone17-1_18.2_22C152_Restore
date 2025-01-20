@interface WFColor
+ (BOOL)supportsSecureCoding;
+ (WFColor)blackColor;
+ (WFColor)clearColor;
+ (WFColor)colorWithCGColor:(CGColor *)a3;
+ (WFColor)colorWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (WFColor)colorWithFocusColorName:(id)a3;
+ (WFColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
+ (WFColor)colorWithP3RGBAValue:(unsigned int)a3;
+ (WFColor)colorWithPaletteColor:(unint64_t)a3;
+ (WFColor)colorWithRGBAValue:(unsigned int)a3;
+ (WFColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (WFColor)colorWithSystemColor:(unint64_t)a3;
+ (WFColor)colorWithWhite:(double)a3 alpha:(double)a4;
+ (WFColor)whiteColor;
+ (id)colorNamed:(id)a3 inBundle:(id)a4;
+ (id)tintColorForBundleIdentifier:(id)a3;
+ (id)workflowGradientPalette;
+ (id)workflowPalette;
+ (id)workflowPaletteNames;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)hasPaletteGradient;
- (BOOL)isCloseToColor:(id)a3;
- (BOOL)isDark;
- (BOOL)isEqual:(id)a3;
- (CGColor)CGColor;
- (NSBundle)bundle;
- (NSColor)NSColor;
- (NSString)colorName;
- (NSString)hexValue;
- (NSString)localizedPaletteName;
- (UIColor)UIColor;
- (WFColor)colorWithAlphaComponent:(double)a3;
- (WFColor)init;
- (WFColor)initWithCGColor:(CGColor *)a3;
- (WFColor)initWithCoder:(id)a3;
- (WFColor)initWithColorName:(id)a3 inBundle:(id)a4;
- (WFColor)initWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (WFColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
- (WFColor)initWithPlatformColor:(id)a3;
- (WFColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (WFColor)initWithSerializedRepresentation:(id)a3;
- (WFColor)initWithSystemColor:(unint64_t)a3;
- (WFColor)initWithWhite:(double)a3 alpha:(double)a4;
- (WFGradient)gradient;
- (WFGradient)paletteGradient;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (id)description;
- (id)paletteGradientFallingBackToDefaultGradient:(BOOL)a3;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (unint64_t)representationType;
- (unint64_t)systemColor;
- (unsigned)RGBAValue;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getHue:(double *)a3 saturation:(double *)a4 value:(double *)a5 alpha:(double *)a6;
@end

@implementation WFColor

+ (WFColor)whiteColor
{
  return +[WFColor colorWithWhite:1.0 alpha:1.0];
}

+ (WFColor)colorWithWhite:(double)a3 alpha:(double)a4
{
  v4 = [[WFColor alloc] initWithWhite:a3 alpha:a4];
  return v4;
}

+ (WFColor)clearColor
{
  return +[WFColor colorWithWhite:0.0 alpha:0.0];
}

- (WFGradient)gradient
{
  if ([(WFColor *)self hasPaletteGradient])
  {
    v3 = [(WFColor *)self paletteGradient];
  }
  else
  {
    [(WFColor *)self red];
    double v5 = v4;
    [(WFColor *)self blue];
    double v7 = v6;
    [(WFColor *)self green];
    double v9 = v8 * 0.7152 + v5 * 0.2126 + v7 * 0.0722;
    double v10 = 0.0;
    double v11 = 0.7;
    double v12 = 0.25;
    if (v9 <= 0.25)
    {
      double v12 = 0.2;
    }
    else if (v9 > 0.5)
    {
      double v12 = dbl_1B3D88A20[v9 > 0.75];
      if (v9 <= 0.75) {
        double v10 = 0.0;
      }
      else {
        double v10 = 1.0;
      }
      double v11 = dbl_1B3D88A30[v9 > 0.75];
    }
    double v13 = v5 - (v9 - v5) * 0.2;
    double v14 = 1.0 - v13;
    if (v12 < 0.0) {
      double v14 = v5 - (v9 - v5) * 0.2;
    }
    double v15 = v13 + v12 * v14;
    double v16 = v7 - (v9 - v7) * 0.2;
    double v17 = 1.0 - v16;
    if (v12 < 0.0) {
      double v17 = v7 - (v9 - v7) * 0.2;
    }
    double v18 = v16 + v12 * v17;
    double v19 = v8 - (v9 - v8) * 0.2;
    double v20 = 1.0 - v19;
    if (v12 < 0.0) {
      double v20 = v19;
    }
    double v21 = v19 + v12 * v20;
    v22 = [WFColor alloc];
    [(WFColor *)self alpha];
    v24 = [(WFColor *)v22 initWithRed:v15 green:v21 blue:v18 alpha:v23];
    v25 = self;
    if (v10 <= v11) {
      v26 = v24;
    }
    else {
      v26 = v25;
    }
    if (v10 <= v11) {
      v27 = v25;
    }
    else {
      v27 = v24;
    }
    v28 = v24;
    v3 = [[WFGradient alloc] initWithStartColor:v26 endColor:v27];
  }
  return v3;
}

- (WFGradient)paletteGradient
{
  return (WFGradient *)[(WFColor *)self paletteGradientFallingBackToDefaultGradient:1];
}

- (BOOL)hasPaletteGradient
{
  v2 = [(WFColor *)self paletteGradientFallingBackToDefaultGradient:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_NSColor, 0);
  objc_destroyWeak((id *)&self->_platformColor);
}

- (void)dealloc
{
  CGColorRelease(self->_CGColor);
  v3.receiver = self;
  v3.super_class = (Class)WFColor;
  [(WFColor *)&v3 dealloc];
}

+ (WFColor)colorWithPaletteColor:(unint64_t)a3
{
  double v4 = [a1 workflowPalette];
  double v5 = [v4 objectAtIndex:a3];

  return (WFColor *)v5;
}

+ (id)workflowPalette
{
  if (workflowPalette_onceToken != -1) {
    dispatch_once(&workflowPalette_onceToken, &__block_literal_global_72);
  }
  v2 = (void *)workflowPalette_workflowPalette;
  return v2;
}

- (WFColor)initWithPlatformColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  return [(WFColor *)self initWithCGColor:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFColor representationType](self, "representationType"), @"representationType");
  unint64_t v5 = [(WFColor *)self representationType];
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "encodeInteger:forKey:", -[WFColor systemColor](self, "systemColor"), @"systemColor");
    }
    else if (v5 == 2)
    {
      double v6 = [(WFColor *)self colorName];
      [v4 encodeObject:v6 forKey:@"colorName"];

      double v7 = [(WFColor *)self bundle];
      double v8 = [v7 bundleURL];
      [v4 encodeObject:v8 forKey:@"bundle"];
    }
  }
  else
  {
    double v15 = 0.0;
    double v16 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    if ([(WFColor *)self getRed:&v16 green:&v15 blue:&v14 alpha:&v13])
    {
      [v4 encodeDouble:@"redComponent" forKey:v16];
      [v4 encodeDouble:@"greenComponent" forKey:v15];
      [v4 encodeDouble:@"blueComponent" forKey:v14];
      [v4 encodeDouble:@"alphaComponent" forKey:v13];
    }
    else
    {
      double v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = WFColorErrorDomain;
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"Unable to convert color to RGB color space for serialization";
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      double v12 = [v9 errorWithDomain:v10 code:1 userInfo:v11];
      [v4 failWithError:v12];
    }
  }
}

- (double)red
{
  double v4 = 0.0;
  BOOL v2 = [(WFColor *)self getRed:&v4 green:0 blue:0 alpha:0];
  double result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)green
{
  double v4 = 0.0;
  BOOL v2 = [(WFColor *)self getRed:0 green:&v4 blue:0 alpha:0];
  double result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)blue
{
  double v4 = 0.0;
  BOOL v2 = [(WFColor *)self getRed:0 green:0 blue:&v4 alpha:0];
  double result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (id)paletteGradientFallingBackToDefaultGradient:(BOOL)a3
{
  BOOL v3 = a3;
  if (paletteGradientFallingBackToDefaultGradient__onceToken != -1) {
    dispatch_once(&paletteGradientFallingBackToDefaultGradient__onceToken, &__block_literal_global_5145);
  }
  unint64_t v5 = (void *)paletteGradientFallingBackToDefaultGradient__colorToGradientIndexMapping;
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[WFColor RGBAValue](self, "RGBAValue"));
  double v7 = [v5 objectForKey:v6];

  if (v7)
  {
    double v8 = [(id)objc_opt_class() workflowGradientPalette];
    uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "unsignedIntegerValue"));
LABEL_7:
    uint64_t v10 = (void *)v9;

    goto LABEL_8;
  }
  if (v3)
  {
    double v8 = [(id)objc_opt_class() workflowGradientPalette];
    uint64_t v9 = [v8 lastObject];
    goto LABEL_7;
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (unsigned)RGBAValue
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if (![(WFColor *)self getRed:&v8 green:&v7 blue:&v6 alpha:&v5])
  {
    BOOL v3 = os_log_create("com.apple.shortcuts", "General");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = self;
      _os_log_fault_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_FAULT, "Could not get RGB components from color %{public}@", buf, 0xCu);
    }
  }
  return ((int)(v8 * 255.0) << 24) | ((int)(v7 * 255.0) << 16) | ((int)(v6 * 255.0) << 8) | (int)(v5 * 255.0);
}

+ (id)workflowGradientPalette
{
  if (workflowGradientPalette_onceToken != -1) {
    dispatch_once(&workflowGradientPalette_onceToken, &__block_literal_global_124);
  }
  BOOL v2 = (void *)workflowGradientPalette_workflowGradientPalette;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (WFColor *)a3;
  double v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    double v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v7 = v6;
      }
      else {
        double v7 = 0;
      }
    }
    else
    {
      double v7 = 0;
    }
    uint64_t v9 = v7;

    if ([(WFColor *)self systemColor] && [(WFColor *)v9 systemColor])
    {
      unint64_t v10 = [(WFColor *)self systemColor];
      LOBYTE(v8) = v10 == [(WFColor *)v9 systemColor];
    }
    else
    {
      uint64_t v11 = v9;
      uint64_t v12 = [(WFColor *)v11 CGColor];
      if (v11)
      {
        double v13 = (CGColor *)v12;
        double v14 = self;
        CGColorSpaceRef ColorSpace = CGColorGetColorSpace([(WFColor *)v14 CGColor]);
        CGColorSpaceRef v16 = CGColorGetColorSpace(v13);
        LOBYTE(v8) = 0;
        if (ColorSpace && v16)
        {
          if (CGColorSpaceEqualToColorSpace())
          {
            LOBYTE(v8) = CGColorEqualToColor([(WFColor *)v14 CGColor], v13);
          }
          else
          {
            double v8 = (CGColor *)MEMORY[0x1B3EC4FA0](ColorSpace, 0);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __19__WFColor_isEqual___block_invoke;
            aBlock[3] = &__block_descriptor_40_e5_v8__0l;
            aBlock[4] = v8;
            uint64_t v17 = (void (**)(void))_Block_copy(aBlock);
            if (v8)
            {
              double v8 = (CGColor *)CGColorTransformConvertColor();
              v20[0] = MEMORY[0x1E4F143A8];
              v20[1] = 3221225472;
              v20[2] = __19__WFColor_isEqual___block_invoke_2;
              v20[3] = &__block_descriptor_40_e5_v8__0l;
              v20[4] = v8;
              double v18 = (void (**)(void))_Block_copy(v20);
              if (v8) {
                LOBYTE(v8) = CGColorEqualToColor([(WFColor *)v14 CGColor], v8);
              }
              v18[2](v18);
            }
            v17[2](v17);
          }
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  return (char)v8;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = [(WFColor *)self CGColor];
  if (v10)
  {
    uint64_t v11 = v10;
    Components = CGColorGetComponents(v10);
    CGFloat Alpha = CGColorGetAlpha(v11);
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace(v11);
    if (Components)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      double v15 = CGColorSpaceGetName(ColorSpace);
      CGColorSpaceRef v16 = v15;
      if (v15)
      {
        if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E4F1DC98], v21, v22)) {
          goto LABEL_11;
        }
        CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1DBE8];
        if ([v16 isEqualToString:*MEMORY[0x1E4F1DBE8]]) {
          goto LABEL_11;
        }
      }
      else
      {
        CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1DBE8];
      }
      double v19 = CGColorSpaceCreateWithName(v17);
      MEMORY[0x1B3EC4FA0](v19, 0);
      CGColorSpaceRelease(v19);
      if (!CGColorTransformConvertColorComponents())
      {
        CGColorTransformRelease();
        BOOL v18 = 0;
LABEL_21:

        return v18;
      }
      *((CGFloat *)&v22 + 1) = Alpha;
      CGColorTransformRelease();
      Components = (const CGFloat *)&v21;
LABEL_11:
      if (a3) {
        *a3 = *Components;
      }
      if (a4) {
        *a4 = Components[1];
      }
      if (a5) {
        *a5 = Components[2];
      }
      if (a6) {
        *a6 = Components[3];
      }
      BOOL v18 = 1;
      goto LABEL_21;
    }
  }
  return 0;
}

- (CGColor)CGColor
{
  unint64_t representationType = self->_representationType;
  BOOL v3 = (CGColor *)(representationType - 1);
  if (representationType - 1 >= 2)
  {
    if (!representationType) {
      return self->_CGColor;
    }
    return v3;
  }
  else
  {
    id v4 = [(WFColor *)self platformColor];
    double v5 = (CGColor *)[v4 CGColor];

    return v5;
  }
}

- (UIColor)UIColor
{
  p_platformColor = &self->_platformColor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformColor);
  if (!WeakRetained)
  {
    unint64_t v5 = [(WFColor *)self representationType];
    if (v5)
    {
      if (v5 != 2)
      {
        if (v5 == 1)
        {
          switch([(WFColor *)self systemColor])
          {
            case 0uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() clearColor];
              goto LABEL_10;
            case 1uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() labelColor];
              goto LABEL_10;
            case 2uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemRedColor];
              goto LABEL_10;
            case 3uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemGreenColor];
              goto LABEL_10;
            case 4uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemBlueColor];
              goto LABEL_10;
            case 5uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemOrangeColor];
              goto LABEL_10;
            case 6uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemYellowColor];
              goto LABEL_10;
            case 7uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemPinkColor];
              goto LABEL_10;
            case 8uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemPurpleColor];
              goto LABEL_10;
            case 9uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemTealColor];
              goto LABEL_10;
            case 10uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemIndigoColor];
              goto LABEL_10;
            case 11uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemBrownColor];
              goto LABEL_10;
            case 12uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemMintColor];
              goto LABEL_10;
            case 13uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemCyanColor];
              goto LABEL_10;
            case 14uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemGrayColor];
              goto LABEL_10;
            case 15uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() secondaryLabelColor];
              goto LABEL_10;
            case 16uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() secondarySystemFillColor];
              goto LABEL_10;
            case 17uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() secondarySystemBackgroundColor];
              goto LABEL_10;
            case 18uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() tertiarySystemBackgroundColor];
              goto LABEL_10;
            case 19uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() systemGroupedBackgroundColor];
              goto LABEL_10;
            case 20uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() tertiarySystemGroupedBackgroundColor];
              goto LABEL_10;
            case 21uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() whiteColor];
              goto LABEL_10;
            case 22uLL:
              uint64_t v6 = [(objc_class *)getUIColorClass() blackColor];
              goto LABEL_10;
            default:
              break;
          }
        }
        id WeakRetained = 0;
        goto LABEL_11;
      }
      uint64_t v6 = [(objc_class *)getUIColorClass() colorNamed:self->_colorName inBundle:self->_bundle compatibleWithTraitCollection:0];
    }
    else
    {
      uint64_t v6 = objc_msgSend(objc_alloc(getUIColorClass()), "initWithCGColor:", -[WFColor CGColor](self, "CGColor"));
    }
LABEL_10:
    id WeakRetained = (id)v6;
LABEL_11:
    objc_storeWeak((id *)p_platformColor, WeakRetained);
  }
  id v7 = WeakRetained;

  return (UIColor *)v7;
}

- (unint64_t)representationType
{
  return self->_representationType;
}

- (unint64_t)systemColor
{
  return self->_systemColor;
}

+ (WFColor)colorWithCGColor:(CGColor *)a3
{
  BOOL v3 = [[WFColor alloc] initWithCGColor:a3];
  return v3;
}

- (WFColor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"representationType"];
  if (!v5)
  {
    if (![v4 containsValueForKey:@"redComponent"]
      || ![v4 containsValueForKey:@"greenComponent"]
      || ![v4 containsValueForKey:@"blueComponent"]
      || ![v4 containsValueForKey:@"alphaComponent"])
    {
      goto LABEL_15;
    }
    [v4 decodeDoubleForKey:@"redComponent"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"greenComponent"];
    double v15 = v14;
    [v4 decodeDoubleForKey:@"blueComponent"];
    double v17 = v16;
    [v4 decodeDoubleForKey:@"alphaComponent"];
    uint64_t v11 = [(WFColor *)self initWithRed:v13 green:v15 blue:v17 alpha:v18];
LABEL_9:
    self = v11;
    unint64_t v10 = self;
    goto LABEL_18;
  }
  if (v5 == 1)
  {
    uint64_t v11 = -[WFColor initWithSystemColor:](self, "initWithSystemColor:", [v4 decodeIntegerForKey:@"systemColor"]);
    goto LABEL_9;
  }
  if (v5 != 2)
  {
LABEL_15:
    unint64_t v10 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorName"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle"];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
    uint64_t v9 = (void *)v8;
    unint64_t v10 = 0;
    if (v6 && v8)
    {
      self = [(WFColor *)self initWithColorName:v6 inBundle:v8];
      unint64_t v10 = self;
    }
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
  }

LABEL_18:
  return v10;
}

- (double)alpha
{
  double v4 = 0.0;
  BOOL v2 = [(WFColor *)self getRed:0 green:0 blue:0 alpha:&v4];
  double result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

+ (id)colorNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[WFColor alloc] initWithColorName:v6 inBundle:v5];

  return v7;
}

- (WFColor)initWithColorName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFColor;
  uint64_t v8 = [(WFColor *)&v14 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_unint64_t representationType = 2;
    uint64_t v10 = [v6 copy];
    colorName = v9->_colorName;
    v9->_colorName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_bundle, a4);
    double v12 = v9;
  }

  return v9;
}

void __51__WFColor_WorkflowPalette__workflowGradientPalette__block_invoke()
{
  v17[15] = *MEMORY[0x1E4F143B8];
  double v16 = WFWorkflowGradientFromRGBA(3881920767, 3680263423, 3260237823, 3125427711);
  v17[0] = v16;
  double v15 = WFWorkflowGradientFromRGBA(4035143167, 3950730239, 3226876415, 3008246527);
  v17[1] = v15;
  objc_super v14 = WFWorkflowGradientFromRGBA(3953481727, 3869068543, 2825198335, 2707297279);
  v17[2] = v14;
  double v13 = WFWorkflowGradientFromRGBA(4038803711, 3736876031, 2827687423, 2238516735);
  v17[3] = v13;
  double v12 = WFWorkflowGradientFromRGBA(1707237887, 1488475391, 997931519, 930821375);
  v17[4] = v12;
  v0 = WFWorkflowGradientFromRGBA(717727999, 650093055, 343237119, 258890751);
  v17[5] = v0;
  v1 = WFWorkflowGradientFromRGBA(1051521279, 1992222463, 224894975, 106729983);
  v17[6] = v1;
  BOOL v2 = WFWorkflowGradientFromRGBA(998242303, 998438911, 406836735, 1520105727);
  v17[7] = v2;
  BOOL v3 = WFWorkflowGradientFromRGBA(1113307391, 1113307391, 224894975, 106729983);
  v17[8] = v3;
  double v4 = WFWorkflowGradientFromRGBA(2018359551, 1816373503, 1412728319, 1244623871);
  v17[9] = v4;
  id v5 = WFWorkflowGradientFromRGBA(2893339903, 2674380799, 2119996671, 1850574335);
  v17[10] = v5;
  id v6 = WFWorkflowGradientFromRGBA(3867791103, 3648635135, 2992140543, 2705809407);
  v17[11] = v6;
  id v7 = WFWorkflowGradientFromRGBA(2156499967, 2038598911, 1600548607, 1364878335);
  v17[12] = v7;
  uint64_t v8 = WFWorkflowGradientFromRGBA(2376241151, 2376241151, 1954379007, 1752393983);
  v17[13] = v8;
  uint64_t v9 = WFWorkflowGradientFromRGBA(2727046911, 2946071807, 2138534911, 2154983167);
  v17[14] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:15];
  uint64_t v11 = (void *)workflowGradientPalette_workflowGradientPalette;
  workflowGradientPalette_workflowGradientPalette = v10;
}

+ (WFColor)colorWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v6 = [[WFColor alloc] initWithDisplayP3Red:a3 green:a4 blue:a5 alpha:a6];
  return v6;
}

- (WFColor)initWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  v8.f64[0] = a3;
  v8.f64[1] = a4;
  __asm { FMOV            V1.2D, #1.0 }
  v14.f64[0] = a5;
  v14.f64[1] = a6;
  *(int8x16_t *)components = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v8, _Q1), (int8x16_t)_Q1, (int8x16_t)v8), (int8x16_t)vcltzq_f64(v8));
  int8x16_t v23 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v14, _Q1), (int8x16_t)_Q1, (int8x16_t)v14), (int8x16_t)vcltzq_f64(v14));
  double v15 = CGColorCreate(v7, components);
  double v16 = [(WFColor *)self initWithCGColor:v15];
  CGColorSpaceRelease(v7);
  CGColorRelease(v15);
  return v16;
}

+ (WFColor)colorWithP3RGBAValue:(unsigned int)a3
{
  return +[WFColor colorWithDisplayP3Red:(double)HIBYTE(a3) / 255.0 green:(double)BYTE2(a3) / 255.0 blue:(double)BYTE1(a3) / 255.0 alpha:(double)a3 / 255.0];
}

+ (WFColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v6 = [[WFColor alloc] initWithRed:a3 green:a4 blue:a5 alpha:a6];
  return v6;
}

+ (WFColor)colorWithRGBAValue:(unsigned int)a3
{
  return +[WFColor colorWithRed:(double)HIBYTE(a3) / 255.0 green:(double)BYTE2(a3) / 255.0 blue:(double)BYTE1(a3) / 255.0 alpha:(double)a3 / 255.0];
}

- (WFColor)initWithWhite:(double)a3 alpha:(double)a4
{
  CGFloat components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBB8]);
  float64x2_t v8 = v7;
  double v9 = 1.0;
  if (a4 <= 1.0) {
    double v9 = a4;
  }
  if (a4 < 0.0) {
    double v9 = 0.0;
  }
  components[0] = a3;
  components[1] = v9;
  uint64_t v10 = CGColorCreate(v7, components);
  uint64_t v11 = [(WFColor *)self initWithCGColor:v10];
  CGColorSpaceRelease(v8);
  CGColorRelease(v10);
  return v11;
}

- (WFColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  uint64_t v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  double v12 = v11;
  components[0] = a3;
  components[1] = a4;
  double v13 = 1.0;
  if (a6 <= 1.0) {
    double v13 = a6;
  }
  if (a6 < 0.0) {
    double v13 = 0.0;
  }
  CGFloat components[2] = a5;
  CGFloat components[3] = v13;
  float64x2_t v14 = CGColorCreate(v11, components);
  double v15 = [(WFColor *)self initWithCGColor:v14];
  CGColorSpaceRelease(v12);
  CGColorRelease(v14);
  return v15;
}

- (WFColor)initWithCGColor:(CGColor *)a3
{
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFColor.m", 134, @"Invalid parameter not satisfying: %@", @"CGColor" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WFColor;
  id v5 = [(WFColor *)&v11 init];
  id v6 = v5;
  if (v5)
  {
    v5->_unint64_t representationType = 0;
    v5->_CGColor = CGColorRetain(a3);
    id v7 = v6;
  }

  return v6;
}

+ (WFColor)colorWithSystemColor:(unint64_t)a3
{
  BOOL v3 = [[WFColor alloc] initWithSystemColor:a3];
  return v3;
}

- (WFColor)initWithSystemColor:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFColor;
  double v4 = [(WFColor *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_unint64_t representationType = 1;
    v4->_systemColor = a3;
    id v6 = v4;
  }

  return v5;
}

+ (WFColor)blackColor
{
  return +[WFColor colorWithWhite:0.0 alpha:1.0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFColor)colorWithAlphaComponent:(double)a3
{
  CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha([(WFColor *)self CGColor], a3);
  double v4 = [[WFColor alloc] initWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);
  return v4;
}

void __72__WFColor_WorkflowPalette__paletteGradientFallingBackToDefaultGradient___block_invoke()
{
  v3[16] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0CB15B0;
  v2[1] = &unk_1F0CB15E0;
  v3[0] = &unk_1F0CB15C8;
  v3[1] = &unk_1F0CB15F8;
  v2[2] = &unk_1F0CB1610;
  v2[3] = &unk_1F0CB1640;
  v3[2] = &unk_1F0CB1628;
  v3[3] = &unk_1F0CB1658;
  v2[4] = &unk_1F0CB1670;
  v2[5] = &unk_1F0CB16A0;
  v3[4] = &unk_1F0CB1688;
  v3[5] = &unk_1F0CB16B8;
  v2[6] = &unk_1F0CB16D0;
  v2[7] = &unk_1F0CB16E8;
  v3[6] = &unk_1F0CB16B8;
  v3[7] = &unk_1F0CB1700;
  v2[8] = &unk_1F0CB1718;
  v2[9] = &unk_1F0CB1748;
  v3[8] = &unk_1F0CB1730;
  v3[9] = &unk_1F0CB1760;
  v2[10] = &unk_1F0CB1778;
  v2[11] = &unk_1F0CB17A8;
  v3[10] = &unk_1F0CB1790;
  v3[11] = &unk_1F0CB17C0;
  v2[12] = &unk_1F0CB17D8;
  v2[13] = &unk_1F0CB1808;
  v3[12] = &unk_1F0CB17F0;
  v3[13] = &unk_1F0CB1820;
  v2[14] = &unk_1F0CB1838;
  v2[15] = &unk_1F0CB1868;
  v3[14] = &unk_1F0CB1850;
  v3[15] = &unk_1F0CB1880;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:16];
  v1 = (void *)paletteGradientFallingBackToDefaultGradient__colorToGradientIndexMapping;
  paletteGradientFallingBackToDefaultGradient__colorToGradientIndexMapping = v0;
}

- (NSString)hexValue
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%06X", -[WFColor RGBAValue](self, "RGBAValue") >> 8);
}

- (NSString)localizedPaletteName
{
  BOOL v3 = +[WFColor workflowPalette];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__WFColor_WorkflowPalette__localizedPaletteName__block_invoke;
  v7[3] = &unk_1E6077988;
  v7[4] = self;
  double v4 = objc_msgSend(v3, "if_compactMap:", v7);
  id v5 = [v4 firstObject];

  return (NSString *)v5;
}

id __48__WFColor_WorkflowPalette__localizedPaletteName__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) isEqual:a2])
  {
    double v4 = +[WFColor workflowPaletteNames];
    id v5 = [v4 objectAtIndex:a3];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)workflowPaletteNames
{
  v19[15] = *MEMORY[0x1E4F143B8];
  double v18 = WFLocalizedString(@"Red");
  v19[0] = v18;
  double v17 = WFLocalizedString(@"Orange");
  v19[1] = v17;
  double v16 = WFLocalizedString(@"Tangerine");
  v19[2] = v16;
  double v15 = WFLocalizedString(@"Yellow");
  v19[3] = v15;
  float64x2_t v14 = WFLocalizedString(@"Lime");
  v19[4] = v14;
  double v13 = WFLocalizedString(@"Teal");
  v19[5] = v13;
  BOOL v2 = WFLocalizedString(@"Cyan");
  v19[6] = v2;
  BOOL v3 = WFLocalizedString(@"Blue");
  v19[7] = v3;
  double v4 = WFLocalizedString(@"Navy");
  v19[8] = v4;
  id v5 = WFLocalizedString(@"Grape");
  v19[9] = v5;
  id v6 = WFLocalizedString(@"Purple");
  v19[10] = v6;
  id v7 = WFLocalizedString(@"Pink");
  v19[11] = v7;
  objc_super v8 = WFLocalizedString(@"Gray Blue");
  v19[12] = v8;
  double v9 = WFLocalizedString(@"Gray Green");
  v19[13] = v9;
  uint64_t v10 = WFLocalizedString(@"Gray Brown");
  v19[14] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];

  return v11;
}

void __43__WFColor_WorkflowPalette__workflowPalette__block_invoke()
{
  v17[15] = *MEMORY[0x1E4F143B8];
  double v16 = +[WFColor colorWithRGBAValue:4282601983];
  v17[0] = v16;
  double v15 = +[WFColor colorWithRGBAValue:4251333119];
  v17[1] = v15;
  float64x2_t v14 = +[WFColor colorWithRGBAValue:4271458815];
  v17[2] = v14;
  double v13 = +[WFColor colorWithRGBAValue:4274264319];
  v17[3] = v13;
  double v12 = +[WFColor colorWithRGBAValue:4292093695];
  v17[4] = v12;
  uint64_t v0 = +[WFColor colorWithRGBAValue:431817727];
  v17[5] = v0;
  v1 = +[WFColor colorWithRGBAValue:1440408063];
  v17[6] = v1;
  BOOL v2 = +[WFColor colorWithRGBAValue:463140863];
  v17[7] = v2;
  BOOL v3 = +[WFColor colorWithRGBAValue:946986751];
  v17[8] = v3;
  double v4 = +[WFColor colorWithRGBAValue:2071128575];
  v17[9] = v4;
  id v5 = +[WFColor colorWithRGBAValue:3679049983];
  v17[10] = v5;
  id v6 = +[WFColor colorWithRGBAValue:3980825855];
  v17[11] = v6;
  id v7 = +[WFColor colorWithRGBAValue:255];
  v17[12] = v7;
  objc_super v8 = +[WFColor colorWithRGBAValue:3031607807];
  v17[13] = v8;
  double v9 = +[WFColor colorWithRGBAValue:2846468607];
  v17[14] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:15];
  objc_super v11 = (void *)workflowPalette_workflowPalette;
  workflowPalette_workflowPalette = v10;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSColor)NSColor
{
  return self->_NSColor;
}

- (unint64_t)hash
{
  BOOL v2 = [(WFColor *)self CGColor];
  return CFHash(v2);
}

uint64_t __19__WFColor_isEqual___block_invoke()
{
  return CGColorTransformRelease();
}

void __19__WFColor_isEqual___block_invoke_2(uint64_t a1)
{
}

- (id)serializedRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v4 = [(WFColor *)self representationType];
  id v5 = @"WFColorRepresentationTypeName";
  if (v4 == 1) {
    id v5 = @"WFColorRepresentationTypeSystem";
  }
  if (v4) {
    id v6 = v5;
  }
  else {
    id v6 = @"WFColorRepresentationTypeCGColor";
  }
  [v3 setObject:v6 forKeyedSubscript:@"WFColorRepresentationType"];
  unint64_t v7 = [(WFColor *)self representationType];
  if (!v7)
  {
    double v26 = 0.0;
    double v27 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
    [(WFColor *)self getRed:&v27 green:&v26 blue:&v25 alpha:&v24];
    HIDWORD(v12) = HIDWORD(v27);
    *(float *)&double v12 = v27;
    double v13 = [NSNumber numberWithFloat:v12];
    [v3 setObject:v13 forKeyedSubscript:@"redComponent"];

    HIDWORD(v14) = HIDWORD(v26);
    *(float *)&double v14 = v26;
    double v15 = [NSNumber numberWithFloat:v14];
    [v3 setObject:v15 forKeyedSubscript:@"greenComponent"];

    HIDWORD(v16) = HIDWORD(v25);
    *(float *)&double v16 = v25;
    double v17 = [NSNumber numberWithFloat:v16];
    [v3 setObject:v17 forKeyedSubscript:@"blueComponent"];

    HIDWORD(v18) = HIDWORD(v24);
    *(float *)&double v18 = v24;
    double v9 = [NSNumber numberWithFloat:v18];
    double v19 = @"alphaComponent";
LABEL_15:
    [v3 setObject:v9 forKeyedSubscript:v19];
    goto LABEL_16;
  }
  if (v7 == 1)
  {
    unint64_t v20 = [(WFColor *)self systemColor];
    if (v20 > 0x16) {
      long long v21 = 0;
    }
    else {
      long long v21 = off_1E6078750[v20];
    }
    double v9 = v21;
    double v19 = @"WFSystemColor";
    goto LABEL_15;
  }
  if (v7 != 2) {
    goto LABEL_17;
  }
  objc_super v8 = [(WFColor *)self colorName];
  [v3 setObject:v8 forKeyedSubscript:@"WFColorName"];

  double v9 = [(WFColor *)self bundle];
  uint64_t v10 = [(__CFString *)v9 bundleURL];
  objc_super v11 = [v10 absoluteString];
  [v3 setObject:v11 forKeyedSubscript:@"WFBundleURL"];

LABEL_16:
LABEL_17:
  long long v22 = (void *)[v3 copy];

  return v22;
}

- (WFColor)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"WFColorRepresentationType"];
  if ([v5 isEqualToString:@"WFColorRepresentationTypeName"])
  {

    id v6 = [v4 objectForKeyedSubscript:@"WFColorName"];
    unint64_t v7 = [v4 objectForKeyedSubscript:@"WFBundleURL"];
    objc_super v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v8];
      uint64_t v10 = (void *)v9;
      objc_super v11 = 0;
      if (v6 && v9)
      {
        self = [(WFColor *)self initWithColorName:v6 inBundle:v9];
        objc_super v11 = self;
      }
    }
    else
    {
      uint64_t v10 = 0;
      objc_super v11 = 0;
    }
  }
  else
  {
    if ([v5 isEqualToString:@"WFColorRepresentationTypeSystem"])
    {

      double v12 = [v4 objectForKeyedSubscript:@"WFSystemColor"];
      unint64_t v13 = 0;
      double v14 = 0;
      while (1)
      {
        double v15 = v13 > 0x16 ? 0 : off_1E6078750[v13];
        double v16 = v15;

        if ([(__CFString *)v16 isEqualToString:v12]) {
          break;
        }
        ++v13;
        double v14 = v16;
        if (!v16)
        {
          unint64_t v13 = 1;
          break;
        }
      }

      double v17 = [(WFColor *)self initWithSystemColor:v13];
    }
    else
    {
      [v5 isEqualToString:@"WFColorRepresentationTypeCGColor"];

      double v18 = [v4 objectForKeyedSubscript:@"redComponent"];
      [v18 floatValue];
      double v20 = v19;

      long long v21 = [v4 objectForKeyedSubscript:@"greenComponent"];
      [v21 floatValue];
      double v23 = v22;

      double v24 = [v4 objectForKeyedSubscript:@"blueComponent"];
      [v24 floatValue];
      double v26 = v25;

      double v27 = [v4 objectForKeyedSubscript:@"alphaComponent"];
      [v27 floatValue];
      double v29 = v28;

      double v17 = [(WFColor *)self initWithRed:v20 green:v23 blue:v26 alpha:v29];
    }
    self = v17;
    objc_super v11 = self;
  }

  return v11;
}

- (BOOL)isDark
{
  double v3 = 0.0;
  [(WFColor *)self getHue:0 saturation:0 value:&v3 alpha:0];
  return v3 < 0.5;
}

- (BOOL)isCloseToColor:(id)a3
{
  double v13 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v8 = 0.0;
  id v4 = a3;
  [(WFColor *)self getHue:&v13 saturation:&v12 value:&v11 alpha:0];
  [v4 getHue:&v10 saturation:&v9 value:&v8 alpha:0];

  if (vabdd_f64(v12, v9) > 0.0399999991 || vabdd_f64(v11, v8) > 0.0399999991) {
    return 0;
  }
  double v5 = v13;
  double v6 = v10;
  if (vabdd_f64(v13, v10) <= 0.0399999991) {
    return 1;
  }
  if (v13 < 0.0399999991) {
    double v5 = v13 + 1.0;
  }
  if (v10 < 0.0399999991) {
    double v6 = v10 + 1.0;
  }
  return vabdd_f64(v5, v6) <= 0.0399999991;
}

- (void)getHue:(double *)a3 saturation:(double *)a4 value:(double *)a5 alpha:(double *)a6
{
  id v10 = [(WFColor *)self platformColor];
  [v10 getHue:a3 saturation:a4 brightness:a5 alpha:a6];
}

- (id)description
{
  double v3 = NSString;
  [(WFColor *)self red];
  uint64_t v5 = v4;
  [(WFColor *)self green];
  uint64_t v7 = v6;
  [(WFColor *)self blue];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"Red:%f Green:%f Blue:%f", v5, v7, v8);
}

- (WFColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  uint64_t v7 = objc_msgSend(objc_alloc(getUIColorClass()), "initWithHue:saturation:brightness:alpha:", fmax(fmin(a3, 1.0), 0.0), fmax(fmin(a4, 1.0), 0.0), fmax(fmin(a5, 1.0), 0.0), a6);
  uint64_t v8 = [(WFColor *)self initWithPlatformColor:v7];

  return v8;
}

- (WFColor)init
{
  return [(WFColor *)self initWithWhite:0.0 alpha:0.0];
}

+ (WFColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  uint64_t v6 = [[WFColor alloc] initWithHue:a3 saturation:a4 brightness:a5 alpha:a6];
  return v6;
}

+ (WFColor)colorWithFocusColorName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (colorWithFocusColorName__onceToken != -1) {
    dispatch_once(&colorWithFocusColorName__onceToken, &__block_literal_global_18648);
  }
  uint64_t v4 = [(id)colorWithFocusColorName__colorMapping objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", [v4 unsignedIntValue]);
  }
  else
  {
    uint64_t v7 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315394;
      id v10 = "+[WFColor(Focus) colorWithFocusColorName:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1B3C5C000, v7, OS_LOG_TYPE_FAULT, "%s Given a Focus color (%@), but we couldn't map it to a WFColor. Are there new Focus colors?", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v6 = 0;
  }

  return (WFColor *)v6;
}

void __42__WFColor_Focus__colorWithFocusColorName___block_invoke()
{
  uint64_t v0 = (void *)colorWithFocusColorName__colorMapping;
  colorWithFocusColorName__colorMapping = (uint64_t)&unk_1F0CB1F80;
}

+ (id)tintColorForBundleIdentifier:(id)a3
{
  uint64_t v3 = tintColorForBundleIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&tintColorForBundleIdentifier__onceToken, &__block_literal_global_129);
  }
  uint64_t v5 = [(id)tintColorForBundleIdentifier__bundleIdentifierMapping objectForKeyedSubscript:v4];

  return v5;
}

void __63__WFColor_IconicSymbolUtilities__tintColorForBundleIdentifier___block_invoke()
{
  v14[11] = *MEMORY[0x1E4F143B8];
  v13[0] = @"com.apple.mobiletimer";
  id v12 = +[WFColor colorWithSystemColor:5];
  v14[0] = v12;
  v13[1] = @"com.apple.iBooks";
  uint64_t v0 = +[WFColor colorWithSystemColor:5];
  v14[1] = v0;
  v13[2] = @"com.apple.mobilenotes";
  v1 = +[WFColor colorWithSystemColor:6];
  v14[2] = v1;
  v13[3] = @"com.apple.Pages";
  BOOL v2 = +[WFColor colorWithSystemColor:5];
  v14[3] = v2;
  v13[4] = @"com.apple.Numbers";
  uint64_t v3 = +[WFColor colorWithSystemColor:3];
  v14[4] = v3;
  v13[5] = @"com.apple.Keynote";
  id v4 = +[WFColor colorWithRed:0.15 green:0.74 blue:1.0 alpha:1.0];
  v14[5] = v4;
  v13[6] = @"com.apple.podcasts";
  uint64_t v5 = +[WFColor colorWithSystemColor:8];
  v14[6] = v5;
  v13[7] = @"com.apple.mobilephone";
  uint64_t v6 = +[WFColor colorWithSystemColor:3];
  v14[7] = v6;
  v13[8] = @"com.apple.facetime";
  uint64_t v7 = +[WFColor colorWithSystemColor:3];
  v14[8] = v7;
  v13[9] = @"com.apple.Music";
  uint64_t v8 = +[WFColor colorWithRed:1.0 green:0.38 blue:0.47 alpha:1.0];
  v14[9] = v8;
  v13[10] = @"com.shazam.Shazam";
  int v9 = +[WFColor colorWithSystemColor:4];
  v14[10] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:11];
  __int16 v11 = (void *)tintColorForBundleIdentifier__bundleIdentifierMapping;
  tintColorForBundleIdentifier__bundleIdentifierMapping = v10;
}

@end