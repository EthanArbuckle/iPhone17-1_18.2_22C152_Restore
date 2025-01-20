@interface SPSecureLocation
+ (BOOL)supportsSecureCoding;
+ (id)_stringFromMotionState:(int64_t)a3;
+ (id)_stringFromPublishReason:(int64_t)a3;
- (NSDate)timestamp;
- (NSNumber)floor;
- (NSString)findMyId;
- (NSString)locationLabel;
- (SPSecureLocation)initWithCoder:(id)a3;
- (double)altitude;
- (double)course;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)motionActivityState;
- (int64_t)publishReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setFindMyId:(id)a3;
- (void)setFloor:(id)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMotionActivityState:(int64_t)a3;
- (void)setPublishReason:(int64_t)a3;
- (void)setSpeed:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation SPSecureLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SPSecureLocation);
  v5 = [(SPSecureLocation *)self findMyId];
  [(SPSecureLocation *)v4 setFindMyId:v5];

  [(SPSecureLocation *)self longitude];
  -[SPSecureLocation setLongitude:](v4, "setLongitude:");
  [(SPSecureLocation *)self latitude];
  -[SPSecureLocation setLatitude:](v4, "setLatitude:");
  [(SPSecureLocation *)self speed];
  -[SPSecureLocation setSpeed:](v4, "setSpeed:");
  [(SPSecureLocation *)self horizontalAccuracy];
  -[SPSecureLocation setHorizontalAccuracy:](v4, "setHorizontalAccuracy:");
  [(SPSecureLocation *)self verticalAccuracy];
  -[SPSecureLocation setVerticalAccuracy:](v4, "setVerticalAccuracy:");
  [(SPSecureLocation *)self course];
  -[SPSecureLocation setCourse:](v4, "setCourse:");
  [(SPSecureLocation *)self altitude];
  -[SPSecureLocation setAltitude:](v4, "setAltitude:");
  v6 = [(SPSecureLocation *)self floor];
  [(SPSecureLocation *)v4 setFloor:v6];

  v7 = [(SPSecureLocation *)self timestamp];
  [(SPSecureLocation *)v4 setTimestamp:v7];

  [(SPSecureLocation *)v4 setMotionActivityState:[(SPSecureLocation *)self motionActivityState]];
  [(SPSecureLocation *)v4 setPublishReason:[(SPSecureLocation *)self publishReason]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  findMyId = self->_findMyId;
  id v5 = a3;
  [v5 encodeObject:findMyId forKey:@"findMyId"];
  [v5 encodeDouble:@"latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeDouble:@"verticalAccuracy" forKey:self->_verticalAccuracy];
  [v5 encodeDouble:@"speed" forKey:self->_speed];
  [v5 encodeDouble:@"course" forKey:self->_course];
  [v5 encodeDouble:@"altitude" forKey:self->_altitude];
  [v5 encodeObject:self->_floor forKey:@"floor"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeInteger:self->_motionActivityState forKey:@"motionActivityState"];
  [v5 encodeInteger:self->_publishReason forKey:@"publishReason"];
  [v5 encodeObject:self->_locationLabel forKey:@"locationLabel"];
}

- (SPSecureLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"findMyId"];
  findMyId = self->_findMyId;
  self->_findMyId = v5;

  [v4 decodeDoubleForKey:@"latitude"];
  self->_latitude = v7;
  [v4 decodeDoubleForKey:@"longitude"];
  self->_longitude = v8;
  [v4 decodeDoubleForKey:@"horizontalAccuracy"];
  self->_horizontalAccuracy = v9;
  [v4 decodeDoubleForKey:@"verticalAccuracy"];
  self->_verticalAccuracy = v10;
  [v4 decodeDoubleForKey:@"speed"];
  self->_speed = v11;
  [v4 decodeDoubleForKey:@"course"];
  self->_course = v12;
  [v4 decodeDoubleForKey:@"altitude"];
  self->_altitude = v13;
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floor"];
  floor = self->_floor;
  self->_floor = v14;

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = self->_timestamp;
  self->_timestamp = v16;

  self->_motionActivityState = [v4 decodeIntegerForKey:@"motionActivityState"];
  self->_publishReason = [v4 decodeIntegerForKey:@"publishReason"];
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationLabel"];

  locationLabel = self->_locationLabel;
  self->_locationLabel = v18;

  return self;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPSecureLocation *)self findMyId];
  [(SPSecureLocation *)self latitude];
  uint64_t v7 = v6;
  [(SPSecureLocation *)self longitude];
  uint64_t v9 = v8;
  double v10 = [(SPSecureLocation *)self timestamp];
  [(SPSecureLocation *)self horizontalAccuracy];
  uint64_t v12 = v11;
  [(SPSecureLocation *)self verticalAccuracy];
  uint64_t v14 = v13;
  [(SPSecureLocation *)self speed];
  uint64_t v16 = v15;
  [(SPSecureLocation *)self altitude];
  uint64_t v18 = v17;
  v19 = [(SPSecureLocation *)self floor];
  v20 = +[SPSecureLocation _stringFromMotionState:[(SPSecureLocation *)self motionActivityState]];
  v21 = +[SPSecureLocation _stringFromPublishReason:[(SPSecureLocation *)self publishReason]];
  v22 = [(SPSecureLocation *)self locationLabel];
  v23 = [v3 stringWithFormat:@"<%@ %p: %@ %.06f/%.06f %@ ha %.06f va %.06f sp %.06f alt %0.06f fl %@ mstate %@ pubreason %@ lbl %@>", v4, self, v5, v7, v9, v10, v12, v14, v16, v18, v19, v20, v21, v22];

  return v23;
}

+ (id)_stringFromPublishReason:(int64_t)a3
{
  id result = @"slc";
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      id result = @"visitStart";
      break;
    case 3:
      id result = @"heartbeat";
      break;
    case 4:
      id result = @"bystander";
      break;
    case 5:
      id result = @"ondemand";
      break;
    case 6:
      id result = @"shallow";
      break;
    case 7:
      id result = @"live";
      break;
    case 8:
      id result = @"stewie";
      break;
    default:
      if (a3 == 100) {
        id result = @"legacyLocate";
      }
      else {
        id result = @"unknown";
      }
      break;
  }
  return result;
}

+ (id)_stringFromMotionState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E601CB50[a3 - 1];
  }
}

- (NSString)findMyId
{
  return self->_findMyId;
}

- (void)setFindMyId:(id)a3
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

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (NSNumber)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int64_t)motionActivityState
{
  return self->_motionActivityState;
}

- (void)setMotionActivityState:(int64_t)a3
{
  self->_motionActivityState = a3;
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (void)setPublishReason:(int64_t)a3
{
  self->_publishReason = a3;
}

- (NSString)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_floor, 0);

  objc_storeStrong((id *)&self->_findMyId, 0);
}

@end