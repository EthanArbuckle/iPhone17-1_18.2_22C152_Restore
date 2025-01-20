@interface TimeoutEntry
- (NSDate)lastAttemptDate;
- (TimeoutEntry)init;
- (unint64_t)timeoutCounter;
- (void)setLastAttemptDate:(id)a3;
- (void)setTimeoutCounter:(unint64_t)a3;
@end

@implementation TimeoutEntry

- (void).cxx_destruct
{
}

- (void)setTimeoutCounter:(unint64_t)a3
{
  self->_timeoutCounter = a3;
}

- (unint64_t)timeoutCounter
{
  return self->_timeoutCounter;
}

- (void)setLastAttemptDate:(id)a3
{
}

- (NSDate)lastAttemptDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (TimeoutEntry)init
{
  v5.receiver = self;
  v5.super_class = (Class)TimeoutEntry;
  v2 = [(TimeoutEntry *)&v5 init];
  if (v2)
  {
    v3 = +[NSDate date];
    [(TimeoutEntry *)v2 setLastAttemptDate:v3];

    [(TimeoutEntry *)v2 setTimeoutCounter:1];
  }
  return v2;
}

@end