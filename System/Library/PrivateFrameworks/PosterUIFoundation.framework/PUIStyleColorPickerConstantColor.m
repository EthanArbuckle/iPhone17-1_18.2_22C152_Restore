@interface PUIStyleColorPickerConstantColor
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
- (PUIStyleColorPickerConstantColor)colorWithVariation:(double)a3;
- (PUIStyleColorPickerConstantColor)init;
- (PUIStyleColorPickerConstantColor)initWithBSXPCCoder:(id)a3;
- (PUIStyleColorPickerConstantColor)initWithBaseUIColor:(id)a3;
- (PUIStyleColorPickerConstantColor)initWithBaseUIColor:(id)a3 initialVariation:(double)a4;
- (PUIStyleColorPickerConstantColor)initWithCoder:(id)a3;
- (PUIStyleColorPickerConstantColor)initWithColor:(id)a3 initialVariation:(double)a4;
- (double)initialVariation;
- (double)variationForLuminance:(double)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIStyleColorPickerConstantColor

+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4
{
  double v4 = a4 * -0.25;
  v5 = [a3 hslValues];
  [v5 luminance];
  double v7 = v6;

  double result = fmax(v7 + v4, 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (PUIStyleColorPickerConstantColor)init
{
  v3 = [MEMORY[0x263F1C550] whiteColor];
  double v4 = [(PUIStyleColorPickerConstantColor *)self initWithBaseUIColor:v3];

  return v4;
}

- (PUIStyleColorPickerConstantColor)initWithBaseUIColor:(id)a3
{
  return [(PUIStyleColorPickerConstantColor *)self initWithBaseUIColor:a3 initialVariation:0.0];
}

- (PUIStyleColorPickerConstantColor)initWithBaseUIColor:(id)a3 initialVariation:(double)a4
{
  id v6 = a3;
  double v7 = [[PUIStyleColor alloc] initWithColor:v6 preferredStyle:0];

  v8 = [(PUIStyleColorPickerConstantColor *)self initWithColor:v7 initialVariation:a4];
  return v8;
}

- (PUIStyleColorPickerConstantColor)initWithColor:(id)a3 initialVariation:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIStyleColorPickerConstantColor;
  double v7 = [(PUIStyleColorPickerConstantColor *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    color = v7->_color;
    v7->_color = (PUIStyleColor *)v8;

    v7->_initialVariation = a4;
  }

  return v7;
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
  return (PUIStyleColor *)[(PUIStyleColorPickerConstantColor *)self colorWithVariation:-1.0];
}

- (PUIStyleColor)rightSliderColor
{
  return (PUIStyleColor *)[(PUIStyleColorPickerConstantColor *)self colorWithVariation:1.0];
}

- (PUIStyleColorPickerConstantColor)colorWithVariation:(double)a3
{
  [(id)objc_opt_class() luminanceForPosterColor:self->_color withAppliedVariation:a3];
  id v4 = -[PUIStyleColor copyWithLuminance:](self->_color, "copyWithLuminance:");
  return (PUIStyleColorPickerConstantColor *)v4;
}

- (BOOL)isCustomColor
{
  return 0;
}

- (BOOL)isVibrantColor
{
  return 0;
}

- (double)variationForLuminance:(double)a3
{
  v5 = [(PUIStyleColorPickerConstantColor *)self baseColor];
  id v6 = [v5 hslValues];
  [v6 luminance];
  double v8 = v7;

  v9 = [(PUIStyleColorPickerConstantColor *)self leftSliderColor];
  v10 = [v9 hslValues];
  [v10 luminance];
  double v12 = v11;

  if (v12 <= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  v14 = [(PUIStyleColorPickerConstantColor *)self rightSliderColor];
  v15 = [v14 hslValues];
  [v15 luminance];
  double v17 = v16;

  double result = 0.0;
  double v19 = fmax(v17, 0.0);
  if (v19 <= a3 && v8 >= a3) {
    return (a3 - v19) / (v8 - v19) + -1.0;
  }
  if (v13 >= a3 && v8 <= a3) {
    return 1.0 - (a3 - v8) / (v13 - v8);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIStyleColorPickerConstantColor *)a3;
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
      double v7 = v4;
      double v8 = [(PUIStyleColorPickerConstantColor *)self baseColor];
      v9 = [(PUIStyleColorPickerConstantColor *)v7 baseColor];
      int v10 = BSEqualObjects();

      if (v10
        && ([(PUIStyleColorPickerConstantColor *)self initialVariation],
            double v12 = v11,
            [(PUIStyleColorPickerConstantColor *)v7 initialVariation],
            v12 == v13))
      {
        double v16 = [(PUIStyleColorPickerConstantColor *)self localizedName];
        double v17 = [(PUIStyleColorPickerConstantColor *)v7 localizedName];
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
  id v4 = [(PUIStyleColorPickerConstantColor *)self color];
  id v5 = (id)[v3 appendObject:v4];

  [(PUIStyleColorPickerConstantColor *)self initialVariation];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    double v7 = [(PUIStyleColorPickerConstantColor *)self localizedName];
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
  unint64_t v9 = __47__PUIStyleColorPickerConstantColor_description__block_invoke;
  int v10 = &unk_265471108;
  double v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __47__PUIStyleColorPickerConstantColor_description__block_invoke(uint64_t a1)
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
  id v4 = [(PUIStyleColorPickerConstantColor *)self color];
  [v5 encodeObject:v4 forKey:@"color"];

  [(PUIStyleColorPickerConstantColor *)self initialVariation];
  objc_msgSend(v5, "encodeDouble:forKey:", @"initialVariation");
}

- (PUIStyleColorPickerConstantColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  [v4 decodeDoubleForKey:@"initialVariation"];
  double v8 = v7;

  unint64_t v9 = [(PUIStyleColorPickerConstantColor *)self initWithColor:v6 initialVariation:v8];
  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PUIStyleColorPickerConstantColor *)self color];
  [v5 encodeObject:v4 forKey:@"color"];

  [(PUIStyleColorPickerConstantColor *)self initialVariation];
  objc_msgSend(v5, "encodeDouble:forKey:", @"initialVariation");
}

- (PUIStyleColorPickerConstantColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  [v4 decodeDoubleForKey:@"initialVariation"];
  double v8 = v7;

  unint64_t v9 = [(PUIStyleColorPickerConstantColor *)self initWithColor:v6 initialVariation:v8];
  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = [(PUIStyleColorPickerConstantColor *)self color];
  id v5 = (id)[v7 appendObject:v4 withName:@"color"];

  [(PUIStyleColorPickerConstantColor *)self initialVariation];
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
  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end