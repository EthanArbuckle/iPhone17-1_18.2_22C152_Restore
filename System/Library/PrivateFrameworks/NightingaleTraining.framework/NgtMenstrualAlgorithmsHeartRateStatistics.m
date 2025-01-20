@interface NgtMenstrualAlgorithmsHeartRateStatistics
+ (BOOL)supportsSecureCoding;
- (NSNumber)lowerPercentile;
- (NgtMenstrualAlgorithmsHeartRateStatistics)initWithCoder:(id)a3;
- (NgtMenstrualAlgorithmsHeartRateStatistics)initWithLowerPercentile:(id)a3 forSampleCount:(int)a4;
- (int64_t)sampleCount;
- (void)encodeWithCoder:(id)a3;
- (void)setLowerPercentile:(id)a3;
- (void)setSampleCount:(int64_t)a3;
@end

@implementation NgtMenstrualAlgorithmsHeartRateStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NgtMenstrualAlgorithmsHeartRateStatistics)initWithLowerPercentile:(id)a3 forSampleCount:(int)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NgtMenstrualAlgorithmsHeartRateStatistics;
  v8 = [(NgtMenstrualAlgorithmsHeartRateStatistics *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lowerPercentile, a3);
    v9->_sampleCount = a4;
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  lowerPercentile = self->_lowerPercentile;
  v5 = NSStringFromSelector(sel_lowerPercentile);
  [v8 encodeObject:lowerPercentile forKey:v5];

  int64_t sampleCount = self->_sampleCount;
  id v7 = NSStringFromSelector(sel_sampleCount);
  [v8 encodeInteger:sampleCount forKey:v7];
}

- (NgtMenstrualAlgorithmsHeartRateStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NgtMenstrualAlgorithmsHeartRateStatistics *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_lowerPercentile);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    lowerPercentile = v5->_lowerPercentile;
    v5->_lowerPercentile = (NSNumber *)v8;

    v10 = NSStringFromSelector(sel_sampleCount);
    v5->_int64_t sampleCount = [v4 decodeIntegerForKey:v10];

    v11 = v5;
  }

  return v5;
}

- (NSNumber)lowerPercentile
{
  return self->_lowerPercentile;
}

- (void)setLowerPercentile:(id)a3
{
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_int64_t sampleCount = a3;
}

- (void).cxx_destruct
{
}

@end