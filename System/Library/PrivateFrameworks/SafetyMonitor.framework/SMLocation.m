@interface SMLocation
+ (BOOL)isCLLocationValid:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)isValid;
- (NSDate)date;
- (NSUUID)identifier;
- (SMLocation)initWithCLLocation:(id)a3;
- (SMLocation)initWithCoder:(id)a3;
- (SMLocation)initWithDictionary:(id)a3;
- (SMLocation)initWithIdentifier:(id)a3 latitude:(double)a4 longitude:(double)a5 hunc:(double)a6 altitude:(double)a7 vunc:(double)a8 date:(id)a9;
- (double)altitude;
- (double)hunc;
- (double)latitude;
- (double)longitude;
- (double)vunc;
- (id)description;
- (id)outputToDictionary;
- (int)referenceFrame;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceFrame:(int)a3;
@end

@implementation SMLocation

- (SMLocation)initWithIdentifier:(id)a3 latitude:(double)a4 longitude:(double)a5 hunc:(double)a6 altitude:(double)a7 vunc:(double)a8 date:(id)a9
{
  id v17 = a3;
  id v18 = a9;
  if (v17)
  {
    v24.receiver = self;
    v24.super_class = (Class)SMLocation;
    v19 = [(SMLocation *)&v24 init];
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
      v20->_referenceFrame = 1;
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

- (SMLocation)initWithCLLocation:(id)a3
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

  id v17 = [(SMLocation *)self initWithIdentifier:v5 latitude:v16 longitude:v7 hunc:v9 altitude:v11 vunc:v13 date:v15];
  return v17;
}

+ (BOOL)isCLLocationValid:(id)a3
{
  id v3 = a3;
  id v4 = [[SMLocation alloc] initWithCLLocation:v3];

  LOBYTE(v3) = [(SMLocation *)v4 isValid];
  return (char)v3;
}

- (BOOL)isValid
{
  [(SMLocation *)self latitude];
  CLLocationDegrees v4 = v3;
  [(SMLocation *)self longitude];
  CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v4, v5);
  if (!CLLocationCoordinate2DIsValid(v12)) {
    return 0;
  }
  [(SMLocation *)self latitude];
  if (v6 == 0.0)
  {
    [(SMLocation *)self longitude];
    if (v7 == 0.0) {
      return 0;
    }
  }
  [(SMLocation *)self hunc];
  if (v8 <= 0.0) {
    return 0;
  }
  double v9 = [(SMLocation *)self date];
  BOOL v10 = v9 != 0;

  return v10;
}

- (SMLocation)initWithDictionary:(id)a3
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
  v28 = [(SMLocation *)self initWithIdentifier:v8 latitude:v27 longitude:v11 hunc:v14 altitude:v17 vunc:v20 date:v23];

  return v28;
}

- (id)outputToDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  CLLocationDegrees v4 = [(SMLocation *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  id v6 = NSNumber;
  [(SMLocation *)self latitude];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"latitude"];

  double v8 = NSNumber;
  [(SMLocation *)self longitude];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKey:@"longitude"];

  double v10 = NSNumber;
  [(SMLocation *)self hunc];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKey:@"hunc"];

  CLLocationCoordinate2D v12 = NSNumber;
  [(SMLocation *)self altitude];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKey:@"altitude"];

  double v14 = NSNumber;
  [(SMLocation *)self vunc];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKey:@"vunc"];

  double v16 = NSNumber;
  double v17 = [(SMLocation *)self date];
  [v17 timeIntervalSince1970];
  id v18 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v18 forKey:@"date"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMLocation)initWithCoder:(id)a3
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

  double v17 = [(SMLocation *)self initWithIdentifier:v5 latitude:v16 longitude:v7 hunc:v9 altitude:v11 vunc:v13 date:v15];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SMLocation *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  [(SMLocation *)self latitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"latitude");
  [(SMLocation *)self longitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"longitude");
  [(SMLocation *)self hunc];
  objc_msgSend(v4, "encodeDouble:forKey:", @"hunc");
  [(SMLocation *)self altitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"altitude");
  [(SMLocation *)self vunc];
  objc_msgSend(v4, "encodeDouble:forKey:", @"vunc");
  id v6 = [(SMLocation *)self date];
  [v4 encodeObject:v6 forKey:@"date"];
}

