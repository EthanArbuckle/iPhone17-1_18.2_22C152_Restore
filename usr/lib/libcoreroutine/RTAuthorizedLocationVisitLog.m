@interface RTAuthorizedLocationVisitLog
+ (BOOL)decodeTimeSourceWithValue:(id)a3 isRetroRegistration:(BOOL *)a4 isTrusted:(BOOL *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)createWithAuthorizedLocationVisitLogMO:(id)a3;
+ (id)createWithManagedObject:(id)a3;
+ (id)encodeTimeSourceWithValue:(id)a3 isTrusted:(BOOL)a4 isRetroRegistration:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)registrationDate;
- (NSString)description;
- (NSUUID)visitIdentifier;
- (RTAuthorizedLocationVisitLog)initWithCoder:(id)a3;
- (RTAuthorizedLocationVisitLog)initWithVisitIdentifier:(id)a3 registrationDate:(id)a4 locationTechnologyAvailability:(unint64_t)a5;
- (id)managedObjectWithContext:(id)a3;
- (unint64_t)locationTechnologyAvailability;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTAuthorizedLocationVisitLog

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(id)objc_opt_class() createWithAuthorizedLocationVisitLogMO:v5];

      goto LABEL_8;
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      int v10 = 138413058;
      v11 = v9;
      __int16 v12 = 2112;
      __int16 v14 = 2080;
      id v13 = v4;
      v15 = "+[RTAuthorizedLocationVisitLog(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTAuthorizedLocationVisitLog+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithAuthorizedLocationVisitLogMO:(id)a3
{
  id v3 = a3;
  if ([v3 locationTechnologyAvailability]) {
    uint64_t v4 = [v3 locationTechnologyAvailability];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [RTAuthorizedLocationVisitLog alloc];
  v6 = [v3 visitIdentifier];
  v7 = [v3 registrationDate];
  v8 = [(RTAuthorizedLocationVisitLog *)v5 initWithVisitIdentifier:v6 registrationDate:v7 locationTechnologyAvailability:v4];

  return v8;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTAuthorizedLocationVisitLogMO managedObjectWithAuthorizedLocationVisitLog:self inManagedObjectContext:a3];
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

- (RTAuthorizedLocationVisitLog)initWithVisitIdentifier:(id)a3 registrationDate:(id)a4 locationTechnologyAvailability:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      __int16 v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    __int16 v16 = "Invalid parameter not satisfying: visitIdentifier";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    __int16 v16 = "Invalid parameter not satisfying: registrationDate";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTAuthorizedLocationVisitLog;
  __int16 v12 = [(RTAuthorizedLocationVisitLog *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_visitIdentifier, a3);
    objc_storeStrong((id *)&v13->_registrationDate, a4);
    v13->_locationTechnologyAvailability = a5;
  }
  self = v13;
  __int16 v14 = self;
LABEL_10:

  return v14;
}

+ (id)encodeTimeSourceWithValue:(id)a3 isTrusted:(BOOL)a4 isRetroRegistration:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v8 = floor(v7);
  double v9 = 0.5;
  if (v6) {
    double v9 = 0.0;
  }
  if (v5) {
    double v9 = 0.25;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v9 + v8];

  return v10;
}

+ (BOOL)decodeTimeSourceWithValue:(id)a3 isRetroRegistration:(BOOL *)a4 isTrusted:(BOOL *)a5
{
  id v7 = a3;
  double v8 = v7;
  BOOL v9 = 0;
  if (a4 && a5)
  {
    [v7 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [v8 timeIntervalSinceReferenceDate];
    double v13 = v11 - floor(v12);
    if (fabs(v13 + -0.25) < 0.001)
    {
      BOOL v14 = 0;
      BOOL v15 = 1;
LABEL_9:
      *a4 = v15;
      *a5 = v14;
      BOOL v9 = 1;
      goto LABEL_10;
    }
    if (fabs(v13 + -0.5) < 0.001)
    {
      BOOL v15 = 0;
      BOOL v14 = 0;
      goto LABEL_9;
    }
    BOOL v9 = 0;
    if (fabs(v13) < 0.001)
    {
      BOOL v15 = 0;
      BOOL v14 = 1;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  visitIdentifier = self->_visitIdentifier;
  id v5 = a3;
  [v5 encodeObject:visitIdentifier forKey:@"visitIdentifier"];
  [v5 encodeObject:self->_registrationDate forKey:@"registrationDate"];
  [v5 encodeInteger:self->_locationTechnologyAvailability forKey:@"locationTechnologyAvailability"];
}

- (RTAuthorizedLocationVisitLog)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visitIdentifier"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationDate"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"locationTechnologyAvailability"];

  double v8 = [(RTAuthorizedLocationVisitLog *)self initWithVisitIdentifier:v5 registrationDate:v6 locationTechnologyAvailability:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isMemberOfClass:objc_opt_class()];
  visitIdentifier = self->_visitIdentifier;
  uint64_t v7 = [v4 visitIdentifier];
  int v8 = [(NSUUID *)visitIdentifier isEqual:v7];

  registrationDate = self->_registrationDate;
  double v10 = [v4 registrationDate];
  char v11 = [(NSDate *)registrationDate isEqual:v10];

  unint64_t locationTechnologyAvailability = self->_locationTechnologyAvailability;
  uint64_t v13 = [v4 locationTechnologyAvailability];

  if (locationTechnologyAvailability == v13) {
    BOOL v14 = v11;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v8) {
    BOOL v14 = 0;
  }
  return v5 && v14;
}

- (NSString)description
{
  __int16 v14 = 0;
  BOOL v3 = +[RTAuthorizedLocationVisitLog decodeTimeSourceWithValue:self->_registrationDate isRetroRegistration:(char *)&v14 + 1 isTrusted:&v14];
  id v4 = NSString;
  id v5 = [(NSUUID *)self->_visitIdentifier UUIDString];
  uint64_t v6 = [v5 UTF8String];
  uint64_t v7 = [(NSDate *)self->_registrationDate stringFromDate];
  int v8 = (void *)v7;
  unint64_t locationTechnologyAvailability = self->_locationTechnologyAvailability;
  if (v3) {
    [v4 stringWithFormat:@"Visit UUID, %s, registrationDate, %@, locationTechnologyAvailability, %lu, isRetroRegistration, %d, isTrustedTime, %d", v6, v7, locationTechnologyAvailability, HIBYTE(v14), v14];
  }
  else {
  double v10 = [v4 stringWithFormat:@"Visit UUID, %s, registrationDate, %@, locationTechnologyAvailability, %lu", v6, v7, locationTechnologyAvailability, v12, v13];
  }

  return (NSString *)v10;
}

- (NSUUID)visitIdentifier
{
  return self->_visitIdentifier;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (unint64_t)locationTechnologyAvailability
{
  return self->_locationTechnologyAvailability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDate, 0);

  objc_storeStrong((id *)&self->_visitIdentifier, 0);
}

@end