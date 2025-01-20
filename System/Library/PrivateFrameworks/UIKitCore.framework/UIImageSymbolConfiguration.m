@interface UIImageSymbolConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIImageSymbolConfiguration)configurationPreferringMonochrome;
+ (UIImageSymbolConfiguration)configurationPreferringMulticolor;
+ (UIImageSymbolConfiguration)configurationWithFont:(UIFont *)font;
+ (UIImageSymbolConfiguration)configurationWithFont:(UIFont *)font scale:(UIImageSymbolScale)scale;
+ (UIImageSymbolConfiguration)configurationWithHierarchicalColor:(UIColor *)hierarchicalColor;
+ (UIImageSymbolConfiguration)configurationWithPaletteColors:(NSArray *)paletteColors;
+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize;
+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize weight:(UIImageSymbolWeight)weight;
+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize weight:(UIImageSymbolWeight)weight scale:(UIImageSymbolScale)scale;
+ (UIImageSymbolConfiguration)configurationWithScale:(UIImageSymbolScale)scale;
+ (UIImageSymbolConfiguration)configurationWithTextStyle:(UIFontTextStyle)textStyle;
+ (UIImageSymbolConfiguration)configurationWithTextStyle:(UIFontTextStyle)textStyle scale:(UIImageSymbolScale)scale;
+ (UIImageSymbolConfiguration)configurationWithWeight:(UIImageSymbolWeight)weight;
+ (id)_configurationWithHierarchicalColors:(id)a3;
+ (id)_configurationWithNamedColorStyles:(id)a3;
+ (id)_unspecifiedConfiguration;
- (BOOL)_hasColorConfigurationWithTintColor;
- (BOOL)_hasSpecifiedHierarchicalColors;
- (BOOL)_hasSpecifiedPaletteColors;
- (BOOL)_hasSpecifiedScale;
- (BOOL)_isEquivalentToConfiguration:(id)a3;
- (BOOL)_isUnspecified;
- (BOOL)_prefersMonochrome;
- (BOOL)_prefersMulticolor;
- (BOOL)_shouldApplyConfiguration:(id)a3;
- (BOOL)_suppressesMaterialRendering;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(UIImageSymbolConfiguration *)otherConfiguration;
- (NSArray)_colors;
- (NSDictionary)_namedColorStyles;
- (NSString)textStyle;
- (UIImageSymbolConfiguration)configurationWithoutPointSizeAndWeight;
- (UIImageSymbolConfiguration)configurationWithoutScale;
- (UIImageSymbolConfiguration)configurationWithoutTextStyle;
- (UIImageSymbolConfiguration)configurationWithoutWeight;
- (UIImageSymbolConfiguration)initWithCoder:(id)a3;
- (double)customFontPointSizeMultiplier;
- (double)pointSizeForScalingWithTextStyle;
- (id)_configurationByReplacingColors:(id)a3;
- (id)_configurationSuppressingMaterialRendering;
- (id)_hierarchicalColorForLayerLevel:(int64_t)a3 effect:(id)a4;
- (id)_hierarchicalColorForLayerLevel:(int64_t)a3 effect:(id)a4 shouldResolveDynamicColors:(BOOL)a5;
- (id)_initWithTraitCollection:(id)a3;
- (id)_paletteColorsWithEffect:(id)a3;
- (id)_paletteColorsWithEffect:(id)a3 shouldResolveDynamicColors:(BOOL)a4;
- (id)_resolvedColorForNamedStyle:(id)a3 effect:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)scale;
- (int64_t)weight;
- (unint64_t)hash;
- (void)_applyConfigurationValuesTo:(id)a3;
- (void)_clearSpecificsExceptScale;
- (void)_deriveGlyphSize:(int64_t *)a3 weight:(int64_t *)a4 pointSize:(double *)a5;
- (void)_setPrefersMonochrome:(uint64_t)a1;
- (void)_setPrefersMulticolor:(uint64_t)a1;
- (void)_setUsesHierarchical:(void *)a3 colors:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIImageSymbolConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_namedColorStyles, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIImageSymbolConfiguration *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v5 = [(UIImageSymbolConfiguration *)self isEqualToConfiguration:v4];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)UIImageSymbolConfiguration;
      unsigned __int8 v5 = [(UIImageConfiguration *)&v8 isEqual:v4];
    }
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)_shouldApplyConfiguration:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIImageSymbolConfiguration;
  if ([(UIImageConfiguration *)&v7 _shouldApplyConfiguration:v4]) {
    BOOL v5 = ![(UIImageSymbolConfiguration *)self isEqualToConfiguration:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(UIImageSymbolConfiguration *)otherConfiguration
{
  id v4 = otherConfiguration;
  if (v4)
  {
    BOOL v5 = v4;
  }
  else
  {
    BOOL v5 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
    if (!v5) {
      goto LABEL_42;
    }
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_42;
    }
  }
  BOOL v8 = [(UIImageSymbolConfiguration *)self _hasSpecifiedScale];
  if (v8 != [(UIImageSymbolConfiguration *)v5 _hasSpecifiedScale]) {
    goto LABEL_42;
  }
  int64_t v9 = [(UIImageSymbolConfiguration *)self scale];
  if (v9 != [(UIImageSymbolConfiguration *)v5 scale]) {
    goto LABEL_42;
  }
  if (self)
  {
    if ((self->_textStyle != 0) != (v5->_textStyle != 0)) {
      goto LABEL_42;
    }
  }
  else if (v5->_textStyle)
  {
    goto LABEL_42;
  }
  v10 = [(UIImageSymbolConfiguration *)self textStyle];
  v11 = [(UIImageSymbolConfiguration *)v5 textStyle];
  id v12 = v10;
  id v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {
  }
  else
  {
    if (!v12 || !v13)
    {

LABEL_41:
      goto LABEL_42;
    }
    char v15 = [v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_41;
    }
  }
  [(UIImageSymbolConfiguration *)self pointSizeForScalingWithTextStyle];
  double v17 = v16;
  [(UIImageSymbolConfiguration *)v5 pointSizeForScalingWithTextStyle];
  double v19 = v18;

  if (v17 != v19) {
    goto LABEL_42;
  }
  if (self)
  {
    $F7261812317C211F76CC117B9D7B19F5 configFlags = self->_configFlags;
    $F7261812317C211F76CC117B9D7B19F5 v21 = v5->_configFlags;
    if ((*(_DWORD *)&configFlags ^ *(_DWORD *)&v21)) {
      goto LABEL_42;
    }
    double v22 = 0.0;
    double pointSize = 0.0;
    if (*(unsigned char *)&configFlags) {
      double pointSize = self->_pointSize;
    }
    if (*(unsigned char *)&v21) {
      double v22 = v5->_pointSize;
    }
    if (pointSize != v22) {
      goto LABEL_42;
    }
  }
  else if (*(unsigned char *)&v5->_configFlags)
  {
    goto LABEL_42;
  }
  [(UIImageSymbolConfiguration *)self customFontPointSizeMultiplier];
  double v25 = v24;
  [(UIImageSymbolConfiguration *)v5 customFontPointSizeMultiplier];
  if (v25 != v26)
  {
LABEL_42:
    BOOL v39 = 0;
    goto LABEL_43;
  }
  if (self)
  {
    if ((self->_weight != 0) != (v5->_weight != 0)) {
      goto LABEL_42;
    }
  }
  else if (v5->_weight)
  {
    goto LABEL_42;
  }
  int64_t v27 = [(UIImageSymbolConfiguration *)self weight];
  if (v27 != [(UIImageSymbolConfiguration *)v5 weight]) {
    goto LABEL_42;
  }
  if (self)
  {
    if ((self->_namedColorStyles != 0) == (v5->_namedColorStyles != 0)) {
      goto LABEL_32;
    }
    goto LABEL_42;
  }
  if (v5->_namedColorStyles) {
    goto LABEL_42;
  }
LABEL_32:
  v28 = [(UIImageSymbolConfiguration *)self _namedColorStyles];
  v29 = [(UIImageSymbolConfiguration *)v5 _namedColorStyles];
  int v30 = UIEqual(v28, v29);

  if (!v30) {
    goto LABEL_42;
  }
  BOOL v31 = [(UIImageSymbolConfiguration *)self _hasSpecifiedHierarchicalColors];
  if (v31 != [(UIImageSymbolConfiguration *)v5 _hasSpecifiedHierarchicalColors]) {
    goto LABEL_42;
  }
  BOOL v32 = [(UIImageSymbolConfiguration *)self _hasSpecifiedPaletteColors];
  if (v32 != [(UIImageSymbolConfiguration *)v5 _hasSpecifiedPaletteColors]) {
    goto LABEL_42;
  }
  v33 = [(UIImageSymbolConfiguration *)self _colors];
  v34 = [(UIImageSymbolConfiguration *)v5 _colors];
  int v35 = UIEqual(v33, v34);

  if (!v35) {
    goto LABEL_42;
  }
  BOOL v36 = [(UIImageSymbolConfiguration *)self _prefersMulticolor];
  if (v36 != [(UIImageSymbolConfiguration *)v5 _prefersMulticolor]) {
    goto LABEL_42;
  }
  BOOL v37 = [(UIImageSymbolConfiguration *)self _prefersMonochrome];
  if (v37 != [(UIImageSymbolConfiguration *)v5 _prefersMonochrome]) {
    goto LABEL_42;
  }
  BOOL v38 = [(UIImageSymbolConfiguration *)self _suppressesMaterialRendering];
  if (v38 != [(UIImageSymbolConfiguration *)v5 _suppressesMaterialRendering]) {
    goto LABEL_42;
  }
  v41.receiver = self;
  v41.super_class = (Class)UIImageSymbolConfiguration;
  BOOL v39 = [(UIImageConfiguration *)&v41 isEqualToConfiguration:v5];
LABEL_43:

  return v39;
}

- (BOOL)_isUnspecified
{
  if ([(UIImageSymbolConfiguration *)self _hasSpecifiedScale]) {
    return 0;
  }
  if (self)
  {
    if ((*(unsigned char *)&self->_configFlags & 1) != 0 || self->_weight || self->_textStyle || self->_namedColorStyles) {
      return 0;
    }
    if ((*(unsigned char *)&self->_configFlags & 0x28) != 0 || self->_colors != 0) {
      return 0;
    }
  }
  if ([(UIImageSymbolConfiguration *)self _suppressesMaterialRendering]) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIImageSymbolConfiguration;
  return [(UIImageConfiguration *)&v5 _isUnspecified];
}

- (BOOL)_hasSpecifiedScale
{
  return self->_scale != 0;
}

- (BOOL)_suppressesMaterialRendering
{
  return (*(unsigned char *)&self->_configFlags >> 6) & 1;
}

- (int64_t)scale
{
  return self->_scale;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (double)pointSizeForScalingWithTextStyle
{
  double result = 0.0;
  if ((*(unsigned char *)&self->_configFlags & 1) == 0) {
    return self->_pointSize;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIImageSymbolConfiguration;
  id v4 = [(UIImageConfiguration *)&v8 copyWithZone:a3];
  if (v4 && ![(UIImageSymbolConfiguration *)self _isUnspecified])
  {
    *((void *)v4 + 8) = self->_scale;
    uint64_t v5 = [(NSString *)self->_textStyle copy];
    uint64_t v6 = (void *)*((void *)v4 + 10);
    *((void *)v4 + 10) = v5;

    *((void *)v4 + 4) = *(void *)&self->_pointSize;
    *((void *)v4 + 11) = *(void *)&self->_customFontPointSizeMultiplier;
    *((void *)v4 + 9) = self->_weight;
    *((_DWORD *)v4 + 10) = self->_configFlags;
    objc_storeStrong((id *)v4 + 6, self->_namedColorStyles);
    objc_storeStrong((id *)v4 + 7, self->_colors);
  }
  return v4;
}

- (BOOL)_hasSpecifiedHierarchicalColors
{
  if (self->_colors) {
    return (*(unsigned char *)&self->_configFlags >> 1) & 1;
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (BOOL)_hasSpecifiedPaletteColors
{
  return self->_colors && (*(unsigned char *)&self->_configFlags & 2) == 0;
}

- (int64_t)weight
{
  return self->_weight;
}

- (BOOL)_prefersMulticolor
{
  return (~*(unsigned char *)&self->_configFlags & 0xC) == 0;
}

- (id)_initWithTraitCollection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIImageSymbolConfiguration;
  id v3 = [(UIImageConfiguration *)&v7 _initWithTraitCollection:a3];
  id v4 = v3;
  if (v3)
  {
    *((void *)v3 + 8) = 0;
    *((void *)v3 + 11) = 0x3FF0000000000000;
    *((void *)v3 + 4) = 0;
    *((unsigned char *)v3 + 40) &= ~1u;
    *((void *)v3 + 9) = 0;
    uint64_t v5 = (void *)*((void *)v3 + 10);
    *((void *)v3 + 10) = 0;
  }
  return v4;
}

- (double)customFontPointSizeMultiplier
{
  return self->_customFontPointSizeMultiplier;
}

+ (id)_unspecifiedConfiguration
{
  if (_MergedGlobals_7_15 != -1) {
    dispatch_once(&_MergedGlobals_7_15, &__block_literal_global_666);
  }
  BOOL v2 = (void *)qword_1EB25D748;
  return v2;
}

- (NSDictionary)_namedColorStyles
{
  return self->_namedColorStyles;
}

- (NSArray)_colors
{
  return self->_colors;
}

- (BOOL)_prefersMonochrome
{
  return (~*(unsigned char *)&self->_configFlags & 0x30) == 0;
}

- (void)_applyConfigurationValuesTo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_59;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_59;
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)UIImageSymbolConfiguration;
  [(UIImageConfiguration *)&v35 _applyConfigurationValuesTo:v4];
  if ([(UIImageSymbolConfiguration *)self _hasSpecifiedScale]) {
    *((void *)v4 + 8) = [(UIImageSymbolConfiguration *)self scale];
  }
  if (dyld_program_sdk_at_least())
  {
    if (self)
    {
      if (self->_weight) {
        *((void *)v4 + 9) = [(UIImageSymbolConfiguration *)self weight];
      }
      if (self->_textStyle)
      {
        *((void *)v4 + 4) = 0;
        *((unsigned char *)v4 + 40) &= ~1u;
        uint64_t v7 = [(UIImageSymbolConfiguration *)self textStyle];
        objc_super v8 = (void *)*((void *)v4 + 10);
        *((void *)v4 + 10) = v7;

        [(UIImageSymbolConfiguration *)self pointSizeForScalingWithTextStyle];
        if (v9 < 0.0) {
          double v9 = 0.0;
        }
        *((double *)v4 + 4) = v9;
        char v10 = *((unsigned char *)v4 + 40) & 0xFE;
LABEL_16:
        *((unsigned char *)v4 + 40) = v10;
LABEL_46:
        if (self->_namedColorStyles)
        {
          double v25 = (void *)[*((id *)v4 + 6) mutableCopy];
          double v26 = v25;
          if (v25) {
            id v27 = v25;
          }
          else {
            id v27 = (id)objc_opt_new();
          }
          v28 = v27;

          [v28 addEntriesFromDictionary:self->_namedColorStyles];
          uint64_t v29 = [v28 copy];
          int v30 = (void *)*((void *)v4 + 6);
          *((void *)v4 + 6) = v29;
        }
        colors = self->_colors;
        if (colors) {
          -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v4, (*(unsigned char *)&self->_configFlags >> 1) & 1, colors);
        }
        $F7261812317C211F76CC117B9D7B19F5 configFlags = self->_configFlags;
        if ((*(unsigned char *)&configFlags & 8) != 0)
        {
          -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v4, (*(unsigned int *)&configFlags >> 2) & 1);
          $F7261812317C211F76CC117B9D7B19F5 configFlags = self->_configFlags;
        }
        if ((*(unsigned char *)&configFlags & 0x20) != 0) {
          -[UIImageSymbolConfiguration _setPrefersMonochrome:]((uint64_t)v4, (*(unsigned int *)&configFlags >> 4) & 1);
        }
        goto LABEL_57;
      }
      if ((*(unsigned char *)&self->_configFlags & 1) == 0) {
        goto LABEL_46;
      }
      char v15 = (void *)*((void *)v4 + 10);
      *((void *)v4 + 10) = 0;

      goto LABEL_25;
    }
  }
  else if (self)
  {
    if (self->_textStyle)
    {
      *((void *)v4 + 4) = 0;
      *((unsigned char *)v4 + 40) &= ~1u;
      *((void *)v4 + 9) = 0;
      v11 = (void *)*((void *)v4 + 10);
      *((void *)v4 + 10) = 0;

      uint64_t v12 = [(UIImageSymbolConfiguration *)self textStyle];
      id v13 = (void *)*((void *)v4 + 10);
      *((void *)v4 + 10) = v12;

      [(UIImageSymbolConfiguration *)self pointSizeForScalingWithTextStyle];
      if (v14 < 0.0) {
        double v14 = 0.0;
      }
      *((double *)v4 + 4) = v14;
      *((unsigned char *)v4 + 40) &= ~1u;
      if (self->_weight) {
        *((void *)v4 + 9) = [(UIImageSymbolConfiguration *)self weight];
      }
      goto LABEL_46;
    }
    int64_t weight = self->_weight;
    if ((*(unsigned char *)&self->_configFlags & 1) == 0)
    {
      if (!weight) {
        goto LABEL_46;
      }
      if ((*((unsigned char *)v4 + 40) & 1) == 0)
      {
        -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
        *((void *)v4 + 9) = [(UIImageSymbolConfiguration *)self weight];
        goto LABEL_46;
      }
      double v33 = *((double *)v4 + 4);
      -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
      *((void *)v4 + 9) = [(UIImageSymbolConfiguration *)self weight];
      double v34 = 0.0;
      if (v33 >= 0.0) {
        double v34 = v33;
      }
      *((double *)v4 + 4) = v34;
      char v10 = *((unsigned char *)v4 + 40) | 1;
      goto LABEL_16;
    }
    if (weight)
    {
      *((void *)v4 + 4) = 0;
      *((unsigned char *)v4 + 40) &= ~1u;
      *((void *)v4 + 9) = 0;
      double v19 = (void *)*((void *)v4 + 10);
      *((void *)v4 + 10) = 0;

      double v20 = 0.0;
      double pointSize = 0.0;
      if (*(unsigned char *)&self->_configFlags) {
        double pointSize = self->_pointSize;
      }
      if (pointSize >= 0.0) {
        double v20 = pointSize;
      }
      *((double *)v4 + 4) = v20;
      *((unsigned char *)v4 + 40) |= 1u;
      *((void *)v4 + 9) = [(UIImageSymbolConfiguration *)self weight];
      goto LABEL_46;
    }
    if (*((void *)v4 + 9))
    {
      uint64_t v22 = [v4 weight];
      -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
      double v23 = 0.0;
      double v24 = 0.0;
      if (*(unsigned char *)&self->_configFlags) {
        double v24 = self->_pointSize;
      }
      if (v24 >= 0.0) {
        double v23 = v24;
      }
      *((double *)v4 + 4) = v23;
      *((unsigned char *)v4 + 40) |= 1u;
      *((void *)v4 + 9) = v22;
      goto LABEL_46;
    }
    -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
LABEL_25:
    double v16 = 0.0;
    double v17 = 0.0;
    if (*(unsigned char *)&self->_configFlags) {
      double v17 = self->_pointSize;
    }
    if (v17 >= 0.0) {
      double v16 = v17;
    }
    *((double *)v4 + 4) = v16;
    *((unsigned char *)v4 + 40) |= 1u;
    goto LABEL_46;
  }
LABEL_57:
  if ([(UIImageSymbolConfiguration *)self _suppressesMaterialRendering]) {
    *((unsigned char *)v4 + 40) = *((unsigned char *)v4 + 40) & 0xBF | *(unsigned char *)&self->_configFlags & 0x40;
  }
LABEL_59:
}

