@interface PLCoreDuetEventInterval
- (BOOL)intersects:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (id)joinWithInterval:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PLCoreDuetEventInterval

- (id)description
{
  v3 = NSString;
  v4 = [(PLCoreDuetEventInterval *)self startDate];
  [v4 timeIntervalSince1970];
  uint64_t v6 = v5;
  v7 = [(PLCoreDuetEventInterval *)self endDate];
  [v7 timeIntervalSince1970];
  v9 = [v3 stringWithFormat:@"(%f, %f)", v6, v8];

  return v9;
}

- (BOOL)intersects:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLCoreDuetEventInterval *)self startDate];
  uint64_t v6 = [v4 endDate];
  [v5 timeIntervalSinceDate:v6];
  if (v7 >= 5.0)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v8 = [v4 startDate];
    v9 = [(PLCoreDuetEventInterval *)self endDate];
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 < 5.0;
  }
  return v11;
}

- (id)joinWithInterval:(id)a3
{
  id v4 = a3;
  if ([(PLCoreDuetEventInterval *)self intersects:v4])
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [(PLCoreDuetEventInterval *)self startDate];
    double v7 = [v4 startDate];
    uint64_t v8 = [v6 earlierDate:v7];
    [v5 setStartDate:v8];

    v9 = [(PLCoreDuetEventInterval *)self endDate];
    double v10 = [v4 endDate];
    BOOL v11 = [v9 laterDate:v10];
    [v5 setEndDate:v11];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end