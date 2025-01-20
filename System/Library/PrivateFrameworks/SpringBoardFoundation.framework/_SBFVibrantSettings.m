@interface _SBFVibrantSettings
+ (id)vibrantSettingsWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5;
- (BOOL)isEqual:(id)a3;
- (UIColor)chevronShimmerColor;
- (UIColor)highlightColor;
- (UIColor)highlightLimitingColor;
- (UIColor)referenceColor;
- (UIColor)shimmerColor;
- (UIColor)tintColor;
- (_SBFVibrantSettings)initWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5;
- (_UILegibilitySettings)legibilitySettings;
- (double)referenceContrast;
- (id)_computeSourceColorDodgeColorForDestinationColor:(id)a3 producingLuminanceChange:(double)a4;
- (id)highlightLimitingViewWithFrame:(CGRect)a3;
- (id)tintViewWithFrame:(CGRect)a3;
- (int64_t)_style;
- (int64_t)style;
- (unint64_t)hash;
- (void)setChevronShimmerColor:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightLimitingColor:(id)a3;
- (void)setShimmerColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _SBFVibrantSettings

+ (id)vibrantSettingsWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithReferenceColor:v9 referenceContrast:v8 legibilitySettings:a4];

  return v10;
}

- (_SBFVibrantSettings)initWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SBFVibrantSettings;
  v10 = [(_SBFVibrantSettings *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    referenceColor = v10->_referenceColor;
    v10->_referenceColor = (UIColor *)v11;

    v10->_referenceContrast = a4;
    objc_storeStrong((id *)&v10->_legibilitySettings, a5);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBFVibrantSettings *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      referenceColor = self->_referenceColor;
      if ((unint64_t)referenceColor | (unint64_t)v4->_referenceColor) {
        char v6 = -[UIColor isEqual:](referenceColor, "isEqual:");
      }
      else {
        char v6 = 1;
      }
      double v8 = vabdd_f64(self->_referenceContrast, v4->_referenceContrast);
      legibilitySettings = self->_legibilitySettings;
      if ((unint64_t)legibilitySettings | (unint64_t)v4->_legibilitySettings) {
        char v10 = -[_UILegibilitySettings isEqual:](legibilitySettings, "isEqual:");
      }
      else {
        char v10 = 1;
      }
      if (v8 < 0.00000011920929) {
        char v11 = v6;
      }
      else {
        char v11 = 0;
      }
      char v7 = v11 & v10;
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  double v3 = self->_referenceContrast + (double)(unint64_t)[(UIColor *)self->_referenceColor hash];
  return (unint64_t)(v3
                          + (double)(unint64_t)[(_UILegibilitySettings *)self->_legibilitySettings hash]);
}

- (int64_t)_style
{
  if (!self->_style)
  {
    self->_style = -1;
    if (self->_referenceColor)
    {
      if (!UIAccessibilityIsReduceTransparencyEnabled())
      {
        uint64_t v12 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        _SBFGetRGBAValuesForColor(self->_referenceColor, &v12, &v11, &v10, 0);
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        uint64_t v7 = 0;
        _SBFGetHSBAValuesForColor(self->_referenceColor, &v9, &v8, &v7, 0);
        legibilitySettings = self->_legibilitySettings;
        if (!legibilitySettings || [(_UILegibilitySettings *)legibilitySettings style] == 1)
        {
          int64_t v5 = 1;
LABEL_8:
          self->_style = v5;
          return self->_style;
        }
        char v6 = self->_legibilitySettings;
        if (v6 && [(_UILegibilitySettings *)v6 style] == 2)
        {
          int64_t v5 = 2;
          goto LABEL_8;
        }
      }
    }
  }
  return self->_style;
}

- (UIColor)tintColor
{
  tintColor = self->_tintColor;
  if (!tintColor)
  {
    int64_t v4 = [(_SBFVibrantSettings *)self _style];
    if (v4 == -1)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings && [(_UILegibilitySettings *)legibilitySettings style] == 2)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F428B8];
        double v11 = 0.0;
        double v12 = 0.5;
      }
      else
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F428B8];
        double v12 = 0.3;
        double v11 = 1.0;
      }
      objc_super v14 = [v10 colorWithWhite:v11 alpha:v12];
      uint64_t v7 = self->_tintColor;
      self->_tintColor = v14;
    }
    else
    {
      if (v4 == 2)
      {
        v13 = self->_legibilitySettings;
        if (v13) {
          [(_UILegibilitySettings *)v13 primaryColor];
        }
        else {
        uint64_t v7 = [MEMORY[0x1E4F428B8] blackColor];
        }
        uint64_t v8 = [v7 colorWithAlphaComponent:0.7];
      }
      else
      {
        if (v4 != 1)
        {
LABEL_17:
          tintColor = self->_tintColor;
          goto LABEL_18;
        }
        referenceColor = self->_referenceColor;
        char v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
        uint64_t v7 = [(UIColor *)referenceColor _colorBlendedWithColor:v6];

        uint64_t v8 = [(_SBFVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v7 producingLuminanceChange:fmin(self->_referenceContrast * self->_referenceContrast * 3.0 + 0.05, 0.35)];
      }
      v15 = self->_tintColor;
      self->_tintColor = v8;
    }
    goto LABEL_17;
  }
