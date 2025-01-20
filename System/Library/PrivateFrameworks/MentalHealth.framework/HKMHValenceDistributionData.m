@interface HKMHValenceDistributionData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMHValenceDistributionData)initWithCoder:(id)a3;
- (HKMHValenceDistributionData)initWithMinimumValence:(double)a3 maximumValence:(double)a4 sampleCount:(int64_t)a5 reflectiveInterval:(int64_t)a6;
- (NSString)hk_redactedDescription;
- (double)maximumValence;
- (double)minimumValence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)reflectiveInterval;
- (int64_t)sampleCount;
- (unint64_t)hash;
- (void)addValenceDistribution:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMHValenceDistributionData

- (HKMHValenceDistributionData)initWithMinimumValence:(double)a3 maximumValence:(double)a4 sampleCount:(int64_t)a5 reflectiveInterval:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HKMHValenceDistributionData;
  result = [(HKMHValenceDistributionData *)&v11 init];
  if (result)
  {
    result->_minimumValence = a3;
    result->_maximumValence = a4;
    result->_sampleCount = a5;
    result->_reflectiveInterval = a6;
  }
  return result;
}

- (void)addValenceDistribution:(id)a3
{
  id v8 = a3;
  [v8 minimumValence];
  if (v4 < self->_minimumValence)
  {
    [v8 minimumValence];
    self->_minimumValence = v5;
  }
  [v8 maximumValence];
  if (v6 > self->_maximumValence)
  {
    [v8 maximumValence];
    self->_maximumValence = v7;
  }
  self->_sampleCount += [v8 sampleCount];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (HKMHValenceDistributionData *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      BOOL v6 = self->_minimumValence == v5->_minimumValence
        && self->_maximumValence == v5->_maximumValence
        && self->_sampleCount == v5->_sampleCount
        && self->_reflectiveInterval == v5->_reflectiveInterval;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_minimumValence];
  uint64_t v4 = [v3 hash];
  double v5 = [NSNumber numberWithDouble:self->_maximumValence];
  unint64_t v6 = [v5 hash] ^ v4 ^ self->_sampleCount ^ self->_reflectiveInterval;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[HKMHValenceDistributionData allocWithZone:a3];
  double minimumValence = self->_minimumValence;
  double maximumValence = self->_maximumValence;
  int64_t sampleCount = self->_sampleCount;
  int64_t reflectiveInterval = self->_reflectiveInterval;
  return [(HKMHValenceDistributionData *)v4 initWithMinimumValence:sampleCount maximumValence:reflectiveInterval sampleCount:minimumValence reflectiveInterval:maximumValence];
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HKMHValenceDistributionData;
  uint64_t v4 = [(HKMHValenceDistributionData *)&v11 description];
  double v5 = [NSNumber numberWithDouble:self->_minimumValence];
  unint64_t v6 = [NSNumber numberWithDouble:self->_maximumValence];
  double v7 = [NSNumber numberWithInteger:self->_sampleCount];
  id v8 = [NSNumber numberWithInteger:self->_reflectiveInterval];
  v9 = [v3 stringWithFormat:@"%@[min:%@ max:%@ count:%@ interval:%@]", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)hk_redactedDescription
{
  v4.receiver = self;
  v4.super_class = (Class)HKMHValenceDistributionData;
  v2 = [(HKMHValenceDistributionData *)&v4 description];
  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceDistributionData)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"MinimumValence"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"MaximumValence"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"SampleCount"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"ReflectiveInterval"];

  return [(HKMHValenceDistributionData *)self initWithMinimumValence:v9 maximumValence:v10 sampleCount:v6 reflectiveInterval:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double minimumValence = self->_minimumValence;
  id v5 = a3;
  [v5 encodeDouble:@"MinimumValence" forKey:minimumValence];
  [v5 encodeDouble:@"MaximumValence" forKey:self->_maximumValence];
  [v5 encodeInteger:self->_sampleCount forKey:@"SampleCount"];
  [v5 encodeInteger:self->_reflectiveInterval forKey:@"ReflectiveInterval"];
}

- (double)minimumValence
{
  return self->_minimumValence;
}

- (double)maximumValence
{
  return self->_maximumValence;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (int64_t)reflectiveInterval
{
  return self->_reflectiveInterval;
}

@end