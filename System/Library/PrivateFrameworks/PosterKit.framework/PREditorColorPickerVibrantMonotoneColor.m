@interface PREditorColorPickerVibrantMonotoneColor
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4;
- (BOOL)isCustomColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVibrantColor;
- (NSDictionary)displayColors;
- (NSString)description;
- (NSString)localizedName;
- (PREditorColorPickerVibrantMonotoneColor)colorWithVariation:(double)a3;
- (PREditorColorPickerVibrantMonotoneColor)initWithBSXPCCoder:(id)a3;
- (PREditorColorPickerVibrantMonotoneColor)initWithCoder:(id)a3;
- (PREditorColorPickerVibrantMonotoneColor)initWithColor:(id)a3 displayColors:(id)a4;
- (PREditorColorPickerVibrantMonotoneColor)initWithColor:(id)a3 displayColors:(id)a4 localizedName:(id)a5;
- (PRPosterColor)activeDisplayColor;
- (PRPosterColor)baseColor;
- (PRPosterColor)color;
- (PRPosterColor)leftSliderColor;
- (PRPosterColor)rightSliderColor;
- (double)contentsLuminance;
- (double)initialVariation;
- (double)variationForAlpha:(double)a3;
- (id)displayColorWithVariation:(double)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveDisplayColor:(id)a3;
- (void)setContentsLuminance:(double)a3;
@end

@implementation PREditorColorPickerVibrantMonotoneColor

+ (double)luminanceForPosterColor:(id)a3 withAppliedVariation:(double)a4
{
  double v4 = a4 * -0.25;
  v5 = [a3 hslValues];
  [v5 luminance];
  double v7 = v6;

  double result = fmax(v7 + v4, 0.1);
  if (result > 0.9) {
    return 0.9;
  }
  return result;
}

- (PREditorColorPickerVibrantMonotoneColor)initWithColor:(id)a3 displayColors:(id)a4
{
  return [(PREditorColorPickerVibrantMonotoneColor *)self initWithColor:a3 displayColors:a4 localizedName:0];
}

- (PREditorColorPickerVibrantMonotoneColor)initWithColor:(id)a3 displayColors:(id)a4 localizedName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PREditorColorPickerVibrantMonotoneColor;
  v12 = [(PREditorColorPickerVibrantMonotoneColor *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_color, a3);
    objc_storeStrong((id *)&v13->_displayColors, a4);
    uint64_t v14 = [(NSDictionary *)v13->_displayColors objectForKeyedSubscript:&unk_1ED9EEE48];
    activeDisplayColor = v13->_activeDisplayColor;
    v13->_activeDisplayColor = (PRPosterColor *)v14;

    uint64_t v16 = [v11 copy];
    localizedName = v13->_localizedName;
    v13->_localizedName = (NSString *)v16;
  }
  return v13;
}

- (NSString)localizedName
{
  localizedName = self->_localizedName;
  if (localizedName)
  {
    v3 = localizedName;
  }
  else
  {
    v3 = [(PRPosterColor *)self->_activeDisplayColor localizedName];
  }
  return v3;
}

- (void)setContentsLuminance:(double)a3
{
  uint64_t v4 = PRPosterContentsBackgroundTypeForLuminance(a3);
  displayColors = self->_displayColors;
  double v6 = [NSNumber numberWithUnsignedInteger:v4];
  double v7 = [(NSDictionary *)displayColors objectForKeyedSubscript:v6];

  activeDisplayColor = self->_activeDisplayColor;
  self->_activeDisplayColor = v7;
}

- (double)initialVariation
{
  return 0.0;
}

- (PRPosterColor)baseColor
{
  return self->_color;
}

- (PRPosterColor)leftSliderColor
{
  return (PRPosterColor *)[(PREditorColorPickerVibrantMonotoneColor *)self displayColorWithVariation:-1.0];
}

- (PRPosterColor)rightSliderColor
{
  return (PRPosterColor *)[(PREditorColorPickerVibrantMonotoneColor *)self displayColorWithVariation:1.0];
}

- (PREditorColorPickerVibrantMonotoneColor)colorWithVariation:(double)a3
{
  id v3 = [(PRPosterColor *)self->_color copyWithAlpha:(a3 + 1.0) * 0.5 + 0.0];
  return (PREditorColorPickerVibrantMonotoneColor *)v3;
}