- (void)_setUsesHierarchical:(void *)a3 colors:
{
  id v6 = a3;
  if (a1)
  {
    id v8 = v6;
    objc_storeStrong((id *)(a1 + 56), a3);
    id v6 = v8;
    char v7 = a2 ? 2 : 0;
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a1 + 40) & 0xFD | v7;
    if (v8)
    {
      *(unsigned char *)(a1 + 40) &= ~4u;
      *(unsigned char *)(a1 + 40) |= 8u;
      *(unsigned char *)(a1 + 40) &= ~0x10u;
      *(unsigned char *)(a1 + 40) |= 0x20u;
    }
  }
}

- (void)_setPrefersMonochrome:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a1 + 40) & 0xEF | v2;
    *(unsigned char *)(a1 + 40) |= 0x20u;
    if (a2)
    {
      *(unsigned char *)(a1 + 40) &= ~4u;
      *(unsigned char *)(a1 + 40) |= 8u;
      -[UIImageSymbolConfiguration _setUsesHierarchical:colors:](a1, 0, 0);
    }
  }
}

- (void)_setPrefersMulticolor:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a1 + 40) & 0xFB | v2;
    *(unsigned char *)(a1 + 40) |= 8u;
    if (a2)
    {
      *(unsigned char *)(a1 + 40) &= ~0x10u;
      *(unsigned char *)(a1 + 40) |= 0x20u;
      -[UIImageSymbolConfiguration _setUsesHierarchical:colors:](a1, 0, 0);
    }
  }
}

