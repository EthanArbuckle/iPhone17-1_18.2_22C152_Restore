@interface TALocationLite
+ ($1AB5FA073B851C12C2339EC22442E995)estimateSpeedFrom:(id)a3 to:(id)a4;
+ (BOOL)distanceFromLocation:(id)a3 toLocation:(id)a4 satisfyNSigma:(unint64_t)a5 satisfyMinDistance:(double)a6;
+ (BOOL)supportsSecureCoding;
+ (double)residualDistanceFromLocation:(id)a3 toLocation:(id)a4 nSigma:(unint64_t)a5;
- (BOOL)distanceToLocation:(id)a3 satisfyNSigma:(unint64_t)a4 satisfyMinDistance:(double)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimulatedOrSpoofed;
- (NSDate)timestamp;
- (NSString)description;
- (TALocationLite)initWithCoder:(id)a3;
- (TALocationLite)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6;
- (TALocationLite)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 deltaDistance:(double)a13 deltaDistanceAccuracy:(double)a14 groundAltitude:(double)a15 groundAltitudeUncertainty:(double)a16 pressure:(double)a17 pressureUncertainty:(double)a18 isSimulatedOrSpoofed:(BOOL)a19;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)deltaDistance;
- (double)deltaDistanceAccuracy;
- (double)distanceFromLocation:(id)a3;
- (double)groundAltitude;
- (double)groundAltitudeUncertainty;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)pressure;
- (double)pressureUncertainty;
- (double)speed;
- (double)speedAccuracy;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TALocationLite

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"Date"];
  [v5 encodeDouble:@"Latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"Longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"HorizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeDouble:@"Altitude" forKey:self->_altitude];
  [v5 encodeDouble:@"VerticalAccuracy" forKey:self->_verticalAccuracy];
  [v5 encodeDouble:@"Speed" forKey:self->_speed];
  [v5 encodeDouble:@"SpeedAccuracy" forKey:self->_speedAccuracy];
  [v5 encodeDouble:@"Course" forKey:self->_course];
  [v5 encodeDouble:@"CourseAccuracy" forKey:self->_courseAccuracy];
  [v5 encodeDouble:@"DeltaDistance" forKey:self->_deltaDistance];
  [v5 encodeDouble:@"DeltaDistanceAccuracy" forKey:self->_deltaDistanceAccuracy];
  [v5 encodeDouble:@"GroundAltitude" forKey:self->_groundAltitude];
  [v5 encodeDouble:@"GroundAltitudeUncertainty" forKey:self->_groundAltitudeUncertainty];
  [v5 encodeDouble:@"Pressure" forKey:self->_pressure];
  [v5 encodeDouble:@"PressureUncertainty" forKey:self->_pressureUncertainty];
  [v5 encodeBool:self->_isSimulatedOrSpoofed forKey:@"IsSimulated"];
}

- (double)distanceFromLocation:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F00A50];
  id v5 = a3;
  id v6 = [v4 alloc];
  CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(self->_latitude, self->_longitude);
  v8 = objc_msgSend(v6, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", self->_timestamp, v7.latitude, v7.longitude, self->_altitude, self->_horizontalAccuracy, self->_verticalAccuracy);
  id v9 = objc_alloc(MEMORY[0x263F00A50]);
  [v5 latitude];
  CLLocationDegrees v11 = v10;
  [v5 longitude];
  CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
  [v5 altitude];
  double v15 = v14;
  [v5 horizontalAccuracy];
  double v17 = v16;
  [v5 verticalAccuracy];
  double v19 = v18;
  v20 = [v5 timestamp];

  v21 = objc_msgSend(v9, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v20, v13.latitude, v13.longitude, v15, v17, v19);
  [v8 distanceFromLocation:v21];
  double v23 = v22;

  return v23;
}

