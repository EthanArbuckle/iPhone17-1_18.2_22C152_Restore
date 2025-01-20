@interface SMSessionStateEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)sortByCreationDate;
- (CLLocation)locationBoundingBox;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (NSNumber)boundingBoxRadius;
- (NSUUID)sessionIdentifier;
- (SMSessionStateEnumerationOptions)init;
- (SMSessionStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByCreationDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7;
- (SMSessionStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByCreationDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7 sessionState:(unint64_t)a8 locationBoundingBox:(id)a9 boundingBoxRadius:(id)a10 sessionIdentifier:(id)a11;
- (SMSessionStateEnumerationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)batchSize;
- (unint64_t)fetchLimit;
- (unint64_t)sessionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionStateEnumerationOptions

- (SMSessionStateEnumerationOptions)init
{
  return [(SMSessionStateEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 sortByCreationDate:0 ascending:0 dateInterval:0 sessionState:0 locationBoundingBox:0 boundingBoxRadius:0 sessionIdentifier:0];
}

- (SMSessionStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByCreationDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7
{
  return [(SMSessionStateEnumerationOptions *)self initWithBatchSize:a3 fetchLimit:a4 sortByCreationDate:a5 ascending:a6 dateInterval:a7 sessionState:0 locationBoundingBox:0 boundingBoxRadius:0 sessionIdentifier:0];
}

- (SMSessionStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByCreationDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7 sessionState:(unint64_t)a8 locationBoundingBox:(id)a9 boundingBoxRadius:(id)a10 sessionIdentifier:(id)a11
{
  id v16 = a7;
  id v17 = a9;
  id v26 = a10;
  id v25 = a11;
  v28.receiver = self;
  v28.super_class = (Class)SMSessionStateEnumerationOptions;
  v18 = [(SMSessionStateEnumerationOptions *)&v28 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_7;
  }
  v18->_batchSize = a3;
  v18->_fetchLimit = a4;
  v18->_sortByCreationDate = a5;
  v18->_ascending = a6;
  objc_storeStrong((id *)&v18->_dateInterval, a7);
  v19->_sessionState = a8;
  objc_storeStrong((id *)&v19->_locationBoundingBox, a9);
  objc_storeStrong((id *)&v19->_sessionIdentifier, a11);
  objc_storeStrong((id *)&v19->_boundingBoxRadius, a10);
  if (v26) {
    goto LABEL_7;
  }
  if (v19->_locationBoundingBox)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: boundingBoxRadius != nil", buf, 2u);
    }

    v21 = 0;
  }
  else
  {
LABEL_7:
    v21 = v19;
  }

  return v21;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  unint64_t batchSize = self->_batchSize;
  unint64_t fetchLimit = self->_fetchLimit;
  BOOL sortByCreationDate = self->_sortByCreationDate;
  v6 = NSString;
  BOOL ascending = self->_ascending;
  v8 = [(NSDateInterval *)self->_dateInterval description];
  v9 = +[SMSessionManagerState convertSessionStateToString:self->_sessionState];
  [(CLLocation *)self->_locationBoundingBox coordinate];
  uint64_t v11 = v10;
  [(CLLocation *)self->_locationBoundingBox coordinate];
  uint64_t v13 = v12;
  [(NSNumber *)self->_boundingBoxRadius doubleValue];
  uint64_t v15 = v14;
  id v16 = [(NSUUID *)self->_sessionIdentifier description];
  id v17 = [v6 stringWithFormat:@"{batchSize:%lu, fetchLimit:%lu, sortByCreationDate:%d, ascending:%d, dateInterval:%@, sessionState:%@, locationBoundingBox.latitude:%f, locationBoundingBox.longitude:%f, boundingBoxRadius:%.3f, sessionIdentifier:%@}", batchSize, fetchLimit, sortByCreationDate, ascending, v8, v9, v11, v13, v15, v16];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:", self->_batchSize, self->_fetchLimit, self->_sortByCreationDate, self->_ascending, self->_dateInterval, self->_sessionState, self->_locationBoundingBox, self->_boundingBoxRadius, self->_sessionIdentifier);
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
  [v5 encodeBool:self->_sortByCreationDate forKey:@"sortByCreationDate"];
  [v5 encodeBool:self->_ascending forKey:@"ascending"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeInteger:self->_sessionState forKey:@"sessionState"];
  [v5 encodeObject:self->_locationBoundingBox forKey:@"locationBoundingBox"];
  [v5 encodeObject:self->_boundingBoxRadius forKey:@"boundingBoxRadius"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
}

- (SMSessionStateEnumerationOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeIntegerForKey:@"batchSize"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"fetchLimit"];
  uint64_t v6 = [v3 decodeBoolForKey:@"sortByCreationDate"];
  uint64_t v7 = [v3 decodeBoolForKey:@"ascending"];
  v8 = [v3 decodeObjectForKey:@"dateInterval"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"sessionState"];
  uint64_t v10 = [v3 decodeObjectForKey:@"locationBoundingBox"];
  uint64_t v11 = [v3 decodeObjectForKey:@"boundingBoxRadius"];
  uint64_t v12 = [v3 decodeObjectForKey:@"sessionIdentifier"];

  uint64_t v13 = [(SMSessionStateEnumerationOptions *)self initWithBatchSize:v4 fetchLimit:v5 sortByCreationDate:v6 ascending:v7 dateInterval:v8 sessionState:v9 locationBoundingBox:v10 boundingBoxRadius:v11 sessionIdentifier:v12];
  return v13;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)sortByCreationDate
{
  return self->_sortByCreationDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (CLLocation)locationBoundingBox
{
  return self->_locationBoundingBox;
}

- (NSNumber)boundingBoxRadius
{
  return self->_boundingBoxRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxRadius, 0);
  objc_storeStrong((id *)&self->_locationBoundingBox, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end