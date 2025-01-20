@interface PUIStyleDiscreteColors
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isEqualToStyle:(id)a3;
- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (BOOL)isVibrant;
- (BOOL)needsToResolveVariationFromColorStore;
- (NSArray)colors;
- (NSArray)variationAppliedColors;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PUIStyleDiscreteColors)initWithCoder:(id)a3;
- (PUIStyleDiscreteColors)initWithColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variationValue:(double)a6;
- (PUIStyleDiscreteColors)initWithOpaqueColors:(id)a3;
- (PUIStyleDiscreteColors)initWithOpaqueColors:(id)a3 variation:(double)a4;
- (PUIStyleDiscreteColors)initWithVibrantColors:(id)a3;
- (PUIStyleDiscreteColors)initWithVibrantColors:(id)a3 variation:(double)a4;
- (UIColor)vibrancyEffectColor;
- (double)maxVariation;
- (double)minVariation;
- (double)variation;
- (id)copyWithVariation:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setNeedsToResolveVariationFromColorStore:(BOOL)a3;
@end

@implementation PUIStyleDiscreteColors

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleDiscreteColors)initWithOpaqueColors:(id)a3
{
  return [(PUIStyleDiscreteColors *)self initWithColors:a3 vibrant:0 supportsVariation:0 variationValue:0.0];
}

- (PUIStyleDiscreteColors)initWithOpaqueColors:(id)a3 variation:(double)a4
{
  return [(PUIStyleDiscreteColors *)self initWithColors:a3 vibrant:0 supportsVariation:1 variationValue:a4];
}

- (PUIStyleDiscreteColors)initWithVibrantColors:(id)a3
{
  return [(PUIStyleDiscreteColors *)self initWithColors:a3 vibrant:1 supportsVariation:0 variationValue:0.0];
}

- (PUIStyleDiscreteColors)initWithVibrantColors:(id)a3 variation:(double)a4
{
  return [(PUIStyleDiscreteColors *)self initWithColors:a3 vibrant:1 supportsVariation:1 variationValue:a4];
}

- (PUIStyleDiscreteColors)initWithColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variationValue:(double)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUIStyleDiscreteColors;
  v11 = [(PUIStyleDiscreteColors *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    colors = v11->_colors;
    v11->_colors = (NSArray *)v12;

    v11->_vibrant = a4;
    v11->_supportsVariation = v7;
    if (v7) {
      v11->_variation = a6;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  return [(PUIStyleDiscreteColors *)self isEqual:a3 ignoringVariation:0];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIStyleDiscreteColors *)self isEqualToStyle:a3 ignoringVariation:0];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleDiscreteColors *)a3;
  if (v6 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStyleDiscreteColors *)self isEqualToStyle:v6 ignoringVariation:v4];
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleDiscreteColors *)a3;
  BOOL v7 = (unsigned __int8 *)v6;
  if (v6 == self) {
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_11;
  }
  if (!_PUIStyleCompareUsingIdentifiers(self, v6, v4)) {
    goto LABEL_11;
  }
  v8 = [(PUIStyleDiscreteColors *)self colors];
  v9 = [v7 colors];
  int v10 = [v8 isEqualToArray:v9];

  if (!v10) {
    goto LABEL_11;
  }
  int v11 = [(PUIStyleDiscreteColors *)self isVibrant];
  if (v11 == [v7 isVibrant]
    && self->_supportsVariation == v7[8]
    && (!self->_supportsVariation || v4 || BSFloatEqualToFloat()))
  {
LABEL_10:
    BOOL v12 = 1;
  }
  else
  {
LABEL_11:
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)[v3 appendObject:self->_colors];
  id v5 = (id)[v3 appendBool:self->_vibrant];
  id v6 = (id)[v3 appendBool:self->_supportsVariation];
  if (self->_supportsVariation) {
    id v7 = (id)[v3 appendCGFloat:self->_variation];
  }
  unint64_t v8 = [v3 hash];

  return v8;
}

- (NSString)nonVariatedIdentifier
{
  id v3 = NSStringFromPUIStyleType([(PUIStyleDiscreteColors *)self type]);
  id v4 = [(PUIStyleDiscreteColors *)self colors];
  id v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_29);
  id v6 = [v5 componentsJoinedByString:@"_"];
  id v7 = [v3 stringByAppendingFormat:@"-%@", v6];

  return (NSString *)v7;
}

uint64_t __47__PUIStyleDiscreteColors_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