- (id)descriptionDictionary
{
  v41[18] = *MEMORY[0x263EF8340];
  v40[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v3);
  v41[0] = v39;
  v40[1] = @"Latitude";
  v4 = NSNumber;
  [(TALocationLite *)self latitude];
  v38 = objc_msgSend(v4, "numberWithDouble:");
  v41[1] = v38;
  v40[2] = @"Longitude";
  id v5 = NSNumber;
  [(TALocationLite *)self longitude];
  v37 = objc_msgSend(v5, "numberWithDouble:");
  v41[2] = v37;
  v40[3] = @"HorizontalAccuracy";
  id v6 = NSNumber;
  [(TALocationLite *)self horizontalAccuracy];
  v36 = objc_msgSend(v6, "numberWithDouble:");
  v41[3] = v36;
  v40[4] = @"Altitude";
  CLLocationCoordinate2D v7 = NSNumber;
  [(TALocationLite *)self altitude];
  v35 = objc_msgSend(v7, "numberWithDouble:");
  v41[4] = v35;
  v40[5] = @"VerticalAccuracy";
  v8 = NSNumber;
  [(TALocationLite *)self verticalAccuracy];
  v34 = objc_msgSend(v8, "numberWithDouble:");
  v41[5] = v34;
  v40[6] = @"Speed";
  id v9 = NSNumber;
  [(TALocationLite *)self speed];
  v33 = objc_msgSend(v9, "numberWithDouble:");
  v41[6] = v33;
  v40[7] = @"SpeedAccuracy";
  double v10 = NSNumber;
  [(TALocationLite *)self speedAccuracy];
  v32 = objc_msgSend(v10, "numberWithDouble:");
  v41[7] = v32;
  v40[8] = @"Course";
  CLLocationDegrees v11 = NSNumber;
  [(TALocationLite *)self course];
  v31 = objc_msgSend(v11, "numberWithDouble:");
  v41[8] = v31;
  v40[9] = @"CourseAccuracy";
  CLLocationDegrees v12 = NSNumber;
  [(TALocationLite *)self courseAccuracy];
  v30 = objc_msgSend(v12, "numberWithDouble:");
  v41[9] = v30;
  v40[10] = @"DeltaDistance";
  CLLocationCoordinate2D v13 = NSNumber;
  [(TALocationLite *)self deltaDistance];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  v41[10] = v14;
  v40[11] = @"DeltaDistanceAccuracy";
  double v15 = NSNumber;
  [(TALocationLite *)self deltaDistanceAccuracy];
  double v16 = objc_msgSend(v15, "numberWithDouble:");
  v41[11] = v16;
  v40[12] = @"GroundAltitude";
  double v17 = NSNumber;
  [(TALocationLite *)self groundAltitude];
  double v18 = objc_msgSend(v17, "numberWithDouble:");
  v41[12] = v18;
  v40[13] = @"GroundAltitudeUncertainty";
  double v19 = NSNumber;
  [(TALocationLite *)self groundAltitudeUncertainty];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  v41[13] = v20;
  v40[14] = @"Pressure";
  v21 = NSNumber;
  [(TALocationLite *)self pressure];
  double v22 = objc_msgSend(v21, "numberWithDouble:");
  v41[14] = v22;
  v40[15] = @"PressureUncertainty";
  double v23 = NSNumber;
  [(TALocationLite *)self pressureUncertainty];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v41[15] = v24;
  v40[16] = @"IsSimulated";
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[TALocationLite isSimulatedOrSpoofed](self, "isSimulatedOrSpoofed"));
  v41[16] = v25;
  v40[17] = @"Date";
  v26 = [(TALocationLite *)self timestamp];
  v27 = [v26 getDateString];
  v41[17] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:18];

  return v28;
}

