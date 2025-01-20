@interface SFWeatherColor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCloudCover;
- (BOOL)hasCloudCoverHighAltPct;
- (BOOL)hasCloudCoverLowAltPct;
- (BOOL)hasCloudCoverMidAltPct;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSString)condition;
- (SFLatLng)location;
- (SFWeatherColor)initWithCoder:(id)a3;
- (SFWeatherColor)initWithProtobuf:(id)a3;
- (double)cloudCover;
- (double)cloudCoverHighAltPct;
- (double)cloudCoverLowAltPct;
- (double)cloudCoverMidAltPct;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudCover:(double)a3;
- (void)setCloudCoverHighAltPct:(double)a3;
- (void)setCloudCoverLowAltPct:(double)a3;
- (void)setCloudCoverMidAltPct:(double)a3;
- (void)setCondition:(id)a3;
- (void)setDate:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SFWeatherColor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

- (double)cloudCoverHighAltPct
{
  return self->_cloudCoverHighAltPct;
}

- (double)cloudCoverMidAltPct
{
  return self->_cloudCoverMidAltPct;
}

- (double)cloudCoverLowAltPct
{
  return self->_cloudCoverLowAltPct;
}

- (double)cloudCover
{
  return self->_cloudCover;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setLocation:(id)a3
{
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setCondition:(id)a3
{
}

- (NSString)condition
{
  return self->_condition;
}

- (unint64_t)hash
{
  v35.receiver = self;
  v35.super_class = (Class)SFWeatherColor;
  unint64_t v3 = [(SFColor *)&v35 hash];
  v4 = [(SFWeatherColor *)self condition];
  uint64_t v5 = [v4 hash];
  v6 = [(SFWeatherColor *)self location];
  uint64_t v7 = [v6 hash];
  v8 = [(SFWeatherColor *)self date];
  uint64_t v9 = [v8 hash];
  [(SFWeatherColor *)self cloudCover];
  float64_t v33 = v10;
  [(SFWeatherColor *)self cloudCoverLowAltPct];
  float64_t v31 = v11;
  [(SFWeatherColor *)self cloudCoverMidAltPct];
  float64_t v29 = v12;
  [(SFWeatherColor *)self cloudCoverHighAltPct];
  v13.f64[0] = v33;
  v13.f64[1] = v31;
  v14.f64[0] = v29;
  v14.f64[1] = v15;
  float64x2_t v16 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v13), (int8x16_t)vnegq_f64(v13), (int8x16_t)v13);
  float64x2_t v17 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v14), (int8x16_t)vnegq_f64(v14), (int8x16_t)v14);
  float64x2_t v18 = vrndaq_f64(v16);
  float64x2_t v32 = vsubq_f64(v16, v18);
  float64x2_t v34 = v18;
  float64x2_t __x = vrndaq_f64(v17);
  float64x2_t v30 = vsubq_f64(v17, __x);
  long double v25 = fmod(__x.f64[1], 1.84467441e19);
  v19.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v19.f64[1] = v25;
  float64x2_t __xa = v19;
  long double v26 = fmod(v34.f64[1], 1.84467441e19);
  v20.f64[0] = fmod(v34.f64[0], 1.84467441e19);
  v20.f64[1] = v26;
  float64x2_t v21 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  int8x16_t v22 = veorq_s8((int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v20, v21)), (int64x2_t)vcvtq_n_u64_f64(v32, 0x40uLL)), (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v21)), (int64x2_t)vcvtq_n_u64_f64(v30, 0x40uLL)));
  unint64_t v23 = *(void *)&veor_s8(*(int8x8_t *)v22.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)) ^ v9 ^ v7 ^ v5 ^ v3;

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFWeatherColor *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFWeatherColor *)v5 isMemberOfClass:objc_opt_class()])
    {
      v50.receiver = self;
      v50.super_class = (Class)SFWeatherColor;
      if ([(SFColor *)&v50 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFWeatherColor *)self condition];
        v8 = [(SFWeatherColor *)v6 condition];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_39:

          goto LABEL_40;
        }
        uint64_t v9 = [(SFWeatherColor *)self condition];
        if (v9)
        {
          double v10 = [(SFWeatherColor *)self condition];
          unint64_t v3 = [(SFWeatherColor *)v6 condition];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_37;
          }
          v49 = v10;
        }
        double v12 = [(SFWeatherColor *)self location];
        float64x2_t v13 = [(SFWeatherColor *)v6 location];
        float64x2_t v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          double v10 = v49;
          if (!v9) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        uint64_t v15 = [(SFWeatherColor *)self location];
        v47 = v3;
        if (v15)
        {
          float64x2_t v16 = (void *)v15;
          float64x2_t v17 = v14;
          float64x2_t v18 = v12;
          float64x2_t v19 = [(SFWeatherColor *)self location];
          [(SFWeatherColor *)v6 location];
          uint64_t v48 = v45 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            BOOL v11 = 0;
            double v12 = v18;
            float64x2_t v14 = v17;
            v24 = (void *)v48;
LABEL_35:

LABEL_36:
            double v10 = v49;
            unint64_t v3 = v47;
            if (!v9)
            {
LABEL_38:

              goto LABEL_39;
            }
LABEL_37:

            goto LABEL_38;
          }
          v46 = v16;
          double v12 = v18;
          float64x2_t v14 = v17;
        }
        else
        {
          v46 = 0;
        }
        float64x2_t v20 = [(SFWeatherColor *)self date];
        float64x2_t v21 = [(SFWeatherColor *)v6 date];
        if ((v20 == 0) == (v21 != 0))
        {

          BOOL v11 = 0;
          float64x2_t v16 = v46;
          goto LABEL_34;
        }
        v43 = v21;
        v44 = v20;
        [(SFWeatherColor *)self date];
        v42 = float64x2_t v16 = v46;
        if (!v42
          || ([(SFWeatherColor *)self date],
              int8x16_t v22 = objc_claimAutoreleasedReturnValue(),
              [(SFWeatherColor *)v6 date],
              v40 = objc_claimAutoreleasedReturnValue(),
              v41 = v22,
              objc_msgSend(v22, "isEqual:")))
        {
          [(SFWeatherColor *)self cloudCover];
          double v26 = v25;
          [(SFWeatherColor *)v6 cloudCover];
          if (vabdd_f64(v26, v27) >= 2.22044605e-16
            || ([(SFWeatherColor *)self cloudCoverLowAltPct],
                double v29 = v28,
                [(SFWeatherColor *)v6 cloudCoverLowAltPct],
                vabdd_f64(v29, v30) >= 2.22044605e-16)
            || ([(SFWeatherColor *)self cloudCoverMidAltPct],
                double v32 = v31,
                [(SFWeatherColor *)v6 cloudCoverMidAltPct],
                vabdd_f64(v32, v33) >= 2.22044605e-16))
          {
            BOOL v11 = 0;
            BOOL v37 = 0;
          }
          else
          {
            [(SFWeatherColor *)self cloudCoverHighAltPct];
            double v35 = v34;
            [(SFWeatherColor *)v6 cloudCoverHighAltPct];
            BOOL v11 = vabdd_f64(v35, v36) < 2.22044605e-16;
            BOOL v37 = v11;
          }
          unint64_t v23 = (void *)v42;
          if (!v42)
          {
            v38 = v43;
            BOOL v11 = v37;
            goto LABEL_33;
          }
        }
        else
        {
          BOOL v11 = 0;
          unint64_t v23 = (void *)v42;
        }

        v38 = v43;
