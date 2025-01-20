@interface HKMHValenceDistributionSummary
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)isEqual:(id)a3;
- (HKMHValenceDistributionSummary)initWithCoder:(id)a3;
- (HKMHValenceDistributionSummary)initWithDayIndexRange:(id)a3 valenceDistributions:(id)a4;
- (NSArray)valenceDistributions;
- (NSString)hk_redactedDescription;
- (id)description;
- (int64_t)countDaily;
- (int64_t)countMomentary;
- (int64_t)totalSampleCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMHValenceDistributionSummary

- (HKMHValenceDistributionSummary)initWithDayIndexRange:(id)a3 valenceDistributions:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKMHValenceDistributionSummary;
  v8 = [(HKMHValenceDistributionSummary *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_dayIndexRange.start = var0;
    v8->_dayIndexRange.duration = var1;
    uint64_t v10 = [v7 copy];
    valenceDistributions = v9->_valenceDistributions;
    v9->_valenceDistributions = (NSArray *)v10;

    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global);
    v9->_countDaily = (uint64_t)v12;
    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global_279);
    v9->_countMomentary = (uint64_t)v13;
  }

  return v9;
}

double __77__HKMHValenceDistributionSummary_initWithDayIndexRange_valenceDistributions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = 0.0;
  if ([v2 reflectiveInterval] == 2) {
    double v3 = (double)[v2 sampleCount];
  }

  return v3;
}

double __77__HKMHValenceDistributionSummary_initWithDayIndexRange_valenceDistributions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = 0.0;
  if ([v2 reflectiveInterval] == 1) {
    double v3 = (double)[v2 sampleCount];
  }

  return v3;
}

- (int64_t)totalSampleCount
{
  return self->_countMomentary + self->_countDaily;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [(HKMHValenceDistributionSummary *)self valenceDistributions];
    id v7 = [v5 valenceDistributions];
    BOOL v9 = [v6 isEqualToArray:v7]
      && self->_countDaily == v5[3]
      && self->_countMomentary == v5[2]
      && self->_dayIndexRange.start == v5[4]
      && self->_dayIndexRange.duration == v5[5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  double v3 = [(HKMHValenceDistributionSummary *)self valenceDistributions];
  uint64_t v4 = [v3 hash];
  int8x16_t v5 = veorq_s8(*(int8x16_t *)&self->_countMomentary, (int8x16_t)self->_dayIndexRange);
  unint64_t v6 = *(void *)&veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) ^ v4;

  return v6;
}

- (id)description
{
  double v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKMHValenceDistributionSummary;
  uint64_t v4 = [(HKMHValenceDistributionSummary *)&v7 description];
  int8x16_t v5 = [v3 stringWithFormat:@"%@[range:(%ld - %ld) distributions:%@]", v4, self->_dayIndexRange.start, self->_dayIndexRange.duration + self->_dayIndexRange.start, self->_valenceDistributions];

  return v5;
}

- (NSString)hk_redactedDescription
{
  v4.receiver = self;
  v4.super_class = (Class)HKMHValenceDistributionSummary;
  id v2 = [(HKMHValenceDistributionSummary *)&v4 description];
  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceDistributionSummary)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  objc_super v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  unint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  objc_super v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ValenceDistributions"];

  uint64_t v9 = [v5 decodeIntegerForKey:@"DayIndexRangeStart"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"DayIndexRangeDuration"];

  v11 = -[HKMHValenceDistributionSummary initWithDayIndexRange:valenceDistributions:](self, "initWithDayIndexRange:valenceDistributions:", v9, v10, v8);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  valenceDistributions = self->_valenceDistributions;
  id v5 = a3;
  [v5 encodeObject:valenceDistributions forKey:@"ValenceDistributions"];
  [v5 encodeInteger:self->_dayIndexRange.start forKey:@"DayIndexRangeStart"];
  [v5 encodeInteger:self->_dayIndexRange.duration forKey:@"DayIndexRangeDuration"];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration = self->_dayIndexRange.duration;
  int64_t start = self->_dayIndexRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (NSArray)valenceDistributions
{
  return self->_valenceDistributions;
}

- (int64_t)countMomentary
{
  return self->_countMomentary;
}

- (int64_t)countDaily
{
  return self->_countDaily;
}

- (void).cxx_destruct
{
}

@end