+ (UIImageSymbolConfiguration)configurationPreferringMonochrome
{
  char v2 = (void *)[objc_alloc((Class)self) _init];
  -[UIImageSymbolConfiguration _setPrefersMonochrome:]((uint64_t)v2, 1);
  return (UIImageSymbolConfiguration *)v2;
}

+ (UIImageSymbolConfiguration)configurationWithHierarchicalColor:(UIColor *)hierarchicalColor
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = hierarchicalColor;
  if (!v4)
  {
    id v4 = +[UIColor tintColor];
  }
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _init];
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v5, 1, v6);

  return (UIImageSymbolConfiguration *)v5;
}

+ (UIImageSymbolConfiguration)configurationWithTextStyle:(UIFontTextStyle)textStyle scale:(UIImageSymbolScale)scale
{
  double result = (UIImageSymbolConfiguration *)[a1 configurationWithTextStyle:textStyle];
  result->_scale = scale;
  return result;
}

+ (UIImageSymbolConfiguration)configurationWithTextStyle:(UIFontTextStyle)textStyle
{
  id v4 = textStyle;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _init];
  id v6 = (void *)v5[10];
  v5[10] = v4;

  return (UIImageSymbolConfiguration *)v5;
}

+ (UIImageSymbolConfiguration)configurationWithScale:(UIImageSymbolScale)scale
{
  id v4 = (void *)[objc_alloc((Class)a1) _init];
  v4[8] = scale;
  return (UIImageSymbolConfiguration *)v4;
}

