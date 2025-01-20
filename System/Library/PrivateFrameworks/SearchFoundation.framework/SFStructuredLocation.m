@interface SFStructuredLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (SFLatLng)geoLocation;
- (SFStructuredLocation)initWithCoder:(id)a3;
- (SFStructuredLocation)initWithProtobuf:(id)a3;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGeoLocation:(id)a3;
- (void)setRadius:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFStructuredLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (double)radius
{
  return self->_radius;
}

- (void)setGeoLocation:(id)a3
{
}

- (SFLatLng)geoLocation
{
  return self->_geoLocation;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(SFStructuredLocation *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(SFStructuredLocation *)self geoLocation];
  uint64_t v6 = [v5 hash] ^ v4;
  [(SFStructuredLocation *)self radius];
  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  long double v9 = round(v8);
  unint64_t v10 = v6 ^ ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFStructuredLocation *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFStructuredLocation *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      double v7 = [(SFStructuredLocation *)self title];
      double v8 = [(SFStructuredLocation *)v6 title];
      if ((v7 == 0) == (v8 != 0))
      {
        BOOL v11 = 0;
LABEL_24:

        goto LABEL_25;
      }
      long double v9 = [(SFStructuredLocation *)self title];
      if (v9)
      {
        unint64_t v10 = [(SFStructuredLocation *)self title];
        v3 = [(SFStructuredLocation *)v6 title];
        if (![v10 isEqual:v3])
        {
          BOOL v11 = 0;
          goto LABEL_22;
        }
        v24 = v10;
      }
      v12 = [(SFStructuredLocation *)self geoLocation];
      v13 = [(SFStructuredLocation *)v6 geoLocation];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        BOOL v11 = 0;
        goto LABEL_21;
      }
      v15 = [(SFStructuredLocation *)self geoLocation];
      if (v15)
      {
        v21 = v3;
        v16 = [(SFStructuredLocation *)self geoLocation];
        v22 = [(SFStructuredLocation *)v6 geoLocation];
        v23 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          BOOL v11 = 0;
          v3 = v21;
LABEL_19:

LABEL_20:
LABEL_21:
          unint64_t v10 = v24;
          if (!v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v3 = v21;
      }
      [(SFStructuredLocation *)self radius];
      double v18 = v17;
      [(SFStructuredLocation *)v6 radius];
      BOOL v11 = vabdd_f64(v18, v19) < 2.22044605e-16;
      if (!v15) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    BOOL v11 = 0;
  }
LABEL_25:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFStructuredLocation *)self title];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  double v7 = [(SFStructuredLocation *)self geoLocation];
  double v8 = (void *)[v7 copy];
  [v4 setGeoLocation:v8];

  [(SFStructuredLocation *)self radius];
  objc_msgSend(v4, "setRadius:");
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBStructuredLocation alloc] initWithFacade:self];
  v3 = [(_SFPBStructuredLocation *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBStructuredLocation alloc] initWithFacade:self];
  v3 = [(_SFPBStructuredLocation *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBStructuredLocation alloc] initWithFacade:self];
  v5 = [(_SFPBStructuredLocation *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFStructuredLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBStructuredLocation alloc] initWithData:v5];
  double v7 = [(SFStructuredLocation *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasRadius
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRadius:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_radius = a3;
}

- (SFStructuredLocation)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFStructuredLocation;
  v5 = [(SFStructuredLocation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 title];

    if (v6)
    {
      double v7 = [v4 title];
      [(SFStructuredLocation *)v5 setTitle:v7];
    }
    double v8 = [v4 geoLocation];

    if (v8)
    {
      long double v9 = [SFLatLng alloc];
      unint64_t v10 = [v4 geoLocation];
      BOOL v11 = [(SFLatLng *)v9 initWithProtobuf:v10];
      [(SFStructuredLocation *)v5 setGeoLocation:v11];
    }
    [v4 radius];
    if (v12 != 0.0)
    {
      [v4 radius];
      -[SFStructuredLocation setRadius:](v5, "setRadius:");
    }
    v13 = v5;
  }

  return v5;
}

@end