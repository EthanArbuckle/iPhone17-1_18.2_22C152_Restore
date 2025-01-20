@interface SMSessionConfigurationEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)pickOneConfigInTimeInADayInterval;
- (BOOL)sortBySessionStartDate;
- (CLLocation)destinationBoundingBoxLocation;
- (CLLocation)startBoundingBoxLocation;
- (Class)enumeratedType;
- (NSArray)sessionTypes;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (NSDateInterval)dateInterval;
- (NSDateInterval)timeInADayInterval;
- (NSNumber)boundingBoxRadius;
- (NSUUID)sessionIdentifier;
- (SMSessionConfigurationEnumerationOptions)init;
- (SMSessionConfigurationEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortBySessionStartDate:(BOOL)a5 ascending:(BOOL)a6 sessionTypes:(id)a7 timeInADayInterval:(id)a8 pickOneConfigInTimeInADayInterval:(BOOL)a9 dateInterval:(id)a10 startBoundingBoxLocation:(id)a11 destinationBoundingBoxLocation:(id)a12 boundingBoxRadius:(id)a13 sessionIdentifier:(id)a14;
- (SMSessionConfigurationEnumerationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)batchSize;
- (unint64_t)fetchLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingBoxRadius:(id)a3;
- (void)setDestinationBoundingBoxLocation:(id)a3;
- (void)setStartBoundingBoxLocation:(id)a3;
@end

@implementation SMSessionConfigurationEnumerationOptions

- (SMSessionConfigurationEnumerationOptions)init
{
  LOBYTE(v3) = 0;
  return [(SMSessionConfigurationEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 sortBySessionStartDate:0 ascending:0 sessionTypes:0 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v3 dateInterval:0 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];
}

- (SMSessionConfigurationEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortBySessionStartDate:(BOOL)a5 ascending:(BOOL)a6 sessionTypes:(id)a7 timeInADayInterval:(id)a8 pickOneConfigInTimeInADayInterval:(BOOL)a9 dateInterval:(id)a10 startBoundingBoxLocation:(id)a11 destinationBoundingBoxLocation:(id)a12 boundingBoxRadius:(id)a13 sessionIdentifier:(id)a14
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v17 = a7;
  id v18 = a8;
  id obj = a10;
  id v49 = a10;
  id v38 = a11;
  id v48 = a11;
  id v39 = a12;
  id v47 = a12;
  id v40 = a13;
  v19 = v17;
  id v50 = a13;
  id v36 = a14;
  id v46 = a14;
  v56.receiver = self;
  v56.super_class = (Class)SMSessionConfigurationEnumerationOptions;
  v20 = [(SMSessionConfigurationEnumerationOptions *)&v56 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_16;
  }
  id v41 = v17;
  v20->_batchSize = a3;
  v20->_fetchLimit = a4;
  v20->_sortBySessionStartDate = a5;
  v20->_ascending = a6;
  objc_storeStrong((id *)&v20->_sessionTypes, a7);
  objc_storeStrong((id *)&v21->_timeInADayInterval, a8);
  v21->_pickOneConfigInTimeInADayInterval = a9;
  if (!a9 || v21->_timeInADayInterval)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v19 = v17;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(v22);
          }
          int v27 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "unsignedIntValue", v36, obj, v38, v39, v40);
          if (v18 && v27 != 2)
          {
            v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timeInADayInterval == nil", buf, 2u);
            }

            goto LABEL_28;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v57 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    objc_storeStrong((id *)&v21->_dateInterval, obj);
    objc_storeStrong((id *)&v21->_startBoundingBoxLocation, v38);
    objc_storeStrong((id *)&v21->_destinationBoundingBoxLocation, v39);
    objc_storeStrong((id *)&v21->_boundingBoxRadius, v40);
    if (v21->_startBoundingBoxLocation)
    {
      v19 = v41;
      if (v50)
      {
LABEL_15:
        objc_storeStrong((id *)&v21->_sessionIdentifier, v36);
LABEL_16:
        v28 = v21;
LABEL_29:
        v33 = v48;
        v32 = v49;
        v31 = v47;
        goto LABEL_30;
      }
    }
    else
    {
      v19 = v41;
      if (v50 || !v21->_destinationBoundingBoxLocation) {
        goto LABEL_15;
      }
    }
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: boundingBoxRadius != nil", buf, 2u);
    }

LABEL_28:
    v28 = 0;
    goto LABEL_29;
  }
  v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = v41;
  v31 = v47;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_25B6E0000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _timeInADayInterval", buf, 2u);
  }

  v28 = 0;
  v33 = v48;
  v32 = v49;
