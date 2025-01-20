@interface PRPosterColor
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PRPosterColor)vibrantMaterialColor;
+ (PRPosterColor)vibrantMonochromeColor;
+ (id)identifierForColorWithValues:(id)a3 style:(unint64_t)a4;
+ (id)styleStringForStyle:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToColor:(id)a3;
- (BOOL)isLUTBackedColor;
- (BOOL)isSuggested;
- (BOOL)isVibrantMaterialColor;
- (BOOL)isVibrantMonochromeColor;
- (BOOL)requiresVibrancyEffectView;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (PRPosterColor)initWithBSXPCCoder:(id)a3;
- (PRPosterColor)initWithCoder:(id)a3;
- (PRPosterColor)initWithColor:(id)a3;
- (PRPosterColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4;
- (PRPosterColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5;
- (PRPosterColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5 suggested:(BOOL)a6;
- (PRPosterColor)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6 preferredStyle:(unint64_t)a7 localizedName:(id)a8 suggested:(BOOL)a9;
- (PRPosterColor)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6 preferredStyle:(unint64_t)a7 suggested:(BOOL)a8;
- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6;
- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6 localizedName:(id)a7;
- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6 localizedName:(id)a7 suggested:(BOOL)a8;
- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 preferredStyle:(unint64_t)a5;
- (PRPosterColor)initWithLUTIdentifier:(id)a3;
- (PRPosterColor)initWithPosterColor:(id)a3;
- (PRPosterColorHSLValues)hslValues;
- (PRPosterColorValues)colorValues;
- (PRPosterColorValues)hsbValues;
- (UIColor)color;
- (id)colors;
- (id)contentStyle;
- (id)contentStylePreferringVibrancy:(BOOL)a3;
- (id)copyAsSuggestedColor;
- (id)copyWithAlpha:(double)a3;
- (id)copyWithLuminance:(double)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)lutIdentifier;
- (id)vibrancyConfiguration;
- (unint64_t)hash;
- (unint64_t)preferredStyle;
- (unint64_t)type;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggested:(BOOL)a3;
@end

@implementation PRPosterColor

+ (PRPosterColor)vibrantMaterialColor
{
  if (vibrantMaterialColor_onceToken != -1) {
    dispatch_once(&vibrantMaterialColor_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)vibrantMaterialColor_vibrantMaterialColor;
  return (PRPosterColor *)v2;
}

void __37__PRPosterColor_vibrantMaterialColor__block_invoke()
{
  v0 = [PRPosterColor alloc];
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
  uint64_t v1 = [(PRPosterColor *)v0 initWithIdentifier:@"vibrantMaterialColor" color:v3 preferredStyle:2];
  v2 = (void *)vibrantMaterialColor_vibrantMaterialColor;
  vibrantMaterialColor_vibrantMaterialColor = v1;
}

+ (PRPosterColor)vibrantMonochromeColor
{
  if (vibrantMonochromeColor_onceToken != -1) {
    dispatch_once(&vibrantMonochromeColor_onceToken, &__block_literal_global_93);
  }
  v2 = (void *)vibrantMonochromeColor_vibrantMonochromeColor;
  return (PRPosterColor *)v2;
}

void __39__PRPosterColor_vibrantMonochromeColor__block_invoke()
{
  v0 = [PRPosterColor alloc];
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = [(PRPosterColor *)v0 initWithIdentifier:@"vibrantMonochromeColor" color:v3 preferredStyle:2];
  v2 = (void *)vibrantMonochromeColor_vibrantMonochromeColor;
  vibrantMonochromeColor_vibrantMonochromeColor = v1;
}

+ (id)styleStringForStyle:(unint64_t)a3
{
  id v3 = @"default";
  if (a3 == 1) {
    id v3 = @"regular";
  }
  if (a3 == 2) {
    return @"vibrant";
  }
  else {
    return v3;
  }
}

+ (id)identifierForColorWithValues:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() styleStringForStyle:a4];
  v7 = [v5 identifier];

  v8 = [NSString stringWithFormat:@"%@-%@", v6, v7];

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v5 = [(PRPosterColor *)self color];
  if (objc_opt_respondsToSelector())
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PRPosterColor;
    id v6 = [(PRPosterColor *)&v9 forwardingTargetForSelector:a3];
  }
  v7 = v6;

  return v7;
}