LABEL_33:

LABEL_34:
        v24 = (void *)v48;
        if (!v16) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }
    BOOL v11 = 0;
  }
LABEL_40:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFWeatherColor;
  id v4 = [(SFColor *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFWeatherColor *)self condition];
  v6 = (void *)[v5 copy];
  [v4 setCondition:v6];

  uint64_t v7 = [(SFWeatherColor *)self location];
  v8 = (void *)[v7 copy];
  [v4 setLocation:v8];

  uint64_t v9 = [(SFWeatherColor *)self date];
  double v10 = (void *)[v9 copy];
  [v4 setDate:v10];

  [(SFWeatherColor *)self cloudCover];
  objc_msgSend(v4, "setCloudCover:");
  [(SFWeatherColor *)self cloudCoverLowAltPct];
  objc_msgSend(v4, "setCloudCoverLowAltPct:");
  [(SFWeatherColor *)self cloudCoverMidAltPct];
  objc_msgSend(v4, "setCloudCoverMidAltPct:");
  [(SFWeatherColor *)self cloudCoverHighAltPct];
  objc_msgSend(v4, "setCloudCoverHighAltPct:");
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBWeatherColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBWeatherColor *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBWeatherColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBWeatherColor *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFWeatherColor;
  [(SFColor *)&v3 encodeWithCoder:a3];
}