- (NSString)identifier
{
  BOOL v3 = [(PUIStyleDiscreteColors *)self allowsVariation];
  id v4 = [(PUIStyleDiscreteColors *)self nonVariatedIdentifier];
  if (v3)
  {
    id v5 = [NSNumber numberWithDouble:self->_variation];
    uint64_t v6 = [v4 stringByAppendingFormat:@":%@", v5];

    id v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)localizedName
{
  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)variationAppliedColors
{
  if (self->_supportsVariation)
  {
    colors = self->_colors;
    if (self->_vibrant)
    {
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      v13 = __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke;
      v14 = &unk_265470E10;
      objc_super v15 = self;
      BOOL v3 = &v11;
    }
    else
    {
      uint64_t v6 = MEMORY[0x263EF8330];
      uint64_t v7 = 3221225472;
      unint64_t v8 = __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke_2;
      v9 = &unk_265470E10;
      int v10 = self;
      BOOL v3 = &v6;
    }
    -[NSArray bs_map:](colors, "bs_map:", v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = self->_colors;
  }
  return v4;
}

uint64_t __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 colorWithAlphaComponent:(*(double *)(*(void *)(a1 + 32) + 16) + 1.0) * 0.5 + 0.0];
}

id __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PUIColorValues alloc] initWithColor:v3];

  double v5 = *(double *)(*(void *)(a1 + 32) + 16) * -0.25;
  uint64_t v6 = [(PUIColorValues *)v4 hslValues];
  [v6 luminance];
  double v8 = v7;

  double v9 = fmax(v8 + v5, 0.0);
  if (v9 > 1.0) {
    double v9 = 1.0;
  }
  id v10 = [(PUIColorValues *)v4 copyWithLuminance:v9];
  uint64_t v11 = [v10 color];

  return v11;
}

- (BOOL)allowsVariation
{
  return self->_supportsVariation;
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
  id v5 = objc_alloc((Class)objc_opt_class());
  colors = self->_colors;
  BOOL vibrant = self->_vibrant;
  BOOL supportsVariation = self->_supportsVariation;
  return (id)[v5 initWithColors:colors vibrant:vibrant supportsVariation:supportsVariation variationValue:a3];
}

- (BOOL)isSupportedSystemStyle
{
  return 1;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 1;
}

- (BOOL)desiresVibrancyEffectView
{
  return self->_vibrant;
}

- (int64_t)vibrancyEffectType
{
  return 1;
}

- (UIColor)vibrancyEffectColor
{
  if ([(PUIStyleDiscreteColors *)self allowsVariation])
  {
    id v3 = [(PUIStyleDiscreteColors *)self variationAppliedColors];
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = [(NSArray *)self->_colors firstObject];
  }
  return (UIColor *)v4;
}

- (NSString)lutIdentifier
{
  return 0;
}

- (PUIStyleDiscreteColors)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"colors"];
  uint64_t v6 = [v4 decodeBoolForKey:@"vibrant"];
  uint64_t v7 = [v4 decodeBoolForKey:@"supportsVariation"];
  [v4 decodeDoubleForKey:@"variation"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeBoolForKey:@"needsToResolveVariation"];

  uint64_t v11 = [[PUIStyleDiscreteColors alloc] initWithColors:v5 vibrant:v6 supportsVariation:v7 variationValue:v9];
  [(PUIStyleDiscreteColors *)v11 setNeedsToResolveVariationFromColorStore:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  colors = self->_colors;
  id v5 = a3;
  [v5 encodeObject:colors forKey:@"colors"];
  [v5 encodeBool:self->_vibrant forKey:@"vibrant"];
  [v5 encodeBool:self->_supportsVariation forKey:@"supportsVariation"];
  [v5 encodeDouble:@"variation" forKey:self->_variation];
  [v5 encodeBool:self->_needsToResolveVariationFromColorStore forKey:@"needsToResolveVariation"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithColors:self->_colors vibrant:self->_vibrant supportsVariation:self->_supportsVariation variationValue:self->_variation];
  [v4 setNeedsToResolveVariationFromColorStore:self->_needsToResolveVariationFromColorStore];
  return v4;
}

- (BOOL)needsToResolveVariationFromColorStore
{
  return self->_needsToResolveVariationFromColorStore;
}

- (void)setNeedsToResolveVariationFromColorStore:(BOOL)a3
{
  self->_needsToResolveVariationFromColorStore = a3;
}

- (BOOL)isVibrant
{
  return self->_vibrant;
}

- (void).cxx_destruct
{
}

@end