- (id)description
{
  if ([(UIImageSymbolConfiguration *)self _isUnspecified])
  {
    if (![(UIImageSymbolConfiguration *)self _suppressesMaterialRendering])
    {
      id v3 = 0;
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  if (self)
  {
    if (self->_textStyle)
    {
      [(UIImageSymbolConfiguration *)self pointSizeForScalingWithTextStyle];
      double v5 = v4;
      id v6 = NSString;
      uint64_t v7 = [(UIImageSymbolConfiguration *)self textStyle];
      id v8 = (void *)v7;
      if (v5 <= 0.0) {
        [v6 stringWithFormat:@"textStyle=%@", v7, v40];
      }
      else {
      double v9 = [v6 stringWithFormat:@"textStyle=%@ (scaled from %gpt)", v7, *(void *)&v5];
      }
    }
    else if (*(unsigned char *)&self->_configFlags)
    {
      double v9 = objc_msgSend(NSString, "stringWithFormat:", @"pointSize=%g", *(void *)&self->_pointSize);
    }
    else
    {
      double v9 = 0;
    }
    if (self->_weight)
    {
      unint64_t v10 = [(UIImageSymbolConfiguration *)self weight];
      if (v10 > 9)
      {
        v11 = 0;
        if (v9) {
          goto LABEL_16;
        }
      }
      else
      {
        v11 = off_1E5310868[v10];
        if (v9)
        {
LABEL_16:
          uint64_t v12 = [v9 stringByAppendingFormat:@", weight=%@", v11];

          double v9 = (void *)v12;
          goto LABEL_19;
        }
      }
      double v9 = [NSString stringWithFormat:@"weight=%@", v11];
    }
  }
  else
  {
    double v9 = 0;
  }
LABEL_19:
  if (![(UIImageSymbolConfiguration *)self _hasSpecifiedScale]) {
    goto LABEL_23;
  }
  int64_t v13 = [(UIImageSymbolConfiguration *)self scale];
  if ((unint64_t)(v13 + 1) > 4)
  {
    double v14 = @"?";
    if (v9) {
      goto LABEL_22;
    }
LABEL_28:
    double v9 = [NSString stringWithFormat:@"scale=%@", v14];
    if (!self) {
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  double v14 = off_1E5310840[v13 + 1];
  if (!v9) {
    goto LABEL_28;
  }
LABEL_22:
  uint64_t v15 = [v9 stringByAppendingFormat:@", scale=%@", v14];

  double v9 = (void *)v15;
LABEL_23:
  if (!self) {
    goto LABEL_32;
  }
LABEL_24:
  namedColorStyles = self->_namedColorStyles;
  if (namedColorStyles)
  {
    if (v9)
    {
      double v17 = [(NSDictionary *)namedColorStyles allKeys];
      double v18 = [v17 componentsJoinedByString:@","];
      uint64_t v19 = [v9 stringByAppendingFormat:@", styled colors (%@)", v18];

      double v9 = (void *)v19;
    }
    else
    {
      double v20 = NSString;
      double v17 = [(NSDictionary *)namedColorStyles allKeys];
      double v18 = [v17 componentsJoinedByString:@","];
      double v9 = [v20 stringWithFormat:@"styled colors (%@)", v18];
    }
  }
LABEL_32:
  if ([(UIImageSymbolConfiguration *)self _hasSpecifiedHierarchicalColors])
  {
    $F7261812317C211F76CC117B9D7B19F5 v21 = NSString;
    uint64_t v22 = [(NSArray *)self->_colors componentsJoinedByString:@","];
    [v21 stringWithFormat:@"hierarchical color (%@)", v22];
  }
  else
  {
    if (![(UIImageSymbolConfiguration *)self _hasSpecifiedPaletteColors])
    {
      double v24 = 0;
      if (v9) {
        goto LABEL_37;
      }
      goto LABEL_39;
    }
    double v23 = NSString;
    uint64_t v22 = [(NSArray *)self->_colors componentsJoinedByString:@","];
    [v23 stringWithFormat:@"palette colors (%@)", v22];
  double v24 = };

  if (v9)
  {
LABEL_37:
    id v3 = [v9 stringByAppendingFormat:@", %@", v24];

    goto LABEL_40;
  }
LABEL_39:
  id v3 = v24;
LABEL_40:
  if ([(UIImageSymbolConfiguration *)self _prefersMulticolor])
  {
    if (v3)
    {
      double v25 = @", prefers multicolor";
LABEL_46:
      uint64_t v26 = [(__CFString *)v3 stringByAppendingString:v25];

      id v3 = (__CFString *)v26;
      goto LABEL_49;
    }
    id v3 = @"prefers multicolor";
  }
  else
  {
    if (![(UIImageSymbolConfiguration *)self _prefersMonochrome]) {
      goto LABEL_49;
    }
    if (v3)
    {
      double v25 = @", prefers monochrome";
      goto LABEL_46;
    }
    id v3 = @"prefers monochrome";
  }
LABEL_49:

  if (![(UIImageSymbolConfiguration *)self _suppressesMaterialRendering]) {
    goto LABEL_53;
  }
  if (v3)
  {
    uint64_t v27 = [(__CFString *)v3 stringByAppendingString:@", suppresses material rendering"];

    id v3 = (__CFString *)v27;
    goto LABEL_53;
  }
LABEL_52:
  id v3 = @"suppresses material rendering";
LABEL_53:
  v28 = [(UIImageConfiguration *)self traitCollection];

  if (v28)
  {
    if (v3)
    {
      uint64_t v29 = [(UIImageConfiguration *)self traitCollection];
      int v30 = [v29 _traitsDescription];
      uint64_t v31 = [(__CFString *)v3 stringByAppendingFormat:@", traits=(%@)", v30];

      id v3 = (__CFString *)v31;
    }
    else
    {
      BOOL v32 = NSString;
      uint64_t v29 = [(UIImageConfiguration *)self traitCollection];
      int v30 = [v29 _traitsDescription];
      [v32 stringWithFormat:@"traits=(%@)", v30];
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  double v33 = [(UIImageConfiguration *)self locale];

  if (v33)
  {
    if (v3)
    {
      double v34 = [(UIImageConfiguration *)self locale];
      uint64_t v35 = [(__CFString *)v3 stringByAppendingFormat:@", locale=(%@)", v34];

      id v3 = (__CFString *)v35;
    }
    else
    {
      BOOL v36 = NSString;
      double v34 = [(UIImageConfiguration *)self locale];
      [v36 stringWithFormat:@"locale=(%@)", v34];
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v3) {
    BOOL v37 = v3;
  }
  else {
    BOOL v37 = @"unspecified";
  }
  BOOL v38 = v37;

  return v38;
}

- (unint64_t)hash
{
  int64_t v3 = self->_weight ^ self->_scale;
  unint64_t v4 = vcvtmd_u64_f64(self->_pointSize * 100.0);
  NSUInteger v5 = v3 ^ [(NSString *)self->_textStyle hash];
  id v6 = [(NSArray *)self->_colors firstObject];
  uint64_t v7 = v5 ^ [v6 hash];
  v10.receiver = self;
  v10.super_class = (Class)UIImageSymbolConfiguration;
  unint64_t v8 = v7 ^ [(UIImageConfiguration *)&v10 hash] ^ v4;

  return v8;
}

- (void)_deriveGlyphSize:(int64_t *)a3 weight:(int64_t *)a4 pointSize:(double *)a5
{
  [off_1E52D39B8 defaultFontSize];
  double v10 = v9;
  v11 = [(UIImageConfiguration *)self _effectiveTraitCollectionForImageLookup];
  if ([(UIImageSymbolConfiguration *)self _hasSpecifiedScale])
  {
    unint64_t v12 = [(UIImageSymbolConfiguration *)self scale] + 1;
    if (v12 > 4)
    {
      int64_t v13 = 0;
      if (!self)
      {
LABEL_30:
        uint64_t v26 = 4;
        goto LABEL_19;
      }
    }
    else
    {
      int64_t v13 = qword_186B9E660[v12];
      if (!self) {
        goto LABEL_30;
      }
    }
  }
  else
  {
    int64_t v13 = 2;
    if (!self) {
      goto LABEL_30;
    }
  }
  if (!self->_textStyle)
  {
    if (*(unsigned char *)&self->_configFlags)
    {
      double pointSize = self->_pointSize;
      [(UIImageSymbolConfiguration *)self customFontPointSizeMultiplier];
      double v10 = pointSize * v25;
    }
    if (self->_weight)
    {
      uint64_t v26 = [(UIImageSymbolConfiguration *)self weight];
      goto LABEL_19;
    }
    goto LABEL_30;
  }
  double v14 = [(UIImageSymbolConfiguration *)self textStyle];
  uint64_t v15 = [v11 preferredContentSizeCategory];
  double v16 = [off_1E52D39B8 _normalizedContentSizeCategory:v15 default:0];

  CTFontDescriptorGetTextStyleSize();
  double v18 = v17;
  [(UIImageSymbolConfiguration *)self pointSizeForScalingWithTextStyle];
  if (v19 > 0.0)
  {
    +[UIFontMetrics scaledValueForValue:v14 withTextStyle:v11 bodyLeading:self->_pointSize compatibleWithTraitCollection:0.0];
    double v18 = v20;
  }
  [(UIImageSymbolConfiguration *)self customFontPointSizeMultiplier];
  double v22 = v21;
  if (self->_weight) {
    uint64_t v23 = [(UIImageSymbolConfiguration *)self weight];
  }
  else {
    uint64_t v23 = UISIndexForFontWeight();
  }
  uint64_t v26 = v23;
  double v10 = v18 * v22;

LABEL_19:
  if ([v11 legibilityWeight] == 1)
  {
    UISFontWeightForIndex();
    CTFontGetAccessibilityBoldWeightOfWeight();
    uint64_t v26 = UISIndexForFontWeight();
  }
  int64_t v27 = 4;
  if ((unint64_t)(v26 - 1) < 9) {
    int64_t v27 = v26;
  }
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v27;
  }
  if (a5) {
    *a5 = v10;
  }
}

+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize weight:(UIImageSymbolWeight)weight
{
  uint64_t v6 = [objc_alloc((Class)a1) _init];
  if (pointSize <= 0.0)
  {
    [off_1E52D39B8 defaultFontSize];
    double pointSize = v7;
  }
  if (v6)
  {
    double v8 = 0.0;
    if (pointSize >= 0.0) {
      double v8 = pointSize;
    }
    *(double *)(v6 + 32) = v8;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  *(void *)(v6 + 72) = weight;
  return (UIImageSymbolConfiguration *)(id)v6;
}

+ (UIImageSymbolConfiguration)configurationWithFont:(UIFont *)font scale:(UIImageSymbolScale)scale
{
  double result = (UIImageSymbolConfiguration *)[a1 configurationWithFont:font];
  result->_scale = scale;
  return result;
}

+ (UIImageSymbolConfiguration)configurationWithFont:(UIFont *)font
{
  int64_t v3 = font;
  id v4 = [(UIImageConfiguration *)[UIImageSymbolConfiguration alloc] _init];
  NSUInteger v5 = [(UIFont *)v3 _textStyle];
  int v6 = dyld_program_sdk_at_least() ^ 1;
  double v7 = [(UIFont *)v3 textStyleForScaling];
  if (v7)
  {
  }
  else if ([(id)objc_opt_class() _isSupportedDynamicFontTextStyle:v5])
  {
    goto LABEL_9;
  }
  double v8 = [(UIFont *)v3 textStyleForScaling];
  if (v8)
  {
    double v9 = objc_opt_class();
    double v10 = [(UIFont *)v3 textStyleForScaling];
    LODWORD(v9) = [v9 _isSupportedDynamicFontTextStyle:v10];

    if (v9)
    {
      double v8 = [(UIFont *)v3 textStyleForScaling];
      int v6 = 1;
    }
    else
    {
      double v8 = 0;
    }
  }

  NSUInteger v5 = v8;
LABEL_9:
  CTFontGetWeight();
  *((void *)v4 + 9) = UISIndexForFontWeight();
  if (v5)
  {
    if (v6)
    {
      [(UIFont *)v3 pointSizeForScaling];
      if (v11 < 0.0) {
        double v11 = 0.0;
      }
      *((double *)v4 + 4) = v11;
      *((unsigned char *)v4 + 40) &= ~1u;
      goto LABEL_22;
    }
    if (!dyld_program_sdk_at_least())
    {
LABEL_22:
      objc_storeStrong((id *)v4 + 10, v5);
      goto LABEL_25;
    }
    int64_t v13 = [off_1E52D39B8 _normalizedContentSizeCategory:0 default:0];
    CTFontDescriptorGetTextStyleSize();
    double v15 = v14;
    [(UIFont *)v3 pointSize];
    if (v15 == v16)
    {
      objc_storeStrong((id *)v4 + 10, v5);
    }
    else
    {
      [(UIFont *)v3 pointSize];
      if (v17 < 0.0) {
        double v17 = 0.0;
      }
      *((double *)v4 + 4) = v17;
      *((unsigned char *)v4 + 40) |= 1u;
    }
  }
  else
  {
    [(UIFont *)v3 pointSize];
    if (v12 < 0.0) {
      double v12 = 0.0;
    }
    *((double *)v4 + 4) = v12;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_25:
  double v18 = CTFontGetUIFontDesign();
  double v19 = *(void **)off_1E52D6B80;
  id v20 = v18;
  id v21 = v19;
  if (v20 == v21)
  {

    goto LABEL_40;
  }
  double v22 = v21;
  if (!v20 || !v21)
  {

    goto LABEL_32;
  }
  char v23 = [v20 isEqual:v21];

  if ((v23 & 1) == 0)
  {
LABEL_32:
    [(UIFont *)v3 pointSize];
    CTFontGetCapHeightForSystemFontOfSize();
    double v25 = v24;
    [(UIFont *)v3 capHeight];
    if (v25 == 0.0 || v26 == 0.0)
    {
      CTFontGetAscentForSystemFontOfSize();
      double v29 = v28;
      CTFontGetDescentForSystemFontOfSize();
      double v31 = v29 + v30;
      [(UIFont *)v3 lineHeight];
      if (v31 == 0.0 || v32 == 0.0)
      {
        *((void *)v4 + 11) = 0x3FF0000000000000;
        goto LABEL_40;
      }
      double v27 = v32 / v31;
    }
    else
    {
      double v27 = v26 / v25;
    }
    *((double *)v4 + 11) = v27;
  }
LABEL_40:

  return (UIImageSymbolConfiguration *)v4;
}

+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize weight:(UIImageSymbolWeight)weight scale:(UIImageSymbolScale)scale
{
  uint64_t v8 = [objc_alloc((Class)a1) _init];
  if (pointSize <= 0.0)
  {
    [off_1E52D39B8 defaultFontSize];
    double pointSize = v9;
  }
  if (v8)
  {
    double v10 = 0.0;
    if (pointSize >= 0.0) {
      double v10 = pointSize;
    }
    *(double *)(v8 + 32) = v10;
    *(unsigned char *)(v8 + 40) |= 1u;
  }
  *(void *)(v8 + 72) = weight;
  *(void *)(v8 + 64) = scale;
  return (UIImageSymbolConfiguration *)(id)v8;
}

+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize
{
  uint64_t v4 = [objc_alloc((Class)a1) _init];
  if (pointSize <= 0.0)
  {
    [off_1E52D39B8 defaultFontSize];
    double pointSize = v5;
  }
  if (v4)
  {
    double v6 = 0.0;
    if (pointSize >= 0.0) {
      double v6 = pointSize;
    }
    *(double *)(v4 + 32) = v6;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  return (UIImageSymbolConfiguration *)(id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIImageSymbolConfiguration;
  [(UIImageConfiguration *)&v12 encodeWithCoder:v4];
  if (![(UIImageSymbolConfiguration *)self _isUnspecified])
  {
    if ([(UIImageSymbolConfiguration *)self _hasSpecifiedScale]) {
      [v4 encodeInteger:self->_scale forKey:@"UISymbolScale"];
    }
    double pointSize = self->_pointSize;
    if (pointSize != 0.0)
    {
      *(float *)&double pointSize = pointSize;
      [v4 encodeFloat:@"UIPointSize" forKey:pointSize];
    }
    double customFontPointSizeMultiplier = self->_customFontPointSizeMultiplier;
    if (customFontPointSizeMultiplier != 1.0)
    {
      *(float *)&double customFontPointSizeMultiplier = customFontPointSizeMultiplier;
      [v4 encodeFloat:@"UIPointSizeScaleFactor" forKey:customFontPointSizeMultiplier];
    }
    int64_t weight = self->_weight;
    if (weight) {
      [v4 encodeInt:weight forKey:@"UISymbolWeight"];
    }
    textStyle = self->_textStyle;
    if (textStyle) {
      [v4 encodeObject:textStyle forKey:@"UITextStyle"];
    }
    namedColorStyles = self->_namedColorStyles;
    if (namedColorStyles) {
      [v4 encodeObject:namedColorStyles forKey:@"UINamedColorStyles"];
    }
    colors = self->_colors;
    if (colors)
    {
      [v4 encodeObject:colors forKey:@"UIHierarchicalColors"];
      [v4 encodeBool:(*(unsigned char *)&self->_configFlags >> 1) & 1 forKey:@"UIDerivativeHierarchicalColors"];
    }
    char configFlags = (char)self->_configFlags;
    if ((configFlags & 8) != 0)
    {
      [v4 encodeBool:1 forKey:@"UISpecifiedPrefersMulticolor"];
      [v4 encodeBool:(*(unsigned char *)&self->_configFlags >> 2) & 1 forKey:@"UIPrefersMulticolor"];
      char configFlags = (char)self->_configFlags;
    }
    if ((configFlags & 0x20) != 0)
    {
      [v4 encodeBool:1 forKey:@"UISpecifiedPrefersMonochrome"];
      [v4 encodeBool:(*(unsigned char *)&self->_configFlags >> 4) & 1 forKey:@"UIPrefersMonochrome"];
    }
    if ([(UIImageSymbolConfiguration *)self _suppressesMaterialRendering]) {
      [v4 encodeBool:(*(unsigned char *)&self->_configFlags >> 6) & 1 forKey:@"UISuppressesMaterialRendering"];
    }
  }
}

- (id)_paletteColorsWithEffect:(id)a3 shouldResolveDynamicColors:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [a3 traitCollection];
  if (!v6)
  {
    double v6 = +[UITraitCollection currentTraitCollection];
  }
  double v7 = (void *)[(NSArray *)self->_colors mutableCopy];
  if ([v7 count])
  {
    uint64_t v8 = 0;
    if (v6) {
      BOOL v9 = v4;
    }
    else {
      BOOL v9 = 0;
    }
    while (1)
    {
      double v10 = [v7 objectAtIndexedSubscript:v8];
      double v11 = +[UIColor tintColor];

      if (v10 == v11) {
        break;
      }
      if (v9) {
        goto LABEL_9;
      }
LABEL_10:
      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_14;
      }
    }
    double v14 = _TintColorFromTraitCollection(v6);
    [v7 setObject:v14 atIndexedSubscript:v8];

    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    objc_super v12 = [v7 objectAtIndexedSubscript:v8];
    int64_t v13 = [v12 resolvedColorWithTraitCollection:v6];
    [v7 setObject:v13 atIndexedSubscript:v8];

    goto LABEL_10;
  }
LABEL_14:
  double v15 = (void *)[v7 copy];

  return v15;
}

- (id)_paletteColorsWithEffect:(id)a3
{
  return [(UIImageSymbolConfiguration *)self _paletteColorsWithEffect:a3 shouldResolveDynamicColors:1];
}

- (id)_hierarchicalColorForLayerLevel:(int64_t)a3 effect:(id)a4 shouldResolveDynamicColors:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a4 traitCollection];
  if (!v8)
  {
    uint64_t v8 = +[UITraitCollection currentTraitCollection];
  }
  NSUInteger v9 = [(NSArray *)self->_colors count];
  if (v9 < 2)
  {
    double v14 = [(NSArray *)self->_colors firstObject];
    double v15 = +[UIColor tintColor];

    if (v14 == v15)
    {
      uint64_t v16 = _TintColorFromTraitCollection(v8);

      double v14 = (void *)v16;
    }
    if ([v8 userInterfaceStyle] == 2)
    {
      double v17 = +[UIColor systemRedColor];
      if ([v14 isEqual:v17])
      {

LABEL_18:
        double v20 = 0.2;
        goto LABEL_19;
      }
      id v21 = +[UIColor systemPinkColor];
      int v22 = [v14 isEqual:v21];

      double v20 = 0.25;
      if (v22) {
        goto LABEL_18;
      }
    }
    else
    {
      double v18 = +[UIColor systemYellowColor];
      int v19 = [v14 isEqual:v18];

      if (v19) {
        double v20 = 0.3;
      }
      else {
        double v20 = 0.25;
      }
    }
LABEL_19:
    if (v5 && v8)
    {
      uint64_t v23 = [v14 resolvedColorWithTraitCollection:v8];

      double v14 = (void *)v23;
    }
    if (a3 == 1)
    {
      [v14 alphaComponent];
      double v26 = v25 * 0.5;
    }
    else
    {
      if (!a3)
      {
        id v24 = v14;
LABEL_28:
        int64_t v13 = v24;

        goto LABEL_29;
      }
      [v14 alphaComponent];
      double v26 = v20 * v27;
    }
    id v24 = [v14 colorWithAlphaComponent:v26];
    goto LABEL_28;
  }
  NSUInteger v10 = v9;
  unint64_t v11 = v9 - 1;
  if (v9 - 1 >= a3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v30 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        int v31 = 134218240;
        NSUInteger v32 = v10;
        __int16 v33 = 2048;
        int64_t v34 = a3;
        _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "Only %lu hierarchical colors specified for a symbol with a layer at level %lu; please adopt +configurationWith"
          "HierarchicalColor: or +configurationWithPaletteColors: API",
          (uint8_t *)&v31,
          0x16u);
      }
    }
    else
    {
      double v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_hierarchicalColorForLayerLevel_effect_shouldResolveDynamicColors____s_category)+ 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v31 = 134218240;
        NSUInteger v32 = v10;
        __int16 v33 = 2048;
        int64_t v34 = a3;
        _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Only %lu hierarchical colors specified for a symbol with a layer at level %lu; please adopt +configurationWith"
          "HierarchicalColor: or +configurationWithPaletteColors: API",
          (uint8_t *)&v31,
          0x16u);
      }
    }
  }
  if (v11 >= a3) {
    int64_t v12 = a3;
  }
  else {
    int64_t v12 = v11;
  }
  int64_t v13 = [(NSArray *)self->_colors objectAtIndexedSubscript:v12];
LABEL_29:

  return v13;
}

