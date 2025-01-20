@interface HKMHValenceDistributionSummaryQueryConfiguration
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)ascending;
- (HKMHValenceDistributionSummaryQueryConfiguration)initWithCoder:(id)a3;
- (NSCalendar)gregorianCalendar;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limit;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setAscending:(BOOL)a3;
- (void)setDayIndexRange:(id)a3;
- (void)setGregorianCalendar:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation HKMHValenceDistributionSummaryQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKMHValenceDistributionSummaryQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v9 copyWithZone:a3];
  uint64_t v5 = [(HKMHValenceDistributionSummaryQueryConfiguration *)self dayIndexRange];
  objc_msgSend(v4, "setDayIndexRange:", v5, v6);
  v7 = [(HKMHValenceDistributionSummaryQueryConfiguration *)self gregorianCalendar];
  [v4 setGregorianCalendar:v7];

  objc_msgSend(v4, "setOptions:", -[HKMHValenceDistributionSummaryQueryConfiguration options](self, "options"));
  objc_msgSend(v4, "setAscending:", -[HKMHValenceDistributionSummaryQueryConfiguration ascending](self, "ascending"));
  objc_msgSend(v4, "setLimit:", -[HKMHValenceDistributionSummaryQueryConfiguration limit](self, "limit"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceDistributionSummaryQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMHValenceDistributionSummaryQueryConfiguration;
  uint64_t v5 = [(HKQueryServerConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_dayIndexRange.start = [v4 decodeIntegerForKey:@"DayIndexRangeStart"];
    v5->_dayIndexRange.duration = [v4 decodeIntegerForKey:@"DayIndexRangeDuration"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GregorianCalendar"];
    gregorianCalendar = v5->_gregorianCalendar;
    v5->_gregorianCalendar = (NSCalendar *)v6;

    v5->_options = [v4 decodeIntegerForKey:@"Options"];
    v5->_ascending = [v4 decodeBoolForKey:@"Ascending"];
    v5->_limit = [v4 decodeIntegerForKey:@"Limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMHValenceDistributionSummaryQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dayIndexRange.start, @"DayIndexRangeStart", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_dayIndexRange.duration forKey:@"DayIndexRangeDuration"];
  [v4 encodeObject:self->_gregorianCalendar forKey:@"GregorianCalendar"];
  [v4 encodeInteger:self->_options forKey:@"Options"];
  [v4 encodeBool:self->_ascending forKey:@"Ascending"];
  [v4 encodeInteger:self->_limit forKey:@"Limit"];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  p_dayIndexRange = &self->_dayIndexRange;
  int64_t start = self->_dayIndexRange.start;
  int64_t duration = p_dayIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (void)setDayIndexRange:(id)a3
{
  self->_dayIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
}

@end