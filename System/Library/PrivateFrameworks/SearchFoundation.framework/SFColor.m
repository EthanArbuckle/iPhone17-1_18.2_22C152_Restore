@interface SFColor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlphaComponent;
- (BOOL)hasBlueComponent;
- (BOOL)hasColorTintStyle;
- (BOOL)hasGreenComponent;
- (BOOL)hasRedComponent;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFColor)darkModeColor;
- (SFColor)initWithCoder:(id)a3;
- (SFColor)initWithProtobuf:(id)a3;
- (double)alphaComponent;
- (double)blueComponent;
- (double)greenComponent;
- (double)redComponent;
- (id)copyWithZone:(_NSZone *)a3;
- (int)colorTintStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlphaComponent:(double)a3;
- (void)setBlueComponent:(double)a3;
- (void)setColorTintStyle:(int)a3;
- (void)setDarkModeColor:(id)a3;
- (void)setGreenComponent:(double)a3;
- (void)setRedComponent:(double)a3;
@end

@implementation SFColor

- (void).cxx_destruct
{
}

- (void)setDarkModeColor:(id)a3
{
}

- (SFColor)darkModeColor
{
  return self->_darkModeColor;
}

- (int)colorTintStyle
{
  return self->_colorTintStyle;
}

- (double)alphaComponent
{
  return self->_alphaComponent;
}

- (double)blueComponent
{
  return self->_blueComponent;
}

- (double)greenComponent
{
  return self->_greenComponent;
}

- (double)redComponent
{
  return self->_redComponent;
}

- (unint64_t)hash
{
  [(SFColor *)self redComponent];
  float64_t v29 = v3;
  [(SFColor *)self greenComponent];
  float64_t v26 = v4;
  [(SFColor *)self blueComponent];
  float64_t v24 = v5;
  [(SFColor *)self alphaComponent];
  v6.f64[0] = v29;
  v7.f64[0] = v24;
  v6.f64[1] = v26;
  v7.f64[1] = v8;
  float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vnegq_f64(v6), (int8x16_t)v6);
  float64x2_t v10 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), (int8x16_t)vnegq_f64(v7), (int8x16_t)v7);
  float64x2_t v30 = vrndaq_f64(v9);
  float64x2_t __x = vrndaq_f64(v10);
  float64x2_t v25 = vsubq_f64(v10, __x);
  float64x2_t v27 = vsubq_f64(v9, v30);
  long double v20 = fmod(__x.f64[1], 1.84467441e19);
  v11.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v11.f64[1] = v20;
  float64x2_t __xa = v11;
  long double v21 = fmod(v30.f64[1], 1.84467441e19);
  v12.f64[0] = fmod(v30.f64[0], 1.84467441e19);
  v12.f64[1] = v21;
  float64x2_t v13 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  int8x16_t v31 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v12, v13)), (int64x2_t)vcvtq_n_u64_f64(v27, 0x40uLL));
  int8x16_t v28 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v13)), (int64x2_t)vcvtq_n_u64_f64(v25, 0x40uLL));
  uint64_t v14 = [(SFColor *)self colorTintStyle];
  v15 = [(SFColor *)self darkModeColor];
  uint64_t v16 = [v15 hash];
  int8x16_t v17 = veorq_s8(v31, v28);
  unint64_t v18 = *(void *)&veor_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)) ^ v16 ^ v14;

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SFColor *)a3;
  if (self == v4)
  {
    char v24 = 1;
  }
  else if ([(SFColor *)v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    [(SFColor *)self redComponent];
    double v7 = v6;
    [(SFColor *)v5 redComponent];
    if (vabdd_f64(v7, v8) >= 2.22044605e-16) {
      goto LABEL_13;
    }
    [(SFColor *)self greenComponent];
    double v10 = v9;
    [(SFColor *)v5 greenComponent];
    if (vabdd_f64(v10, v11) >= 2.22044605e-16) {
      goto LABEL_13;
    }
    [(SFColor *)self blueComponent];
    double v13 = v12;
    [(SFColor *)v5 blueComponent];
    if (vabdd_f64(v13, v14) < 2.22044605e-16
      && ([(SFColor *)self alphaComponent],
          double v16 = v15,
          [(SFColor *)v5 alphaComponent],
          vabdd_f64(v16, v17) < 2.22044605e-16)
      && (int v18 = [(SFColor *)self colorTintStyle], v18 == [(SFColor *)v5 colorTintStyle]))
    {
      v19 = [(SFColor *)self darkModeColor];
      long double v20 = [(SFColor *)v5 darkModeColor];
      if ((v19 == 0) == (v20 != 0))
      {
        char v24 = 0;
      }
      else
      {
        long double v21 = [(SFColor *)self darkModeColor];
        if (v21)
        {
          v22 = [(SFColor *)self darkModeColor];
          v23 = [(SFColor *)v5 darkModeColor];
          char v24 = [v22 isEqual:v23];
        }
        else
        {
          char v24 = 1;
        }
      }
    }
    else
    {
LABEL_13:
      char v24 = 0;
    }
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SFColor *)self redComponent];
  objc_msgSend(v4, "setRedComponent:");
  [(SFColor *)self greenComponent];
  objc_msgSend(v4, "setGreenComponent:");
  [(SFColor *)self blueComponent];
  objc_msgSend(v4, "setBlueComponent:");
  [(SFColor *)self alphaComponent];
  objc_msgSend(v4, "setAlphaComponent:");
  objc_msgSend(v4, "setColorTintStyle:", -[SFColor colorTintStyle](self, "colorTintStyle"));
  double v5 = [(SFColor *)self darkModeColor];
  double v6 = (void *)[v5 copy];
  [v4 setDarkModeColor:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBColor alloc] initWithFacade:self];
  double v3 = [(_SFPBColor *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBColor alloc] initWithFacade:self];
  double v3 = [(_SFPBColor *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v6 = [[_SFPBColor alloc] initWithFacade:self];
  double v5 = [(_SFPBColor *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFColor)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  double v6 = [SFColor alloc];
  double v7 = [[_SFPBColor alloc] initWithData:v5];
  double v8 = [(SFColor *)v6 initWithProtobuf:v7];

  return v8;
}

- (BOOL)hasColorTintStyle
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setColorTintStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_colorTintStyle = a3;
}

- (BOOL)hasAlphaComponent
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAlphaComponent:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_alphaComponent = a3;
}

