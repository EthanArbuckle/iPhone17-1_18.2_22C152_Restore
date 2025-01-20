@interface VMSharedProtectionObserver
+ (id)sharedProtectionObserver;
- (BOOL)checkUnlockSinceBootState;
- (BOOL)hasDeviceBeenUnlockedSinceBoot;
- (VMSharedProtectionObserver)init;
- (void)setHasDeviceBeenUnlockedSinceBoot:(BOOL)a3;
- (void)setupMobileKeyBag;
@end

@implementation VMSharedProtectionObserver

+ (id)sharedProtectionObserver
{
  if (qword_1000E0830 != -1) {
    dispatch_once(&qword_1000E0830, &stru_1000C1980);
  }
  v2 = (void *)qword_1000E0828;
  return v2;
}

- (VMSharedProtectionObserver)init
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating ProtectionObserver", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)VMSharedProtectionObserver;
  v4 = [(VMSharedProtectionObserver *)&v7 init];
  if (v4)
  {
    v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ProtectionObserver mode KEYBAG_AVAILABLE", buf, 2u);
    }

    v4->_hasDeviceBeenUnlockedSinceBoot = 0;
    [(VMSharedProtectionObserver *)v4 setupMobileKeyBag];
  }
  return v4;
}

- (void)setupMobileKeyBag
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setupMobileKeyBag", (uint8_t *)buf, 2u);
  }

  v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setupMobileKeyBag: register for notification", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  int out_token = 0;
  v5 = dispatch_get_global_queue(0, 0);
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_100018788;
  v9 = &unk_1000C19A8;
  objc_copyWeak(&v10, buf);
  int v11 = 0;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v5, &v6);

  [(VMSharedProtectionObserver *)self checkUnlockSinceBootState];
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (BOOL)checkUnlockSinceBootState
{
  int v3 = MKBDeviceUnlockedSinceBoot();
  v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unlocked since boot %d", (uint8_t *)v7, 8u);
  }

  if (v3 == 1)
  {
    v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "hasDeviceBeenUnlockedSinceBoot = YES", (uint8_t *)v7, 2u);
    }

    [(VMSharedProtectionObserver *)self setHasDeviceBeenUnlockedSinceBoot:1];
  }
  return [(VMSharedProtectionObserver *)self hasDeviceBeenUnlockedSinceBoot];
}

- (BOOL)hasDeviceBeenUnlockedSinceBoot
{
  return self->_hasDeviceBeenUnlockedSinceBoot;
}

- (void)setHasDeviceBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_hasDeviceBeenUnlockedSinceBoot = a3;
}

@end