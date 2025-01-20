@interface MTTimerTimeInterval
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTime:(id)a3;
- (MTTimerTimeInterval)initWithCoder:(id)a3;
- (MTTimerTimeInterval)initWithTimeInterval:(double)a3;
- (double)remainingTime;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTTimerTimeInterval

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(MTTimerTimeInterval *)self remainingTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"MTTimerTimeInterval");
}

- (double)remainingTime
{
  return self->_remainingTime;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimerTimeInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerTimeInterval *)self initWithTimeInterval:0.0];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"MTTimerTimeInterval"];
    v5->_remainingTime = v6;
  }

  return v5;
}

- (MTTimerTimeInterval)initWithTimeInterval:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTTimerTimeInterval;
  result = [(MTTimerTimeInterval *)&v5 init];
  if (result) {
    result->_remainingTime = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EEE26C58]) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    BOOL v7 = [(MTTimerTimeInterval *)self isEqualToTime:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToTime:(id)a3
{
  return MTCompareTimerTimes(self, a3) == 0;
}

- (int64_t)compare:(id)a3
{
  return MTCompareTimerTimes(self, a3);
}

@end