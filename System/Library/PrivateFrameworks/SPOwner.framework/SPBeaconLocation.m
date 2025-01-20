@interface SPBeaconLocation
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSString)source;
- (SPBeaconLocation)initWithCoder:(id)a3;
- (SPBeaconLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 source:(id)a7;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setSource:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SPBeaconLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconLocation alloc];
  v5 = [(SPBeaconLocation *)self timestamp];
  [(SPBeaconLocation *)self latitude];
  double v7 = v6;
  [(SPBeaconLocation *)self longitude];
  double v9 = v8;
  [(SPBeaconLocation *)self horizontalAccuracy];
  double v11 = v10;
  v12 = [(SPBeaconLocation *)self source];
  v13 = [(SPBeaconLocation *)v4 initWithTimestamp:v5 latitude:v12 longitude:v7 horizontalAccuracy:v9 source:v11];

  return v13;
}

- (SPBeaconLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 source:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SPBeaconLocation;
  v15 = [(SPBeaconLocation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timestamp, a3);
    v16->_latitude = a4;
    v16->_longitude = a5;
    v16->_horizontalAccuracy = a6;
    objc_storeStrong((id *)&v16->_source, a7);
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeDouble:@"latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeObject:self->_source forKey:@"source"];
}

- (SPBeaconLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  [v4 decodeDoubleForKey:@"latitude"];
  self->_latitude = v7;
  [v4 decodeDoubleForKey:@"longitude"];
  self->_longitude = v8;
  [v4 decodeDoubleForKey:@"horizontalAccuracy"];
  self->_horizontalAccuracy = v9;
  double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];

  source = self->_source;
  self->_source = v10;

  return self;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(SPBeaconLocation *)self latitude];
  uint64_t v6 = v5;
  [(SPBeaconLocation *)self longitude];
  uint64_t v8 = v7;
  double v9 = [(SPBeaconLocation *)self timestamp];
  [(SPBeaconLocation *)self horizontalAccuracy];
  uint64_t v11 = v10;
  v12 = [(SPBeaconLocation *)self source];
  id v13 = [v3 stringWithFormat:@"<%@ %p: %.06f/%.06f %@ (%.0f) source: %@>", v4, self, v6, v8, v9, v11, v12];

  return v13;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end