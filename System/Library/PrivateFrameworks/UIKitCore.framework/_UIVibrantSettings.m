@interface _UIVibrantSettings
+ (_UIVibrantSettings)vibrantSettingsWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5;
- (BOOL)isEqual:(id)a3;
- (UIColor)chevronShimmerColor;
- (UIColor)highlightColor;
- (UIColor)highlightLimitingColor;
- (UIColor)referenceColor;
- (UIColor)shimmerColor;
- (UIColor)tintColor;
- (_UILegibilitySettings)legibilitySettings;
- (_UIVibrantSettings)initWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5;
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

@implementation _UIVibrantSettings

+ (_UIVibrantSettings)vibrantSettingsWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithReferenceColor:v9 referenceContrast:v8 legibilitySettings:a4];

  return (_UIVibrantSettings *)v10;
}

- (_UIVibrantSettings)initWithReferenceColor:(id)a3 referenceContrast:(double)a4 legibilitySettings:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UIVibrantSettings;
  v10 = [(_UIVibrantSettings *)&v14 init];
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
  v4 = (_UIVibrantSettings *)a3;
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
  double v3 = self->_referenceContrast + (double)[(UIColor *)self->_referenceColor hash];
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
      if (!_AXSEnhanceBackgroundContrastEnabled())
      {
        referenceColor = self->_referenceColor;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v11 = 0;
        v5 = referenceColor;
        if (CGColorGetNumberOfComponents([(UIColor *)v5 CGColor]) == 2)
        {
          uint64_t v14 = 0;
          [(UIColor *)v5 getWhite:&v14 alpha:0];

          uint64_t v11 = v14;
          uint64_t v12 = v14;
          uint64_t v13 = v14;
        }
        else
        {
          [(UIColor *)v5 getRed:&v13 green:&v12 blue:&v11 alpha:0];
        }
        uint64_t v14 = 0;
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        _UIGetHSBValuesForColor(self->_referenceColor, &v14, &v10, &v9);
        legibilitySettings = self->_legibilitySettings;
        if (!legibilitySettings || [(_UILegibilitySettings *)legibilitySettings style] == 1)
        {
          int64_t v7 = 1;
LABEL_11:
          self->_style = v7;
          return self->_style;
        }
        double v8 = self->_legibilitySettings;
        if (v8 && [(_UILegibilitySettings *)v8 style] == 2)
        {
          int64_t v7 = 2;
          goto LABEL_11;
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
    int64_t v4 = [(_UIVibrantSettings *)self _style];
    if (v4 == -1)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings && [(_UILegibilitySettings *)legibilitySettings style] == 2)
      {
        double v10 = 0.0;
        double v11 = 0.5;
      }
      else
      {
        double v11 = 0.3;
        double v10 = 1.0;
      }
      uint64_t v13 = +[UIColor colorWithWhite:v10 alpha:v11];
      int64_t v7 = self->_tintColor;
      self->_tintColor = v13;
    }
    else
    {
      if (v4 == 2)
      {
        uint64_t v12 = self->_legibilitySettings;
        if (v12) {
          [(_UILegibilitySettings *)v12 primaryColor];
        }
        else {
        int64_t v7 = +[UIColor blackColor];
        }
        double v8 = [v7 colorWithAlphaComponent:0.7];
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
        char v6 = +[UIColor colorWithWhite:1.0 alpha:0.2];
        int64_t v7 = [(UIColor *)referenceColor _colorBlendedWithColor:v6];

        double v8 = [(_UIVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v7 producingLuminanceChange:fmin(self->_referenceContrast * self->_referenceContrast * 3.0 + 0.05, 0.35)];
      }
      uint64_t v14 = self->_tintColor;
      self->_tintColor = v8;
    }
    goto LABEL_17;
  }
LABEL_18:
  v15 = tintColor;
  return v15;
}

