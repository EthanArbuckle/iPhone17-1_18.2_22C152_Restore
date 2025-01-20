@interface HKMHValenceSummary
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)isEqual:(id)a3;
- (HKMHValenceSummary)initWithCoder:(id)a3;
- (HKMHValenceSummary)initWithCountPleasant:(int64_t)a3 countNeutral:(int64_t)a4 countUnpleasant:(int64_t)a5 dayIndexRange:(id)a6;
- (HKMHValenceSummary)initWithDayIndexRange:(id)a3;
- (id)description;
- (int64_t)countNeutral;
- (int64_t)countPleasant;
- (int64_t)countUnpleasant;
- (int64_t)totalCount;
- (unint64_t)hash;
- (void)_addValence:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCountNeutral:(int64_t)a3;
- (void)setCountPleasant:(int64_t)a3;
- (void)setCountUnpleasant:(int64_t)a3;
@end

@implementation HKMHValenceSummary

- (HKMHValenceSummary)initWithCountPleasant:(int64_t)a3 countNeutral:(int64_t)a4 countUnpleasant:(int64_t)a5 dayIndexRange:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HKMHValenceSummary;
  result = [(HKMHValenceSummary *)&v10 init];
  if (result)
  {
    result->_countPleasant = a3;
    result->_countNeutral = a4;
    result->_countUnpleasant = a5;
  }
  return result;
}

- (HKMHValenceSummary)initWithDayIndexRange:(id)a3
{
  return -[HKMHValenceSummary initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:](self, "initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:", 0, 0, 0, a3.var0, a3.var1);
}

- (int64_t)totalCount
{
  return self->_countNeutral + self->_countPleasant + self->_countUnpleasant;
}

- (void)_addValence:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 6) {
    ++*(Class *)((char *)&self->super.isa + qword_255F28030[a3 - 1]);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v7 = self->_countPleasant == v5[1]
      && self->_countNeutral == v5[2]
      && self->_countUnpleasant == v5[3]
      && self->_dayIndexRange.start == v5[4]
      && self->_dayIndexRange.duration == v5[5];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8(*(int8x16_t *)&self->_countNeutral, (int8x16_t)self->_dayIndexRange);
  return *(void *)&veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) ^ self->_countPleasant;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [NSNumber numberWithInteger:self->_countPleasant];
  v6 = [NSNumber numberWithInteger:self->_countNeutral];
  BOOL v7 = [NSNumber numberWithInteger:self->_countUnpleasant];
  v8 = NSStringFromHKDayIndexRange();
  v9 = [v3 stringWithFormat:@"<%@:%p Counts pleasant:%@ neutral:%@ unpleasant:%@ day index range:%@>", v4, self, v5, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"CountPleasant"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"CountUnpleasant"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"CountNeutral"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"DayIndexRangeStart"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"DayIndexRangeDuration"];

  return -[HKMHValenceSummary initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:](self, "initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:", v5, v7, v6, v8, v9);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t countPleasant = self->_countPleasant;
  id v5 = a3;
  [v5 encodeInteger:countPleasant forKey:@"CountPleasant"];
  [v5 encodeInteger:self->_countNeutral forKey:@"CountNeutral"];
  [v5 encodeInteger:self->_countUnpleasant forKey:@"CountUnpleasant"];
  [v5 encodeInteger:self->_dayIndexRange.start forKey:@"DayIndexRangeStart"];
  [v5 encodeInteger:self->_dayIndexRange.duration forKey:@"DayIndexRangeDuration"];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration = self->_dayIndexRange.duration;
  int64_t start = self->_dayIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (int64_t)countPleasant
{
  return self->_countPleasant;
}

- (void)setCountPleasant:(int64_t)a3
{
  self->_int64_t countPleasant = a3;
}

- (int64_t)countNeutral
{
  return self->_countNeutral;
}

- (void)setCountNeutral:(int64_t)a3
{
  self->_countNeutral = a3;
}

- (int64_t)countUnpleasant
{
  return self->_countUnpleasant;
}

- (void)setCountUnpleasant:(int64_t)a3
{
  self->_countUnpleasant = a3;
}

@end