LABEL_30:

  return v28;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_pickOneConfigInTimeInADayInterval;
  return (id)[v4 initWithBatchSize:self->_batchSize fetchLimit:self->_fetchLimit sortBySessionStartDate:self->_sortBySessionStartDate ascending:self->_ascending sessionTypes:self->_sessionTypes timeInADayInterval:self->_timeInADayInterval pickOneConfigInTimeInADayInterval:v6 dateInterval:self->_dateInterval startBoundingBoxLocation:self->_startBoundingBoxLocation destinationBoundingBoxLocation:self->_destinationBoundingBoxLocation boundingBoxRadius:self->_boundingBoxRadius sessionIdentifier:self->_sessionIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t batchSize = self->_batchSize;
  id v5 = a3;
  [v5 encodeInteger:batchSize forKey:@"batchSize"];
  [v5 encodeInteger:self->_fetchLimit forKey:@"fetchLimit"];
  [v5 encodeBool:self->_sortBySessionStartDate forKey:@"sortBySessionStartDate"];
  [v5 encodeBool:self->_ascending forKey:@"ascending"];
  [v5 encodeObject:self->_sessionTypes forKey:@"sessionTypes"];
  [v5 encodeObject:self->_timeInADayInterval forKey:@"timeInADayInterval"];
  [v5 encodeBool:self->_pickOneConfigInTimeInADayInterval forKey:@"pickOneConfigInTimeInADayInterval"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_startBoundingBoxLocation forKey:@"startBoundingBoxLocation"];
  [v5 encodeObject:self->_destinationBoundingBoxLocation forKey:@"destinationBoundingBoxLocation"];
  [v5 encodeObject:self->_boundingBoxRadius forKey:@"boundingBoxRadius"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
}

- (SMSessionConfigurationEnumerationOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v18 = [v3 decodeIntegerForKey:@"batchSize"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"fetchLimit"];
  unsigned int v16 = [v3 decodeBoolForKey:@"sortBySessionStartDate"];
  uint64_t v4 = [v3 decodeBoolForKey:@"ascending"];
  id v5 = [v3 decodeObjectForKey:@"sessionTypes"];
  uint64_t v6 = [v3 decodeObjectForKey:@"timeInADayInterval"];
  char v7 = [v3 decodeBoolForKey:@"pickOneConfigInTimeInADayInterval"];
  v8 = [v3 decodeObjectForKey:@"dateInterval"];
  v9 = [v3 decodeObjectForKey:@"startBoundingBoxLocation"];
  v10 = [v3 decodeObjectForKey:@"destinationBoundingBoxLocation"];
  v11 = [v3 decodeObjectForKey:@"boundingBoxRadius"];
  v12 = [v3 decodeObjectForKey:@"sessionIdentifier"];

  LOBYTE(v15) = v7;
  v13 = [(SMSessionConfigurationEnumerationOptions *)self initWithBatchSize:v18 fetchLimit:v17 sortBySessionStartDate:v16 ascending:v4 sessionTypes:v5 timeInADayInterval:v6 pickOneConfigInTimeInADayInterval:v15 dateInterval:v8 startBoundingBoxLocation:v9 destinationBoundingBoxLocation:v10 boundingBoxRadius:v11 sessionIdentifier:v12];

  return v13;
}

- (id)description
{
  v21 = NSString;
  unint64_t v20 = [(SMSessionConfigurationEnumerationOptions *)self batchSize];
  unint64_t v19 = [(SMSessionConfigurationEnumerationOptions *)self fetchLimit];
  if ([(SMSessionConfigurationEnumerationOptions *)self sortBySessionStartDate]) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  uint64_t v18 = v3;
  if ([(SMSessionConfigurationEnumerationOptions *)self ascending]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  id v5 = [(SMSessionConfigurationEnumerationOptions *)self sessionTypes];
  uint64_t v6 = [v5 count];
  char v7 = [(SMSessionConfigurationEnumerationOptions *)self timeInADayInterval];
  if ([(SMSessionConfigurationEnumerationOptions *)self pickOneConfigInTimeInADayInterval])
  {
    v8 = @"YES";
  }
  else
  {
    v8 = @"NO";
  }
  v9 = [(SMSessionConfigurationEnumerationOptions *)self dateInterval];
  v10 = [(SMSessionConfigurationEnumerationOptions *)self startBoundingBoxLocation];
  v11 = [(SMSessionConfigurationEnumerationOptions *)self destinationBoundingBoxLocation];
  v12 = [(SMSessionConfigurationEnumerationOptions *)self boundingBoxRadius];
  [v12 doubleValue];
  uint64_t v14 = v13;
  uint64_t v15 = [(SMSessionConfigurationEnumerationOptions *)self sessionIdentifier];
  unsigned int v16 = [v21 stringWithFormat:@"batchSize, %lu, fetchLimit, %lu, sortBySessionStartDate, %@, ascending, %@, session types count, %lu, timeInADayInterval, %@, pickOneConfigInTimeInADayInterval, %@, dateInterval, %@, startBoundingBoxLocation, %@, destinationBoundingBoxLocation, %@, boundingBoxRadius, %.3f, sessionIdentifier, %@", v20, v19, v18, v4, v6, v7, v8, v9, v10, v11, v14, v15];

  return v16;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)sortBySessionStartDate
{
  return self->_sortBySessionStartDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSArray)sessionTypes
{
  return self->_sessionTypes;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (NSDateInterval)timeInADayInterval
{
  return self->_timeInADayInterval;
}

- (BOOL)pickOneConfigInTimeInADayInterval
{
  return self->_pickOneConfigInTimeInADayInterval;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (CLLocation)startBoundingBoxLocation
{
  return self->_startBoundingBoxLocation;
}

- (void)setStartBoundingBoxLocation:(id)a3
{
}

- (CLLocation)destinationBoundingBoxLocation
{
  return self->_destinationBoundingBoxLocation;
}

- (void)setDestinationBoundingBoxLocation:(id)a3
{
}

- (NSNumber)boundingBoxRadius
{
  return self->_boundingBoxRadius;
}

- (void)setBoundingBoxRadius:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxRadius, 0);
  objc_storeStrong((id *)&self->_destinationBoundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_startBoundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_timeInADayInterval, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionTypes, 0);
}

@end