- (BOOL)isSimulatedOrSpoofed
{
  return self->_isSimulatedOrSpoofed;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)speed
{
  return self->_speed;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (double)pressure
{
  return self->_pressure;
}

- (double)pressureUncertainty
{
  return self->_pressureUncertainty;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (double)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (TALocationLite)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 deltaDistance:(double)a13 deltaDistanceAccuracy:(double)a14 groundAltitude:(double)a15 groundAltitudeUncertainty:(double)a16 pressure:(double)a17 pressureUncertainty:(double)a18 isSimulatedOrSpoofed:(BOOL)a19
{
  id v29 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TALocationLite;
  v30 = [(TALocationLite *)&v35 init];
  if (v30)
  {
    if (!v29)
    {
      v33 = 0;
      goto LABEL_6;
    }
    uint64_t v31 = [v29 copy];
    timestamp = v30->_timestamp;
    v30->_timestamp = (NSDate *)v31;

    v30->_latitude = a4;
    v30->_longitude = a5;
    v30->_horizontalAccuracy = a6;
    v30->_altitude = a7;
    v30->_verticalAccuracy = a8;
    v30->_speed = a9;
    v30->_speedAccuracy = a10;
    v30->_course = a11;
    v30->_courseAccuracy = a12;
    v30->_deltaDistance = a13;
    v30->_deltaDistanceAccuracy = a14;
    v30->_groundAltitude = a15;
    v30->_groundAltitudeUncertainty = a16;
    v30->_pressure = a17;
    v30->_pressureUncertainty = a18;
    v30->_isSimulatedOrSpoofed = a19;
  }
  v33 = v30;
LABEL_6:

  return v33;
}

- (id)getDate
{
  return self->_timestamp;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSString)description
{
  v3 = [(TALocationLite *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (TALocationLite)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6
{
  return -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](self, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", a3, 0, a4, a5, a6, 0.0, -1.0, 0.0, -1.0, 0.0, 0xBFF0000000000000, 0, 0xBFF0000000000000, 0, 0xBFF0000000000000,
           0,
           0xBFF0000000000000);
}

- (BOOL)distanceToLocation:(id)a3 satisfyNSigma:(unint64_t)a4 satisfyMinDistance:(double)a5
{
  return +[TALocationLite distanceFromLocation:self toLocation:a3 satisfyNSigma:a4 satisfyMinDistance:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TALocationLite alloc];
  id v5 = [(TALocationLite *)self timestamp];
  [(TALocationLite *)self latitude];
  double v36 = v6;
  [(TALocationLite *)self longitude];
  double v35 = v7;
  [(TALocationLite *)self horizontalAccuracy];
  double v34 = v8;
  [(TALocationLite *)self altitude];
  double v33 = v9;
  [(TALocationLite *)self verticalAccuracy];
  double v32 = v10;
  [(TALocationLite *)self speed];
  double v31 = v11;
  [(TALocationLite *)self speedAccuracy];
  double v30 = v12;
  [(TALocationLite *)self course];
  double v14 = v13;
  [(TALocationLite *)self courseAccuracy];
  uint64_t v16 = v15;
  [(TALocationLite *)self deltaDistance];
  uint64_t v18 = v17;
  [(TALocationLite *)self deltaDistanceAccuracy];
  uint64_t v20 = v19;
  [(TALocationLite *)self groundAltitude];
  uint64_t v22 = v21;
  [(TALocationLite *)self groundAltitudeUncertainty];
  uint64_t v24 = v23;
  [(TALocationLite *)self pressure];
  uint64_t v26 = v25;
  [(TALocationLite *)self pressureUncertainty];
  v28 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](v4, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", v5, [(TALocationLite *)self isSimulatedOrSpoofed], v36, v35, v34, v33, v32, v31, v30, v14, v16, v18, v20, v22, v24,
          v26,
          v27);

  return v28;
}

+ (BOOL)distanceFromLocation:(id)a3 toLocation:(id)a4 satisfyNSigma:(unint64_t)a5 satisfyMinDistance:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  double v11 = v10;
  BOOL v12 = 0;
  if (v9 && v10)
  {
    [v9 horizontalAccuracy];
    if (v13 >= 0.0 && ([v11 horizontalAccuracy], v14 >= 0.0))
    {
      [v9 distanceFromLocation:v11];
      double v16 = v15;
      +[TALocationLite residualDistanceFromLocation:v9 toLocation:v11 nSigma:a5];
      BOOL v12 = v16 >= a6 && v17 > 0.0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

+ (double)residualDistanceFromLocation:(id)a3 toLocation:(id)a4 nSigma:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  double v10 = 0.0;
  if (v7)
  {
    if (v8)
    {
      [v7 horizontalAccuracy];
      if (v11 >= 0.0)
      {
        [v9 horizontalAccuracy];
        if (v12 >= 0.0)
        {
          [v7 distanceFromLocation:v9];
          double v14 = v13;
          [v7 horizontalAccuracy];
          double v16 = v14 - (double)a5 * v15;
          [v9 horizontalAccuracy];
          double v10 = v16 - (double)a5 * v17;
        }
      }
    }
  }

  return v10;
}

+ ($1AB5FA073B851C12C2339EC22442E995)estimateSpeedFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  double v8 = -1.0;
  if (!v5) {
    goto LABEL_9;
  }
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v9 = [v5 getDate];
  if (!v9) {
    goto LABEL_9;
  }
  double v10 = (void *)v9;
  uint64_t v11 = [v7 getDate];
  if (!v11)
  {
LABEL_8:

LABEL_9:
    double v16 = -1.0;
    double v17 = -1.0;
    goto LABEL_10;
  }
  double v12 = (void *)v11;
  double v13 = [v5 getDate];
  double v14 = [v7 getDate];
  if ([v13 compare:v14] == 1 || (objc_msgSend(v5, "horizontalAccuracy"), v15 < 0.0))
  {

    goto LABEL_8;
  }
  [v7 horizontalAccuracy];
  double v22 = v21;

  double v16 = -1.0;
  double v17 = -1.0;
  if (v22 >= 0.0)
  {
    uint64_t v23 = [v7 getDate];
    uint64_t v24 = [v5 getDate];
    [v23 timeIntervalSinceDate:v24];
    double v26 = v25;

    double v8 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    if (v26 != 0.0)
    {
      [v7 distanceFromLocation:v5];
      double v28 = v27;
      [v5 horizontalAccuracy];
      double v30 = v28 - v29;
      [v7 horizontalAccuracy];
      double v32 = v30 - v31;
      [v5 horizontalAccuracy];
      double v34 = v28 + v33;
      [v7 horizontalAccuracy];
      double v36 = v34 + v35;
      if (v32 >= 0.0) {
        double v8 = v32 / v26;
      }
      else {
        double v8 = 0.0;
      }
      double v16 = v36 / v26;
      double v17 = v28 / v26;
    }
  }
LABEL_10:

  double v18 = v8;
  double v19 = v16;
  double v20 = v17;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (TALocationLite)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
  [v4 decodeDoubleForKey:@"Latitude"];
  double v38 = v6;
  [v4 decodeDoubleForKey:@"Longitude"];
  double v37 = v7;
  [v4 decodeDoubleForKey:@"HorizontalAccuracy"];
  double v36 = v8;
  [v4 decodeDoubleForKey:@"Altitude"];
  double v35 = v9;
  [v4 decodeDoubleForKey:@"VerticalAccuracy"];
  double v34 = v10;
  [v4 decodeDoubleForKey:@"Speed"];
  double v33 = v11;
  [v4 decodeDoubleForKey:@"SpeedAccuracy"];
  double v32 = v12;
  [v4 decodeDoubleForKey:@"Course"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"CourseAccuracy"];
  uint64_t v16 = v15;
  [v4 decodeDoubleForKey:@"DeltaDistance"];
  uint64_t v18 = v17;
  [v4 decodeDoubleForKey:@"DeltaDistanceAccuracy"];
  uint64_t v20 = v19;
  [v4 decodeDoubleForKey:@"GroundAltitude"];
  uint64_t v22 = v21;
  [v4 decodeDoubleForKey:@"GroundAltitudeUncertainty"];
  uint64_t v24 = v23;
  [v4 decodeDoubleForKey:@"Pressure"];
  uint64_t v26 = v25;
  [v4 decodeDoubleForKey:@"PressureUncertainty"];
  uint64_t v28 = v27;
  uint64_t v29 = [v4 decodeBoolForKey:@"IsSimulated"];

  double v30 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](self, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", v5, v29, v38, v37, v36, v35, v34, v33, v32, v14, v16, v18, v20, v22, v24,
          v26,
          v28);

  return v30;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_timestamp hash];
  double v36 = [NSNumber numberWithDouble:self->_latitude];
  uint64_t v4 = [v36 hash] ^ v3;
  double v35 = [NSNumber numberWithDouble:self->_longitude];
  uint64_t v5 = [v35 hash];
  double v34 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  uint64_t v6 = v4 ^ v5 ^ [v34 hash];
  double v33 = [NSNumber numberWithDouble:self->_altitude];
  uint64_t v7 = [v33 hash];
  double v32 = [NSNumber numberWithDouble:self->_verticalAccuracy];
  uint64_t v8 = v7 ^ [v32 hash];
  double v31 = [NSNumber numberWithDouble:self->_speed];
  uint64_t v9 = v6 ^ v8 ^ [v31 hash];
  double v30 = [NSNumber numberWithDouble:self->_speedAccuracy];
  uint64_t v10 = [v30 hash];
  uint64_t v29 = [NSNumber numberWithDouble:self->_course];
  uint64_t v11 = v10 ^ [v29 hash];
  uint64_t v28 = [NSNumber numberWithDouble:self->_courseAccuracy];
  uint64_t v12 = v11 ^ [v28 hash];
  double v13 = [NSNumber numberWithDouble:self->_deltaDistance];
  uint64_t v14 = v9 ^ v12 ^ [v13 hash];
  uint64_t v15 = [NSNumber numberWithDouble:self->_deltaDistanceAccuracy];
  uint64_t v16 = [v15 hash];
  uint64_t v17 = [NSNumber numberWithDouble:self->_groundAltitude];
  uint64_t v18 = v16 ^ [v17 hash];
  uint64_t v19 = [NSNumber numberWithDouble:self->_groundAltitudeUncertainty];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = [NSNumber numberWithDouble:self->_pressure];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = [NSNumber numberWithDouble:self->_pressureUncertainty];
  uint64_t v24 = v14 ^ v22 ^ [v23 hash];
  uint64_t v25 = [NSNumber numberWithBool:self->_isSimulatedOrSpoofed];
  unint64_t v26 = v24 ^ [v25 hash];

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TALocationLite *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [(TALocationLite *)self distanceFromLocation:v5];
      if (v6 == 0.0)
      {
        timestamp = self->_timestamp;
        uint64_t v8 = [(TALocationLite *)v5 timestamp];
        char v9 = [(NSDate *)timestamp isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  double v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

@end