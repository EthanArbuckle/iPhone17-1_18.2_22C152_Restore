@interface TSTAIUTCValue
- (NSDate)taiDate;
- (NSDate)utcDate;
- (NSDictionary)dictionary;
- (TSTAIUTCValue)init;
- (TSTAIUTCValue)initWithDictionary:(id)a3;
- (double)coefficient;
- (double)constant;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)modifiedJulianDay;
- (unint64_t)offset;
- (void)setCoefficient:(double)a3;
- (void)setConstant:(double)a3;
- (void)setModifiedJulianDay:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setTaiDate:(id)a3;
- (void)setUtcDate:(id)a3;
@end

@implementation TSTAIUTCValue

- (TSTAIUTCValue)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSTAIUTCValue;
  v2 = [(TSTAIUTCValue *)&v4 init];
  if (v2 && init_onceToken_1 != -1) {
    dispatch_once(&init_onceToken_1, &__block_literal_global_120);
  }
  return v2;
}

uint64_t __21__TSTAIUTCValue_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)TSTAIUTCValueDateFormatter;
  TSTAIUTCValueDateFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [(id)TSTAIUTCValueDateFormatter setTimeZone:v2];

  v3 = (void *)TSTAIUTCValueDateFormatter;
  return [v3 setFormatOptions:3955];
}

- (TSTAIUTCValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(TSTAIUTCValue *)self init];
  if (v5)
  {
    v6 = (void *)TSTAIUTCValueDateFormatter;
    v7 = [v4 objectForKeyedSubscript:@"utc_date"];
    uint64_t v8 = [v6 dateFromString:v7];
    utcDate = v5->_utcDate;
    v5->_utcDate = (NSDate *)v8;

    v10 = (void *)TSTAIUTCValueDateFormatter;
    v11 = [v4 objectForKeyedSubscript:@"tai_date"];
    uint64_t v12 = [v10 dateFromString:v11];
    taiDate = v5->_taiDate;
    v5->_taiDate = (NSDate *)v12;

    v14 = [v4 objectForKeyedSubscript:@"modified_julian_day"];
    v5->_modifiedJulianDay = [v14 integerValue];

    v15 = [v4 objectForKeyedSubscript:@"constant"];
    [v15 doubleValue];
    v5->_constant = v16;

    v17 = [v4 objectForKeyedSubscript:@"offset"];
    v5->_offset = [v17 integerValue];

    v18 = [v4 objectForKeyedSubscript:@"coefficient"];
    [v18 doubleValue];
    v5->_double coefficient = v19;

    double coefficient = v5->_coefficient;
    if (coefficient != 0.0)
    {
      uint64_t v21 = [(NSDate *)v5->_utcDate dateByAddingTimeInterval:v5->_constant + (double)(uint64_t)(v5->_modifiedJulianDay - v5->_offset) * coefficient];
      v22 = v5->_taiDate;
      v5->_taiDate = (NSDate *)v21;
    }
  }

  return v5;
}

- (NSDictionary)dictionary
{
  v18[6] = *MEMORY[0x1E4F143B8];
  v17[0] = @"utc_date";
  v3 = (void *)TSTAIUTCValueDateFormatter;
  id v4 = [(TSTAIUTCValue *)self utcDate];
  v5 = [v3 stringFromDate:v4];
  v18[0] = v5;
  v17[1] = @"tai_date";
  v6 = (void *)TSTAIUTCValueDateFormatter;
  v7 = [(TSTAIUTCValue *)self taiDate];
  uint64_t v8 = [v6 stringFromDate:v7];
  v18[1] = v8;
  v17[2] = @"modified_julian_day";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TSTAIUTCValue modifiedJulianDay](self, "modifiedJulianDay"));
  v18[2] = v9;
  v17[3] = @"constant";
  v10 = NSNumber;
  [(TSTAIUTCValue *)self constant];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v18[3] = v11;
  v17[4] = @"offset";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TSTAIUTCValue offset](self, "offset"));
  v18[4] = v12;
  v17[5] = @"coefficient";
  v13 = NSNumber;
  [(TSTAIUTCValue *)self coefficient];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v18[5] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

  return (NSDictionary *)v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(TSTAIUTCValue *)self utcDate];
  [v4 setUtcDate:v5];

  v6 = [(TSTAIUTCValue *)self taiDate];
  [v4 setTaiDate:v6];

  objc_msgSend(v4, "setModifiedJulianDay:", -[TSTAIUTCValue modifiedJulianDay](self, "modifiedJulianDay"));
  [(TSTAIUTCValue *)self constant];
  objc_msgSend(v4, "setConstant:");
  [(TSTAIUTCValue *)self coefficient];
  objc_msgSend(v4, "setCoefficient:");
  objc_msgSend(v4, "setOffset:", -[TSTAIUTCValue offset](self, "offset"));
  return v4;
}

- (NSDate)utcDate
{
  return self->_utcDate;
}

- (void)setUtcDate:(id)a3
{
}

- (NSDate)taiDate
{
  return self->_taiDate;
}

- (void)setTaiDate:(id)a3
{
}

- (unint64_t)modifiedJulianDay
{
  return self->_modifiedJulianDay;
}

- (void)setModifiedJulianDay:(unint64_t)a3
{
  self->_modifiedJulianDay = a3;
}

- (double)constant
{
  return self->_constant;
}

- (void)setConstant:(double)a3
{
  self->_constant = a3;
}

- (double)coefficient
{
  return self->_coefficient;
}

- (void)setCoefficient:(double)a3
{
  self->_double coefficient = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taiDate, 0);
  objc_storeStrong((id *)&self->_utcDate, 0);
}

@end