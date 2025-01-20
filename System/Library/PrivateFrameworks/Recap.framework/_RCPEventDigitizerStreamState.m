@interface _RCPEventDigitizerStreamState
+ (id)streamStateWithEnvironment:(id)a3;
- (BOOL)countOfContactsTouchingDidChange;
- (RCPEventEnvironment)environment;
- (double)streamStartTimeInterval;
- (double)timeIntervalSinceStreamStart;
- (int64_t)countOfContactsChangeAmount;
- (int64_t)countOfContactsTouching;
- (int64_t)eventNumber;
- (void)ingestEvent:(id)a3;
- (void)setCountOfContactsTouching:(int64_t)a3;
- (void)setCountOfContactsTouchingDidChange:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setEventNumber:(int64_t)a3;
- (void)setStreamStartTimeInterval:(double)a3;
- (void)setTimeIntervalSinceStreamStart:(double)a3;
@end

@implementation _RCPEventDigitizerStreamState

+ (id)streamStateWithEnvironment:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setEnvironment:v3];

  [v4 setEventNumber:-1];
  return v4;
}

- (void)ingestEvent:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_eventNumber == -1)
  {
    -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self->_environment, "timeIntervalForMachAbsoluteTime:", [v4 deliveryTimestamp]);
    id v4 = v12;
    self->_streamStartTimeInterval = v5;
  }
  uint64_t v6 = [v4 hidEvent];
  if (IOHIDEventGetType() == 11)
  {
    int64_t v7 = _RCPEventHIDDigitizerEventCountOfTouchingContacts(v6);
    int64_t countOfContactsTouching = self->_countOfContactsTouching;
    int64_t v9 = v7 - countOfContactsTouching;
    BOOL v10 = v7 != countOfContactsTouching;
    self->_int64_t countOfContactsTouching = v7;
    self->_countOfContactsChangeAmount = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
  self->_countOfContactsTouchingDidChange = v10;
  -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self->_environment, "timeIntervalForMachAbsoluteTime:", [v12 deliveryTimestamp]);
  self->_timeIntervalSinceStreamStart = v11 - self->_streamStartTimeInterval;
  ++self->_eventNumber;
}

- (double)timeIntervalSinceStreamStart
{
  return self->_timeIntervalSinceStreamStart;
}

- (void)setTimeIntervalSinceStreamStart:(double)a3
{
  self->_timeIntervalSinceStreamStart = a3;
}

- (BOOL)countOfContactsTouchingDidChange
{
  return self->_countOfContactsTouchingDidChange;
}

- (void)setCountOfContactsTouchingDidChange:(BOOL)a3
{
  self->_countOfContactsTouchingDidChange = a3;
}

- (int64_t)countOfContactsTouching
{
  return self->_countOfContactsTouching;
}

- (void)setCountOfContactsTouching:(int64_t)a3
{
  self->_int64_t countOfContactsTouching = a3;
}

- (int64_t)countOfContactsChangeAmount
{
  return self->_countOfContactsChangeAmount;
}

- (int64_t)eventNumber
{
  return self->_eventNumber;
}

- (void)setEventNumber:(int64_t)a3
{
  self->_eventNumber = a3;
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (double)streamStartTimeInterval
{
  return self->_streamStartTimeInterval;
}

- (void)setStreamStartTimeInterval:(double)a3
{
  self->_streamStartTimeInterval = a3;
}

- (void).cxx_destruct
{
}

@end