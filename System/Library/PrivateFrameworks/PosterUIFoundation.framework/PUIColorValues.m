@interface PUIColorValues
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (PUIColorHSBValues)hsbValues;
- (PUIColorHSLValues)hslValues;
- (PUIColorValues)initWithColor:(id)a3;
- (PUIColorValues)initWithColor:(id)a3 hsbValues:(id)a4 hslValues:(id)a5 alpha:(double)a6;
- (PUIColorValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6;
- (UIColor)color;
- (double)alpha;
- (id)copyWithAlpha:(double)a3;
- (id)copyWithLuminance:(double)a3;
- (id)copyWithLuminance:(double)a3 saturation:(double)a4;
- (unint64_t)hash;
@end

@implementation PUIColorValues

- (PUIColorValues)initWithColor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double v10 = 1.0;
  if (v4) {
    [v4 getWhite:0 alpha:&v10];
  }
  v6 = [[PUIColorHSBValues alloc] initWithColor:v5];
  v7 = [(PUIColorHSBValues *)v6 hslValues];
  v8 = [(PUIColorValues *)self initWithColor:v5 hsbValues:v6 hslValues:v7 alpha:v10];

  return v8;
}

- (PUIColorValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5 alpha:(double)a6
{
  v8 = [[PUIColorHSLValues alloc] initWithHue:a3 saturation:a4 luminance:a5];
  v9 = [(PUIColorHSLValues *)v8 hsbValues];
  double v10 = [v9 colorWithAlpha:a6];
  v11 = [(PUIColorValues *)self initWithColor:v10 hsbValues:v9 hslValues:v8 alpha:a6];

  return v11;
}

- (PUIColorValues)initWithColor:(id)a3 hsbValues:(id)a4 hslValues:(id)a5 alpha:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUIColorValues;
  v13 = [(PUIColorValues *)&v17 init];
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
  v3 = [(PUIColorValues *)self hslValues];
  [(PUIColorValues *)self alpha];
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

- (unint64_t)hash
{
  v2 = [(PUIColorValues *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PUIColorValues *)a3;
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
      uint64_t v8 = [(PUIColorValues *)self identifier];
      uint64_t v9 = [(PUIColorValues *)v7 identifier];

      char v10 = BSEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithLuminance:(double)a3
{
  uint64_t v5 = [(PUIColorValues *)self hslValues];
  [v5 saturation];
  id v7 = [(PUIColorValues *)self copyWithLuminance:a3 saturation:v6];

  return v7;
}

- (id)copyWithLuminance:(double)a3 saturation:(double)a4
{
  id v7 = [(PUIColorValues *)self hslValues];
  uint64_t v8 = [PUIColorValues alloc];
  [v7 hue];
  double v10 = v9;
  [(PUIColorValues *)self alpha];
  id v12 = [(PUIColorValues *)v8 initWithHue:v10 saturation:a4 luminance:a3 alpha:v11];

  return v12;
}

- (id)copyWithAlpha:(double)a3
{
  uint64_t v4 = [(PUIColorValues *)self hslValues];
  uint64_t v5 = [PUIColorValues alloc];
  [v4 hue];
  double v7 = v6;
  [v4 saturation];
  double v9 = v8;
  [v4 luminance];
  double v11 = [(PUIColorValues *)v5 initWithHue:v7 saturation:v9 luminance:v10 alpha:a3];

  return v11;
}

- (PUIColorHSBValues)hsbValues
{
  return self->_hsbValues;
}

- (PUIColorHSLValues)hslValues
{
  return self->_hslValues;
}

- (UIColor)color
{
  return self->_color;
}

- (double)alpha
{
  return self->_alpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_hslValues, 0);
  objc_storeStrong((id *)&self->_hsbValues, 0);
}

@end