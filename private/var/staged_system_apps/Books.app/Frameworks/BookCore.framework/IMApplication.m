@interface IMApplication
- (double)lastEventDate;
- (void)sendEvent:(id)a3;
- (void)setLastEventDate:(double)a3;
@end

@implementation IMApplication

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  -[IMApplication setLastEventDate:](self, "setLastEventDate:");
  v5.receiver = self;
  v5.super_class = (Class)IMApplication;
  [(IMApplication *)&v5 sendEvent:v4];
}

- (double)lastEventDate
{
  return self->_lastEventDate;
}

- (void)setLastEventDate:(double)a3
{
  self->_lastEventDate = a3;
}

@end