- (id)_hierarchicalColorForLayerLevel:(int64_t)a3 effect:(id)a4
{
  return [(UIImageSymbolConfiguration *)self _hierarchicalColorForLayerLevel:a3 effect:a4 shouldResolveDynamicColors:1];
}

- (id)_resolvedColorForNamedStyle:(id)a3 effect:(id)a4
{
  id v6 = a3;
  double v7 = (id *)a4;
  uint64_t v8 = v7;
  if (v7) {
    id WeakRetained = objc_loadWeakRetained(v7 + 2);
  }
  else {
    id WeakRetained = 0;
  }
  NSUInteger v10 = [WeakRetained traitCollection];

  if (!v10)
  {
    NSUInteger v10 = +[UITraitCollection currentTraitCollection];
  }
  unint64_t v11 = [(UIImageSymbolConfiguration *)self _namedColorStyles];
  int64_t v12 = [v11 objectForKeyedSubscript:v6];

  if (v12) {
    goto LABEL_22;
  }
  int64_t v12 = +[UIColor _systemColorWithUnvalidatedName:v6];
  if (v12) {
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"white"])
  {
    uint64_t v13 = +[UIColor whiteColor];
  }
  else
  {
    if (![v6 isEqualToString:@"black"]) {
      goto LABEL_12;
    }
    uint64_t v13 = +[UIColor blackColor];
  }
  int64_t v12 = (void *)v13;
  if (v13) {
    goto LABEL_22;
  }
