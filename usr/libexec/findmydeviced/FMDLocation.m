@interface FMDLocation
+ (BOOL)supportsSecureCoding;
- (FMDLocation)initWithCoder:(id)a3;
- (FMDLocation)initWithDictionary:(id)a3;
- (FMDLocation)initWithLocation:(id)a3 eventType:(int64_t)a4 positionType:(unsigned __int8)a5;
- (FMDVolatileMetaDataRecord)metaDataRecord;
- (FMGeoLocatable)location;
- (NSDate)timeStamp;
- (NSDictionary)dictionaryValue;
- (OS_dispatch_queue)serialQueue;
- (id)_trackedLocationTypeAsString:(unsigned __int8)a3;
- (id)stringForLocationType:(int64_t)a3;
- (int64_t)eventType;
- (unsigned)positionType;
- (void)encodeWithCoder:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setPositionType:(unsigned __int8)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation FMDLocation

- (FMDLocation)initWithLocation:(id)a3 eventType:(int64_t)a4 positionType:(unsigned __int8)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDLocation;
  v10 = [(FMDLocation *)&v18 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("FMDLocationQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[NSDate date];
    timeStamp = v10->_timeStamp;
    v10->_timeStamp = (NSDate *)v13;

    objc_storeStrong((id *)&v10->_location, a3);
    v10->_eventType = a4;
    v10->_positionType = a5;
    v15 = (FMDVolatileMetaDataRecord *)objc_alloc_init((Class)FMDVolatileMetaDataRecord);
    metaDataRecord = v10->_metaDataRecord;
    v10->_metaDataRecord = v15;
  }
  return v10;
}

