@interface TVTimeRange
- (NSDate)endDate;
- (NSDate)startDate;
- (double)duration;
- (double)endTime;
- (double)startTime;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setStartDate:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation TVTimeRange

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
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