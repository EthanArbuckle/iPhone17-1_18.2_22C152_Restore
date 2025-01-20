@interface SPObservationLocation
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSNumber)floorLevel;
- (SPObservationLocation)initWithCoder:(id)a3;
- (SPObservationLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 floorLevel:(id)a13;
- (SPObservationLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAcuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 floorLevel:(id)a13;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)speedAccuracy;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setCourseAccuracy:(double)a3;
- (void)setFloorLevel:(id)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedAccuracy:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation SPObservationLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPObservationLocation alloc];
  v5 = [(SPObservationLocation *)self timestamp];
  [(SPObservationLocation *)self latitude];
  double v26 = v6;
  [(SPObservationLocation *)self longitude];
  double v8 = v7;
  [(SPObservationLocation *)self horizontalAccuracy];
  double v10 = v9;
  [(SPObservationLocation *)self altitude];
  double v12 = v11;
  [(SPObservationLocation *)self verticalAccuracy];
  double v14 = v13;
  [(SPObservationLocation *)self speed];
  double v16 = v15;
  [(SPObservationLocation *)self speedAccuracy];
  double v18 = v17;
  [(SPObservationLocation *)self course];
  double v20 = v19;
  [(SPObservationLocation *)self courseAccuracy];
  uint64_t v22 = v21;
  v23 = [(SPObservationLocation *)self floorLevel];
  v24 = [(SPObservationLocation *)v4 initWithTimestamp:v5 latitude:v23 longitude:v26 horizontalAccuracy:v8 altitude:v10 verticalAccuracy:v12 speed:v14 speedAccuracy:v16 course:v18 courseAccuracy:v20 floorLevel:v22];

  return v24;
}

- (SPObservationLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAcuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 floorLevel:(id)a13
{
  return -[SPObservationLocation initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:](self, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", a3, a13, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (SPObservationLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 floorLevel:(id)a13
{
  id v24 = a3;
  id v25 = a13;
  v29.receiver = self;
  v29.super_class = (Class)SPObservationLocation;
  double v26 = [(SPObservationLocation *)&v29 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_timestamp, a3);
    v27->_latitude = a4;
    v27->_longitude = a5;
    v27->_horizontalAccuracy = a6;
    v27->_altitude = a7;
    v27->_verticalAccuracy = a8;
    v27->_speed = a9;
    v27->_speedAccuracy = a10;
    v27->_course = a11;
    v27->_courseAccuracy = a12;
    objc_storeStrong((id *)&v27->_floorLevel, a13);
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeDouble:@"latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeDouble:@"altitude" forKey:self->_altitude];
  [v5 encodeDouble:@"verticalAccuracy" forKey:self->_verticalAccuracy];
  [v5 encodeDouble:@"speed" forKey:self->_speed];
  [v5 encodeDouble:@"speedAccuracy" forKey:self->_speedAccuracy];
  [v5 encodeDouble:@"course" forKey:self->_course];
  [v5 encodeDouble:@"courseAccuracy" forKey:self->_courseAccuracy];
  [v5 encodeObject:self->_floorLevel forKey:@"floorLevel"];
}

- (SPObservationLocation)initWithCoder:(id)a3
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
  [v4 decodeDoubleForKey:@"altitude"];
  self->_altitude = v10;
  [v4 decodeDoubleForKey:@"verticalAccuracy"];
  self->_verticalAccuracy = v11;
  [v4 decodeDoubleForKey:@"speed"];
  self->_speed = v12;
  [v4 decodeDoubleForKey:@"speedAccuracy"];
  self->_speedAccuracy = v13;
  [v4 decodeDoubleForKey:@"course"];
  self->_course = v14;
  [v4 decodeDoubleForKey:@"courseAccuracy"];
  self->_courseAccuracy = v15;
  double v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floorLevel"];

  floorLevel = self->_floorLevel;
  self->_floorLevel = v16;

  return self;
}

- (id)description
{
  v3 = NSString;
  [(SPObservationLocation *)self latitude];
  uint64_t v25 = v4;
  [(SPObservationLocation *)self longitude];
  uint64_t v6 = v5;
  [(SPObservationLocation *)self horizontalAccuracy];
  uint64_t v8 = v7;
  [(SPObservationLocation *)self altitude];
  uint64_t v10 = v9;
  [(SPObservationLocation *)self verticalAccuracy];
  uint64_t v12 = v11;
  [(SPObservationLocation *)self speed];
  uint64_t v14 = v13;
  [(SPObservationLocation *)self speedAccuracy];
  uint64_t v16 = v15;
  [(SPObservationLocation *)self course];
  uint64_t v18 = v17;
  [(SPObservationLocation *)self courseAccuracy];
  uint64_t v20 = v19;
  uint64_t v21 = [(SPObservationLocation *)self floorLevel];
  uint64_t v22 = [(SPObservationLocation *)self timestamp];
  v23 = [v3 stringWithFormat:@"SPObservationLocation Latitude: %f Longitude: %f hAcc: %f alt: %f(acc:%f) speed: %f(acc:%f) course: %f(acc:%f) floor: %@ %@", v25, v6, v8, v10, v12, v14, v16, v18, v20, v21, v22];

  return v23;
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

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setSpeedAccuracy:(double)a3
{
  self->_speedAccuracy = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setCourseAccuracy:(double)a3
{
  self->_courseAccuracy = a3;
}

- (NSNumber)floorLevel
{
  return self->_floorLevel;
}

- (void)setFloorLevel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorLevel, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end