@interface SMWatchdogRecord
- (NSDate)startDate;
- (SMSessionManagerState)state;
- (SMWatchdogRecord)initWithState:(id)a3 timeout:(double)a4;
- (double)timeout;
- (id)description;
- (void)setStartDate:(id)a3;
- (void)setState:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation SMWatchdogRecord

- (SMWatchdogRecord)initWithState:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMWatchdogRecord;
  v8 = [(SMWatchdogRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_state, a3);
    v9->_timeout = a4;
  }

  return v9;
}

- (id)description
{
  v2 = NSString;
  state = self->_state;
  double timeout = self->_timeout;
  v5 = [(NSDate *)self->_startDate stringFromDate];
  v6 = [v2 stringWithFormat:@"state, %@, timeout, %.2f, startDate, %@", state, *(void *)&timeout, v5];

  return v6;
}

- (SMSessionManagerState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end