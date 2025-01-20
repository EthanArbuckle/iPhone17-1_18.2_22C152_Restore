@interface OADRgbColor
+ (id)black;
+ (id)rgbColorWithRed:(float)a3 green:(float)a4 blue:(float)a5;
+ (id)rgbColorWithRedByte:(float)a3 greenByte:(float)a4 blueByte:(float)a5;
+ (id)rgbColorWithTSUColor:(id)a3;
+ (id)rgbColorWithWhite:(float)a3;
+ (id)rgbColorWithWhiteByte:(float)a3;
+ (id)white;
- (BOOL)isBlack;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWhite;
- (OADRgbColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5;
- (OADRgbColor)initWithRedByte:(float)a3 greenByte:(float)a4 blueByte:(float)a5;
- (OADRgbColor)initWithWhite:(float)a3;
- (OADRgbColor)initWithWhiteByte:(float)a3;
- (OADRgbColor)rgbColorWithFraction:(float)a3 ofRgbColor:(id)a4;
- (float)blue;
- (float)green;
- (float)red;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)blueByte;
- (unsigned)greenByte;
- (unsigned)redByte;
@end

@implementation OADRgbColor

+ (id)black
{
  v2 = [[OADRgbColor alloc] initWithRed:0.0 green:0.0 blue:0.0];
  return v2;
}

- (OADRgbColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)OADRgbColor;
  result = [(OADRgbColor *)&v9 init];
  if (result)
  {
    result->mRed = a3;
    result->mGreen = a4;
    result->mBlue = a5;
  }
  return result;
}

- (OADRgbColor)initWithRedByte:(float)a3 greenByte:(float)a4 blueByte:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)OADRgbColor;
  result = [(OADRgbColor *)&v9 init];
  if (result)
  {
    result->mRed = a3 / 255.0;
    result->mGreen = a4 / 255.0;
    result->mBlue = a5 / 255.0;
  }
  return result;
}

+ (id)white
{
  v2 = [OADRgbColor alloc];
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  v6 = [(OADRgbColor *)v2 initWithRed:v3 green:v4 blue:v5];
  return v6;
}

- (float)red
{
  return self->mRed;
}

- (float)green
{
  return self->mGreen;
}

- (float)blue
{
  return self->mBlue;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t v5 = -[OADRgbColor hash](self, "hash"), v5 == [v4 hash]))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADRgbColor;
    BOOL v6 = [(OADColor *)&v8 isEqual:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(OADRgbColor *)self redByte];
  uint64_t v4 = [(OADRgbColor *)self greenByte];
  unint64_t v5 = [(OADRgbColor *)self blueByte] | (unint64_t)(v4 << 8) | (v3 << 16);
  v7.receiver = self;
  v7.super_class = (Class)OADRgbColor;
  return [(OADColor *)&v7 hash] ^ v5;
}

- (unsigned)redByte
{
  double v2 = fmax(self->mRed, 0.0);
  if (v2 >= 1.0) {
    double v3 = 255.0;
  }
  else {
    double v3 = v2 * 255.0;
  }
  float v4 = v3;
  return llroundf(v4);
}

- (unsigned)greenByte
{
  double v2 = fmax(self->mGreen, 0.0);
  if (v2 >= 1.0) {
    double v3 = 255.0;
  }
  else {
    double v3 = v2 * 255.0;
  }
  float v4 = v3;
  return llroundf(v4);
}

- (unsigned)blueByte
{
  double v2 = fmax(self->mBlue, 0.0);
  if (v2 >= 1.0) {
    double v3 = 255.0;
  }
  else {
    double v3 = v2 * 255.0;
  }
  float v4 = v3;
  return llroundf(v4);
}

+ (id)rgbColorWithRedByte:(float)a3 greenByte:(float)a4 blueByte:(float)a5
{
  objc_super v8 = [OADRgbColor alloc];
  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  v12 = [(OADRgbColor *)v8 initWithRedByte:v9 greenByte:v10 blueByte:v11];
  return v12;
}

+ (id)rgbColorWithTSUColor:(id)a3
{
  id v3 = a3;
  float v4 = [OADRgbColor alloc];
  [v3 redComponent];
  double v6 = v5;
  [v3 greenComponent];
  double v8 = v7;
  [v3 blueComponent];
  float v9 = v6;
  *(float *)&double v10 = v8;
  *(float *)&double v12 = v11;
  *(float *)&double v11 = v9;
  v13 = [(OADRgbColor *)v4 initWithRed:v11 green:v10 blue:v12];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v6 = self->mRed;
  *(float *)&double v7 = self->mGreen;
  *(float *)&double v8 = self->mBlue;
  float v9 = (void *)[v5 initWithRed:v6 green:v7 blue:v8];
  double v10 = [(OADColor *)self transforms];
  double v11 = (void *)[v10 copyWithZone:a3];
  [v9 setTransforms:v11];

  return v9;
}

+ (id)rgbColorWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  double v8 = [OADRgbColor alloc];
  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  double v12 = [(OADRgbColor *)v8 initWithRed:v9 green:v10 blue:v11];
  return v12;
}

- (BOOL)isBlack
{
  return self->mRed == 0.0 && self->mGreen == 0.0 && self->mBlue == 0.0;
}

- (BOOL)isWhite
{
  return self->mRed == 1.0 && self->mGreen == 1.0 && self->mBlue == 1.0;
}

- (OADRgbColor)initWithWhite:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADRgbColor;
  result = [(OADRgbColor *)&v5 init];
  if (result)
  {
    result->mRed = a3;
    result->mGreen = a3;
    result->mBlue = a3;
  }
  return result;
}

+ (id)rgbColorWithWhite:(float)a3
{
  float v4 = [OADRgbColor alloc];
  *(float *)&double v5 = a3;
  double v6 = [(OADRgbColor *)v4 initWithWhite:v5];
  return v6;
}

- (OADRgbColor)initWithWhiteByte:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADRgbColor;
  result = [(OADRgbColor *)&v5 init];
  if (result)
  {
    result->mRed = a3 / 255.0;
    result->mGreen = a3 / 255.0;
    result->mBlue = a3 / 255.0;
  }
  return result;
}

+ (id)rgbColorWithWhiteByte:(float)a3
{
  float v4 = [OADRgbColor alloc];
  *(float *)&double v5 = a3;
  double v6 = [(OADRgbColor *)v4 initWithWhiteByte:v5];
  return v6;
}

- (OADRgbColor)rgbColorWithFraction:(float)a3 ofRgbColor:(id)a4
{
  id v6 = a4;
  [(OADRgbColor *)self red];
  float v8 = v7;
  [v6 red];
  float v10 = v9;
  [(OADRgbColor *)self green];
  float v12 = v11;
  [v6 green];
  float v14 = v13;
  [(OADRgbColor *)self blue];
  float v16 = v15;
  [v6 blue];
  double v17 = 1.0 - a3;
  float v18 = (float)(v10 * a3) + v17 * v8;
  double v19 = (float)(v14 * a3) + v17 * v12;
  *(float *)&double v19 = v19;
  double v21 = (float)(v20 * a3) + v17 * v16;
  *(float *)&double v17 = v21;
  *(float *)&double v21 = v18;
  v22 = +[OADRgbColor rgbColorWithRed:v21 green:v19 blue:v17];

  return (OADRgbColor *)v22;
}

@end