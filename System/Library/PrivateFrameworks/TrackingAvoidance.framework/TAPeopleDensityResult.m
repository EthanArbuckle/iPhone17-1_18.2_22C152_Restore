@interface TAPeopleDensityResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDateInterval)observationInterval;
- (NSDictionary)additionalInfo;
- (NSString)description;
- (TAPeopleDensityResult)initWithCoder:(id)a3;
- (TAPeopleDensityResult)initWithState:(int64_t)a3 confidence:(double)a4 observationInterval:(id)a5 additionalInfo:(id)a6 date:(id)a7;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (int64_t)peopleDensityState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAPeopleDensityResult

- (TAPeopleDensityResult)initWithState:(int64_t)a3 confidence:(double)a4 observationInterval:(id)a5 additionalInfo:(id)a6 date:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)TAPeopleDensityResult;
  v15 = [(TAPeopleDensityResult *)&v25 init];
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v17 = v16;
    goto LABEL_10;
  }
  v17 = 0;
  if (a4 >= 0.0 && v12 && v14)
  {
    v15->_peopleDensityState = a3;
    v15->_confidence = a4;
    uint64_t v18 = [v12 copy];
    observationInterval = v16->_observationInterval;
    v16->_observationInterval = (NSDateInterval *)v18;

    uint64_t v20 = [v14 copy];
    date = v16->_date;
    v16->_date = (NSDate *)v20;

    if (v13)
    {
      uint64_t v22 = [v13 copy];
    }
    else
    {
      uint64_t v22 = [NSDictionary dictionary];
    }
    additionalInfo = v16->_additionalInfo;
    v16->_additionalInfo = (NSDictionary *)v22;

    goto LABEL_9;
  }
LABEL_10:

  return v17;
}

- (unint64_t)hash
{
  int64_t v3 = [(TAPeopleDensityResult *)self peopleDensityState];
  v4 = NSNumber;
  [(TAPeopleDensityResult *)self confidence];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v6 = [v5 hash];
  v7 = [(TAPeopleDensityResult *)self observationInterval];
  uint64_t v8 = v3 ^ [v7 hash];
  v9 = [(TAPeopleDensityResult *)self additionalInfo];
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [(TAPeopleDensityResult *)self date];
  unint64_t v12 = v6 ^ v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (TAPeopleDensityResult *)a3;
  if (self == v6)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      int64_t v8 = [(TAPeopleDensityResult *)self peopleDensityState];
      if (v8 != [(TAPeopleDensityResult *)v7 peopleDensityState]
        || ([(TAPeopleDensityResult *)self confidence],
            double v10 = v9,
            [(TAPeopleDensityResult *)v7 confidence],
            v10 != v11))
      {
        char v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      unint64_t v12 = [(TAPeopleDensityResult *)self observationInterval];
      id v13 = [(TAPeopleDensityResult *)v7 observationInterval];
      if (v12 != v13)
      {
        int64_t v3 = [(TAPeopleDensityResult *)self observationInterval];
        v4 = [(TAPeopleDensityResult *)v7 observationInterval];
        if (![v3 isEqual:v4])
        {
          char v14 = 0;
          goto LABEL_22;
        }
      }
      v15 = [(TAPeopleDensityResult *)self additionalInfo];
      v16 = [(TAPeopleDensityResult *)v7 additionalInfo];
      if (v15 == v16)
      {
        v29 = v15;
      }
      else
      {
        v17 = [(TAPeopleDensityResult *)self additionalInfo];
        v30 = [(TAPeopleDensityResult *)v7 additionalInfo];
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v14 = 0;
          goto LABEL_20;
        }
        v28 = v17;
        v29 = v15;
      }
      uint64_t v18 = [(TAPeopleDensityResult *)self date];
      uint64_t v19 = [(TAPeopleDensityResult *)v7 date];
      if (v18 == (void *)v19)
      {

        char v14 = 1;
      }
      else
      {
        uint64_t v20 = (void *)v19;
        [(TAPeopleDensityResult *)self date];
        v21 = v27 = v3;
        [(TAPeopleDensityResult *)v7 date];
        v26 = v4;
        uint64_t v22 = v13;
        v24 = v23 = v12;
        char v14 = [v21 isEqual:v24];

        unint64_t v12 = v23;
        id v13 = v22;
        v4 = v26;

        int64_t v3 = v27;
      }
      v17 = v28;
      v15 = v29;
      if (v29 == v16)
      {
LABEL_21:

        if (v12 == v13)
        {
LABEL_23:

          goto LABEL_24;
        }
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:

      goto LABEL_21;
    }
    char v14 = 0;
  }
LABEL_25:

  return v14;
}

- (id)descriptionDictionary
{
  v16[6] = *MEMORY[0x263EF8340];
  v15[0] = @"EventType";
  int64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v16[0] = v4;
  v15[1] = @"PeopleDensityState";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[TAPeopleDensityResult peopleDensityState](self, "peopleDensityState"));
  v16[1] = v5;
  v15[2] = @"Confidence";
  uint64_t v6 = NSNumber;
  [(TAPeopleDensityResult *)self confidence];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v16[2] = v7;
  v15[3] = @"ObservationInterval";
  int64_t v8 = [(TAPeopleDensityResult *)self observationInterval];
  double v9 = [v8 description];
  v16[3] = v9;
  v15[4] = @"AdditionalInfo";
  double v10 = [(TAPeopleDensityResult *)self additionalInfo];
  v16[4] = v10;
  v15[5] = @"Date";
  double v11 = [(TAPeopleDensityResult *)self date];
  unint64_t v12 = [v11 getDateString];
  v16[5] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v13;
}

- (NSString)description
{
  int64_t v3 = [(TAPeopleDensityResult *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  int64_t v8 = v7;

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPeopleDensityResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"PeopleDensityState"];
  [v4 decodeDoubleForKey:@"Confidence"];
  double v7 = v6;
  int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObservationInterval"];
  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AdditionalInfo"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  double v11 = [(TAPeopleDensityResult *)self initWithState:v5 confidence:v8 observationInterval:v9 additionalInfo:v10 date:v7];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t peopleDensityState = self->_peopleDensityState;
  id v5 = a3;
  [v5 encodeInteger:peopleDensityState forKey:@"PeopleDensityState"];
  [v5 encodeDouble:@"Confidence" forKey:self->_confidence];
  [v5 encodeObject:self->_observationInterval forKey:@"ObservationInterval"];
  [v5 encodeObject:self->_additionalInfo forKey:@"AdditionalInfo"];
  [v5 encodeObject:self->_date forKey:@"Date"];
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
  id v4 = +[TAPeopleDensityResult allocWithZone:a3];
  int64_t peopleDensityState = self->_peopleDensityState;
  double confidence = self->_confidence;
  observationInterval = self->_observationInterval;
  additionalInfo = self->_additionalInfo;
  date = self->_date;
  return [(TAPeopleDensityResult *)v4 initWithState:peopleDensityState confidence:observationInterval observationInterval:additionalInfo additionalInfo:date date:confidence];
}

- (id)getDate
{
  return self->_date;
}

- (int64_t)peopleDensityState
{
  return self->_peopleDensityState;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDateInterval)observationInterval
{
  return self->_observationInterval;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_observationInterval, 0);
}

@end