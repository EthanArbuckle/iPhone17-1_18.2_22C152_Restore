@interface SFMapRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAltitudeInMeters;
- (BOOL)hasEastLng;
- (BOOL)hasNorthLat;
- (BOOL)hasSouthLat;
- (BOOL)hasWestLng;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFMapRegion)initWithCoder:(id)a3;
- (SFMapRegion)initWithProtobuf:(id)a3;
- (double)altitudeInMeters;
- (double)eastLng;
- (double)northLat;
- (double)southLat;
- (double)westLng;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitudeInMeters:(double)a3;
- (void)setEastLng:(double)a3;
- (void)setNorthLat:(double)a3;
- (void)setSouthLat:(double)a3;
- (void)setWestLng:(double)a3;
@end

@implementation SFMapRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)altitudeInMeters
{
  return self->_altitudeInMeters;
}

- (double)eastLng
{
  return self->_eastLng;
}

- (double)northLat
{
  return self->_northLat;
}

- (double)westLng
{
  return self->_westLng;
}

- (double)southLat
{
  return self->_southLat;
}

- (unint64_t)hash
{
  [(SFMapRegion *)self southLat];
  float64_t v29 = v3;
  [(SFMapRegion *)self westLng];
  float64_t v26 = v4;
  [(SFMapRegion *)self northLat];
  float64_t v24 = v5;
  [(SFMapRegion *)self eastLng];
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
  [(SFMapRegion *)self altitudeInMeters];
  double v15 = -v14;
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  long double v16 = round(v15);
  unint64_t v17 = (unint64_t)(fmod(v16, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v15 - v16, 0x40uLL);
  int8x16_t v18 = veorq_s8(v31, v28);
  return *(void *)&veor_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)) ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SFMapRegion *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }
  else if ([(SFMapRegion *)v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    [(SFMapRegion *)self southLat];
    double v7 = v6;
    [(SFMapRegion *)v5 southLat];
    if (vabdd_f64(v7, v8) >= 2.22044605e-16) {
      goto LABEL_10;
    }
    [(SFMapRegion *)self westLng];
    double v10 = v9;
    [(SFMapRegion *)v5 westLng];
    if (vabdd_f64(v10, v11) >= 2.22044605e-16
      || ([(SFMapRegion *)self northLat],
          double v13 = v12,
          [(SFMapRegion *)v5 northLat],
          vabdd_f64(v13, v14) >= 2.22044605e-16)
      || ([(SFMapRegion *)self eastLng],
          double v16 = v15,
          [(SFMapRegion *)v5 eastLng],
          vabdd_f64(v16, v17) >= 2.22044605e-16))
    {
LABEL_10:
      BOOL v21 = 0;
    }
    else
    {
      [(SFMapRegion *)self altitudeInMeters];
      double v19 = v18;
      [(SFMapRegion *)v5 altitudeInMeters];
      BOOL v21 = vabdd_f64(v19, v20) < 2.22044605e-16;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SFMapRegion *)self southLat];
  objc_msgSend(v4, "setSouthLat:");
  [(SFMapRegion *)self westLng];
  objc_msgSend(v4, "setWestLng:");
  [(SFMapRegion *)self northLat];
  objc_msgSend(v4, "setNorthLat:");
  [(SFMapRegion *)self eastLng];
  objc_msgSend(v4, "setEastLng:");
  [(SFMapRegion *)self altitudeInMeters];
  objc_msgSend(v4, "setAltitudeInMeters:");
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMapRegion alloc] initWithFacade:self];
  double v3 = [(_SFPBMapRegion *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMapRegion alloc] initWithFacade:self];
  double v3 = [(_SFPBMapRegion *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v6 = [[_SFPBMapRegion alloc] initWithFacade:self];
  double v5 = [(_SFPBMapRegion *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMapRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  double v6 = [[_SFPBMapRegion alloc] initWithData:v5];
  double v7 = [(SFMapRegion *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasAltitudeInMeters
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAltitudeInMeters:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_altitudeInMeters = a3;
}

- (BOOL)hasEastLng
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEastLng:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_eastLng = a3;
}

- (BOOL)hasNorthLat
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNorthLat:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_northLat = a3;
}

- (BOOL)hasWestLng
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWestLng:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_westLng = a3;
}

- (BOOL)hasSouthLat
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSouthLat:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_southLat = a3;
}

- (SFMapRegion)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFMapRegion;
  double v5 = [(SFMapRegion *)&v13 init];
  if (v5)
  {
    [v4 southLat];
    if (v6 != 0.0)
    {
      [v4 southLat];
      [(SFMapRegion *)v5 setSouthLat:"setSouthLat:"];
    }
    [v4 westLng];
    if (v7 != 0.0)
    {
      [v4 westLng];
      -[SFMapRegion setWestLng:](v5, "setWestLng:");
    }
    [v4 northLat];
    if (v8 != 0.0)
    {
      [v4 northLat];
      -[SFMapRegion setNorthLat:](v5, "setNorthLat:");
    }
    [v4 eastLng];
    if (v9 != 0.0)
    {
      [v4 eastLng];
      -[SFMapRegion setEastLng:](v5, "setEastLng:");
    }
    [v4 altitudeInMeters];
    if (v10 != 0.0)
    {
      [v4 altitudeInMeters];
      -[SFMapRegion setAltitudeInMeters:](v5, "setAltitudeInMeters:");
    }
    double v11 = v5;
  }

  return v5;
}

@end