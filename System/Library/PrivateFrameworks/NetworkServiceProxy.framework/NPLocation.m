@interface NPLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NPLocation)initWithCoder:(id)a3;
- (NPLocation)initWithLatitude:(double)a3 longtitude:(double)a4 timestamp:(id)a5;
- (NSDate)timestamp;
- (double)latitude;
- (double)longtitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongtitude:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation NPLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPLocation)initWithLatitude:(double)a3 longtitude:(double)a4 timestamp:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NPLocation;
  v10 = [(NPLocation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_latitude = a3;
    v10->_longtitude = a4;
    objc_storeStrong((id *)&v10->_timestamp, a5);
  }

  return v11;
}

- (NPLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"Latitude"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"Longtitude"];
  double v8 = v7;
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Timestamp"];

  v10 = [(NPLocation *)self initWithLatitude:v9 longtitude:v6 timestamp:v8];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(NPLocation *)self latitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"Latitude");
  [(NPLocation *)self longtitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"Longtitude");
  id v5 = [(NPLocation *)self timestamp];
  [v4 encodeObject:v5 forKey:@"Timestamp"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPLocation allocWithZone:a3] init];
  [(NPLocation *)self latitude];
  -[NPLocation setLatitude:](v4, "setLatitude:");
  [(NPLocation *)self longtitude];
  -[NPLocation setLongtitude:](v4, "setLongtitude:");
  id v5 = [(NPLocation *)self timestamp];
  [(NPLocation *)v4 setTimestamp:v5];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(NPLocation *)self latitude];
  uint64_t v5 = v4;
  [(NPLocation *)self longtitude];
  uint64_t v7 = v6;
  double v8 = [(NPLocation *)self timestamp];
  [v3 appendFormat:@"<%f, %f> %@", v5, v7, v8];

  return v3;
}

- (BOOL)isValid
{
  [(NPLocation *)self latitude];
  if (v3 == 0.0) {
    return 0;
  }
  [(NPLocation *)self longtitude];
  return v4 != 0.0;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longtitude
{
  return self->_longtitude;
}

- (void)setLongtitude:(double)a3
{
  self->_longtitude = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end