@interface DMDDeviceStateObserver
- (BOOL)hasKeychainUnlockedSinceBoot;
- (BOOL)isKeychainUnlocked;
- (BOOL)isNetworkTethered;
- (DMDDeviceStateObserver)init;
- (NSString)description;
- (void)keybagLockStateDidChange;
- (void)networkDidChange;
- (void)setHasKeychainUnlockedSinceBoot:(BOOL)a3;
- (void)setIsKeychainUnlocked:(BOOL)a3;
- (void)setIsNetworkTethered:(BOOL)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
@end

@implementation DMDDeviceStateObserver

- (DMDDeviceStateObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMDDeviceStateObserver;
  result = [(DMDDeviceStateObserver *)&v3 init];
  if (result) {
    result->_isKeychainUnlocked = 1;
  }
  return result;
}

- (NSString)description
{
  v5[0] = @"hasKeychainUnlockedSinceBoot";
  v5[1] = @"isKeychainUnlocked";
  v5[2] = @"isNetworkTethered";
  v2 = +[NSArray arrayWithObjects:v5 count:3];
  objc_super v3 = DMFObjectDescriptionWithProperties();

  return (NSString *)v3;
}

- (void)startObservingChanges
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)kMobileKeyBagLockStatusNotifyToken;
  id v4 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003D0F8;
  handler[3] = &unk_1000CAE68;
  objc_copyWeak(&v15, &location);
  LODWORD(v3) = notify_register_dispatch(v3, &self->mKeychainLockStateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  if (v3) {
    self->mKeychainLockStateNotificationToken = -1;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003D178;
  v12[3] = &unk_1000CAE68;
  objc_copyWeak(&v13, &location);
  uint32_t v5 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->mKeychainFirstUnlockNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v12);

  if (v5) {
    self->mKeychainFirstUnlockNotificationToken = -1;
  }
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_10003D1F4;
  v10 = &unk_1000CAE68;
  objc_copyWeak(&v11, &location);
  uint32_t v6 = notify_register_dispatch("com.apple.system.config.network_change", &self->mNetworkChangeNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v7);

  if (v6) {
    self->mNetworkChangeNotificationToken = -1;
  }
  [(DMDDeviceStateObserver *)self keybagLockStateDidChange];
  [(DMDDeviceStateObserver *)self networkDidChange];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)stopObservingChanges
{
  int mKeychainLockStateNotificationToken = self->mKeychainLockStateNotificationToken;
  if (mKeychainLockStateNotificationToken != -1)
  {
    notify_cancel(mKeychainLockStateNotificationToken);
    self->int mKeychainLockStateNotificationToken = -1;
  }
  int mNetworkChangeNotificationToken = self->mNetworkChangeNotificationToken;
  if (mNetworkChangeNotificationToken != -1)
  {
    notify_cancel(mNetworkChangeNotificationToken);
    self->int mNetworkChangeNotificationToken = -1;
  }
}

- (void)keybagLockStateDidChange
{
  int v3 = MKBGetDeviceLockState();
  BOOL v5 = v3 == 3 || v3 == 0;
  BOOL v6 = MKBDeviceUnlockedSinceBoot() == 1;
  [(DMDDeviceStateObserver *)self setIsKeychainUnlocked:v5];

  [(DMDDeviceStateObserver *)self setHasKeychainUnlockedSinceBoot:v6];
}

- (void)networkDidChange
{
  BOOL v3 = +[DMDNetworkTetherUtilities isNetworkTethered];

  [(DMDDeviceStateObserver *)self setIsNetworkTethered:v3];
}

- (BOOL)hasKeychainUnlockedSinceBoot
{
  return self->_hasKeychainUnlockedSinceBoot;
}

- (void)setHasKeychainUnlockedSinceBoot:(BOOL)a3
{
  self->_hasKeychainUnlockedSinceBoot = a3;
}

- (BOOL)isKeychainUnlocked
{
  return self->_isKeychainUnlocked;
}

- (void)setIsKeychainUnlocked:(BOOL)a3
{
  self->_isKeychainUnlocked = a3;
}

- (BOOL)isNetworkTethered
{
  return self->_isNetworkTethered;
}

- (void)setIsNetworkTethered:(BOOL)a3
{
  self->_isNetworkTethered = a3;
}

@end