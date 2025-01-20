@interface NFPreferenceObserver
- (id)callback;
- (void)dealloc;
- (void)handlePreferencesOrProfileChanged;
- (void)setCallback:(id)a3;
- (void)start:(id)a3;
- (void)stop;
@end

@implementation NFPreferenceObserver

- (void)dealloc
{
  [(NFPreferenceObserver *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)NFPreferenceObserver;
  [(NFPreferenceObserver *)&v3 dealloc];
}

- (void)start:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NFPreferenceObserver *)v4 setCallback:v7];
  objc_sync_exit(v4);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)NFPreferencesChangedHandler, @"com.apple.stockholm.preferenceschanged", 0, (CFNotificationSuspensionBehavior)1026);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)NFPreferencesChangedHandler, @"com.apple.ManagedConfiguration.profileListChanged", 0, (CFNotificationSuspensionBehavior)1026);
}

- (void)stop
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.stockholm.preferenceschanged", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.ManagedConfiguration.profileListChanged", 0);
  obj = self;
  objc_sync_enter(obj);
  [(NFPreferenceObserver *)obj setCallback:0];
  objc_sync_exit(obj);
}

- (void)handlePreferencesOrProfileChanged
{
  obj = self;
  objc_sync_enter(obj);
  callback = (void (**)(void))obj->_callback;
  if (callback) {
    callback[2]();
  }
  objc_sync_exit(obj);
}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end