- (PRPosterColor)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6 preferredStyle:(unint64_t)a7 suggested:(BOOL)a8
{
  return [(PRPosterColor *)self initWithHue:a7 saturation:0 luminance:a8 alpha:a3 preferredStyle:a4 localizedName:a5 suggested:a6];
}

- (PRPosterColor)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6 preferredStyle:(unint64_t)a7 localizedName:(id)a8 suggested:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a8;
  v17 = [[PRPosterColorValues alloc] initWithHue:a3 saturation:a4 luminance:a5 alpha:a6];
  v18 = [(PRPosterColorValues *)v17 color];
  v19 = [(id)objc_opt_class() identifierForColorWithValues:v17 style:a7];
  v20 = [(PRPosterColor *)self initWithIdentifier:v19 color:v18 colorValues:v17 preferredStyle:a7 localizedName:v16 suggested:v9];

  return v20;
}

- (PRPosterColor)initWithColor:(id)a3
{
  return [(PRPosterColor *)self initWithColor:a3 preferredStyle:0];
}

- (PRPosterColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4
{
  return [(PRPosterColor *)self initWithColor:a3 preferredStyle:a4 localizedName:0];
}

- (PRPosterColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5
{
  return [(PRPosterColor *)self initWithColor:a3 preferredStyle:a4 localizedName:a5 suggested:0];
}

- (PRPosterColor)initWithColor:(id)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5 suggested:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[PRPosterColorValues alloc] initWithColor:v11];
  v13 = [(id)objc_opt_class() identifierForColorWithValues:v12 style:a4];
  v14 = [(PRPosterColor *)self initWithIdentifier:v13 color:v11 colorValues:v12 preferredStyle:a4 localizedName:v10 suggested:v6];

  return v14;
}

- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 preferredStyle:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PRPosterColorValues alloc] initWithColor:v8];
  id v11 = [(PRPosterColor *)self initWithIdentifier:v9 color:v8 colorValues:v10 preferredStyle:a5];

  return v11;
}

- (PRPosterColor)initWithPosterColor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  BOOL v6 = [v4 color];
  v7 = [v4 colorValues];
  uint64_t v8 = [v4 preferredStyle];
  id v9 = [v4 localizedName];
  uint64_t v10 = [v4 isSuggested];

  id v11 = [(PRPosterColor *)self initWithIdentifier:v5 color:v6 colorValues:v7 preferredStyle:v8 localizedName:v9 suggested:v10];
  return v11;
}

- (PRPosterColor)initWithLUTIdentifier:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@%@", @"lutColor-", a3];
  id v5 = [(PRPosterColor *)self initWithIdentifier:v4 color:0 preferredStyle:0];

  return v5;
}

- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6
{
  return [(PRPosterColor *)self initWithIdentifier:a3 color:a4 colorValues:a5 preferredStyle:a6 localizedName:0];
}

- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6 localizedName:(id)a7
{
  return [(PRPosterColor *)self initWithIdentifier:a3 color:a4 colorValues:a5 preferredStyle:a6 localizedName:a7 suggested:0];
}

- (PRPosterColor)initWithIdentifier:(id)a3 color:(id)a4 colorValues:(id)a5 preferredStyle:(unint64_t)a6 localizedName:(id)a7 suggested:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PRPosterColor;
  v18 = [(PRPosterColor *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    if (v15)
    {
      uint64_t v21 = [v15 copy];
      color = v18->_color;
      v18->_color = (UIColor *)v21;
    }
    else
    {
      color = [(id)objc_opt_class() vibrantMaterialColor];
      uint64_t v23 = [color color];
      v24 = v18->_color;
      v18->_color = (UIColor *)v23;
    }
    objc_storeStrong((id *)&v18->_colorValues, a5);
    v18->_preferredStyle = a6;
    uint64_t v25 = [v17 copy];
    localizedName = v18->_localizedName;
    v18->_localizedName = (NSString *)v25;

    v18->_suggested = a8;
  }

  return v18;
}