- (BOOL)hasBlueComponent
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBlueComponent:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_blueComponent = a3;
}

- (BOOL)hasGreenComponent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGreenComponent:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_greenComponent = a3;
}

- (BOOL)hasRedComponent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRedComponent:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_redComponent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFColor)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SFColor;
  double v5 = [(SFColor *)&v40 init];
  if (v5)
  {
    double v6 = [v4 redComponent];

    if (v6)
    {
      double v7 = [v4 redComponent];
      [v7 doubleValue];
      -[SFColor setRedComponent:](v5, "setRedComponent:");
    }
    double v8 = [v4 greenComponent];

    if (v8)
    {
      double v9 = [v4 greenComponent];
      [v9 doubleValue];
      -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    }
    double v10 = [v4 blueComponent];

    if (v10)
    {
      double v11 = [v4 blueComponent];
      [v11 doubleValue];
      -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    }
    double v12 = [v4 alphaComponent];

    if (v12)
    {
      double v13 = [v4 alphaComponent];
      [v13 doubleValue];
      -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    }
    if ([v4 colorTintStyle]) {
      -[SFColor setColorTintStyle:](v5, "setColorTintStyle:", [v4 colorTintStyle]);
    }
    double v14 = [v4 darkModeColor];

    if (v14)
    {
      double v15 = [SFColor alloc];
      double v16 = [v4 darkModeColor];
      double v17 = [(SFColor *)v15 initWithProtobuf:v16];
      [(SFColor *)v5 setDarkModeColor:v17];
    }
    int v18 = [v4 calendarColor];

    if (v18)
    {
      v19 = [SFCalendarColor alloc];
      uint64_t v20 = [v4 calendarColor];
    }
    else
    {
      v22 = [v4 appColor];

      if (v22)
      {
        v19 = [SFAppColor alloc];
        uint64_t v20 = [v4 appColor];
      }
      else
      {
        v23 = [v4 imageDerivedColor];

        if (v23)
        {
          v19 = [SFImageDerivedColor alloc];
          uint64_t v20 = [v4 imageDerivedColor];
        }
        else
        {
          char v24 = [v4 gradientColor];

          if (v24)
          {
            v19 = [SFGradientColor alloc];
            uint64_t v20 = [v4 gradientColor];
          }
          else
          {
            float64x2_t v25 = [v4 weatherColor];

            if (!v25)
            {
              long double v21 = v5;
              goto LABEL_37;
            }
            v19 = [SFWeatherColor alloc];
            uint64_t v20 = [v4 weatherColor];
          }
        }
      }
    }
    float64_t v26 = (void *)v20;
    long double v21 = [(SFCalendarColor *)v19 initWithProtobuf:v20];

    float64x2_t v27 = [v4 redComponent];

    if (v27)
    {
      int8x16_t v28 = [v4 redComponent];
      [v28 doubleValue];
      -[SFColor setRedComponent:](v21, "setRedComponent:");
    }
    float64_t v29 = [v4 greenComponent];

    if (v29)
    {
      float64x2_t v30 = [v4 greenComponent];
      [v30 doubleValue];
      -[SFColor setGreenComponent:](v21, "setGreenComponent:");
    }
    int8x16_t v31 = [v4 blueComponent];

    if (v31)
    {
      v32 = [v4 blueComponent];
      [v32 doubleValue];
      -[SFColor setBlueComponent:](v21, "setBlueComponent:");
    }
    v33 = [v4 alphaComponent];

    if (v33)
    {
      v34 = [v4 alphaComponent];
      [v34 doubleValue];
      -[SFColor setAlphaComponent:](v21, "setAlphaComponent:");
    }
    if ([v4 colorTintStyle]) {
      -[SFColor setColorTintStyle:](v21, "setColorTintStyle:", [v4 colorTintStyle]);
    }
    v35 = [v4 darkModeColor];

    if (v35)
    {
      v36 = [SFColor alloc];
      v37 = [v4 darkModeColor];
      v38 = [(SFColor *)v36 initWithProtobuf:v37];
      [(SFColor *)v21 setDarkModeColor:v38];
    }
  }
  else
  {
    long double v21 = 0;
  }
LABEL_37:

  return v21;
}

@end