LABEL_12:
  if (([v6 isEqualToString:@"controlAccentColor"] & 1) == 0
    && ![v6 isEqualToString:@"tintColor"]
    || (+[UIColor tintColor],
        (int64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v8)
    {
      id v14 = objc_loadWeakRetained(v8 + 3);
      double v15 = v14;
      if (v14)
      {
        int64_t v12 = [v14 _colorForName:v6 withTraitCollection:v10];
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      double v15 = 0;
    }
    int64_t v12 = 0;
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v16 = +[UIColor tintColor];

  if (v12 == v16)
  {
    uint64_t v17 = _TintColorFromTraitCollection(v10);

    int64_t v12 = (void *)v17;
  }
  double v18 = [v12 resolvedColorWithTraitCollection:v10];

  return v18;
}

void __55__UIImageSymbolConfiguration__unspecifiedConfiguration__block_invoke()
{
  id v0 = [(UIImageConfiguration *)[UIImageSymbolConfiguration alloc] _init];
  v1 = (void *)qword_1EB25D748;
  qword_1EB25D748 = (uint64_t)v0;
}

+ (id)_configurationWithHierarchicalColors:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    uint64_t v5 = +[UIColor tintColor];
    goto LABEL_5;
  }
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 firstObject];
LABEL_5:
    id v6 = (void *)v5;
    double v7 = [a1 configurationWithHierarchicalColor:v5];

    goto LABEL_7;
  }
  double v7 = [a1 configurationWithPaletteColors:v4];
