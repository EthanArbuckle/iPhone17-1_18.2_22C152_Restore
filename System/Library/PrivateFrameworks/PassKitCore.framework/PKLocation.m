@interface PKLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAltitude;
- (BOOL)hasEqualCoordinatesToLocation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSString)name;
- (NSString)relevantText;
- (PKLocation)init;
- (PKLocation)initWithCoder:(id)a3;
- (PKLocation)initWithDictionary:(id)a3;
- (double)altitude;
- (double)latitude;
- (double)longitude;
- (double)maxDistance;
- (id)CLLocation;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setMaxDistance:(double)a3;
- (void)setName:(id)a3;
- (void)setRelevantText:(id)a3;
@end

@implementation PKLocation

- (void)setMaxDistance:(double)a3
{
  self->_maxDistance = a3;
}

- (PKLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKLocation *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = [v4 decodeObjectOfClass:v6 forKey:@"latitude"];
    [v8 doubleValue];
    v5->_latitude = v9;

    v10 = [v4 decodeObjectOfClass:v6 forKey:@"longitude"];
    [v10 doubleValue];
    v5->_longitude = v11;

    v12 = [v4 decodeObjectOfClass:v6 forKey:@"altitude"];
    v5->_hasAltitude = v12 != 0;
    [v12 doubleValue];
    v5->_altitude = v13;
    v14 = [v4 decodeObjectOfClass:v6 forKey:@"maxDistance"];
    [v14 doubleValue];
    v5->_maxDistance = v15;

    uint64_t v16 = [v4 decodeObjectOfClass:v7 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:v7 forKey:@"relevantText"];
    relevantText = v5->_relevantText;
    v5->_relevantText = (NSString *)v18;
  }
  return v5;
}

- (PKLocation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKLocation;
  return [(PKLocation *)&v3 init];
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
  self->_hasAltitude = 1;
  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)setRelevantText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  relevantText = self->_relevantText;
  self->_relevantText = v4;

  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v4;

  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_latitude];
  [v8 encodeObject:v4 forKey:@"latitude"];

  v5 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_longitude];
  [v8 encodeObject:v5 forKey:@"longitude"];

  if (self->_hasAltitude)
  {
    uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_altitude];
    [v8 encodeObject:v6 forKey:@"altitude"];
  }
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_maxDistance];
  [v8 encodeObject:v7 forKey:@"maxDistance"];

  [v8 encodeObject:self->_name forKey:@"name"];
  [v8 encodeObject:self->_relevantText forKey:@"relevantText"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKLocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKLocation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 PKNumberForKey:@"latitude"];
    [v6 doubleValue];
    v5->_latitude = v7;

    id v8 = [v4 PKNumberForKey:@"longitude"];
    [v8 doubleValue];
    v5->_longitude = v9;

    v10 = [v4 PKNumberForKey:@"altitude"];
    v5->_hasAltitude = v10 != 0;
    [v10 doubleValue];
    v5->_altitude = v11;
    v12 = [v4 PKNumberForKey:@"maxDistance"];
    [v12 doubleValue];
    v5->_maxDistance = v13;

    uint64_t v14 = [v4 PKStringForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"relevantText"];
    relevantText = v5->_relevantText;
    v5->_relevantText = (NSString *)v16;
  }
  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_latitude;
  double longitude = self->_longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"(%.8g, %.8g)", *(void *)&self->_latitude, *(void *)&self->_longitude];
  if (self->_maxDistance > 0.0) {
    [v3 appendFormat:@", max distance %.1g", *(void *)&self->_maxDistance];
  }
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (![(PKLocation *)self hasEqualCoordinatesToLocation:v5])
    {
      LOBYTE(v10) = 0;
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v6 = (void *)v5[3];
    double v7 = self->_name;
    id v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      double v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
LABEL_16:

        goto LABEL_17;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_17;
      }
    }
    relevantText = self->_relevantText;
    v12 = (void *)v5[4];
    double v7 = relevantText;
    double v13 = v12;
    if (v7 == v13)
    {
      LOBYTE(v10) = 1;
      double v9 = v7;
    }
    else
    {
      double v9 = v13;
      LOBYTE(v10) = 0;
      if (v7 && v13) {
        LOBYTE(v10) = [(NSString *)v7 isEqualToString:v13];
      }
    }
    goto LABEL_16;
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (BOOL)hasEqualCoordinatesToLocation:(id)a3
{
  id v4 = (double *)a3;
  if (self->_latitude == v4[5] && self->_longitude == v4[6])
  {
    BOOL v5 = (*((unsigned __int8 *)v4 + 8) | self->_hasAltitude) == 0;
    if (self->_hasAltitude && *((unsigned char *)v4 + 8)) {
      BOOL v5 = self->_altitude == v4[7];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_hashComputed);
  if (v3) {
    return atomic_load(&self->_hash);
  }
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, &self->_latitude, 8u);
  CC_SHA1_Update(&c, &self->_longitude, 8u);
  if (self->_hasAltitude) {
    double altitude = self->_altitude;
  }
  else {
    double altitude = 0.0;
  }
  double data = altitude;
  CC_SHA1_Update(&c, &data, 8u);
  NSUInteger v6 = [(NSString *)self->_name hash];
  CC_SHA1_Update(&c, &v6, 8u);
  NSUInteger v6 = [(NSString *)self->_relevantText hash];
  CC_SHA1_Update(&c, &v6, 8u);
  CC_SHA1_Final(md, &c);
  unint64_t result = *(void *)md;
  atomic_store(*(unint64_t *)md, &self->_hash);
  atomic_store(1u, (unsigned __int8 *)&self->_hashComputed);
  return result;
}

- (id)CLLocation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:self->_latitude longitude:self->_longitude];
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (BOOL)hasAltitude
{
  return self->_hasAltitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)maxDistance
{
  return self->_maxDistance;
}

@end