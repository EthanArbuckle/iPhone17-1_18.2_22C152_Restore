@interface LTEPoint
- (NSDate)endDate;
- (NSDate)startDate;
- (unsigned)threshold;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setThreshold:(unsigned int)a3;
@end

@implementation LTEPoint

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndDate:(id)a3
{
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unsigned int)a3
{
  self->_threshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end