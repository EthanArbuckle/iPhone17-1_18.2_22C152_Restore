@interface PUIStyleColorPickerVibrantColor
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4;
- (BOOL)isCustomColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVibrantColor;
- (NSString)description;
- (NSString)localizedName;
- (PUIStyleColor)baseColor;
- (PUIStyleColor)color;
- (PUIStyleColor)leftSliderColor;
- (PUIStyleColor)rightSliderColor;
- (PUIStyleColorPickerVibrantColor)colorWithVariation:(double)a3;
- (PUIStyleColorPickerVibrantColor)initWithBSXPCCoder:(id)a3;
- (PUIStyleColorPickerVibrantColor)initWithCoder:(id)a3;
- (PUIStyleColorPickerVibrantColor)initWithColor:(id)a3 initialVariation:(double)a4;
- (double)initialVariation;
- (double)variationForAlpha:(double)a3;
- (id)displayColorWithVariation:(double)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIStyleColorPickerVibrantColor

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

- (PUIStyleColorPickerVibrantColor)initWithColor:(id)a3 initialVariation:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIStyleColorPickerVibrantColor;
  v8 = [(PUIStyleColorPickerVibrantColor *)&v11 init];
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
  return [(PUIStyleColor *)self->_color localizedName];
}

- (PUIStyleColor)baseColor
{
  return self->_color;
}

- (PUIStyleColor)leftSliderColor
{
  return (PUIStyleColor *)[(PUIStyleColorPickerVibrantColor *)self displayColorWithVariation:-1.0];
}

- (PUIStyleColor)rightSliderColor
{
  return (PUIStyleColor *)[(PUIStyleColorPickerVibrantColor *)self displayColorWithVariation:1.0];
}

- (PUIStyleColorPickerVibrantColor)colorWithVariation:(double)a3
{
  id v3 = [(PUIStyleColor *)self->_color copyWithAlpha:(a3 + 1.0) * 0.5 + 0.0];
  return (PUIStyleColorPickerVibrantColor *)v3;
}

- (id)displayColorWithVariation:(double)a3
{
  [(id)objc_opt_class() luminanceForPosterColor:self->_color withAppliedVariation:a3];
  id v4 = -[PUIStyleColor copyWithLuminance:](self->_color, "copyWithLuminance:");
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
  id v4 = (PUIStyleColorPickerVibrantColor *)a3;
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
      v8 = [(PUIStyleColorPickerVibrantColor *)self color];
      v9 = [(PUIStyleColorPickerVibrantColor *)v7 color];
      int v10 = BSEqualObjects();

      if (v10
        && ([(PUIStyleColorPickerVibrantColor *)self initialVariation],
            double v12 = v11,
            [(PUIStyleColorPickerVibrantColor *)v7 initialVariation],
            v12 == v13))
      {
        v16 = [(PUIStyleColorPickerVibrantColor *)self localizedName];
        v17 = [(PUIStyleColorPickerVibrantColor *)v7 localizedName];
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
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = [(PUIStyleColorPickerVibrantColor *)self color];
  id v5 = (id)[v3 appendObject:v4];

  [(PUIStyleColorPickerVibrantColor *)self initialVariation];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    id v7 = [(PUIStyleColorPickerVibrantColor *)self localizedName];
    id v8 = (id)[v3 appendObject:v7];
  }
  unint64_t v9 = [v3 hash];

  return v9;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  unint64_t v9 = __46__PUIStyleColorPickerVibrantColor_description__block_invoke;
  int v10 = &unk_265471108;
  double v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __46__PUIStyleColorPickerVibrantColor_description__block_invoke(uint64_t a1)
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
  id v4 = [(PUIStyleColorPickerVibrantColor *)self color];
  [v5 encodeObject:v4 forKey:@"color"];

  [(PUIStyleColorPickerVibrantColor *)self initialVariation];
  objc_msgSend(v5, "encodeDouble:forKey:", @"initialVariation");
}

- (PUIStyleColorPickerVibrantColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  [v4 decodeDoubleForKey:@"initialVariation"];
  double v8 = v7;

  unint64_t v9 = [(PUIStyleColorPickerVibrantColor *)self initWithColor:v6 initialVariation:v8];
  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PUIStyleColorPickerVibrantColor *)self color];
  [v5 encodeObject:v4 forKey:@"color"];

  [(PUIStyleColorPickerVibrantColor *)self initialVariation];
  objc_msgSend(v5, "encodeDouble:forKey:", @"initialVariation");
}

- (PUIStyleColorPickerVibrantColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  [v4 decodeDoubleForKey:@"initialVariation"];
  double v8 = v7;

  unint64_t v9 = [(PUIStyleColorPickerVibrantColor *)self initWithColor:v6 initialVariation:v8];
  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = [(PUIStyleColorPickerVibrantColor *)self color];
  id v5 = (id)[v7 appendObject:v4 withName:@"color"];

  [(PUIStyleColorPickerVibrantColor *)self initialVariation];
  id v6 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", @"initialVariation", 5);
}

- (double)initialVariation
{
  return self->_initialVariation;
}

- (PUIStyleColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end