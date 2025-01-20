@interface FMDDeviceMotion
+ (id)stringFromActivityState:(int64_t)a3;
- (NSDate)activityStartDate;
- (id)description;
- (int64_t)activityState;
- (void)setActivityStartDate:(id)a3;
- (void)setActivityState:(int64_t)a3;
@end

@implementation FMDDeviceMotion

- (id)description
{
  v3 = +[FMDDeviceMotion stringFromActivityState:[(FMDDeviceMotion *)self activityState]];
  v4 = [(FMDDeviceMotion *)self activityStartDate];
  v5 = +[NSString stringWithFormat:@"DeviceMotion state %@, startDate %@", v3, v4];

  return v5;
}

+ (id)stringFromActivityState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return *(&off_1002DB198 + a3 - 1);
  }
}

- (int64_t)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(int64_t)a3
{
  self->_activityState = a3;
}

- (NSDate)activityStartDate
{
  return self->_activityStartDate;
}

- (void)setActivityStartDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end