@interface RTPeopleDensitySingleRecord
+ (BOOL)supportsSecureCoding;
- (NSDate)startDatetime;
- (RTPeopleDensitySingleRecord)init;
- (RTPeopleDensitySingleRecord)initWithCoder:(id)a3;
- (RTPeopleDensitySingleRecord)initWithStats:(unint64_t)a3 scanDuration:(double)a4;
- (double)scanDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)advertisementsCount;
- (void)encodeWithCoder:(id)a3;
- (void)setStartDatetime:(id)a3;
@end

@implementation RTPeopleDensitySingleRecord

- (RTPeopleDensitySingleRecord)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStats_scanDuration_);
}

- (RTPeopleDensitySingleRecord)initWithStats:(unint64_t)a3 scanDuration:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RTPeopleDensitySingleRecord;
  v6 = [(RTPeopleDensitySingleRecord *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_advertisementsCount = a3;
    v6->_scanDuration = a4;
    startDatetime = v6->_startDatetime;
    v6->_startDatetime = 0;
  }
  return v7;
}

- (id)descriptionDictionary
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"numOfAdvs";
  v3 = [NSNumber numberWithUnsignedInteger:self->_advertisementsCount];
  v10[0] = v3;
  v9[1] = @"duration";
  v4 = [NSNumber numberWithDouble:self->_scanDuration];
  v10[1] = v4;
  v9[2] = @"startDatetime";
  startDatetime = self->_startDatetime;
  if (startDatetime)
  {
    v6 = [(NSDate *)startDatetime getFormattedDateString];
  }
  else
  {
    v6 = @"-";
  }
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  if (startDatetime) {

  }
  return v7;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDensitySingleRecord *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      objc_super v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t advertisementsCount = self->_advertisementsCount;
  double scanDuration = self->_scanDuration;

  return (id)[v4 initWithStats:advertisementsCount scanDuration:scanDuration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensitySingleRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTPeopleDensitySingleRecord;
  v5 = [(RTPeopleDensitySingleRecord *)&v10 init];
  if (v5)
  {
    v5->_unint64_t advertisementsCount = [v4 decodeIntegerForKey:@"numOfAdvs"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_double scanDuration = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDatetime"];
    startDatetime = v5->_startDatetime;
    v5->_startDatetime = (NSDate *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t advertisementsCount = self->_advertisementsCount;
  id v5 = a3;
  [v5 encodeInteger:advertisementsCount forKey:@"numOfAdvs"];
  [v5 encodeDouble:@"duration" forKey:self->_scanDuration];
  [v5 encodeObject:self->_startDatetime forKey:@"startDatetime"];
}

- (unint64_t)advertisementsCount
{
  return self->_advertisementsCount;
}

- (double)scanDuration
{
  return self->_scanDuration;
}

- (NSDate)startDatetime
{
  return self->_startDatetime;
}

- (void)setStartDatetime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end