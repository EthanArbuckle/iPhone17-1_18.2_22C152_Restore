@interface TACLVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArrivalDate;
- (BOOL)hasDepartureDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporalOrderSensical;
- (CLLocationCoordinate2D)coordinate;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (NSDate)detectionDate;
- (NSDateInterval)dateInterval;
- (NSString)description;
- (TACLVisit)initWithCoder:(id)a3;
- (TACLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7 confidence:(unint64_t)a8;
- (double)horizontalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TACLVisit

- (id)getDate
{
  return self->_detectionDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TACLVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"Latitude"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"Longitude"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"HorizontalAccuracy"];
  double v10 = v9;
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ArrivalDate"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DepartureDate"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
  uint64_t v14 = [v4 decodeIntegerForKey:@"Confidence"];

  v15 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](self, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v11, v12, v13, v14, v6, v8, v10);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(TACLVisit *)self coordinate];
  objc_msgSend(v8, "encodeDouble:forKey:", @"Latitude");
  [(TACLVisit *)self coordinate];
  [v8 encodeDouble:@"Longitude" forKey:v4];
  [(TACLVisit *)self horizontalAccuracy];
  objc_msgSend(v8, "encodeDouble:forKey:", @"HorizontalAccuracy");
  double v5 = [(TACLVisit *)self arrivalDate];
  [v8 encodeObject:v5 forKey:@"ArrivalDate"];

  double v6 = [(TACLVisit *)self departureDate];
  [v8 encodeObject:v6 forKey:@"DepartureDate"];

  double v7 = [(TACLVisit *)self detectionDate];
  [v8 encodeObject:v7 forKey:@"Date"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[TACLVisit confidence](self, "confidence"), @"Confidence");
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  double v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[TACLVisit allocWithZone:a3];
  [(TACLVisit *)self coordinate];
  double v6 = v5;
  double v8 = v7;
  [(TACLVisit *)self horizontalAccuracy];
  double v10 = v9;
  v11 = [(TACLVisit *)self arrivalDate];
  v12 = [(TACLVisit *)self departureDate];
  v13 = [(TACLVisit *)self detectionDate];
  uint64_t v14 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](v4, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v11, v12, v13, [(TACLVisit *)self confidence], v6, v8, v10);

  return v14;
}

- (TACLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7 confidence:(unint64_t)a8
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v15 = (uint64_t)a5;
  uint64_t v16 = (uint64_t)a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TACLVisit;
  v18 = [(TACLVisit *)&v27 init];
  if (!v18) {
    goto LABEL_7;
  }
  if (!v17)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  if (!(v15 | v16))
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x263EFF910] distantFuture];
    if (v15) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v15 = [MEMORY[0x263EFF910] distantPast];
    goto LABEL_6;
  }
  if (!v15) {
    goto LABEL_12;
  }
LABEL_6:
  v18->_coordinate.CLLocationDegrees latitude = latitude;
  v18->_coordinate.CLLocationDegrees longitude = longitude;
  v18->_horizontalAccuracy = a4;
  uint64_t v19 = [(id)v15 copy];
  arrivalDate = v18->_arrivalDate;
  v18->_arrivalDate = (NSDate *)v19;

  uint64_t v21 = [(id)v16 copy];
  departureDate = v18->_departureDate;
  v18->_departureDate = (NSDate *)v21;

  uint64_t v23 = [v17 copy];
  detectionDate = v18->_detectionDate;
  v18->_detectionDate = (NSDate *)v23;

  v18->_confidence = a8;
LABEL_7:
  v25 = v18;
LABEL_10:

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = (TACLVisit *)a3;
  if (self == v5)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = v5;
      [(TACLVisit *)self coordinate];
      double v8 = v7;
      [(TACLVisit *)v6 coordinate];
      if (v8 != v9
        || ([(TACLVisit *)self coordinate], double v11 = v10,
                                                         [(TACLVisit *)v6 coordinate],
                                                         v11 != v12)
        || ([(TACLVisit *)self horizontalAccuracy],
            double v14 = v13,
            [(TACLVisit *)v6 horizontalAccuracy],
            v14 != v15))
      {
        BOOL v19 = 0;
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v16 = [(TACLVisit *)self arrivalDate];
      id v17 = [(TACLVisit *)v6 arrivalDate];
      if (v16 != v17)
      {
        v3 = [(TACLVisit *)self arrivalDate];
        v18 = [(TACLVisit *)v6 arrivalDate];
        if (![v3 isEqual:v18])
        {
          BOOL v19 = 0;
          goto LABEL_27;
        }
        v32 = v18;
        v33 = v3;
      }
      v20 = [(TACLVisit *)self departureDate];
      uint64_t v21 = [(TACLVisit *)v6 departureDate];
      if (v20 != v21)
      {
        v3 = [(TACLVisit *)self departureDate];
        v22 = [(TACLVisit *)v6 departureDate];
        if (![v3 isEqual:v22])
        {
          BOOL v19 = 0;
LABEL_25:

LABEL_26:
          v18 = v32;
          v3 = v33;
          if (v16 == v17)
          {
LABEL_28:

            goto LABEL_29;
          }
LABEL_27:

          goto LABEL_28;
        }
        v30 = v22;
        v31 = v3;
      }
      uint64_t v23 = [(TACLVisit *)self detectionDate];
      v24 = [(TACLVisit *)v6 detectionDate];
      if (v23 != v24)
      {
        v28 = v20;
        v25 = [(TACLVisit *)self detectionDate];
        v3 = [(TACLVisit *)v6 detectionDate];
        v29 = v25;
        if (![v25 isEqual:v3])
        {
          BOOL v19 = 0;
          v20 = v28;
          goto LABEL_23;
        }
        v20 = v28;
      }
      unint64_t v26 = [(TACLVisit *)self confidence];
      BOOL v19 = v26 == [(TACLVisit *)v6 confidence];
      if (v23 == v24)
      {

        goto LABEL_24;
      }
LABEL_23:

LABEL_24:
      v22 = v30;
      v3 = v31;
      if (v20 == v21) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    BOOL v19 = 0;
  }