- (BOOL)isVibrantMaterialColor
{
  id v3 = [(id)objc_opt_class() vibrantMaterialColor];
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (BOOL)isVibrantMonochromeColor
{
  id v3 = [(id)objc_opt_class() vibrantMonochromeColor];
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (BOOL)isLUTBackedColor
{
  v2 = [(PRPosterColor *)self identifier];
  char v3 = [v2 hasPrefix:@"lutColor-"];

  return v3;
}

- (id)copyWithLuminance:(double)a3
{
  if ([(PRPosterColor *)self isVibrantMonochromeColor]
    || [(PRPosterColor *)self isVibrantMaterialColor]
    || [(PRPosterColor *)self isLUTBackedColor])
  {
    return self;
  }
  else
  {
    id v5 = [(PRPosterColor *)self colorValues];

    if (v5)
    {
      BOOL v6 = [(PRPosterColor *)self colorValues];
      v7 = [v6 hslValues];

      id v8 = objc_alloc((Class)objc_opt_class());
      [v7 hue];
      double v10 = v9;
      [v7 saturation];
      double v12 = v11;
      v13 = [(PRPosterColor *)self colorValues];
      [v13 alpha];
      id v15 = objc_msgSend(v8, "initWithHue:saturation:luminance:alpha:preferredStyle:suggested:", -[PRPosterColor preferredStyle](self, "preferredStyle"), -[PRPosterColor isSuggested](self, "isSuggested"), v10, v12, a3, v14);

      return v15;
    }
    else
    {
      id v16 = objc_opt_class();
      return (id)[v16 initWithPosterColor:self];
    }
  }
}

- (id)copyWithAlpha:(double)a3
{
  if ([(PRPosterColor *)self isVibrantMonochromeColor]
    || [(PRPosterColor *)self isVibrantMaterialColor]
    || [(PRPosterColor *)self isLUTBackedColor])
  {
    return self;
  }
  else
  {
    id v5 = [(PRPosterColor *)self color];
    BOOL v6 = [v5 colorWithAlphaComponent:a3];
    id v7 = objc_alloc((Class)objc_opt_class());
    unint64_t v8 = [(PRPosterColor *)self preferredStyle];
    double v9 = [(PRPosterColor *)self localizedName];
    double v10 = objc_msgSend(v7, "initWithColor:preferredStyle:localizedName:suggested:", v6, v8, v9, -[PRPosterColor isSuggested](self, "isSuggested"));

    return v10;
  }
}

- (PRPosterColorValues)hsbValues
{
  v2 = [(PRPosterColor *)self colorValues];
  char v3 = [v2 hsbValues];

  return (PRPosterColorValues *)v3;
}

- (PRPosterColorHSLValues)hslValues
{
  v2 = [(PRPosterColor *)self colorValues];
  char v3 = [v2 hslValues];

  return (PRPosterColorHSLValues *)v3;
}

- (id)lutIdentifier
{
  if ([(PRPosterColor *)self isLUTBackedColor])
  {
    char v3 = [(PRPosterColor *)self identifier];
    id v4 = [v3 substringFromIndex:objc_msgSend(@"lutColor-", "length")];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)copyAsSuggestedColor
{
  char v3 = [PRPosterColor alloc];
  id v4 = [(PRPosterColor *)self identifier];
  id v5 = [(PRPosterColor *)self color];
  BOOL v6 = [(PRPosterColor *)self colorValues];
  unint64_t v7 = [(PRPosterColor *)self preferredStyle];
  unint64_t v8 = [(PRPosterColor *)self localizedName];
  double v9 = [(PRPosterColor *)v3 initWithIdentifier:v4 color:v5 colorValues:v6 preferredStyle:v7 localizedName:v8 suggested:1];

  return v9;
}

- (BOOL)isEquivalentToColor:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterColor *)self identifier];
  BOOL v6 = [v4 identifier];
  int v7 = BSEqualStrings();

  if (v7)
  {
    unint64_t v8 = [(PRPosterColor *)self localizedName];
    double v9 = [v4 localizedName];
    char v10 = BSEqualStrings();
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)contentStyle
{
  return [(PRPosterColor *)self contentStylePreferringVibrancy:0];
}

- (id)contentStylePreferringVibrancy:(BOOL)a3
{
  BOOL v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([(PRPosterColor *)self isVibrantMaterialColor])
  {
    id v5 = PRPosterContentVibrantMaterialStyle;
LABEL_5:
    BOOL v6 = (PRPosterContentLUTStyle *)objc_alloc_init(v5);
    goto LABEL_6;
  }
  if ([(PRPosterColor *)self isVibrantMonochromeColor])
  {
    id v5 = PRPosterContentVibrantMonochromeStyle;
    goto LABEL_5;
  }
  if ([(PRPosterColor *)self isLUTBackedColor])
  {
    unint64_t v8 = [PRPosterContentLUTStyle alloc];
    double v9 = [(PRPosterColor *)self lutIdentifier];
    BOOL v6 = [(PRPosterContentLUTStyle *)v8 initWithLUTIdentifier:v9];

    goto LABEL_6;
  }
  BOOL v10 = [(PRPosterColor *)self requiresVibrancyEffectView];
  if (v10 || !v3)
  {
    if (!v10) {
      goto LABEL_14;
    }
LABEL_16:
    v13 = [(PRPosterColor *)self colorValues];
    [v13 alpha];
    double v12 = v14;

    uint64_t v11 = 1;
    goto LABEL_17;
  }
  if (![(PRPosterColor *)self preferredStyle]) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v11 = 0;
  double v12 = 0.0;
LABEL_17:
  id v15 = [PRPosterContentDiscreteColorsStyle alloc];
  id v16 = [(PRPosterColor *)self color];
  v18[0] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  BOOL v6 = [(PRPosterContentDiscreteColorsStyle *)v15 initWithColors:v17 vibrant:v11 supportsVariation:1 variationValue:v12];

  [(PRPosterContentLUTStyle *)v6 setNeedsToResolveVariationFromColorStore:1];
LABEL_6:
  return v6;
}

- (BOOL)requiresVibrancyEffectView
{
  BOOL v3 = [(PRPosterColor *)self colorValues];
  [v3 alpha];

  return !BSFloatIsOne() || [(PRPosterColor *)self preferredStyle] == 2;
}

- (id)vibrancyConfiguration
{
  if ([(PRPosterColor *)self isVibrantMaterialColor])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    id v4 = [(PRPosterColor *)self color];
    id v5 = v3;
    uint64_t v6 = 0;
  }
  else if ([(PRPosterColor *)self isVibrantMonochromeColor])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    id v4 = [(PRPosterColor *)self color];
    id v5 = v7;
    uint64_t v6 = 2;
  }
  else
  {
    BOOL v8 = [(PRPosterColor *)self isLUTBackedColor];
    id v9 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    id v4 = [(PRPosterColor *)self color];
    id v5 = v9;
    if (v8) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  BOOL v10 = (void *)[v5 initWithEffectType:v6 backgroundType:0 color:v4];

  return v10;
}

