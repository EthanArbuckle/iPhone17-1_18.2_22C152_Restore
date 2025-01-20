@interface MAProgressNotification
- (BOOL)isStalled;
- (NSString)taskDescription;
- (double)expectedTimeRemaining;
- (int64_t)totalExpected;
- (int64_t)totalWritten;
- (void)setExpectedTimeRemaining:(double)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setTaskDescription:(id)a3;
- (void)setTotalExpected:(int64_t)a3;
- (void)setTotalWritten:(int64_t)a3;
@end

@implementation MAProgressNotification

- (int64_t)totalExpected
{
  return self->_totalExpected;
}

- (void)setTotalExpected:(int64_t)a3
{
  self->_totalExpected = a3;
}

- (int64_t)totalWritten
{
  return self->_totalWritten;
}

- (void)setTotalWritten:(int64_t)a3
{
  self->_totalWritten = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (double)expectedTimeRemaining
{
  return self->_expectedTimeRemaining;
}

- (void)setExpectedTimeRemaining:(double)a3
{
  self->_expectedTimeRemaining = a3;
}

- (NSString)taskDescription
{
  return self->_taskDescription;
}

- (void)setTaskDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end