LABEL_30:

  return v19;
}

- (id)descriptionDictionary
{
  v19[8] = *MEMORY[0x263EF8340];
  if ([(TACLVisit *)self hasArrivalDate])
  {
    v3 = [(TACLVisit *)self arrivalDate];
    double v4 = [v3 getDateString];
  }
  else
  {
    double v4 = @"-";
  }
  if ([(TACLVisit *)self hasDepartureDate])
  {
    double v5 = [(TACLVisit *)self departureDate];
    double v6 = [v5 getDateString];
  }
  else
  {
    double v6 = @"-";
  }
  v18[0] = @"EventType";
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  v19[0] = v8;
  v18[1] = @"Latitude";
  double v9 = [NSNumber numberWithDouble:self->_coordinate.latitude];
  v19[1] = v9;
  v18[2] = @"Longitude";
  double v10 = [NSNumber numberWithDouble:self->_coordinate.longitude];
  v19[2] = v10;
  v18[3] = @"HorizontalAccuracy";
  double v11 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  v19[3] = v11;
  v19[4] = v4;
  v18[4] = @"ArrivalDate";
  v18[5] = @"DepartureDate";
  v19[5] = v6;
  v18[6] = @"Date";
  double v12 = [(TACLVisit *)self detectionDate];
  double v13 = [v12 getDateString];
  v19[6] = v13;
  v18[7] = @"Confidence";
  unint64_t confidence = self->_confidence;
  if (confidence > 2) {
    double v15 = @"<invalid>";
  }
  else {
    double v15 = off_2646AAEA0[confidence];
  }
  v19[7] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:8];

  return v16;
}

- (NSString)description
{
  v3 = [(TACLVisit *)self descriptionDictionary];
  id v10 = 0;
  double v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    double v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  double v8 = v7;

  return (NSString *)v8;
}

- (BOOL)hasArrivalDate
{
  v2 = [(TACLVisit *)self arrivalDate];
  v3 = [MEMORY[0x263EFF910] distantPast];
  char v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

- (BOOL)hasDepartureDate
{
  v2 = [(TACLVisit *)self departureDate];
  v3 = [MEMORY[0x263EFF910] distantFuture];
  char v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

- (BOOL)isTemporalOrderSensical
{
  v3 = [(TACLVisit *)self arrivalDate];
  char v4 = [(TACLVisit *)self departureDate];
  id v5 = [v3 earlierDate:v4];
  double v6 = [(TACLVisit *)self detectionDate];
  id v7 = [v5 earlierDate:v6];
  double v8 = [(TACLVisit *)self arrivalDate];
  char v9 = [v7 isEqual:v8];

  return v9;
}

- (NSDateInterval)dateInterval
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(TACLVisit *)self isTemporalOrderSensical])
  {
    id v3 = objc_alloc(MEMORY[0x263F08798]);
    char v4 = [(TACLVisit *)self arrivalDate];
    id v5 = [(TACLVisit *)self departureDate];
    double v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];
  }
  else
  {
    id v7 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = v7;
      char v9 = [(TACLVisit *)self arrivalDate];
      id v10 = [(TACLVisit *)self departureDate];
      v13[0] = 68289539;
      v13[1] = 0;
      __int16 v14 = 2082;
      double v15 = "";
      __int16 v16 = 2113;
      id v17 = v9;
      __int16 v18 = 2113;
      BOOL v19 = v10;
      _os_log_impl(&dword_22345C000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TACLVisit attempted to create dateInterval with nonsensical arrival and departure dates\", \"arrivalDate\":\"%{private}@\", \"departureDate\":\"%{private}@\"}", (uint8_t *)v13, 0x26u);
    }
    id v11 = objc_alloc(MEMORY[0x263F08798]);
    char v4 = [(TACLVisit *)self arrivalDate];
    double v6 = (void *)[v11 initWithStartDate:v4 duration:0.0];
  }

  return (NSDateInterval *)v6;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (NSDate)detectionDate
{
  return self->_detectionDate;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

@end