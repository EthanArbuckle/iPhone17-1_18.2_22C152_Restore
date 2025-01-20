@interface RTMotionActivityPedometerData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateInterval;
- (RTMotionActivityPedometerData)initWithCoder:(id)a3;
- (RTMotionActivityPedometerData)initWithDateInterval:(id)a3 numberOfSteps:(unint64_t)a4 distance:(double)a5;
- (double)distance;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numberOfSteps;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTMotionActivityPedometerData

- (RTMotionActivityPedometerData)initWithDateInterval:(id)a3 numberOfSteps:(unint64_t)a4 distance:(double)a5
{
  id v9 = a3;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTMotionActivityPedometerData;
    v10 = [(RTMotionActivityPedometerData *)&v15 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_dateInterval, a3);
      v11->_numberOfSteps = a4;
      v11->_distance = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTMotionActivityPedometerData *)self dateInterval];
  unint64_t v5 = [(RTMotionActivityPedometerData *)self numberOfSteps];
  [(RTMotionActivityPedometerData *)self distance];
  v7 = [v3 stringWithFormat:@"dateInterval, %@, number of steps, %lu, distance, %.3f,", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTMotionActivityPedometerData)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectForKey:@"DateInterval"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"NumberOfSteps"];
  [v4 decodeDoubleForKey:@"Distance"];
  double v8 = v7;

  id v9 = [(RTMotionActivityPedometerData *)self initWithDateInterval:v5 numberOfSteps:v6 distance:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"DateInterval"];
  [v5 encodeInteger:self->_numberOfSteps forKey:@"NumberOfSteps"];
  [v5 encodeDouble:@"Distance" forKey:self->_distance];
}

- (unint64_t)hash
{
  v3 = [(RTMotionActivityPedometerData *)self dateInterval];
  uint64_t v4 = [v3 hash];
  id v5 = [NSNumber numberWithUnsignedInteger:-[RTMotionActivityPedometerData numberOfSteps](self, "numberOfSteps")];
  uint64_t v6 = [v5 hash] ^ v4;
  double v7 = NSNumber;
  [(RTMotionActivityPedometerData *)self distance];
  double v8 = [v7 numberWithDouble:];
  unint64_t v9 = v6 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RTMotionActivityPedometerData *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(RTMotionActivityPedometerData *)self dateInterval];
      double v7 = [(RTMotionActivityPedometerData *)v5 dateInterval];
      if ([v6 isEqualToDateInterval:v7]
        && (unint64_t v8 = [(RTMotionActivityPedometerData *)self numberOfSteps],
            v8 == [(RTMotionActivityPedometerData *)v5 numberOfSteps]))
      {
        [(RTMotionActivityPedometerData *)self distance];
        double v10 = v9;
        [(RTMotionActivityPedometerData *)v5 distance];
        BOOL v12 = v10 == v11;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)numberOfSteps
{
  return self->_numberOfSteps;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
}

@end