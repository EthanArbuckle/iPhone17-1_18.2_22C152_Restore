@interface ASNFHardwareMonitor
- (ASNFHardwareMonitor)init;
- (void)hardwareStateDidChange;
- (void)waitForNotification;
@end

@implementation ASNFHardwareMonitor

- (ASNFHardwareMonitor)init
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = (void *)qword_1006AD198;
  qword_1006AD198 = (uint64_t)v3;

  if (qword_1006AD198) {
    v5 = self;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)waitForNotification
{
  v2 = qword_1006AD198;
  if (qword_1006AD198)
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v2, v3);
  }
}

- (void)hardwareStateDidChange
{
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1006AD198);
  v2 = (void *)qword_1006AD198;
  qword_1006AD198 = 0;
}

@end