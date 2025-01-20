@interface TIKeyboardSecureCandidateRGBColor
+ (BOOL)supportsSecureCoding;
+ (id)blackColor;
+ (id)lightGrayColor;
+ (id)whiteColor;
- (BOOL)isEqual:(id)a3;
- (TIKeyboardSecureCandidateRGBColor)initWithCoder:(id)a3;
- (TIKeyboardSecureCandidateRGBColor)initWithR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6;
- (double)colorA;
- (double)colorB;
- (double)colorG;
- (double)colorR;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setColorA:(double)a3;
- (void)setColorB:(double)a3;
- (void)setColorG:(double)a3;
- (void)setColorR:(double)a3;
@end

@implementation TIKeyboardSecureCandidateRGBColor

- (void)setColorA:(double)a3
{
  self->_colorA = a3;
}

- (double)colorA
{
  return self->_colorA;
}

- (void)setColorB:(double)a3
{
  self->_colorB = a3;
}

- (double)colorB
{
  return self->_colorB;
}

- (void)setColorG:(double)a3
{
  self->_colorG = a3;
}

- (double)colorG
{
  return self->_colorG;
}

- (void)setColorR:(double)a3
{
  self->_colorR = a3;
}

- (double)colorR
{
  return self->_colorR;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    [(TIKeyboardSecureCandidateRGBColor *)self colorR];
    double v7 = v6;
    [v5 colorR];
    if (v7 == v8
      && (-[TIKeyboardSecureCandidateRGBColor colorG](self, "colorG"), double v10 = v9, [v5 colorG], v10 == v11)
      && (-[TIKeyboardSecureCandidateRGBColor colorB](self, "colorB"), double v13 = v12, [v5 colorB], v13 == v14))
    {
      [(TIKeyboardSecureCandidateRGBColor *)self colorA];
      double v16 = v15;
      [v5 colorA];
      BOOL v18 = v16 == v17;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [(TIKeyboardSecureCandidateRGBColor *)self colorR];
  uint64_t v5 = v4;
  [(TIKeyboardSecureCandidateRGBColor *)self colorG];
  uint64_t v7 = v6;
  [(TIKeyboardSecureCandidateRGBColor *)self colorB];
  uint64_t v9 = v8;
  [(TIKeyboardSecureCandidateRGBColor *)self colorA];
  [v3 appendFormat:@"; textColor = [R:%f, G:%f, B:%f, A:%f]", v5, v7, v9, v10];
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  float colorR = self->_colorR;
  id v9 = a3;
  *(float *)&double v5 = colorR;
  [v9 encodeFloat:@"colorR" forKey:v5];
  double colorG = self->_colorG;
  *(float *)&double colorG = colorG;
  [v9 encodeFloat:@"colorG" forKey:colorG];
  double colorB = self->_colorB;
  *(float *)&double colorB = colorB;
  [v9 encodeFloat:@"colorB" forKey:colorB];
  double colorA = self->_colorA;
  *(float *)&double colorA = colorA;
  [v9 encodeFloat:@"colorA" forKey:colorA];
}

- (TIKeyboardSecureCandidateRGBColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardSecureCandidateRGBColor;
  double v5 = [(TIKeyboardSecureCandidateRGBColor *)&v11 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"colorR"];
    v5->_float colorR = v6;
    [v4 decodeFloatForKey:@"colorG"];
    v5->_double colorG = v7;
    [v4 decodeFloatForKey:@"colorB"];
    v5->_double colorB = v8;
    [v4 decodeFloatForKey:@"colorA"];
    v5->_double colorA = v9;
  }

  return v5;
}

- (TIKeyboardSecureCandidateRGBColor)initWithR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardSecureCandidateRGBColor;
  result = [(TIKeyboardSecureCandidateRGBColor *)&v11 init];
  if (result)
  {
    result->_float colorR = a3;
    result->_double colorG = a4;
    result->_double colorB = a5;
    result->_double colorA = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(TIKeyboardSecureCandidateRGBColor);
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_colorR;
    *((void *)result + 2) = *(void *)&self->_colorG;
    *((void *)result + 3) = *(void *)&self->_colorB;
    *((void *)result + 4) = *(void *)&self->_colorA;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)lightGrayColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithR:0.898039216 G:0.909803922 B:0.917647059 A:1.0];

  return v2;
}

+ (id)blackColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithR:0.0 G:0.0 B:0.0 A:1.0];

  return v2;
}

+ (id)whiteColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithR:1.0 G:1.0 B:1.0 A:1.0];

  return v2;
}

@end