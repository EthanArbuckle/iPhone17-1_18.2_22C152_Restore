@interface RFMapPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFMapPoint)initWithCoder:(id)a3;
- (RFMapPoint)initWithProtobuf:(id)a3;
- (double)x;
- (double)y;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation RFMapPoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (unint64_t)hash
{
  [(RFMapPoint *)self x];
  double v4 = -v3;
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  [(RFMapPoint *)self y];
  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  long double v9 = round(v8);
  return ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (RFMapPoint *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if ([(RFMapPoint *)v4 isMemberOfClass:objc_opt_class()])
  {
    long double v5 = v4;
    [(RFMapPoint *)self x];
    double v7 = v6;
    [(RFMapPoint *)v5 x];
    if (vabdd_f64(v7, v8) >= 2.22044605e-16)
    {
      BOOL v12 = 0;
    }
    else
    {
      [(RFMapPoint *)self y];
      double v10 = v9;
      [(RFMapPoint *)v5 y];
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
  [(RFMapPoint *)self x];
  objc_msgSend(v4, "setX:");
  [(RFMapPoint *)self y];
  objc_msgSend(v4, "setY:");
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapPoint alloc] initWithFacade:self];
  double v3 = [(_SFPBRFMapPoint *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapPoint alloc] initWithFacade:self];
  double v3 = [(_SFPBRFMapPoint *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v6 = [[_SFPBRFMapPoint alloc] initWithFacade:self];
  long double v5 = [(_SFPBRFMapPoint *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMapPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  long double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  double v6 = [[_SFPBRFMapPoint alloc] initWithData:v5];
  double v7 = [(RFMapPoint *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setY:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_y = a3;
}

- (BOOL)hasX
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setX:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_x = a3;
}

- (RFMapPoint)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFMapPoint;
  long double v5 = [(RFMapPoint *)&v10 init];
  if (v5)
  {
    [v4 x];
    if (v6 != 0.0)
    {
      [v4 x];
      -[RFMapPoint setX:](v5, "setX:");
    }
    [v4 y];
    if (v7 != 0.0)
    {
      [v4 y];
      -[RFMapPoint setY:](v5, "setY:");
    }
    double v8 = v5;
  }

  return v5;
}

@end