LABEL_18:
  v16 = tintColor;
  return v16;
}

- (UIColor)highlightLimitingColor
{
  highlightLimitingColor = self->_highlightLimitingColor;
  if (!highlightLimitingColor)
  {
    if ((unint64_t)([(_SBFVibrantSettings *)self _style] - 1) <= 1)
    {
      int64_t v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.87 alpha:1.0];
      int64_t v5 = self->_highlightLimitingColor;
      self->_highlightLimitingColor = v4;
    }
    highlightLimitingColor = self->_highlightLimitingColor;
  }
  char v6 = highlightLimitingColor;
  return v6;
}

- (UIColor)shimmerColor
{
  shimmerColor = self->_shimmerColor;
  if (!shimmerColor)
  {
    if ([(_SBFVibrantSettings *)self _style] == 1)
    {
      referenceColor = self->_referenceColor;
      int64_t v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
      char v6 = [(UIColor *)referenceColor _colorBlendedWithColor:v5];

      uint64_t v7 = [(_SBFVibrantSettings *)self tintColor];
      uint64_t v8 = [v6 _colorBlendedWithColor:v7 compositingFilter:*MEMORY[0x1E4F3A018]];
      [v8 _luminance];
      uint64_t v10 = [(_SBFVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v8 producingLuminanceChange:fmax(0.98 - v9, 0.2)];
      double v11 = self->_shimmerColor;
      self->_shimmerColor = v10;
    }
    shimmerColor = self->_shimmerColor;
  }
  double v12 = shimmerColor;
  return v12;
}

- (UIColor)chevronShimmerColor
{
  chevronShimmerColor = self->_chevronShimmerColor;
  if (!chevronShimmerColor)
  {
    int64_t v4 = [(_SBFVibrantSettings *)self _style];
    if (v4 == 2)
    {
      double v11 = [MEMORY[0x1E4F428B8] colorWithWhite:0.6 alpha:1.0];
      uint64_t v7 = self->_chevronShimmerColor;
      self->_chevronShimmerColor = v11;
    }
    else
    {
      if (v4 != 1)
      {
LABEL_7:
        chevronShimmerColor = self->_chevronShimmerColor;
        goto LABEL_8;
      }
      referenceColor = self->_referenceColor;
      char v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
      uint64_t v7 = [(UIColor *)referenceColor _colorBlendedWithColor:v6];

      [v7 _luminance];
      double v9 = [(_SBFVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v7 producingLuminanceChange:fmax(0.95 - v8, 0.2)];
      uint64_t v10 = self->_chevronShimmerColor;
      self->_chevronShimmerColor = v9;
    }
    goto LABEL_7;
  }
LABEL_8:
  double v12 = chevronShimmerColor;
  return v12;
}

- (UIColor)highlightColor
{
  highlightColor = self->_highlightColor;
  if (!highlightColor)
  {
    int64_t v4 = [(_SBFVibrantSettings *)self _style];
    if (v4 == 2)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings) {
        [(_UILegibilitySettings *)legibilitySettings primaryColor];
      }
      else {
      uint64_t v7 = [MEMORY[0x1E4F428B8] blackColor];
      }
      v18 = [v7 colorWithAlphaComponent:0.7];
      double v8 = self->_highlightColor;
      self->_highlightColor = v18;
    }
    else
    {
      if (v4 != 1)
      {
LABEL_12:
        highlightColor = self->_highlightColor;
        goto LABEL_13;
      }
      referenceColor = self->_referenceColor;
      char v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
      uint64_t v7 = [(UIColor *)referenceColor _colorBlendedWithColor:v6];

      double v8 = [(_SBFVibrantSettings *)self tintColor];
      double v9 = [v7 _colorBlendedWithColor:v8 compositingFilter:*MEMORY[0x1E4F3A018]];
      [v9 _luminance];
      double v11 = 0.98 - v10;
      double v12 = v11 * 0.75;
      BOOL v13 = v11 <= 0.2;
      double v14 = 0.15;
      if (!v13) {
        double v14 = v12;
      }
      v15 = [(_SBFVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v9 producingLuminanceChange:v14];
      v16 = self->_highlightColor;
      self->_highlightColor = v15;
    }
    goto LABEL_12;
  }
LABEL_13:
  v19 = highlightColor;
  return v19;
}

- (id)_computeSourceColorDodgeColorForDestinationColor:(id)a3 producingLuminanceChange:(double)a4
{
  id v5 = a3;
  [v5 _luminance];
  double v29 = 0.0;
  double v30 = 0.0;
  double v21 = fmin(v6 + a4, 1.0);
  double v28 = 0.0;
  [v5 getRed:&v30 green:&v29 blue:&v28 alpha:0];
  double v26 = 0.0;
  double v27 = 0.0;
  uint64_t v25 = 0;
  _SBFGetHSBAValuesForColor(v5, &v27, &v26, &v25, 0);
  double v26 = v26 * 0.15;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithHue:saturation:brightness:alpha:", v27);
  double v23 = 0.0;
  double v24 = 0.0;
  double v22 = 0.0;
  [v7 getRed:&v24 green:&v23 blue:&v22 alpha:0];
  double v19 = v23 + a4;
  double v20 = v24 + a4;
  double v8 = v22 + a4;
  double v9 = 0.0;
  do
  {
    double v10 = v9 + 1.0 - v24 / v20;
    double v11 = v9 + 1.0 - v23 / v19;
    double v12 = v9 + 1.0 - v22 / v8;
    BOOL v13 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", v30 / (1.0 - v10), v29 / (1.0 - v11), v28 / (1.0 - v12), 1.0, *(void *)&v19, *(void *)&v20);
    [v13 _luminance];
    double v15 = v14;

    double v9 = v9 + 0.01;
  }
  while (v15 < v21 && v9 < 1.0);
  v17 = [MEMORY[0x1E4F428B8] colorWithRed:v10 green:v11 blue:v12 alpha:1.0];

  return v17;
}

- (id)tintViewWithFrame:(CGRect)a3
{
  int64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = [(_SBFVibrantSettings *)self tintColor];
  [v4 setBackgroundColor:v5];

  if ([(_SBFVibrantSettings *)self _style] == 1)
  {
    double v6 = [v4 layer];
    [v6 setCompositingFilter:*MEMORY[0x1E4F3A018]];
  }
  return v4;
}

- (id)highlightLimitingViewWithFrame:(CGRect)a3
{
  int64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = [(_SBFVibrantSettings *)self highlightLimitingColor];
  [v4 setBackgroundColor:v5];

  double v6 = [v4 layer];
  [v6 setCompositingFilter:*MEMORY[0x1E4F3A070]];

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)referenceColor
{
  return self->_referenceColor;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)referenceContrast
{
  return self->_referenceContrast;
}

- (void)setTintColor:(id)a3
{
}

- (void)setShimmerColor:(id)a3
{
}

- (void)setChevronShimmerColor:(id)a3
{
}

- (void)setHighlightColor:(id)a3
{
}

- (void)setHighlightLimitingColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLimitingColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_chevronShimmerColor, 0);
  objc_storeStrong((id *)&self->_shimmerColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_referenceColor, 0);
}

@end