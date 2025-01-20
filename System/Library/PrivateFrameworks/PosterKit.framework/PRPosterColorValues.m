@interface PRPosterColorValues
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (PRPosterColorHSBValues)hsbValues;
- (PRPosterColorHSLValues)hslValues;
- (PRPosterColorValues)initWithColor:(id)a3;
- (PRPosterColorValues)initWithColor:(id)a3 hsbValues:(id)a4 hslValues:(id)a5 alpha:(double)a6;
- (PRPosterColorValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6;
- (UIColor)color;
- (double)alpha;
- (id)copyWithAlpha:(double)a3;
- (id)copyWithLuminance:(double)a3;
- (unint64_t)hash;
- (void)setAlpha:(double)a3;
- (void)setColor:(id)a3;
- (void)setHsbValues:(id)a3;
- (void)setHslValues:(id)a3;
@end

@implementation PRPosterColorValues

- (PRPosterColorValues)initWithColor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double v10 = 1.0;
  if (v4) {
    [v4 getWhite:0 alpha:&v10];
  }
  v6 = [[PRPosterColorHSBValues alloc] initWithColor:v5];
  v7 = [(PRPosterColorHSBValues *)v6 hslValues];
  v8 = [(PRPosterColorValues *)self initWithColor:v5 hsbValues:v6 hslValues:v7 alpha:v10];

  return v8;
}

- (PRPosterColorValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6
{
  v8 = [[PRPosterColorHSLValues alloc] initWithHue:a3 saturation:a4 luminance:a5];
  v9 = [(PRPosterColorHSLValues *)v8 hsbValues];
  double v10 = [v9 colorWithAlpha:a6];
  v11 = [(PRPosterColorValues *)self initWithColor:v10 hsbValues:v9 hslValues:v8 alpha:a6];

  return v11;
}

- (PRPosterColorValues)initWithColor:(id)a3 hsbValues:(id)a4 hslValues:(id)a5 alpha:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PRPosterColorValues;
  v13 = [(PRPosterColorValues *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    color = v13->_color;
    v13->_color = (UIColor *)v14;

    objc_storeStrong((id *)&v13->_hsbValues, a4);
    objc_storeStrong((id *)&v13->_hslValues, a5);
    v13->_alpha = a6;
  }

  return v13;
}

- (NSString)identifier
{
  v3 = [(PRPosterColorValues *)self hslValues];
  [(PRPosterColorValues *)self alpha];
  uint64_t v5 = v4;
  v6 = NSString;
  [v3 hue];
  uint64_t v8 = v7;
  [v3 saturation];
  uint64_t v10 = v9;
  [v3 luminance];
  id v12 = [v6 stringWithFormat:@"%.5f:%.5f:%.5f:%.2f", v8, v10, v11, v5];

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PRPosterColorValues *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = v4;
      uint64_t v8 = [(PRPosterColorValues *)self identifier];
      uint64_t v9 = [(PRPosterColorValues *)v7 identifier];

      char v10 = BSEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(PRPosterColorValues *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithLuminance:(double)a3
{
  uint64_t v5 = [(PRPosterColorValues *)self hslValues];
  v6 = [PRPosterColorValues alloc];
  [v5 hue];
  double v8 = v7;
  [v5 saturation];
  double v10 = v9;
  [(PRPosterColorValues *)self alpha];
  id v12 = [(PRPosterColorValues *)v6 initWithHue:v8 saturation:v10 luminance:a3 alpha:v11];

  return v12;
}

- (id)copyWithAlpha:(double)a3
{
  uint64_t v4 = [(PRPosterColorValues *)self hslValues];
  uint64_t v5 = [PRPosterColorValues alloc];
  [v4 hue];
  double v7 = v6;
  [v4 saturation];
  double v9 = v8;
  [v4 luminance];
  double v11 = [(PRPosterColorValues *)v5 initWithHue:v7 saturation:v9 luminance:v10 alpha:a3];

  return v11;
}

- (PRPosterColorHSBValues)hsbValues
{
  return self->_hsbValues;
}

- (void)setHsbValues:(id)a3
{
}

- (PRPosterColorHSLValues)hslValues
{
  return self->_hslValues;
}

- (void)setHslValues:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_hslValues, 0);
  objc_storeStrong((id *)&self->_hsbValues, 0);
}

@end