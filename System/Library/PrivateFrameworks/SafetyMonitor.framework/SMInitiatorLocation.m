@interface SMInitiatorLocation
+ (BOOL)isCLLocationValid:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSDate)date;
- (NSUUID)identifier;
- (SMInitiatorLocation)initWithCLLocation:(id)a3;
- (SMInitiatorLocation)initWithCoder:(id)a3;
- (SMInitiatorLocation)initWithDictionary:(id)a3;
- (SMInitiatorLocation)initWithIdentifier:(id)a3 latitude:(double)a4 longitude:(double)a5 hunc:(double)a6 altitude:(double)a7 vunc:(double)a8 date:(id)a9;
- (double)altitude;
- (double)hunc;
- (double)latitude;
- (double)longitude;
- (double)vunc;
- (id)description;
- (id)outputToDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMInitiatorLocation

- (SMInitiatorLocation)initWithIdentifier:(id)a3 latitude:(double)a4 longitude:(double)a5 hunc:(double)a6 altitude:(double)a7 vunc:(double)a8 date:(id)a9
{
  id v17 = a3;
  id v18 = a9;
  if (v17)
  {
    v24.receiver = self;
    v24.super_class = (Class)SMInitiatorLocation;
    v19 = [(SMInitiatorLocation *)&v24 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      v20->_hunc = a6;
      v20->_altitude = a7;
      v20->_latitude = a4;
      v20->_longitude = a5;
      objc_storeStrong((id *)&v20->_date, a9);
      v20->_vunc = a8;
    }
    self = v20;
    v21 = self;
  }
  else
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (SMInitiatorLocation)initWithCLLocation:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v4 coordinate];
  double v7 = v6;
  [v4 coordinate];
  double v9 = v8;
  [v4 horizontalAccuracy];
  double v11 = v10;
  [v4 altitude];
  double v13 = v12;
  [v4 verticalAccuracy];
  double v15 = v14;
  v16 = [v4 timestamp];

  id v17 = [(SMInitiatorLocation *)self initWithIdentifier:v5 latitude:v16 longitude:v7 hunc:v9 altitude:v11 vunc:v13 date:v15];
  return v17;
}

+ (BOOL)isCLLocationValid:(id)a3
{
  id v3 = a3;
  id v4 = [[SMInitiatorLocation alloc] initWithCLLocation:v3];

  LOBYTE(v3) = [(SMInitiatorLocation *)v4 isValid];
  return (char)v3;
}

- (BOOL)isValid
{
  [(SMInitiatorLocation *)self latitude];
  CLLocationDegrees v4 = v3;
  [(SMInitiatorLocation *)self longitude];
  CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v4, v5);
  if (!CLLocationCoordinate2DIsValid(v12)) {
    return 0;
  }
  [(SMInitiatorLocation *)self latitude];
  if (v6 == 0.0)
  {
    [(SMInitiatorLocation *)self longitude];
    if (v7 == 0.0) {
      return 0;
    }
  }
  [(SMInitiatorLocation *)self hunc];
  if (v8 <= 0.0) {
    return 0;
  }
  double v9 = [(SMInitiatorLocation *)self date];
  BOOL v10 = v9 != 0;

  return v10;
}

- (SMInitiatorLocation)initWithDictionary:(id)a3
{
  CLLocationDegrees v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = [v5 valueForKey:@"identifier"];
  double v8 = (void *)[v6 initWithUUIDString:v7];

  double v9 = [v5 valueForKey:@"latitude"];
  [v9 doubleValue];
  double v11 = v10;

  CLLocationCoordinate2D v12 = [v5 valueForKey:@"longitude"];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = [v5 valueForKey:@"hunc"];
  [v15 doubleValue];
  double v17 = v16;

  id v18 = [v5 valueForKey:@"altitude"];
  [v18 doubleValue];
  double v20 = v19;

  v21 = [v5 valueForKey:@"vunc"];
  [v21 doubleValue];
  double v23 = v22;

  objc_super v24 = [v5 valueForKey:@"date"];

  [v24 doubleValue];
  double v26 = v25;

  v27 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v26];
  v28 = [(SMInitiatorLocation *)self initWithIdentifier:v8 latitude:v27 longitude:v11 hunc:v14 altitude:v17 vunc:v20 date:v23];

  return v28;
}

- (id)outputToDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  CLLocationDegrees v4 = [(SMInitiatorLocation *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  id v6 = NSNumber;
  [(SMInitiatorLocation *)self latitude];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"latitude"];

  double v8 = NSNumber;
  [(SMInitiatorLocation *)self longitude];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKey:@"longitude"];

  double v10 = NSNumber;
  [(SMInitiatorLocation *)self hunc];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKey:@"hunc"];

  CLLocationCoordinate2D v12 = NSNumber;
  [(SMInitiatorLocation *)self altitude];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKey:@"altitude"];

  double v14 = NSNumber;
  [(SMInitiatorLocation *)self vunc];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKey:@"vunc"];

  double v16 = NSNumber;
  double v17 = [(SMInitiatorLocation *)self date];
  [v17 timeIntervalSince1970];
  id v18 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v18 forKey:@"date"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMInitiatorLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [v4 decodeDoubleForKey:@"latitude"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"longitude"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"hunc"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"altitude"];
  double v13 = v12;
  [v4 decodeDoubleForKey:@"vunc"];
  double v15 = v14;
  double v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  double v17 = [(SMInitiatorLocation *)self initWithIdentifier:v5 latitude:v16 longitude:v7 hunc:v9 altitude:v11 vunc:v13 date:v15];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SMInitiatorLocation *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  [(SMInitiatorLocation *)self latitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"latitude");
  [(SMInitiatorLocation *)self longitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"longitude");
  [(SMInitiatorLocation *)self hunc];
  objc_msgSend(v4, "encodeDouble:forKey:", @"hunc");
  [(SMInitiatorLocation *)self altitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"altitude");
  [(SMInitiatorLocation *)self vunc];
  objc_msgSend(v4, "encodeDouble:forKey:", @"vunc");
  id v6 = [(SMInitiatorLocation *)self date];
  [v4 encodeObject:v6 forKey:@"date"];
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(SMInitiatorLocation *)self identifier];
  [(SMInitiatorLocation *)self latitude];
  uint64_t v6 = v5;
  [(SMInitiatorLocation *)self longitude];
  uint64_t v8 = v7;
  [(SMInitiatorLocation *)self hunc];
  uint64_t v10 = v9;
  [(SMInitiatorLocation *)self altitude];
  uint64_t v12 = v11;
  [(SMInitiatorLocation *)self vunc];
  uint64_t v14 = v13;
  double v15 = [(SMInitiatorLocation *)self date];
  double v16 = [v15 stringFromDate];
  double v17 = [v3 stringWithFormat:@"identifier, %@, latitude, %f, longitude, %f, hunc, %f, altitude, %f, vunc, %f, date, %@", v4, v6, v8, v10, v12, v14, v16];

  return v17;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)hunc
{
  return self->_hunc;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)vunc
{
  return self->_vunc;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end