LABEL_7:

  return v7;
}

+ (UIImageSymbolConfiguration)configurationWithPaletteColors:(NSArray *)paletteColors
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = paletteColors;
  if (!v4)
  {
    uint64_t v5 = +[UIColor tintColor];
    v8[0] = v5;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  id v6 = (void *)[objc_alloc((Class)a1) _init];
  -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v6, 0, v4);

  return (UIImageSymbolConfiguration *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UIImageSymbolConfiguration)configurationWithWeight:(UIImageSymbolWeight)weight
{
  id v4 = (void *)[objc_alloc((Class)a1) _init];
  v4[9] = weight;
  return (UIImageSymbolConfiguration *)v4;
}

+ (UIImageSymbolConfiguration)configurationPreferringMulticolor
{
  char v2 = (void *)[objc_alloc((Class)self) _init];
  -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v2, 1);
  return (UIImageSymbolConfiguration *)v2;
}

+ (id)_configurationWithNamedColorStyles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _init];
  uint64_t v6 = [v4 copy];

  double v7 = (void *)v5[6];
  v5[6] = v6;

  -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v5, 1);
  return v5;
}

- (UIImageSymbolConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIImageSymbolConfiguration;
  uint64_t v5 = [(UIImageConfiguration *)&v25 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"UISymbolScale"]) {
      v5->_scale = [v4 decodeIntegerForKey:@"UISymbolScale"];
    }
    if ([v4 containsValueForKey:@"UIPointSizeScaleFactor"])
    {
      [v4 decodeFloatForKey:@"UIPointSizeScaleFactor"];
      v5->_double customFontPointSizeMultiplier = v6;
    }
    if ([v4 containsValueForKey:@"UISymbolWeight"]) {
      v5->_int64_t weight = [v4 decodeIntegerForKey:@"UISymbolWeight"];
    }
    if ([v4 containsValueForKey:@"UITextStyle"])
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITextStyle"];
      textStyle = v5->_textStyle;
      v5->_textStyle = (NSString *)v7;
    }
    if ([v4 containsValueForKey:@"UIPointSize"])
    {
      BOOL v9 = v5->_textStyle == 0;
      [v4 decodeFloatForKey:@"UIPointSize"];
      double v11 = v10;
      if (v11 < 0.0) {
        double v11 = 0.0;
      }
      v5->_double pointSize = v11;
      *(unsigned char *)&v5->_char configFlags = *(unsigned char *)&v5->_configFlags & 0xFE | v9;
    }
    if ([v4 containsValueForKey:@"UINamedColorStyles"])
    {
      int64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      double v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
      uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"UINamedColorStyles"];
      namedColorStyles = v5->_namedColorStyles;
      v5->_namedColorStyles = (NSDictionary *)v16;

      -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v5, 1);
    }
    if ([v4 containsValueForKey:@"UIHierarchicalColors"])
    {
      double v18 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      id v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
      int v22 = [v4 decodeObjectOfClasses:v21 forKey:@"UIHierarchicalColors"];

      -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v5, [v4 decodeBoolForKey:@"UIDerivativeHierarchicalColors"], v22);
    }
    if ([v4 containsValueForKey:@"UISpecifiedPrefersMulticolor"]
      && [v4 decodeBoolForKey:@"UISpecifiedPrefersMulticolor"])
    {
      -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v5, [v4 decodeBoolForKey:@"UIPrefersMulticolor"]);
    }
    if ([v4 containsValueForKey:@"UISpecifiedPrefersMonochrome"]
      && [v4 decodeBoolForKey:@"UISpecifiedPrefersMonochrome"])
    {
      -[UIImageSymbolConfiguration _setPrefersMonochrome:]((uint64_t)v5, [v4 decodeBoolForKey:@"UIPrefersMonochrome"]);
    }
    if ([v4 containsValueForKey:@"UISuppressesMaterialRendering"])
    {
      if ([v4 decodeBoolForKey:@"UISuppressesMaterialRendering"]) {
        char v23 = 64;
      }
      else {
        char v23 = 0;
      }
      *(unsigned char *)&v5->_char configFlags = *(unsigned char *)&v5->_configFlags & 0xBF | v23;
    }
  }

  return v5;
}