- (FMDLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMDLocation;
  v5 = [(FMDLocation *)&v21 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FMDLocationQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_class();
    id v9 = NSStringFromSelector("timeStamp");
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
    timeStamp = v5->_timeStamp;
    v5->_timeStamp = (NSDate *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoLocation"];
    if ([v12 conformsToProtocol:&OBJC_PROTOCOL___FMGeoLocatable]) {
      objc_storeStrong((id *)&v5->_location, v12);
    }
    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector("eventType");
    v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    v5->_eventType = (int64_t)[v15 integerValue];

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector("metaDataRecord");
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    metaDataRecord = v5->_metaDataRecord;
    v5->_metaDataRecord = (FMDVolatileMetaDataRecord *)v18;
  }
  return v5;
}

- (FMDLocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)FMDLocation;
  v5 = [(FMDLocation *)&v54 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FMDLocationQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v53 = [v4 objectForKeyedSubscript:@"locationTimestamp"];
    uint64_t v8 = +[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", [v53 integerValue]);
    [(FMDLocation *)v5 setTimeStamp:v8];

    id v9 = [v4 objectForKeyedSubscript:@"eventType"];
    -[FMDLocation setEventType:](v5, "setEventType:", (int)[v9 intValue]);

    uint64_t v10 = [v4 objectForKeyedSubscript:@"locationTypeEnum"];
    -[FMDLocation setPositionType:](v5, "setPositionType:", [v10 intValue]);

    dispatch_queue_t v11 = [v4 objectForKeyedSubscript:@"latitude"];
    v12 = [v4 objectForKeyedSubscript:@"longitude"];
    uint64_t v13 = [v4 objectForKeyedSubscript:@"alt"];
    v14 = [v4 objectForKeyedSubscript:@"horizontalAccuracy"];
    v15 = [v4 objectForKeyedSubscript:@"vertAcc"];
    v49 = [v4 objectForKeyedSubscript:@"speed"];
    uint64_t v16 = [v4 objectForKeyedSubscript:@"course"];
    v17 = [v4 objectForKeyedSubscript:@"locationTimestamp"];
    id v18 = [v17 integerValue];

    id v19 = objc_alloc((Class)CLLocation);
    v52 = v11;
    [v11 doubleValue];
    CLLocationDegrees v21 = v20;
    v51 = v12;
    [v12 doubleValue];
    CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(v21, v22);
    [v13 doubleValue];
    double v25 = v24;
    v50 = v14;
    [v14 doubleValue];
    double v27 = v26;
    [v15 doubleValue];
    double v29 = v28;
    [v16 doubleValue];
    double v31 = v30;
    [v49 doubleValue];
    double v33 = v32;
    v34 = +[NSDate fm_dateFromEpoch:v18];
    id v35 = [v19 initWithCoordinate:v34 altitude:v23.latitude horizontalAccuracy:v23.longitude verticalAccuracy:v25 course:v27 speed:v29 timestamp:v31];

    v36 = [[CLLocationFMGeoLocatableAdapter alloc] initWithLocation:v35];
    v37 = [v4 objectForKeyedSubscript:@"positionTypeEnum"];
    -[CLLocationFMGeoLocatableAdapter setLocationType:](v36, "setLocationType:", (int)[v37 intValue]);

    [(FMDLocation *)v5 setLocation:v36];
    v38 = (FMDVolatileMetaDataRecord *)objc_alloc_init((Class)FMDVolatileMetaDataRecord);
    metaDataRecord = v5->_metaDataRecord;
    v5->_metaDataRecord = v38;

    v40 = [v4 objectForKeyedSubscript:@"deviceInfo"];

    if (v40)
    {
      v41 = [(FMDLocation *)v5 metaDataRecord];
      CFStringRef v57 = @"deviceInfo";
      v42 = [v4 objectForKeyedSubscript:@"deviceInfo"];
      v58 = v42;
      v43 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      [v41 appendMetaData:v43];
    }
    v44 = [v4 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDBatteryInfo"];

    if (v44)
    {
      v45 = [(FMDLocation *)v5 metaDataRecord];
      CFStringRef v55 = @"kFMDTrackedLocationsStoreTrackFMDBatteryInfo";
      v46 = [v4 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDBatteryInfo"];
      v56 = v46;
      v47 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      [v45 appendMetaData:v47];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  timeStamp = self->_timeStamp;
  id v5 = a3;
  dispatch_queue_t v6 = NSStringFromSelector("timeStamp");
  [v5 encodeObject:timeStamp forKey:v6];

  [v5 encodeObject:self->_location forKey:@"geoLocation"];
  v7 = +[NSNumber numberWithInteger:self->_eventType];
  uint64_t v8 = NSStringFromSelector("eventType");
  [v5 encodeObject:v7 forKey:v8];

  id v10 = [(FMDLocation *)self metaDataRecord];
  id v9 = NSStringFromSelector("metaDataRecord");
  [v5 encodeObject:v10 forKey:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDVolatileMetaDataRecord)metaDataRecord
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10005F358;
  id v10 = sub_10005F368;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005F370;
  v5[3] = &unk_1002D9210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FMDVolatileMetaDataRecord *)v3;
}

- (NSDictionary)dictionaryValue
{
  id v3 = objc_opt_new();
  id v4 = [(NSDate *)self->_timeStamp stringValueForServer];
  [v3 fm_safelySetObject:v4 forKey:@"timestamp"];

  id v5 = +[NSNumber numberWithLongLong:[(NSDate *)self->_timeStamp fm_epoch]];
  [v3 fm_safelySetObject:v5 forKey:@"locationTimestamp"];

  uint64_t v6 = +[NSNumber numberWithInteger:self->_eventType];
  [v3 fm_safelySetObject:v6 forKey:@"eventType"];

  v7 = [(FMGeoLocatable *)self->_location latitude];
  [v3 fm_safelySetObject:v7 forKey:@"latitude"];

  uint64_t v8 = [(FMGeoLocatable *)self->_location longitude];
  [v3 fm_safelySetObject:v8 forKey:@"longitude"];

  id v9 = [(FMGeoLocatable *)self->_location horizontalAccuracy];
  [v3 fm_safelySetObject:v9 forKey:@"horizontalAccuracy"];

  id v10 = [(FMGeoLocatable *)self->_location verticalAccuracy];
  [v3 fm_safelySetObject:v10 forKey:@"vertAcc"];

  id v11 = [(FMGeoLocatable *)self->_location speed];
  [v3 fm_safelySetObject:v11 forKey:@"speed"];

  v12 = [(FMGeoLocatable *)self->_location course];
  [v3 fm_safelySetObject:v12 forKey:@"course"];

  uint64_t v13 = [(FMDLocation *)self location];
  v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 locationType]);
  [v3 fm_safelySetObject:v14 forKey:@"positionTypeEnum"];

  v15 = [(FMDLocation *)self location];
  uint64_t v16 = -[FMDLocation stringForLocationType:](self, "stringForLocationType:", [v15 locationType]);
  [v3 fm_safelySetObject:v16 forKey:@"positionType"];

  v17 = +[NSNumber numberWithUnsignedChar:[(FMDLocation *)self positionType]];
  [v3 fm_safelySetObject:v17 forKey:@"locationTypeEnum"];

  id v18 = [(FMDLocation *)self _trackedLocationTypeAsString:[(FMDLocation *)self positionType]];
  [v3 fm_safelySetObject:v18 forKey:@"locationType"];

  id v19 = [(FMGeoLocatable *)self->_location altitude];
  [v3 fm_safeSetObject:v19 forKey:@"alt"];

  double v20 = [(FMDLocation *)self metaDataRecord];
  CLLocationDegrees v21 = [v20 dictionaryValue];
  [v3 setValuesForKeysWithDictionary:v21];

  return (NSDictionary *)v3;
}

- (id)stringForLocationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return @"Unknown";
  }
  else {
    return off_1002DB6F0[a3 - 1];
  }
}

- (id)_trackedLocationTypeAsString:(unsigned __int8)a3
{
  if ((a3 + 1) > 4u) {
    return &stru_1002E7428;
  }
  else {
    return off_1002DB740[(char)(a3 + 1)];
  }
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (FMGeoLocatable)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (unsigned)positionType
{
  return self->_positionType;
}

- (void)setPositionType:(unsigned __int8)a3
{
  self->_positionType = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);

  objc_storeStrong((id *)&self->_metaDataRecord, 0);
}

@end