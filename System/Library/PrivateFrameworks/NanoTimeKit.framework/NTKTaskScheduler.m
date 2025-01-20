@interface NTKTaskScheduler
- (double)waitingPeriod;
- (id)scheduleTask:(id)a3 identifier:(id)a4;
- (void)setWaitingPeriod:(double)a3;
@end

@implementation NTKTaskScheduler

- (id)scheduleTask:(id)a3 identifier:(id)a4
{
  return 0;
}

- (double)waitingPeriod
{
  return self->_waitingPeriod;
}

- (void)setWaitingPeriod:(double)a3
{
  self->_waitingPeriod = a3;
}

@end