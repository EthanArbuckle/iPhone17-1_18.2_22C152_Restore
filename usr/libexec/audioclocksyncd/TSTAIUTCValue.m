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
  if (v2 && qword_100047C60 != -1) {
    dispatch_once(&qword_100047C60, &stru_10003C7D0);
  }
  return v2;
}

- (TSTAIUTCValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(TSTAIUTCValue *)self init];
  if (v5)
  {
    v6 = (void *)qword_100047C58;
    v7 = [v4 objectForKeyedSubscript:@"utc_date"];
    uint64_t v8 = [v6 dateFromString:v7];
    utcDate = v5->_utcDate;
    v5->_utcDate = (NSDate *)v8;

    v10 = (void *)qword_100047C58;
    v11 = [v4 objectForKeyedSubscript:@"tai_date"];
    uint64_t v12 = [v10 dateFromString:v11];
    taiDate = v5->_taiDate;
    v5->_taiDate = (NSDate *)v12;

    v14 = [v4 objectForKeyedSubscript:@"modified_julian_day"];
    v5->_modifiedJulianDay = (unint64_t)[v14 integerValue];

    v15 = [v4 objectForKeyedSubscript:@"constant"];
    [v15 doubleValue];
    v5->_constant = v16;

    v17 = [v4 objectForKeyedSubscript:@"offset"];
    v5->_offset = (unint64_t)[v17 integerValue];

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
  v15[0] = @"utc_date";
  v3 = (void *)qword_100047C58;
  id v4 = [(TSTAIUTCValue *)self utcDate];
  v5 = [v3 stringFromDate:v4];
  v16[0] = v5;
  v15[1] = @"tai_date";
  v6 = (void *)qword_100047C58;
  v7 = [(TSTAIUTCValue *)self taiDate];
  uint64_t v8 = [v6 stringFromDate:v7];
  v16[1] = v8;
  v15[2] = @"modified_julian_day";
  v9 = +[NSNumber numberWithUnsignedInteger:[(TSTAIUTCValue *)self modifiedJulianDay]];
  v16[2] = v9;
  v15[3] = @"constant";
  [(TSTAIUTCValue *)self constant];
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16[3] = v10;
  v15[4] = @"offset";
  v11 = +[NSNumber numberWithUnsignedInteger:[(TSTAIUTCValue *)self offset]];
  v16[4] = v11;
  v15[5] = @"coefficient";
  [(TSTAIUTCValue *)self coefficient];
  uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16[5] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  return (NSDictionary *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = [(TSTAIUTCValue *)self utcDate];
  [v4 setUtcDate:v5];

  v6 = [(TSTAIUTCValue *)self taiDate];
  [v4 setTaiDate:v6];

  [v4 setModifiedJulianDay:-[TSTAIUTCValue modifiedJulianDay](self, "modifiedJulianDay")];
  [(TSTAIUTCValue *)self constant];
  [v4 setConstant:];
  [(TSTAIUTCValue *)self coefficient];
  [v4 setCoefficient:];
  [v4 setOffset:-[TSTAIUTCValue offset](self, "offset")];
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