- (id)colors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PRPosterColor *)self color];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterColor *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      if ([(PRPosterColor *)self isEquivalentToColor:v7])
      {
        BOOL v8 = [(PRPosterColor *)self isSuggested];
        BOOL v9 = v8 ^ [(PRPosterColor *)v7 isSuggested] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = [(PRPosterColor *)self identifier];
  id v5 = (id)[v3 appendString:v4];

  uint64_t v6 = [(PRPosterColor *)self localizedName];
  id v7 = (id)[v3 appendString:v6];

  id v8 = (id)objc_msgSend(v3, "appendBool:", -[PRPosterColor isSuggested](self, "isSuggested"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  unint64_t v9 = __28__PRPosterColor_description__block_invoke;
  BOOL v10 = &unk_1E54DAA08;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __28__PRPosterColor_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(PRPosterColor *)self identifier];
  [v8 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(PRPosterColor *)self color];
  [v8 encodeObject:v5 forKey:@"color"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterColor preferredStyle](self, "preferredStyle"));
  [v8 encodeObject:v6 forKey:@"preferredStyle"];

  [v8 encodeBool:self->_suggested forKey:@"suggested"];
  if (self->_localizedName)
  {
    uint64_t v7 = [(PRPosterColor *)self localizedName];
    [v8 encodeObject:v7 forKey:@"localizedName"];
  }
}

