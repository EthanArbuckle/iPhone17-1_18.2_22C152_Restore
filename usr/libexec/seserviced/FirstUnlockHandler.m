@interface FirstUnlockHandler
- (FirstUnlockHandler)init;
- (void)onDarwinNotification:(uint64_t)a1;
@end

@implementation FirstUnlockHandler

- (FirstUnlockHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)FirstUnlockHandler;
  v2 = [(FirstUnlockHandler *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_fired = 0;
    if (+[SESDarwinNotificationMonitor registerDelegate:v2 forEvent:@"com.apple.mobile.keybagd.first_unlock"])
    {
      -[FirstUnlockHandler onDarwinNotification:]_0((uint64_t)v3);
    }
    v4 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003B4AC;
    block[3] = &unk_10040B880;
    v7 = v3;
    dispatch_async(v4, block);
  }
  return v3;
}

- (void)onDarwinNotification:(uint64_t)a1
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (!*(unsigned char *)(a1 + 12))
    {
      *(unsigned char *)(a1 + 12) = 1;
      sub_10003B4F4();
    }
    os_unfair_lock_unlock(v2);
  }
}

@end