@interface TALocationOfInterest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)convertRTToTALocationOfInterestType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (TALocationOfInterest)initWithCoder:(id)a3;
- (TALocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 date:(id)a7;
- (TALocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 referenceFrame:(unint64_t)a7 date:(id)a8;
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

@implementation TALocationOfInterest

- (TALocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 date:(id)a7
{
  return [(TALocationOfInterest *)self initWithType:a3 latitude:0 longitude:a7 horizontalAccuracy:a4 referenceFrame:a5 date:a6];
}

- (TALocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 referenceFrame:(unint64_t)a7 date:(id)a8
{
  id v14 = a8;
  v21.receiver = self;
  v21.super_class = (Class)TALocationOfInterest;
  v15 = [(TALocationOfInterest *)&v21 init];
  v16 = v15;
  if (v15)
  {
    if (!v14)
    {
      v19 = 0;
      goto LABEL_6;
    }
    v15->_type = a3;
    v15->_latitude = a4;
    v15->_longitude = a5;
    v15->_horizontalAccuracy = a6;
    v15->_referenceFrame = a7;
    uint64_t v17 = [v14 copy];
    date = v16->_date;
    v16->_date = (NSDate *)v17;
  }
  v19 = v16;
LABEL_6:

  return v19;
}

+ (unint64_t)convertRTToTALocationOfInterestType:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
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
  unint64_t v10 = v9 ^ [(NSDate *)self->_date hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TALocationOfInterest *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(TALocationOfInterest *)self type];
      if (v6 != [(TALocationOfInterest *)v5 type]) {
        goto LABEL_12;
      }
      [(TALocationOfInterest *)self latitude];
      double v8 = v7;
      [(TALocationOfInterest *)v5 latitude];
      if (v8 != v9) {
        goto LABEL_12;
      }
      [(TALocationOfInterest *)self longitude];
      double v11 = v10;
      [(TALocationOfInterest *)v5 longitude];
      if (v11 == v12
        && ([(TALocationOfInterest *)self horizontalAccuracy],
            double v14 = v13,
            [(TALocationOfInterest *)v5 horizontalAccuracy],
            v14 == v15)
        && (unint64_t v16 = [(TALocationOfInterest *)self referenceFrame],
            v16 == [(TALocationOfInterest *)v5 referenceFrame]))
      {
        uint64_t v17 = [(TALocationOfInterest *)self date];
        v18 = [(TALocationOfInterest *)v5 date];
        if (v17 == v18)
        {
          char v21 = 1;
        }
        else
        {
          v19 = [(TALocationOfInterest *)self date];
          v20 = [(TALocationOfInterest *)v5 date];
          char v21 = [v19 isEqual:v20];
        }
      }
      else
      {
LABEL_12:
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (id)descriptionDictionary
{
  v16[7] = *MEMORY[0x263EF8340];
  v15[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v16[0] = v4;
  v15[1] = @"Type";
  unint64_t type = self->_type;
  if (type > 2) {
    unint64_t v6 = @"<invalid>";
  }
  else {
    unint64_t v6 = off_2646AAF88[type];
  }
  v16[1] = v6;
  v15[2] = @"Latitude";
  double v7 = [NSNumber numberWithDouble:self->_latitude];
  v16[2] = v7;
  v15[3] = @"Longitude";
  double v8 = [NSNumber numberWithDouble:self->_longitude];
  v16[3] = v8;
  v15[4] = @"HorizontalAccuracy";
  double v9 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  v16[4] = v9;
  v15[5] = @"ReferenceFrame";
  double v10 = [NSNumber numberWithUnsignedInteger:self->_referenceFrame];
  v16[5] = v10;
  v15[6] = @"Date";
  double v11 = [(TALocationOfInterest *)self date];
  double v12 = [v11 getDateString];
  v16[6] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:7];

  return v13;
}

- (NSString)description
{
  v3 = [(TALocationOfInterest *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    unint64_t v6 = (void *)TAStatusLog;
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
  v4 = [TALocationOfInterest alloc];
  unint64_t type = self->_type;
  double latitude = self->_latitude;
  double longitude = self->_longitude;
  double horizontalAccuracy = self->_horizontalAccuracy;
  date = self->_date;
  return [(TALocationOfInterest *)v4 initWithType:type latitude:date longitude:latitude horizontalAccuracy:longitude date:horizontalAccuracy];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TALocationOfInterest)initWithCoder:(id)a3
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
  double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  double v14 = [(TALocationOfInterest *)self initWithType:v5 latitude:v12 longitude:v13 horizontalAccuracy:v7 referenceFrame:v9 date:v11];
  return v14;
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

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end