@interface PREditorColorPickerVibrantColor
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4;
- (BOOL)isCustomColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVibrantColor;
- (NSString)description;
- (NSString)localizedName;
- (PREditorColorPickerVibrantColor)colorWithVariation:(double)a3;
- (PREditorColorPickerVibrantColor)initWithBSXPCCoder:(id)a3;
- (PREditorColorPickerVibrantColor)initWithCoder:(id)a3;
- (PREditorColorPickerVibrantColor)initWithColor:(id)a3 initialVariation:(double)a4;
- (PRPosterColor)baseColor;
- (PRPosterColor)color;
- (PRPosterColor)leftSliderColor;
- (PRPosterColor)rightSliderColor;
- (double)initialVariation;
- (double)variationForAlpha:(double)a3;
- (id)displayColorWithVariation:(double)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PREditorColorPickerVibrantColor

+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4
{
  double v4 = ((a4 + 1.0) * 0.5 + -1.0) * -0.25;
  v5 = [a3 hslValues];
  [v5 luminance];
  double v7 = v6;

  double result = fmax(v7 + v4, 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (PREditorColorPickerVibrantColor)initWithColor:(id)a3 initialVariation:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PREditorColorPickerVibrantColor;
  v8 = [(PREditorColorPickerVibrantColor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_color, a3);
    v9->_initialVariation = a4;
  }

  return v9;
}

- (NSString)localizedName
{
  return [(PRPosterColor *)self->_color localizedName];
}

- (PRPosterColor)baseColor
{
  return self->_color;
}

- (PRPosterColor)leftSliderColor
{
  return (PRPosterColor *)[(PREditorColorPickerVibrantColor *)self displayColorWithVariation:-1.0];
}

- (PRPosterColor)rightSliderColor
{
  return (PRPosterColor *)[(PREditorColorPickerVibrantColor *)self displayColorWithVariation:1.0];
}

- (PREditorColorPickerVibrantColor)colorWithVariation:(double)a3
{
  id v3 = [(PRPosterColor *)self->_color copyWithAlpha:(a3 + 1.0) * 0.5 + 0.0];
  return (PREditorColorPickerVibrantColor *)v3;
}

- (id)displayColorWithVariation:(double)a3
{
  [(id)objc_opt_class() luminanceForPosterColor:self->_color withAppliedVariation:a3];
  id v4 = -[PRPosterColor copyWithLuminance:](self->_color, "copyWithLuminance:");
  return v4;
}

- (BOOL)isCustomColor
{
  return 0;
}

- (BOOL)isVibrantColor
{
  return 1;
}

- (double)variationForAlpha:(double)a3
{
  return a3 + a3 + -1.0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PREditorColorPickerVibrantColor *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      v8 = [(PREditorColorPickerVibrantColor *)self color];
      v9 = [(PREditorColorPickerVibrantColor *)v7 color];
      int v10 = BSEqualObjects();

      if (v10
        && ([(PREditorColorPickerVibrantColor *)self initialVariation],
            double v12 = v11,
            [(PREditorColorPickerVibrantColor *)v7 initialVariation],
            v12 == v13))
      {
        v16 = [(PREditorColorPickerVibrantColor *)self localizedName];
        v17 = [(PREditorColorPickerVibrantColor *)v7 localizedName];
        char v14 = BSEqualStrings();
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = [(PREditorColorPickerVibrantColor *)self color];
  id v5 = (id)[v3 appendObject:v4];

  [(PREditorColorPickerVibrantColor *)self initialVariation];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    id v7 = [(PREditorColorPickerVibrantColor *)self localizedName];
    id v8 = (id)[v3 appendObject:v7];
  }
  unint64_t v9 = [v3 hash];

  return v9;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  unint64_t v9 = __46__PREditorColorPickerVibrantColor_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  double v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __46__PREditorColorPickerVibrantColor_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PREditorColorPickerVibrantColor *)self color];
  [v5 encodeObject:v4 forKey:@"color"];

  [(PREditorColorPickerVibrantColor *)self initialVariation];
  objc_msgSend(v5, "encodeDouble:forKey:", @"initialVariation");
}

- (PREditorColorPickerVibrantColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  [v4 decodeDoubleForKey:@"initialVariation"];
  double v8 = v7;

  unint64_t v9 = [(PREditorColorPickerVibrantColor *)self initWithColor:v6 initialVariation:v8];
  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PREditorColorPickerVibrantColor *)self color];
  [v5 encodeObject:v4 forKey:@"color"];

  [(PREditorColorPickerVibrantColor *)self initialVariation];
  objc_msgSend(v5, "encodeDouble:forKey:", @"initialVariation");
}

- (PREditorColorPickerVibrantColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  [v4 decodeDoubleForKey:@"initialVariation"];
  double v8 = v7;

  unint64_t v9 = [(PREditorColorPickerVibrantColor *)self initWithColor:v6 initialVariation:v8];
  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = [(PREditorColorPickerVibrantColor *)self color];
  id v5 = (id)[v7 appendObject:v4 withName:@"color"];

  [(PREditorColorPickerVibrantColor *)self initialVariation];
  id v6 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", @"initialVariation", 5);
}

- (double)initialVariation
{
  return self->_initialVariation;
}

- (PRPosterColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end