- (SFWeatherColor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFWeatherColor *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBColor alloc] initWithData:v6];
  v8 = [[SFColor alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFColor *)v8 condition];
    [(SFWeatherColor *)v5 setCondition:v9];

    double v10 = [(SFColor *)v8 location];
    [(SFWeatherColor *)v5 setLocation:v10];

    BOOL v11 = [(SFColor *)v8 date];
    [(SFWeatherColor *)v5 setDate:v11];

    [(SFColor *)v8 cloudCover];
    -[SFWeatherColor setCloudCover:](v5, "setCloudCover:");
    [(SFColor *)v8 cloudCoverLowAltPct];
    -[SFWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    [(SFColor *)v8 cloudCoverMidAltPct];
    -[SFWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    [(SFColor *)v8 cloudCoverHighAltPct];
    -[SFWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    [(SFColor *)v8 redComponent];
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    [(SFColor *)v8 greenComponent];
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    [(SFColor *)v8 blueComponent];
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    [(SFColor *)v8 alphaComponent];
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    [(SFColor *)v5 setColorTintStyle:[(SFColor *)v8 colorTintStyle]];
    objc_super v12 = [(SFColor *)v8 darkModeColor];
    [(SFColor *)v5 setDarkModeColor:v12];
  }
  return v5;
}

- (BOOL)hasCloudCoverHighAltPct
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCloudCoverHighAltPct:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_cloudCoverHighAltPct = a3;
}

- (BOOL)hasCloudCoverMidAltPct
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCloudCoverMidAltPct:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cloudCoverMidAltPct = a3;
}

- (BOOL)hasCloudCoverLowAltPct
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCloudCoverLowAltPct:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cloudCoverLowAltPct = a3;
}

- (BOOL)hasCloudCover
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCloudCover:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cloudCover = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFWeatherColor)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFWeatherColor;
  uint64_t v5 = [(SFWeatherColor *)&v22 init];
  if (v5)
  {
    v6 = [v4 condition];

    if (v6)
    {
      uint64_t v7 = [v4 condition];
      [(SFWeatherColor *)v5 setCondition:v7];
    }
    v8 = [v4 location];

    if (v8)
    {
      uint64_t v9 = [SFLatLng alloc];
      double v10 = [v4 location];
      BOOL v11 = [(SFLatLng *)v9 initWithProtobuf:v10];
      [(SFWeatherColor *)v5 setLocation:v11];
    }
    objc_super v12 = [v4 date];

    if (v12)
    {
      float64x2_t v13 = [v4 date];
      float64x2_t v14 = (void *)MEMORY[0x1E4F1C9C8];
      [v13 secondsSince1970];
      uint64_t v15 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
      [(SFWeatherColor *)v5 setDate:v15];
    }
    [v4 cloudCover];
    if (v16 != 0.0)
    {
      [v4 cloudCover];
      -[SFWeatherColor setCloudCover:](v5, "setCloudCover:");
    }
    [v4 cloudCoverLowAltPct];
    if (v17 != 0.0)
    {
      [v4 cloudCoverLowAltPct];
      -[SFWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    }
    [v4 cloudCoverMidAltPct];
    if (v18 != 0.0)
    {
      [v4 cloudCoverMidAltPct];
      -[SFWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    }
    [v4 cloudCoverHighAltPct];
    if (v19 != 0.0)
    {
      [v4 cloudCoverHighAltPct];
      -[SFWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    }
    float64x2_t v20 = v5;
  }

  return v5;
}

@end