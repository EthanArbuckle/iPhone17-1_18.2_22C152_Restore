@interface PAWorkInProgressAccessInterval
- (PAAccess)access;
- (PAWorkInProgressAccessInterval)init;
- (double)endTime;
- (double)startTime;
- (id)asSealedRecord;
- (void)setAccess:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation PAWorkInProgressAccessInterval

- (PAWorkInProgressAccessInterval)init
{
  v6.receiver = self;
  v6.super_class = (Class)PAWorkInProgressAccessInterval;
  v2 = [(PAWorkInProgressAccessInterval *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_startTime = xmmword_1A8FCA0E0;
    v4 = v2;
  }

  return v3;
}

- (id)asSealedRecord
{
  double v2 = fabs(self->_endTime);
  if (fabs(self->_startTime) == INFINITY)
  {
    if (v2 == INFINITY) {
      v3 = 0;
    }
    else {
      v3 = [[PAPartialAccessRecord alloc] initWithAccess:self->_access endTime:self->_endTime];
    }
  }
  else if (v2 == INFINITY)
  {
    v3 = [[PAOngoingAccessRecord alloc] initWithAccess:self->_access startTime:self->_startTime];
  }
  else
  {
    v3 = [[PACompleteAccessRecord alloc] initWithAccess:self->_access startTime:self->_startTime endTime:self->_endTime];
  }

  return v3;
}

- (PAAccess)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

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

- (void).cxx_destruct
{
}

@end