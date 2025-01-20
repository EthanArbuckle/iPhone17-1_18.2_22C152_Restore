@interface HKMHMostPrevalentDomains
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)isEqual:(id)a3;
- (HKMHDomainSummary)mostPleasantDomains;
- (HKMHDomainSummary)mostUnpleasantDomains;
- (HKMHMostPrevalentDomains)initWithCoder:(id)a3;
- (HKMHMostPrevalentDomains)initWithMostUnpleasantDomains:(id)a3 mostPleasantDomains:(id)a4 dayIndexRange:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMHMostPrevalentDomains

- (HKMHMostPrevalentDomains)initWithMostUnpleasantDomains:(id)a3 mostPleasantDomains:(id)a4 dayIndexRange:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKMHMostPrevalentDomains;
  v12 = [(HKMHMostPrevalentDomains *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mostUnpleasantDomains, a3);
    objc_storeStrong((id *)&v13->_mostPleasantDomains, a4);
    v13->_dayIndexRange.start = var0;
    v13->_dayIndexRange.duration = var1;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    mostUnpleasantDomains = self->_mostUnpleasantDomains;
    v7 = (HKMHDomainSummary *)v5[1];
    BOOL v11 = (mostUnpleasantDomains == v7 || v7 && -[HKMHDomainSummary isEqual:](mostUnpleasantDomains, "isEqual:"))
       && ((mostPleasantDomains = self->_mostPleasantDomains, v9 = (HKMHDomainSummary *)v5[2], mostPleasantDomains == v9)
        || v9 && -[HKMHDomainSummary isEqual:](mostPleasantDomains, "isEqual:"))
       && self->_dayIndexRange.start == v5[3]
       && self->_dayIndexRange.duration == v5[4];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMHDomainSummary *)self->_mostPleasantDomains hash];
  return [(HKMHDomainSummary *)self->_mostUnpleasantDomains hash] ^ v3 ^ self->_dayIndexRange.duration ^ self->_dayIndexRange.start;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromHKDayIndexRange();
  v6 = [(HKMHDomainSummary *)self->_mostUnpleasantDomains description];
  v7 = [(HKMHDomainSummary *)self->_mostPleasantDomains description];
  v8 = [v3 stringWithFormat:@"<%@:%p Day Index Range:%@ Unpleasant:%@ Pleasant:%@>", v4, self, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHMostPrevalentDomains)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PleasantDomains"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnpleasantDomains"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"DayIndexRangeStart"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"DayIndexRangeDuration"];

  v9 = -[HKMHMostPrevalentDomains initWithMostUnpleasantDomains:mostPleasantDomains:dayIndexRange:](self, "initWithMostUnpleasantDomains:mostPleasantDomains:dayIndexRange:", v6, v5, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t start = self->_dayIndexRange.start;
  id v5 = a3;
  [v5 encodeInteger:start forKey:@"DayIndexRangeStart"];
  [v5 encodeInteger:self->_dayIndexRange.duration forKey:@"DayIndexRangeDuration"];
  [v5 encodeObject:self->_mostUnpleasantDomains forKey:@"UnpleasantDomains"];
  [v5 encodeObject:self->_mostPleasantDomains forKey:@"PleasantDomains"];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration = self->_dayIndexRange.duration;
  int64_t start = self->_dayIndexRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (HKMHDomainSummary)mostUnpleasantDomains
{
  return self->_mostUnpleasantDomains;
}

- (HKMHDomainSummary)mostPleasantDomains
{
  return self->_mostPleasantDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostPleasantDomains, 0);
  objc_storeStrong((id *)&self->_mostUnpleasantDomains, 0);
}

@end