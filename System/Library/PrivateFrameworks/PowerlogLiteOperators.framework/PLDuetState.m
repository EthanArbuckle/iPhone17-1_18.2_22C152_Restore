@interface PLDuetState
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)info;
- (NSMutableArray)overlappingStates;
- (PLDuetState)init;
- (double)cpuSeconds;
- (double)duration;
- (id)description;
- (void)setCpuSeconds:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setInfo:(id)a3;
- (void)setOverlappingStates:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PLDuetState

- (PLDuetState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLDuetState;
  v2 = [(PLDuetState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    overlappingStates = v2->_overlappingStates;
    v2->_overlappingStates = (NSMutableArray *)v3;
  }
  return v2;
}

- (double)duration
{
  uint64_t v3 = [(PLDuetState *)self startDate];
  if (v3)
  {
    v4 = [(PLDuetState *)self endDate];
    if (v4)
    {
      v5 = [(PLDuetState *)self endDate];
      objc_super v6 = [(PLDuetState *)self startDate];
      [v5 timeIntervalSinceDate:v6];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.0;
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(PLDuetState *)self startDate];
  v5 = [(PLDuetState *)self endDate];
  [(PLDuetState *)self cpuSeconds];
  uint64_t v7 = v6;
  double v8 = [(PLDuetState *)self info];
  v9 = [v3 stringWithFormat:@"startDate=%@, endDate=%@, cpuSeconds=%f, info=%@", v4, v5, v7, v8];

  return v9;
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

- (double)cpuSeconds
{
  return self->_cpuSeconds;
}

- (void)setCpuSeconds:(double)a3
{
  self->_cpuSeconds = a3;
}

- (NSMutableArray)overlappingStates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOverlappingStates:(id)a3
{
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_overlappingStates, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end