- (PRPosterColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if ([v5 isEqualToString:@"vibrantMaterialColor"])
  {
    uint64_t v6 = +[PRPosterColor vibrantMaterialColor];
  }
  else
  {
    if (![v5 isEqualToString:@"vibrantMonochromeColor"])
    {
      id v8 = self;
      unint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"color"];

      BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredStyle"];
      uint64_t v11 = [v10 unsignedIntegerValue];

      uint64_t v12 = [v4 decodeBoolForKey:@"suggested"];
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
      double v14 = [[PRPosterColorValues alloc] initWithColor:v9];
      uint64_t v7 = [[PRPosterColor alloc] initWithIdentifier:v5 color:v9 colorValues:v14 preferredStyle:v11 localizedName:v13 suggested:v12];

      goto LABEL_7;
    }
    uint64_t v6 = +[PRPosterColor vibrantMonochromeColor];
  }
  uint64_t v7 = (PRPosterColor *)v6;
LABEL_7:

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(PRPosterColor *)self identifier];
  [v8 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(PRPosterColor *)self color];
  [v8 encodeObject:v5 forKey:@"color"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterColor preferredStyle](self, "preferredStyle"));
  [v8 encodeObject:v6 forKey:@"preferredStyle"];

  objc_msgSend(v8, "encodeBool:forKey:", -[PRPosterColor isSuggested](self, "isSuggested"), @"suggested");
  if (self->_localizedName)
  {
    uint64_t v7 = [(PRPosterColor *)self localizedName];
    [v8 encodeObject:v7 forKey:@"localizedName"];
  }
}

- (PRPosterColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if ([v5 isEqualToString:@"vibrantMaterialColor"])
  {
    uint64_t v6 = +[PRPosterColor vibrantMaterialColor];
  }
  else
  {
    if (![v5 isEqualToString:@"vibrantMonochromeColor"])
    {
      id v8 = self;
      unint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"color"];

      BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredStyle"];
      uint64_t v11 = [v10 unsignedIntegerValue];

      uint64_t v12 = [v4 decodeBoolForKey:@"suggested"];
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
      double v14 = [[PRPosterColorValues alloc] initWithColor:v9];
      uint64_t v7 = [[PRPosterColor alloc] initWithIdentifier:v5 color:v9 colorValues:v14 preferredStyle:v11 localizedName:v13 suggested:v12];

      goto LABEL_7;
    }
    uint64_t v6 = +[PRPosterColor vibrantMonochromeColor];
  }
  uint64_t v7 = (PRPosterColor *)v6;
LABEL_7:

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v10 = a3;
  id v4 = [(PRPosterColor *)self identifier];
  id v5 = (id)[v10 appendObject:v4 withName:@"identifier"];

  uint64_t v6 = [(PRPosterColor *)self color];
  id v7 = (id)[v10 appendObject:v6 withName:@"color"];

  id v8 = (id)objc_msgSend(v10, "appendUnsignedInteger:withName:", -[PRPosterColor preferredStyle](self, "preferredStyle"), @"preferredStyle");
  id v9 = (id)objc_msgSend(v10, "appendBool:withName:ifEqualTo:", -[PRPosterColor isSuggested](self, "isSuggested"), @"isSuggested", 1);
}

- (UIColor)color
{
  return self->_color;
}

- (unint64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (void)setSuggested:(BOOL)a3
{
  self->_suggested = a3;
}

- (PRPosterColorValues)colorValues
{
  return self->_colorValues;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_colorValues, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end