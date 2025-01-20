@interface FMDMockGeoLocatableLocation
+ (BOOL)supportsSecureCoding;
+ (id)geoLocatableLocation;
- (FMDMockGeoLocatableLocation)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSNumber)altitude;
- (NSNumber)course;
- (NSNumber)floor;
- (NSNumber)horizontalAccuracy;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)speed;
- (NSNumber)verticalAccuracy;
- (int64_t)locationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(id)a3;
- (void)setCourse:(id)a3;
- (void)setFloor:(id)a3;
- (void)setHorizontalAccuracy:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setLongitude:(id)a3;
- (void)setNewLatitude:(id)a3 longitude:(id)a4;
- (void)setSpeed:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setVerticalAccuracy:(id)a3;
@end

@implementation FMDMockGeoLocatableLocation

+ (id)geoLocatableLocation
{
  v2 = objc_alloc_init(FMDMockGeoLocatableLocation);
  [(FMDMockGeoLocatableLocation *)v2 setLatitude:&off_1002F21E0];
  [(FMDMockGeoLocatableLocation *)v2 setLongitude:&off_1002F21F0];
  [(FMDMockGeoLocatableLocation *)v2 setAltitude:&off_1002F1DE0];
  [(FMDMockGeoLocatableLocation *)v2 setHorizontalAccuracy:&off_1002F1DE0];
  [(FMDMockGeoLocatableLocation *)v2 setVerticalAccuracy:&off_1002F1DE0];
  v3 = +[NSDate date];
  [(FMDMockGeoLocatableLocation *)v2 setTimestamp:v3];

  return v2;
}

- (void)setNewLatitude:(id)a3 longitude:(id)a4
{
  id v6 = a4;
  [(FMDMockGeoLocatableLocation *)self setLatitude:a3];
  [(FMDMockGeoLocatableLocation *)self setLongitude:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDMockGeoLocatableLocation *)self latitude];
  id v6 = NSStringFromSelector("latitude");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDMockGeoLocatableLocation *)self longitude];
  v8 = NSStringFromSelector("longitude");
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(FMDMockGeoLocatableLocation *)self altitude];
  v10 = NSStringFromSelector("altitude");
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(FMDMockGeoLocatableLocation *)self horizontalAccuracy];
  v12 = NSStringFromSelector("horizontalAccuracy");
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(FMDMockGeoLocatableLocation *)self verticalAccuracy];
  v14 = NSStringFromSelector("verticalAccuracy");
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(FMDMockGeoLocatableLocation *)self course];
  v16 = NSStringFromSelector("course");
  [v4 encodeObject:v15 forKey:v16];

  v17 = [(FMDMockGeoLocatableLocation *)self speed];
  v18 = NSStringFromSelector("speed");
  [v4 encodeObject:v17 forKey:v18];

  v19 = [(FMDMockGeoLocatableLocation *)self timestamp];
  v20 = NSStringFromSelector("timestamp");
  [v4 encodeObject:v19 forKey:v20];

  v21 = [(FMDMockGeoLocatableLocation *)self floor];
  v22 = NSStringFromSelector("floor");
  [v4 encodeObject:v21 forKey:v22];

  id v24 = +[NSNumber numberWithInteger:[(FMDMockGeoLocatableLocation *)self locationType]];
  v23 = NSStringFromSelector("locationType");
  [v4 encodeObject:v24 forKey:v23];
}

- (FMDMockGeoLocatableLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)FMDMockGeoLocatableLocation;
  v5 = [(FMDMockGeoLocatableLocation *)&v37 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("latitude");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDMockGeoLocatableLocation *)v5 setLatitude:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector("longitude");
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDMockGeoLocatableLocation *)v5 setLongitude:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector("altitude");
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDMockGeoLocatableLocation *)v5 setAltitude:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("horizontalAccuracy");
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(FMDMockGeoLocatableLocation *)v5 setHorizontalAccuracy:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector("verticalAccuracy");
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    [(FMDMockGeoLocatableLocation *)v5 setVerticalAccuracy:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("course");
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(FMDMockGeoLocatableLocation *)v5 setCourse:v23];

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector("speed");
    v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    [(FMDMockGeoLocatableLocation *)v5 setSpeed:v26];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector("timestamp");
    v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    [(FMDMockGeoLocatableLocation *)v5 setTimestamp:v29];

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector("floor");
    v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    [(FMDMockGeoLocatableLocation *)v5 setFloor:v32];

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector("locationType");
    v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    -[FMDMockGeoLocatableLocation setLocationType:](v5, "setLocationType:", [v35 integerValue]);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(id)a3
{
}

- (NSNumber)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(id)a3
{
}

- (NSNumber)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(id)a3
{
}

- (NSNumber)course
{
  return self->_course;
}

- (void)setCourse:(id)a3
{
}

- (NSNumber)speed
{
  return self->_speed;
}

- (void)setSpeed:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_course, 0);
  objc_storeStrong((id *)&self->_verticalAccuracy, 0);
  objc_storeStrong((id *)&self->_horizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);

  objc_storeStrong((id *)&self->_latitude, 0);
}

@end