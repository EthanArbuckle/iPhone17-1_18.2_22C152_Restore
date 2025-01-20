@interface MNTraceAnnotatedUserEnvironmentRow
- (double)endTimestamp;
- (double)startTimestamp;
- (int64_t)environmentType;
- (void)setEndTimestamp:(double)a3;
- (void)setEnvironmentType:(int64_t)a3;
- (void)setStartTimestamp:(double)a3;
@end

@implementation MNTraceAnnotatedUserEnvironmentRow

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(double)a3
{
  self->_endTimestamp = a3;
}

- (int64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(int64_t)a3
{
  self->_environmentType = a3;
}

@end