- (UIColor)highlightLimitingColor
{
  highlightLimitingColor = self->_highlightLimitingColor;
  if (!highlightLimitingColor)
  {
    if ((unint64_t)([(_UIVibrantSettings *)self _style] - 1) <= 1)
    {
      int64_t v4 = +[UIColor colorWithWhite:0.87 alpha:1.0];
      v5 = self->_highlightLimitingColor;
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
    if ([(_UIVibrantSettings *)self _style] == 1)
    {
      referenceColor = self->_referenceColor;
      v5 = +[UIColor colorWithWhite:1.0 alpha:0.2];
      char v6 = [(UIColor *)referenceColor _colorBlendedWithColor:v5];

      int64_t v7 = [(_UIVibrantSettings *)self tintColor];
      double v8 = [v6 _colorBlendedWithColor:v7 compositingFilter:*MEMORY[0x1E4F3A018]];
      [v8 _luminance];
      double v10 = [(_UIVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v8 producingLuminanceChange:fmax(0.98 - v9, 0.2)];
      double v11 = self->_shimmerColor;
      self->_shimmerColor = v10;
    }
    shimmerColor = self->_shimmerColor;
  }
  uint64_t v12 = shimmerColor;
  return v12;
}

- (UIColor)chevronShimmerColor
{
  chevronShimmerColor = self->_chevronShimmerColor;
  if (!chevronShimmerColor)
  {
    int64_t v4 = [(_UIVibrantSettings *)self _style];
    if (v4 == 2)
    {
      double v11 = +[UIColor colorWithWhite:0.6 alpha:1.0];
      int64_t v7 = self->_chevronShimmerColor;
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
      char v6 = +[UIColor colorWithWhite:1.0 alpha:0.2];
      int64_t v7 = [(UIColor *)referenceColor _colorBlendedWithColor:v6];

      [v7 _luminance];
      double v9 = [(_UIVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v7 producingLuminanceChange:fmax(0.95 - v8, 0.2)];
      double v10 = self->_chevronShimmerColor;
      self->_chevronShimmerColor = v9;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v12 = chevronShimmerColor;
  return v12;
}

- (UIColor)highlightColor
{
  highlightColor = self->_highlightColor;
  if (!highlightColor)
  {
    int64_t v4 = [(_UIVibrantSettings *)self _style];
    if (v4 == 2)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings) {
        [(_UILegibilitySettings *)legibilitySettings primaryColor];
      }
      else {
      int64_t v7 = +[UIColor blackColor];
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
      char v6 = +[UIColor colorWithWhite:1.0 alpha:0.2];
      int64_t v7 = [(UIColor *)referenceColor _colorBlendedWithColor:v6];

      double v8 = [(_UIVibrantSettings *)self tintColor];
      double v9 = [v7 _colorBlendedWithColor:v8 compositingFilter:*MEMORY[0x1E4F3A018]];
      [v9 _luminance];
      double v11 = 0.98 - v10;
      double v12 = v11 * 0.75;
      BOOL v13 = v11 <= 0.2;
      double v14 = 0.15;
      if (!v13) {
        double v14 = v12;
      }
      v15 = [(_UIVibrantSettings *)self _computeSourceColorDodgeColorForDestinationColor:v9 producingLuminanceChange:v14];
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
  double v28 = 0.0;
  double v29 = 0.0;
  double v18 = fmin(v6 + a4, 1.0);
  double v27 = 0.0;
  [v5 getRed:&v29 green:&v28 blue:&v27 alpha:0];
  double v25 = 0.0;
  double v26 = 0.0;
  uint64_t v24 = 0;
  _UIGetHSBValuesForColor(v5, &v26, &v25, &v24);
  double v25 = v25 * 0.15;
  int64_t v7 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v26);
  double v22 = 0.0;
  double v23 = 0.0;
  double v21 = 0.0;
  [v7 getRed:&v23 green:&v22 blue:&v21 alpha:0];
  double v19 = v22 + a4;
  double v20 = v23 + a4;
  double v8 = v21 + a4;
  double v9 = 0.0;
  do
  {
    double v10 = v9 + 1.0 - v23 / v20;
    double v11 = v9 + 1.0 - v22 / v19;
    double v12 = v9 + 1.0 - v21 / v8;
    BOOL v13 = +[UIColor colorWithRed:v29 / (1.0 - v10) green:v28 / (1.0 - v11) blue:v27 / (1.0 - v12) alpha:1.0];
    [v13 _luminance];
    double v15 = v14;

    double v9 = v9 + 0.01;
  }
  while (v9 < 1.0 && v15 < v18);
  v16 = +[UIColor colorWithRed:v10 green:v11 blue:v12 alpha:1.0];

  return v16;
}

- (id)tintViewWithFrame:(CGRect)a3
{
  int64_t v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = [(_UIVibrantSettings *)self tintColor];
  [(UIView *)v4 setBackgroundColor:v5];

  if ([(_UIVibrantSettings *)self _style] == 1)
  {
    double v6 = [(UIView *)v4 layer];
    [v6 setCompositingFilter:*MEMORY[0x1E4F3A018]];
  }
  return v4;
}

- (id)highlightLimitingViewWithFrame:(CGRect)a3
{
  int64_t v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = [(_UIVibrantSettings *)self highlightLimitingColor];
  [(UIView *)v4 setBackgroundColor:v5];

  double v6 = [(UIView *)v4 layer];
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