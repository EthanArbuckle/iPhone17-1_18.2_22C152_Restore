@interface TVPDateRange
- (BOOL)containsDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (TVPDateRange)initWithStartDate:(id)a3 duration:(double)a4;
- (double)durationInSeconds;
- (id)dateRangeByIntersectingDateRange:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TVPDateRange

- (TVPDateRange)initWithStartDate:(id)a3 duration:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVPDateRange;
  v8 = [(TVPDateRange *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startDate, a3);
    v9->_durationInSeconds = a4;
    uint64_t v10 = [v7 dateByAddingTimeInterval:a4];
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v10;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(TVPDateRange *)self startDate];
    id v7 = [v5 startDate];
    if ([v6 isEqualToDate:v7])
    {
      v8 = [(TVPDateRange *)self endDate];
      v9 = [v5 endDate];
      char v10 = [v8 isEqualToDate:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(TVPDateRange *)self startDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(TVPDateRange *)self endDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(TVPDateRange *)self startDate];
  id v5 = [(TVPDateRange *)self endDate];
  [(TVPDateRange *)self durationInSeconds];
  id v7 = [v3 stringWithFormat:@"Start date: %@ End Date:%@ Duration: %f ", v4, v5, v6];

  return v7;
}

- (id)dateRangeByIntersectingDateRange:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPDateRange *)self startDate];
  uint64_t v6 = [v4 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [(TVPDateRange *)self durationInSeconds];
  double v10 = v8 + v9;
  [v6 timeIntervalSinceReferenceDate];
  double v12 = v11;
  [v4 durationInSeconds];
  double v14 = v13;

  double v15 = v12 + v14;
  if (v10 >= v12 + v14) {
    double v16 = v12 + v14;
  }
  else {
    double v16 = v10;
  }
  BOOL v17 = v12 <= v8 && v8 < v15;
  v18 = v5;
  if (v17 || (v8 <= v12 ? (v19 = v12 < v10) : (v19 = 0), double v8 = v12, v18 = v6, v19)) {
    v20 = [[TVPDateRange alloc] initWithStartDate:v18 duration:v16 - v8];
  }
  else {
    v20 = 0;
  }

  return v20;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPDateRange *)self startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  [(TVPDateRange *)self durationInSeconds];
  double v9 = v7 + v8;
  [v4 timeIntervalSinceReferenceDate];
  double v11 = v10;

  return v11 <= v9 && v11 >= v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end