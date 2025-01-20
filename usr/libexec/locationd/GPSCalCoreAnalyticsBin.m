@interface GPSCalCoreAnalyticsBin
+ (BOOL)supportsSecureCoding;
- (GPSCalCoreAnalyticsBin)initWithCoder:(id)a3;
- (GPSCalCoreAnalyticsBin)initWithSpeeds:(double)a3 speedUB:(double)a4;
- (double)lastUpdateTime;
- (double)mean;
- (double)speedLB;
- (double)speedUB;
- (double)variance;
- (int)updateCount;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUpdateTime:(double)a3;
- (void)setMean:(double)a3;
- (void)setSpeedLB:(double)a3;
- (void)setSpeedUB:(double)a3;
- (void)setUpdateCount:(int)a3;
- (void)setVariance:(double)a3;
@end

@implementation GPSCalCoreAnalyticsBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPSCalCoreAnalyticsBin)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GPSCalCoreAnalyticsBin;
  v4 = [(GPSCalCoreAnalyticsBin *)&v10 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"speedLB"];
    v4->_speedLB = v5;
    [a3 decodeDoubleForKey:@"speedUB"];
    v4->_speedUB = v6;
    [a3 decodeDoubleForKey:@"mean"];
    v4->_mean = v7;
    [a3 decodeDoubleForKey:@"variance"];
    v4->_variance = v8;
    v4->_updateCount = [a3 decodeInt32ForKey:@"updateCount"];
    v4->_lastUpdateTime = (double)(int)[a3 decodeInt32ForKey:@"lastUpdateTime"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"speedLB" forKey:self->_speedLB];
  [a3 encodeDouble:@"speedUB" forKey:self->_speedUB];
  [a3 encodeDouble:@"mean" forKey:self->_mean];
  [a3 encodeDouble:@"variance" forKey:self->_variance];
  [a3 encodeInt32:self->_updateCount forKey:@"updateCount"];
  uint64_t lastUpdateTime = (int)self->_lastUpdateTime;

  [a3 encodeInt32:lastUpdateTime forKey:@"lastUpdateTime"];
}

- (GPSCalCoreAnalyticsBin)initWithSpeeds:(double)a3 speedUB:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GPSCalCoreAnalyticsBin;
  double v6 = [(GPSCalCoreAnalyticsBin *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    v6->_speedLB = a3;
    v6->_speedUB = a4;
    *(_OWORD *)&v6->_mean = xmmword_101D1C450;
    v6->_uint64_t lastUpdateTime = CFAbsoluteTimeGetCurrent();
    v7->_updateCount = 0;
  }
  return v7;
}

- (double)speedLB
{
  return self->_speedLB;
}

- (void)setSpeedLB:(double)a3
{
  self->_speedLB = a3;
}

- (double)speedUB
{
  return self->_speedUB;
}

- (void)setSpeedUB:(double)a3
{
  self->_speedUB = a3;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_mean = a3;
}

- (double)variance
{
  return self->_variance;
}

- (void)setVariance:(double)a3
{
  self->_variance = a3;
}

- (int)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(int)a3
{
  self->_updateCount = a3;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_uint64_t lastUpdateTime = a3;
}

@end