- (id)displayColorWithVariation:(double)a3
{
  [(id)objc_opt_class() luminanceForPosterColor:self->_activeDisplayColor withAppliedVariation:a3];
  id v4 = -[PRPosterColor copyWithLuminance:](self->_activeDisplayColor, "copyWithLuminance:");
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
  id v4 = (PREditorColorPickerVibrantMonotoneColor *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v7 = v4;
      v8 = [(PREditorColorPickerVibrantMonotoneColor *)self color];
      id v9 = [(PREditorColorPickerVibrantMonotoneColor *)v7 color];
      int v10 = BSEqualObjects();

      if (!v10) {
        goto LABEL_6;
      }
      id v11 = [(PREditorColorPickerVibrantMonotoneColor *)self displayColors];
      v12 = [(PREditorColorPickerVibrantMonotoneColor *)v7 displayColors];
      int v13 = BSEqualObjects();

      if (!v13) {
        goto LABEL_6;
      }
      [(PREditorColorPickerVibrantMonotoneColor *)self initialVariation];
      double v15 = v14;
      [(PREditorColorPickerVibrantMonotoneColor *)v7 initialVariation];
      if (v15 == v16)
      {
        objc_super v19 = [(PREditorColorPickerVibrantMonotoneColor *)self localizedName];
        v20 = [(PREditorColorPickerVibrantMonotoneColor *)v7 localizedName];
        char v17 = BSEqualStrings();
      }
      else
      {
LABEL_6:
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = [(PREditorColorPickerVibrantMonotoneColor *)self color];
  id v5 = (id)[v3 appendObject:v4];

  double v6 = [(PREditorColorPickerVibrantMonotoneColor *)self displayColors];
  id v7 = (id)[v3 appendObject:v6];

  [(PREditorColorPickerVibrantMonotoneColor *)self initialVariation];
  id v8 = (id)objc_msgSend(v3, "appendCGFloat:");
  if (self->_localizedName)
  {
    id v9 = [(PREditorColorPickerVibrantMonotoneColor *)self localizedName];
    id v10 = (id)[v3 appendObject:v9];
  }
  unint64_t v11 = [v3 hash];

  return v11;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __54__PREditorColorPickerVibrantMonotoneColor_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  unint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __54__PREditorColorPickerVibrantMonotoneColor_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(PREditorColorPickerVibrantMonotoneColor *)self color];
  [v7 encodeObject:v4 forKey:@"color"];

  id v5 = [(PREditorColorPickerVibrantMonotoneColor *)self displayColors];
  [v7 encodeObject:v5 forKey:@"displayColors"];

  if (self->_localizedName)
  {
    double v6 = [(PREditorColorPickerVibrantMonotoneColor *)self localizedName];
    [v7 encodeObject:v6 forKey:@"localizedName"];
  }
}

- (PREditorColorPickerVibrantMonotoneColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  double v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 decodeDictionaryWithKeysOfClass:v7 objectsOfClass:objc_opt_class() forKey:@"displayColors"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];

  id v10 = [(PREditorColorPickerVibrantMonotoneColor *)self initWithColor:v6 displayColors:v8 localizedName:v9];
  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PREditorColorPickerVibrantMonotoneColor *)self color];
  [v4 encodeObject:v5 forKey:@"color"];

  double v6 = [(PREditorColorPickerVibrantMonotoneColor *)self displayColors];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = [(PREditorColorPickerVibrantMonotoneColor *)self displayColors];
  id v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v11 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        [v9 addObject:v16];
        char v17 = [v6 objectForKey:v16];
        [v10 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [v4 encodeCollection:v9 forKey:@"displayColorKeys"];
  [v4 encodeCollection:v10 forKey:@"displayColorValues"];
  if (self->_localizedName)
  {
    v18 = [(PREditorColorPickerVibrantMonotoneColor *)self localizedName];
    [v4 encodeObject:v18 forKey:@"localizedName"];
  }
}

- (PREditorColorPickerVibrantMonotoneColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  double v6 = [v4 decodeObjectOfClass:v5 forKey:@"color"];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"displayColorKeys"];
  uint64_t v9 = objc_opt_class();
  id v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"displayColorValues"];
  unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v8];
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];

  uint64_t v13 = [(PREditorColorPickerVibrantMonotoneColor *)self initWithColor:v6 displayColors:v11 localizedName:v12];
  return v13;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v10 = a3;
  id v4 = [(PREditorColorPickerVibrantMonotoneColor *)self color];
  id v5 = (id)[v10 appendObject:v4 withName:@"color"];

  double v6 = [(PREditorColorPickerVibrantMonotoneColor *)self displayColors];
  id v7 = (id)[v10 appendObject:v6 withName:@"displayColors"];

  uint64_t v8 = [(PREditorColorPickerVibrantMonotoneColor *)self localizedName];
  id v9 = (id)[v10 appendObject:v8 withName:@"localizedName" skipIfNil:1];
}

- (PRPosterColor)color
{
  return self->_color;
}

- (NSDictionary)displayColors
{
  return self->_displayColors;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PRPosterColor)activeDisplayColor
{
  return self->_activeDisplayColor;
}

- (void)setActiveDisplayColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDisplayColor, 0);
  objc_storeStrong((id *)&self->_displayColors, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end