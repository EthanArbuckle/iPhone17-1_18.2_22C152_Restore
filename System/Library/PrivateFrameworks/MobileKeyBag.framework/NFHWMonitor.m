@interface NFHWMonitor
- (NFHWMonitor)init;
- (int64_t)waitForNotificationOrTimeout:(unsigned int)a3;
- (void)dealloc;
- (void)hardwareStateDidChange;
@end

@implementation NFHWMonitor

- (NFHWMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)NFHWMonitor;
  v2 = [(NFHWMonitor *)&v4 init];
  if (v2) {
    v2->sem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->sem);
  v3.receiver = self;
  v3.super_class = (Class)NFHWMonitor;
  [(NFHWMonitor *)&v3 dealloc];
}

- (void)hardwareStateDidChange
{
  debuglog("-[NFHWMonitor hardwareStateDidChange]", @"hardwareStateDidChange", v2, v3, v4, v5, v6, v7, v10);
  sem = self->sem;

  dispatch_semaphore_signal(sem);
}

- (int64_t)waitForNotificationOrTimeout:(unsigned int)a3
{
  sem = self->sem;
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);

  return dispatch_semaphore_wait(sem, v4);
}

@end