- (id)_configurationByReplacingColors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(UIImageSymbolConfiguration *)self copy];
  uint64_t v6 = [v4 copy];

  uint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (id)_configurationSuppressingMaterialRendering
{
  char v2 = (unsigned char *)[(UIImageSymbolConfiguration *)self copy];
  if (v2) {
    v2[40] |= 0x40u;
  }
  return v2;
}

- (void)_clearSpecificsExceptScale
{
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) &= ~1u;
  *(void *)(a1 + 72) = 0;
  v1 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = 0;
}

- (BOOL)_hasColorConfigurationWithTintColor
{
  if (self)
  {
    char v2 = self;
    namedColorStyles = self->_namedColorStyles;
    if (namedColorStyles
      && ([(NSDictionary *)namedColorStyles objectForKeyedSubscript:@"tintColor"],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      LOBYTE(self) = 1;
    }
    else
    {
      colors = v2->_colors;
      if (colors)
      {
        uint64_t v6 = +[UIColor tintColor];
        BOOL v7 = [(NSArray *)colors containsObject:v6];

        LOBYTE(self) = v7;
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  return (char)self;
}

- (UIImageSymbolConfiguration)configurationWithoutTextStyle
{
  if (self)
  {
    if (self->_textStyle)
    {
      int64_t v3 = (UIImageSymbolConfiguration *)[(UIImageSymbolConfiguration *)self copy];
      id v4 = [(UIImageConfiguration *)v3 traitCollection];
      uint64_t v5 = [v4 preferredContentSizeCategory];

      p_double pointSize = (UIImageSymbolConfiguration *)&v3->_pointSize;
      if (v5 == @"_UICTContentSizeCategoryUnspecified")
      {
        p_pointSize->super.super.isa = 0;
        char v7 = *(unsigned char *)&v3->_configFlags & 0xFE;
      }
      else
      {
        [(UIImageSymbolConfiguration *)self _deriveGlyphSize:0 weight:0 pointSize:p_pointSize];
        char v7 = *(unsigned char *)&v3->_configFlags | 1;
      }
      *(unsigned char *)&v3->_char configFlags = v7;
      textStyle = v3->_textStyle;
      v3->_textStyle = 0;
    }
    else
    {
      int64_t v3 = self;
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (UIImageSymbolConfiguration)configurationWithoutScale
{
  if (self)
  {
    if (self->_scale)
    {
      self = (UIImageSymbolConfiguration *)[(UIImageSymbolConfiguration *)self copy];
      self->_scale = 0;
    }
    else
    {
      self = self;
    }
    uint64_t v2 = vars8;
  }
  return self;
}

- (UIImageSymbolConfiguration)configurationWithoutWeight
{
  if (self)
  {
    if (self->_weight)
    {
      self = (UIImageSymbolConfiguration *)[(UIImageSymbolConfiguration *)self copy];
      self->_int64_t weight = 0;
    }
    else
    {
      self = self;
    }
    uint64_t v2 = vars8;
  }
  return self;
}

- (UIImageSymbolConfiguration)configurationWithoutPointSizeAndWeight
{
  if (self)
  {
    if ((*(unsigned char *)&self->_configFlags & 1) != 0 || self->_weight)
    {
      self = (UIImageSymbolConfiguration *)[(UIImageSymbolConfiguration *)self copy];
      *(unsigned char *)&self->_configFlags &= ~1u;
      self->_double pointSize = 0.0;
      self->_int64_t weight = 0;
    }
    else
    {
      self = self;
    }
    uint64_t v2 = vars8;
  }
  return self;
}

- (id)debugDescription
{
  int64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(UIImageSymbolConfiguration *)self description];
  char v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (BOOL)_isEquivalentToConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)UIImageSymbolConfiguration;
    BOOL v5 = [(UIImageConfiguration *)&v21 _isEquivalentToConfiguration:v4];
    goto LABEL_8;
  }
  if (![(UIImageSymbolConfiguration *)self _isUnspecified]
    && ([v4 _isUnspecified] & 1) == 0)
  {
    if ([(UIImageSymbolConfiguration *)self _hasSpecifiedScale]
      && [v4 _hasSpecifiedScale])
    {
      int64_t v7 = [(UIImageSymbolConfiguration *)self scale];
      uint64_t v8 = [v4 scale];
      goto LABEL_28;
    }
    if (self)
    {
      if (self->_textStyle)
      {
        if (!v4) {
          goto LABEL_30;
        }
        if (*((void *)v4 + 10))
        {
          BOOL v9 = [(UIImageSymbolConfiguration *)self textStyle];
          float v10 = [v4 textStyle];
          id v11 = v9;
          id v12 = v10;
          uint64_t v13 = v12;
          if (v11 == v12)
          {
          }
          else
          {
            if (!v11 || !v12)
            {

LABEL_39:
              goto LABEL_6;
            }
            int v14 = [v11 isEqual:v12];

            if (!v14) {
              goto LABEL_39;
            }
          }
          [(UIImageSymbolConfiguration *)self pointSizeForScalingWithTextStyle];
          double v18 = v17;
          [v4 pointSizeForScalingWithTextStyle];
          double v20 = v19;

          if (v18 != v20) {
            goto LABEL_6;
          }
LABEL_36:
          char v16 = 1;
          goto LABEL_37;
        }
      }
      if (*(unsigned char *)&self->_configFlags & 1) != 0 && v4 && (*((unsigned char *)v4 + 40))
      {
        if (self->_pointSize != *((double *)v4 + 4)) {
          goto LABEL_6;
        }
        goto LABEL_36;
      }
      if (self->_weight && v4 && *((void *)v4 + 9))
      {
        int64_t v7 = [(UIImageSymbolConfiguration *)self weight];
        uint64_t v8 = [v4 weight];
LABEL_28:
        if (v7 != v8) {
          goto LABEL_6;
        }
        goto LABEL_36;
      }
    }
LABEL_30:
    v22.receiver = self;
    v22.super_class = (Class)UIImageSymbolConfiguration;
    unsigned int v15 = [(UIImageConfiguration *)&v22 _isEquivalentToConfiguration:v4];
    char v16 = 0;
    BOOL v5 = 0;
    if (!v15) {
      goto LABEL_8;
    }
LABEL_37:
    BOOL v5 = v16;
    goto LABEL_8;
  }
LABEL_6:
  BOOL v5 = 0;
LABEL_8:

  return v5;
}

@end