- (BOOL)isEquivalent:(id)a3
{
  double v7 = (SMLocation *)a3;
  if (self == v7)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = v7;
      double v9 = [(SMLocation *)self identifier];
      double v10 = [(SMLocation *)v8 identifier];
      if (v9 != v10)
      {
        id v3 = [(SMLocation *)self identifier];
        id v4 = [(SMLocation *)v8 identifier];
        if (![v3 isEqual:v4])
        {
          BOOL v11 = 0;
          goto LABEL_26;
        }
      }
      [(SMLocation *)self latitude];
      double v13 = v12;
      [(SMLocation *)v8 latitude];
      if (v13 != v14)
      {
        [(SMLocation *)self latitude];
        double v16 = v15;
        [(SMLocation *)v8 latitude];
        if (vabdd_f64(v16, v17) >= 2.22044605e-16) {
          goto LABEL_21;
        }
      }
      [(SMLocation *)self longitude];
      double v19 = v18;
      [(SMLocation *)v8 longitude];
      if (v19 != v20)
      {
        [(SMLocation *)self longitude];
        double v22 = v21;
        [(SMLocation *)v8 longitude];
        if (vabdd_f64(v22, v23) >= 2.22044605e-16) {
          goto LABEL_21;
        }
      }
      [(SMLocation *)self hunc];
      double v25 = v24;
      [(SMLocation *)v8 hunc];
      if (v25 != v26)
      {
        [(SMLocation *)self hunc];
        double v28 = v27;
        [(SMLocation *)v8 hunc];
        if (vabdd_f64(v28, v29) >= 2.22044605e-16) {
          goto LABEL_21;
        }
      }
      [(SMLocation *)self altitude];
      double v31 = v30;
      [(SMLocation *)v8 altitude];
      if (v31 != v32)
      {
        [(SMLocation *)self altitude];
        double v34 = v33;
        [(SMLocation *)v8 altitude];
        if (vabdd_f64(v34, v35) >= 2.22044605e-16) {
          goto LABEL_21;
        }
      }
      [(SMLocation *)self vunc];
      double v37 = v36;
      [(SMLocation *)v8 vunc];
      if (v37 != v38)
      {
        [(SMLocation *)self vunc];
        double v40 = v39;
        [(SMLocation *)v8 vunc];
        if (vabdd_f64(v40, v41) >= 2.22044605e-16)
        {
LABEL_21:
          BOOL v11 = 0;
          goto LABEL_25;
        }
      }
      v42 = [(SMLocation *)self date];
      [v42 timeIntervalSince1970];
      double v44 = v43;
      v45 = [(SMLocation *)v8 date];
      [v45 timeIntervalSince1970];
      double v47 = v46;
      if (v44 == v46
        || ([(SMLocation *)self date],
            v53 = objc_claimAutoreleasedReturnValue(),
            [v53 timeIntervalSince1970],
            double v49 = v48,
            [(SMLocation *)v8 date],
            id v5 = objc_claimAutoreleasedReturnValue(),
            [v5 timeIntervalSince1970],
            vabdd_f64(v49, v50) < 2.22044605e-16))
      {
        int v51 = [(SMLocation *)self referenceFrame];
        BOOL v11 = v51 == [(SMLocation *)v8 referenceFrame];
        if (v44 == v47)
        {
LABEL_24:

LABEL_25:
          if (v9 == v10)
          {
LABEL_27:

            goto LABEL_28;
          }
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_24;
    }
    BOOL v11 = 0;
  }
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  double v24 = [(SMLocation *)self identifier];
  uint64_t v3 = [v24 hash];
  id v4 = NSNumber;
  [(SMLocation *)self latitude];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v6 = [v5 hash] ^ v3;
  double v7 = NSNumber;
  [(SMLocation *)self longitude];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = [v8 hash];
  double v10 = NSNumber;
  [(SMLocation *)self hunc];
  BOOL v11 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v12 = v6 ^ v9 ^ [v11 hash];
  double v13 = NSNumber;
  [(SMLocation *)self altitude];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  uint64_t v15 = [v14 hash];
  double v16 = NSNumber;
  [(SMLocation *)self vunc];
  double v17 = objc_msgSend(v16, "numberWithDouble:");
  uint64_t v18 = v15 ^ [v17 hash];
  double v19 = [(SMLocation *)self date];
  uint64_t v20 = v12 ^ v18 ^ [v19 hash];
  double v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SMLocation referenceFrame](self, "referenceFrame"));
  unint64_t v22 = v20 ^ [v21 hash];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SMLocation *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = v6;
      double v8 = [(SMLocation *)self identifier];
      uint64_t v9 = [(SMLocation *)v7 identifier];
      if (v8 != v9)
      {
        uint64_t v3 = [(SMLocation *)self identifier];
        id v4 = [(SMLocation *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          BOOL v10 = 0;
          goto LABEL_18;
        }
      }
      [(SMLocation *)self latitude];
      double v13 = v12;
      [(SMLocation *)v7 latitude];
      if (v13 == v14)
      {
        [(SMLocation *)self longitude];
        double v16 = v15;
        [(SMLocation *)v7 longitude];
        if (v16 == v17)
        {
          [(SMLocation *)self hunc];
          double v19 = v18;
          [(SMLocation *)v7 hunc];
          if (v19 == v20)
          {
            [(SMLocation *)self altitude];
            double v22 = v21;
            [(SMLocation *)v7 altitude];
            if (v22 == v23)
            {
              [(SMLocation *)self vunc];
              double v25 = v24;
              [(SMLocation *)v7 vunc];
              if (v25 == v26)
              {
                double v27 = [(SMLocation *)self date];
                double v28 = [(SMLocation *)v7 date];
                if ([v27 isEqualToDate:v28])
                {
                  int v29 = [(SMLocation *)self referenceFrame];
                  BOOL v10 = v29 == [(SMLocation *)v7 referenceFrame];

                  BOOL v11 = v10;
                  goto LABEL_17;
                }
              }
            }
          }
        }
      }
      BOOL v10 = 0;
      BOOL v11 = 0;
LABEL_17:
      if (v8 == v9)
      {
LABEL_19:

        goto LABEL_20;
      }
LABEL_18:

      BOOL v11 = v10;
      goto LABEL_19;
    }
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(SMLocation *)self identifier];
  [(SMLocation *)self latitude];
  uint64_t v6 = v5;
  [(SMLocation *)self longitude];
  uint64_t v8 = v7;
  [(SMLocation *)self hunc];
  uint64_t v10 = v9;
  [(SMLocation *)self altitude];
  uint64_t v12 = v11;
  [(SMLocation *)self vunc];
  uint64_t v14 = v13;
  double v15 = [(SMLocation *)self date];
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

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end