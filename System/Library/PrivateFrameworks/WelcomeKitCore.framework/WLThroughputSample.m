@interface WLThroughputSample
- (NSDate)endDate;
- (NSDate)startDate;
- (double)duration;
- (unint64_t)bytes;
- (unint64_t)expectedBytes;
- (void)setBytes:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setExpectedBytes:(unint64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation WLThroughputSample

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

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_bytes = a3;
}

- (unint64_t)expectedBytes
{
  return self->_expectedBytes;
}

- (void)setExpectedBytes:(unint64_t)a3
{
  self->_expectedBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end