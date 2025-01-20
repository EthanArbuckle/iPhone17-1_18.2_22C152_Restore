@interface STYWorkflowEventTracker
- (WRWorkflowEventTracker)wrTracker;
- (int)perDayEventCount;
- (int)perPeriodEventCount;
- (void)setPerDayEventCount:(int)a3;
- (void)setPerPeriodEventCount:(int)a3;
- (void)setWrTracker:(id)a3;
@end

@implementation STYWorkflowEventTracker

- (WRWorkflowEventTracker)wrTracker
{
  return (WRWorkflowEventTracker *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWrTracker:(id)a3
{
}

- (int)perDayEventCount
{
  return self->_perDayEventCount;
}

- (void)setPerDayEventCount:(int)a3
{
  self->_perDayEventCount = a3;
}

- (int)perPeriodEventCount
{
  return self->_perPeriodEventCount;
}

- (void)setPerPeriodEventCount:(int)a3
{
  self->_perPeriodEventCount = a3;
}

- (void).cxx_destruct
{
}

@end