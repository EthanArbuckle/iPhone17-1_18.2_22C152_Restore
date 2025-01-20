@interface SFLatLng
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLat;
- (BOOL)hasLng;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFLatLng)initWithCoder:(id)a3;
- (SFLatLng)initWithProtobuf:(id)a3;
- (double)lat;
- (double)lng;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLat:(double)a3;
- (void)setLng:(double)a3;
@end

@implementation SFLatLng

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)lng
{
  return self->_lng;
}

- (double)lat
{
  return self->_lat;
}

- (unint64_t)hash
{
  [(SFLatLng *)self lat];
  double v4 = -v3;
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  [(SFLatLng *)self lng];
  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  long double v9 = round(v8);
  return ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SFLatLng *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if ([(SFLatLng *)v4 isMemberOfClass:objc_opt_class()])
  {
    long double v5 = v4;
    [(SFLatLng *)self lat];
    double v7 = v6;
    [(SFLatLng *)v5 lat];
    if (vabdd_f64(v7, v8) >= 2.22044605e-16)
    {
      BOOL v12 = 0;
    }
    else
    {
      [(SFLatLng *)self lng];
      double v10 = v9;
      [(SFLatLng *)v5 lng];
      BOOL v12 = vabdd_f64(v10, v11) < 2.22044605e-16;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SFLatLng *)self lat];
  objc_msgSend(v4, "setLat:");
  [(SFLatLng *)self lng];
  objc_msgSend(v4, "setLng:");
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBLatLng alloc] initWithFacade:self];
  double v3 = [(_SFPBLatLng *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBLatLng alloc] initWithFacade:self];
  double v3 = [(_SFPBLatLng *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v6 = [[_SFPBLatLng alloc] initWithFacade:self];
  long double v5 = [(_SFPBLatLng *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFLatLng)initWithCoder:(id)a3
{
  id v4 = a3;
  long double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  double v6 = [[_SFPBLatLng alloc] initWithData:v5];
  double v7 = [(SFLatLng *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasLng
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLng:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lng = a3;
}

- (BOOL)hasLat
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLat:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lat = a3;
}

- (SFLatLng)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFLatLng;
  long double v5 = [(SFLatLng *)&v10 init];
  if (v5)
  {
    [v4 lat];
    if (v6 != 0.0)
    {
      [v4 lat];
      -[SFLatLng setLat:](v5, "setLat:");
    }
    [v4 lng];
    if (v7 != 0.0)
    {
      [v4 lng];
      -[SFLatLng setLng:](v5, "setLng:");
    }
    double v8 = v5;
  }

  return v5;
}

@end