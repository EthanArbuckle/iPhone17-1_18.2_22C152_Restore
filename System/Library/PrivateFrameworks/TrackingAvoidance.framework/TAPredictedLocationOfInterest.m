@interface TAPredictedLocationOfInterest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDate)nextEntryTime;
- (NSString)description;
- (TAPredictedLocationOfInterest)initWithCoder:(id)a3;
- (TAPredictedLocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 confidence:(double)a7 nextEntryTime:(id)a8 date:(id)a9;
- (TAPredictedLocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 referenceFrame:(unint64_t)a7 confidence:(double)a8 nextEntryTime:(id)a9 date:(id)a10;
- (double)confidence;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)hash;
- (unint64_t)referenceFrame;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAPredictedLocationOfInterest

- (TAPredictedLocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 confidence:(double)a7 nextEntryTime:(id)a8 date:(id)a9
{
  return [(TAPredictedLocationOfInterest *)self initWithType:a3 latitude:0 longitude:a8 horizontalAccuracy:a9 referenceFrame:a4 confidence:a5 nextEntryTime:a6 date:a7];
}

- (TAPredictedLocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 referenceFrame:(unint64_t)a7 confidence:(double)a8 nextEntryTime:(id)a9 date:(id)a10
{
  id v18 = a9;
  id v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)TAPredictedLocationOfInterest;
  v20 = [(TAPredictedLocationOfInterest *)&v28 init];
  v21 = v20;
  if (v20)
  {
    if (!v19)
    {
      v26 = 0;
      goto LABEL_6;
    }
    v20->_type = a3;
    v20->_latitude = a4;
    v20->_longitude = a5;
    v20->_horizontalAccuracy = a6;
    v20->_referenceFrame = a7;
    v20->_confidence = a8;
    uint64_t v22 = [v18 copy];
    nextEntryTime = v21->_nextEntryTime;
    v21->_nextEntryTime = (NSDate *)v22;

    uint64_t v24 = [v19 copy];
    date = v21->_date;
    v21->_date = (NSDate *)v24;
  }
  v26 = v21;
LABEL_6:

  return v26;
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  v4 = [NSNumber numberWithDouble:self->_latitude];
  uint64_t v5 = [v4 hash] ^ type;
  v6 = [NSNumber numberWithDouble:self->_longitude];
  uint64_t v7 = [v6 hash];
  v8 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [NSNumber numberWithDouble:self->_confidence];
  uint64_t v11 = [v10 hash];
  unint64_t v12 = v9 ^ v11 ^ [(NSDate *)self->_date hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (TAPredictedLocationOfInterest *)a3;
  if (self == v5)
  {
    char v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      unint64_t v7 = [(TAPredictedLocationOfInterest *)self type];
      if (v7 != [(TAPredictedLocationOfInterest *)v6 type]) {
        goto LABEL_14;
      }
      [(TAPredictedLocationOfInterest *)self latitude];
      double v9 = v8;
      [(TAPredictedLocationOfInterest *)v6 latitude];
      if (v9 != v10) {
        goto LABEL_14;
      }
      [(TAPredictedLocationOfInterest *)self longitude];
      double v12 = v11;
      [(TAPredictedLocationOfInterest *)v6 longitude];
      if (v12 != v13
        || ([(TAPredictedLocationOfInterest *)self horizontalAccuracy],
            double v15 = v14,
            [(TAPredictedLocationOfInterest *)v6 horizontalAccuracy],
            v15 != v16)
        || (unint64_t v17 = [(TAPredictedLocationOfInterest *)self referenceFrame],
            v17 != [(TAPredictedLocationOfInterest *)v6 referenceFrame])
        || ([(TAPredictedLocationOfInterest *)self confidence],
            double v19 = v18,
            [(TAPredictedLocationOfInterest *)v6 confidence],
            v19 != v20))
      {
LABEL_14:
        char v24 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v21 = [(TAPredictedLocationOfInterest *)self nextEntryTime];
      uint64_t v22 = [(TAPredictedLocationOfInterest *)v6 nextEntryTime];
      if (v21 != v22)
      {
        v23 = [(TAPredictedLocationOfInterest *)self nextEntryTime];
        v3 = [(TAPredictedLocationOfInterest *)v6 nextEntryTime];
        if (![v23 isEqual:v3])
        {
          char v24 = 0;
LABEL_22:

LABEL_23:
          goto LABEL_15;
        }
        v31 = v23;
      }
      v26 = [(TAPredictedLocationOfInterest *)self date];
      uint64_t v27 = [(TAPredictedLocationOfInterest *)v6 date];
      if (v26 == (void *)v27)
      {

        char v24 = 1;
      }
      else
      {
        objc_super v28 = (void *)v27;
        v29 = [(TAPredictedLocationOfInterest *)self date];
        v30 = [(TAPredictedLocationOfInterest *)v6 date];
        char v24 = [v29 isEqual:v30];
      }
      v23 = v31;
      if (v21 == v22) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    char v24 = 0;
  }
LABEL_16:

  return v24;
}

- (id)descriptionDictionary
{
  v19[9] = *MEMORY[0x263EF8340];
  v18[0] = @"EventType";
  v4 = (objc_class *)objc_opt_class();
  unint64_t v17 = NSStringFromClass(v4);
  v19[0] = v17;
  v18[1] = @"Type";
  double v16 = TALocationOfInterestTypeToString(self->_type);
  v19[1] = v16;
  v18[2] = @"Latitude";
  double v15 = [NSNumber numberWithDouble:self->_latitude];
  v19[2] = v15;
  v18[3] = @"Longitude";
  uint64_t v5 = [NSNumber numberWithDouble:self->_longitude];
  v19[3] = v5;
  v18[4] = @"HorizontalAccuracy";
  v6 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  v19[4] = v6;
  v18[5] = @"ReferenceFrame";
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_referenceFrame];
  v19[5] = v7;
  v18[6] = @"Confidence";
  double v8 = [NSNumber numberWithDouble:self->_confidence];
  v19[6] = v8;
  v18[7] = @"NextEntryTime";
  double v9 = [(TAPredictedLocationOfInterest *)self nextEntryTime];
  if (v9)
  {
    v2 = [(TAPredictedLocationOfInterest *)self nextEntryTime];
    double v10 = [v2 getDateString];
  }
  else
  {
    double v10 = &stru_26D677430;
  }
  v19[7] = v10;
  v18[8] = @"Date";
  double v11 = [(TAPredictedLocationOfInterest *)self date];
  double v12 = [v11 getDateString];
  v19[8] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:9];

  if (v9)
  {
  }
  return v13;
}

- (NSString)description
{
  v3 = [(TAPredictedLocationOfInterest *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
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

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TAPredictedLocationOfInterest alloc];
  unint64_t type = self->_type;
  double latitude = self->_latitude;
  double longitude = self->_longitude;
  double horizontalAccuracy = self->_horizontalAccuracy;
  double confidence = self->_confidence;
  nextEntryTime = self->_nextEntryTime;
  date = self->_date;
  return [(TAPredictedLocationOfInterest *)v4 initWithType:type latitude:nextEntryTime longitude:date horizontalAccuracy:latitude confidence:longitude nextEntryTime:horizontalAccuracy date:confidence];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPredictedLocationOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"Type"];
  [v4 decodeDoubleForKey:@"Latitude"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"Longitude"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"HorizontalAccuracy"];
  double v11 = v10;
  uint64_t v12 = [v4 decodeIntegerForKey:@"ReferenceFrame"];
  [v4 decodeDoubleForKey:@"Confidence"];
  double v14 = v13;
  double v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NextEntryTime"];
  double v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  unint64_t v17 = [(TAPredictedLocationOfInterest *)self initWithType:v5 latitude:v12 longitude:v15 horizontalAccuracy:v16 referenceFrame:v7 confidence:v9 nextEntryTime:v11 date:v14];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"Type"];
  [v5 encodeDouble:@"Latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"Longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"HorizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeInteger:self->_referenceFrame forKey:@"ReferenceFrame"];
  [v5 encodeDouble:@"Confidence" forKey:self->_confidence];
  [v5 encodeObject:self->_nextEntryTime forKey:@"NextEntryTime"];
  [v5 encodeObject:self->_date forKey:@"Date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  double v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)getDate
{
  return self->_date;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)nextEntryTime
{
  return self->_nextEntryTime;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_nextEntryTime, 0);
}

@end