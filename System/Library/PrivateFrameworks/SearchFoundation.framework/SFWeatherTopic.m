@interface SFWeatherTopic
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SFLatLng)location;
- (SFWeatherTopic)initWithCoder:(id)a3;
- (SFWeatherTopic)initWithQuery:(id)a3 location:(id)a4;
- (SFWeatherTopic)initWithQuery:(id)a3 location:(id)a4 identifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SFWeatherTopic

- (void).cxx_destruct
{
}

- (void)setLocation:(id)a3
{
}

- (SFLatLng)location
{
  return self->_location;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)SFWeatherTopic;
  v3 = [(SFQueryTopic *)&v13 description];
  v4 = NSString;
  v5 = [(SFWeatherTopic *)self location];
  [v5 lat];
  uint64_t v7 = v6;
  v8 = [(SFWeatherTopic *)self location];
  [v8 lng];
  v10 = objc_msgSend(v4, "stringWithFormat:", @" lat: %f long: %f", v7, v9);
  v11 = [v3 stringByAppendingString:v10];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFWeatherTopic;
  if ([(SFQueryTopic *)&v18 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(SFWeatherTopic *)self location];
    [v6 lat];
    double v8 = v7;
    uint64_t v9 = [v5 location];
    [v9 lat];
    if (v8 == v10)
    {
      v11 = [(SFWeatherTopic *)self location];
      [v11 lng];
      double v13 = v12;
      v14 = [v5 location];
      [v14 lng];
      BOOL v16 = v13 == v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFWeatherTopic;
  unint64_t v3 = [(SFQueryTopic *)&v12 hash];
  [(SFLatLng *)self->_location lat];
  double v5 = -v4;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  long double v6 = round(v5);
  unint64_t v7 = ((unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL)) ^ v3;
  [(SFLatLng *)self->_location lng];
  double v9 = -v8;
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  long double v10 = round(v9);
  return v7 ^ ((unint64_t)(fmod(v10, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v9 - v10, 0x40uLL));
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFWeatherTopic;
  id v4 = a3;
  [(SFQueryTopic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, @"_location", v5.receiver, v5.super_class);
}

- (SFWeatherTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFWeatherTopic;
  objc_super v5 = [(SFQueryTopic *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_location"];
    location = v5->_location;
    v5->_location = (SFLatLng *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFWeatherTopic;
  id v4 = [(SFQueryTopic *)&v7 copyWithZone:a3];
  objc_super v5 = [(SFWeatherTopic *)self location];
  [v4 setLocation:v5];

  return v4;
}

- (SFWeatherTopic)initWithQuery:(id)a3 location:(id)a4
{
  return [(SFWeatherTopic *)self initWithQuery:a3 location:a4 identifier:a3];
}

- (SFWeatherTopic)initWithQuery:(id)a3 location:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFWeatherTopic;
  objc_super v9 = [(SFQueryTopic *)&v12 initWithType:4 query:a3 identifier:a5];
  long double v10 = v9;
  if (v9) {
    [(SFWeatherTopic *)v9 setLocation:v8];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end