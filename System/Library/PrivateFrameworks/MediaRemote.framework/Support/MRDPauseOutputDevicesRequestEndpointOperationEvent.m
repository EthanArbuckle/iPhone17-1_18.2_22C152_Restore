@interface MRDPauseOutputDevicesRequestEndpointOperationEvent
- (NSDate)endDate;
- (NSDate)startDate;
- (NSError)error;
- (NSString)name;
- (double)duration;
- (void)setEndDate:(id)a3;
- (void)setError:(id)a3;
- (void)setName:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MRDPauseOutputDevicesRequestEndpointOperationEvent

- (double)duration
{
  [(NSDate *)self->_startDate timeIntervalSinceDate:self->_endDate];
  return -v2;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
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

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end