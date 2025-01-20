@interface PTPSecurityModel
- (BOOL)canVendPhotoStorage;
- (BOOL)deviceWasUnlocked;
- (BOOL)hostIsTrusted;
- (BOOL)isPhotoStorageAvailable;
- (BOOL)photoLibraryIsAvailable;
- (BOOL)shouldRemovePlaceholderStorage;
- (BOOL)shouldVendPhotoStorage;
- (BOOL)updateProtectionStatus:(int64_t)a3;
- (PTPSecurityModel)init;
- (id)delegate;
- (id)prettyAccess:(int64_t)a3 value:(BOOL)a4;
- (id)prettyHostID;
- (void)dealloc;
- (void)handleInternalSettingsChanged;
- (void)handleProtectionStatusChanged:(int64_t)a3;
- (void)handleThrottleChanged;
- (void)registerForSecurityNotifications;
- (void)setDelegate:(id)a3;
- (void)setHasVended:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)start;
- (void)stop;
- (void)unregisterForSecurityNotifications;
@end

@implementation PTPSecurityModel

- (PTPSecurityModel)init
{
  v5.receiver = self;
  v5.super_class = (Class)PTPSecurityModel;
  v2 = [(PTPSecurityModel *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasVended = 0;
    *(_DWORD *)&v2->_deviceWasUnlocked = 0;
    v2->_observersInstalled = 0;
    *(void *)&v2->_prefsChangedToken = 0;
    *(void *)&v2->_photoStorageToken = 0;
    *(void *)&v2->_lockStatusToken = 0;
    objc_storeWeak(&v2->_delegate, 0);
    v3->_sessionID = -1592735106;
  }
  return v3;
}

- (void)dealloc
{
  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v4 = [&stru_100048E60 substringWithRange:0, 18];
    v3 = [v4 stringByAppendingString:@".."];
  }
  objc_super v5 = +[NSString stringWithFormat:@"PTPSecurityModel Deallocated SessionID - 0x%x", self->_sessionID];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v11 = [(__CFString *)v7 UTF8String];
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(PTPSecurityModel *)self stop];
  [(PTPSecurityModel *)self setDelegate:0];
  v9.receiver = self;
  v9.super_class = (Class)PTPSecurityModel;
  [(PTPSecurityModel *)&v9 dealloc];
}

- (void)start
{
  if (!self->_observersInstalled)
  {
    __ICOSLogCreate();
    v3 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v4 = [&stru_100048E60 substringWithRange:0, 18];
      v3 = [v4 stringByAppendingString:@".."];
    }
    objc_super v5 = +[NSString stringWithFormat:@"Install Device Security Observers"];
    v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v3;
      v8 = v6;
      int v9 = 136446466;
      id v10 = [(__CFString *)v7 UTF8String];
      __int16 v11 = 2114;
      __int16 v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [(PTPSecurityModel *)self registerForSecurityNotifications];
    self->_observersInstalled = 1;
    [(PTPSecurityModel *)self handleProtectionStatusChanged:0];
    [(PTPSecurityModel *)self handleProtectionStatusChanged:1];
    [(PTPSecurityModel *)self handleProtectionStatusChanged:4];
    [(PTPSecurityModel *)self handleProtectionStatusChanged:2];
  }
}

- (void)stop
{
  if (self->_observersInstalled)
  {
    __ICOSLogCreate();
    v3 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v4 = [&stru_100048E60 substringWithRange:0, 18];
      v3 = [v4 stringByAppendingString:@".."];
    }
    objc_super v5 = +[NSString stringWithFormat:@"Removing Device Security Observers \n"];
    v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v3;
      v8 = v6;
      int v9 = 136446466;
      id v10 = [(__CFString *)v7 UTF8String];
      __int16 v11 = 2114;
      __int16 v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [(PTPSecurityModel *)self unregisterForSecurityNotifications];
    self->_observersInstalled = 0;
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = objc_storeWeak(&self->_delegate, a3);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained(p_delegate);
    self->_sessionID = [WeakRetained currentInternalSessionID];
  }
  else
  {
    self->_sessionID = 0;
  }
}

- (void)setSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_sessionID = a3;
  __ICOSLogCreate();
  v4 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v5 = [[&stru_100048E60 substringWithRange:0, 18];
    v4 = [v5 stringByAppendingString:@".."];
  }
  v6 = +[NSString stringWithFormat:@"PTPSecurityModel Allocated SessionID: 0x%x", v3];
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v4;
    int v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v11 = [(__CFString *)v8 UTF8String];
    __int16 v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (void)setHasVended:(BOOL)a3
{
  self->_hasVended = a3;
  __ICOSLogCreate();
  v4 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v5 = [[&stru_100048E60 substringWithRange:0, 18];
    v4 = [v5 stringByAppendingString:@".."];
  }
  if (self->_hasVended) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  v7 = +[NSString stringWithFormat:@"PTPSecurityModel Has Vended: %s", v6];
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v4;
    id v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v12 = [(__CFString *)v9 UTF8String];
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (BOOL)updateProtectionStatus:(int64_t)a3
{
  int deviceWasUnlocked = self->_deviceWasUnlocked;
  int photoLibraryIsAvailable = self->_photoLibraryIsAvailable;
  int hostIsTrusted = self->_hostIsTrusted;
  int photoStorageIsAvailable = self->_photoStorageIsAvailable;
  int v9 = sub_10000B5F8();
  id v10 = v9;
  switch(a3)
  {
    case 0:
      unsigned int v11 = [v9 libraryIsAvailable];
      self->_int photoLibraryIsAvailable = v11;
      BOOL v12 = photoLibraryIsAvailable == v11;
      goto LABEL_18;
    case 1:
      unsigned int v19 = [(PTPSecurityModel *)self isPhotoStorageAvailable];
      self->_int photoStorageIsAvailable = v19;
      BOOL v12 = photoStorageIsAvailable == v19;
      goto LABEL_18;
    case 2:
      int is_host_trusted = lockdown_is_host_trusted();
      self->_int hostIsTrusted = is_host_trusted;
      BOOL v12 = hostIsTrusted == is_host_trusted;
      goto LABEL_18;
    case 3:
      self->_int hostIsTrusted = 1;
      BOOL v18 = hostIsTrusted == 0;
      break;
    case 4:
      int v13 = MKBGetDeviceLockState();
      if (v13) {
        BOOL v14 = v13 == 3;
      }
      else {
        BOOL v14 = 1;
      }
      int v15 = v14;
      int v16 = self->_deviceWasUnlocked;
      if (!self->_deviceWasUnlocked && v15 != 0)
      {
        int v16 = 1;
        self->_int deviceWasUnlocked = 1;
      }
      BOOL v12 = deviceWasUnlocked == v16;
LABEL_18:
      BOOL v18 = !v12;
      break;
    case 5:
      BOOL v18 = 1;
      break;
    default:
      BOOL v18 = 0;
      break;
  }

  return v18;
}

- (BOOL)photoLibraryIsAvailable
{
  return self->_photoLibraryIsAvailable;
}

- (id)prettyHostID
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (!WeakRetained) {
    return 0;
  }
  id v4 = objc_loadWeakRetained(p_delegate);
  unsigned __int8 v5 = [v4 hostIsWindows];

  if (v5) {
    return @"Windows";
  }
  id v7 = objc_loadWeakRetained(p_delegate);
  unsigned __int8 v8 = [v7 hostIsMacOS];

  if (v8) {
    return @"macOS";
  }
  id v9 = objc_loadWeakRetained(p_delegate);
  unsigned int v10 = [v9 hostIsLegacyOS];

  if (v10) {
    return @"OSX";
  }
  else {
    return @"PTP";
  }
}

- (id)prettyAccess:(int64_t)a3 value:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      id v4 = sub_100019354(a4);
      +[NSString stringWithFormat:@"(%@) Library", v4];
      goto LABEL_8;
    case 1:
      id v4 = sub_100019354(a4);
      +[NSString stringWithFormat:@"(%@) Storage", v4];
      goto LABEL_8;
    case 2:
    case 3:
      id v4 = sub_100019354(a4);
      +[NSString stringWithFormat:@"(%@) Trusted", v4];
      goto LABEL_8;
    case 4:
      id v4 = sub_100019354(a4);
      +[NSString stringWithFormat:@"(%@) Unlocked", v4];
      goto LABEL_8;
    case 5:
      id v4 = sub_100019354(a4);
      +[NSString stringWithFormat:@"(%@) Primed ", v4];
LABEL_8:
      unsigned __int8 v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      unsigned __int8 v5 = @"Undefined";
      break;
  }

  return v5;
}

- (void)handleProtectionStatusChanged:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    unsigned int v7 = [(PTPSecurityModel *)self updateProtectionStatus:a3];

    if (v7)
    {
      if ([(PTPSecurityModel *)self shouldRemovePlaceholderStorage])
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001A110;
        block[3] = &unk_100048750;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
      if ([(PTPSecurityModel *)self shouldVendPhotoStorage])
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10001A27C;
        v8[3] = &unk_100048750;
        v8[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
      }
    }
  }
}

- (void)handleInternalSettingsChanged
{
  __ICOSLogCreate();
  uint64_t v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v4 = [[&stru_100048E60 substringWithRange:0, 18];
    uint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  unsigned __int8 v5 = +[NSString stringWithFormat:@"ApplePTP Internal Settings Changed"];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = v3;
    unsigned __int8 v8 = v6;
    int v12 = 136446466;
    id v13 = [(__CFString *)v7 UTF8String];
    __int16 v14 = 2114;
    int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v12, 0x16u);
  }
  __ICReadPrefs();
  [(PTPSecurityModel *)self setHasVended:0];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(p_delegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained(p_delegate);
    [v11 handleInternalSettingsChanged];
  }
}

- (void)handleThrottleChanged
{
  double v2 = (double)sub_100002670();
  double v3 = v2 * 0.0009765625;
  int v4 = sub_100002670();
  __ICOSLogCreate();
  id v5 = [&stru_100048E60 length];
  if (v4)
  {
    double v6 = 512.0 / v2;
    if ((unint64_t)v5 < 0x15)
    {
      unsigned __int8 v8 = &stru_100048E60;
    }
    else
    {
      unsigned int v7 = [&stru_100048E60 substringWithRange:0, 18];
      unsigned __int8 v8 = [v7 stringByAppendingString:@".."];
    }
    unsigned int v10 = +[NSString stringWithFormat:@"Throttle Enabled [Size: %.2fKB Rate: %.2fMB/s Delay: %.2fs]\n", 0x4080000000000000, *(void *)&v3, *(void *)&v6];
    id v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      unsigned __int8 v8 = v8;
      int v12 = v11;
      *(_DWORD *)buf = 136446466;
      id v14 = [(__CFString *)v8 UTF8String];
      __int16 v15 = 2114;
      int v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if ((unint64_t)v5 < 0x15)
    {
      unsigned __int8 v8 = &stru_100048E60;
    }
    else
    {
      id v9 = [&stru_100048E60 substringWithRange:0, 18];
      unsigned __int8 v8 = [v9 stringByAppendingString:@".."];
    }
    unsigned int v10 = +[NSString stringWithFormat:@"Throttle Disabled [Rate: %.2fMB/s]\n", *(void *)&v3];
    id v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
  }
}

- (BOOL)isPhotoStorageAvailable
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (!WeakRetained) {
    return 0;
  }
  int v4 = WeakRetained;
  id v5 = objc_loadWeakRetained(p_delegate);
  double v6 = [v5 photoStorageAvailable];

  if (!v6) {
    return 0;
  }
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)shouldRemovePlaceholderStorage
{
  return self->_deviceWasUnlocked && self->_hostIsTrusted;
}

- (BOOL)shouldVendPhotoStorage
{
  BOOL v3 = [(PTPSecurityModel *)self canVendPhotoStorage];
  if (v3) {
    LOBYTE(v3) = !self->_hasVended;
  }
  return v3;
}

- (BOOL)canVendPhotoStorage
{
  BOOL v3 = self->_photoLibraryIsAvailable
    && self->_hostIsTrusted
    && self->_photoStorageIsAvailable
    && self->_deviceWasUnlocked;
  int v4 = [(PTPSecurityModel *)self prettyAccess:4 value:self->_deviceWasUnlocked];
  id v5 = [(PTPSecurityModel *)self prettyAccess:0 value:self->_photoLibraryIsAvailable];
  double v6 = [(PTPSecurityModel *)self prettyAccess:1 value:self->_photoStorageIsAvailable];
  unsigned __int8 v7 = [(PTPSecurityModel *)self prettyAccess:2 value:self->_hostIsTrusted];
  __ICOSLogCreate();
  unsigned __int8 v8 = @"<Photos>";
  if ((unint64_t)[(__CFString *)v8 length] >= 0x15)
  {
    id v9 = -[__CFString substringWithRange:](v8, "substringWithRange:", 0, 18);
    uint64_t v10 = [v9 stringByAppendingString:@".."];

    unsigned __int8 v8 = (__CFString *)v10;
  }
  CFStringRef v11 = @"❌";
  if (v3) {
    CFStringRef v11 = @"✅";
  }
  int v12 = +[NSString stringWithFormat:@"%@ [%20@ %20@ %20@ %20@]\n", v11, v4, v5, v6, v7];
  id v13 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v8;
    __int16 v15 = v13;
    *(_DWORD *)buf = 136446466;
    id v18 = [(__CFString *)v14 UTF8String];
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return v3;
}

- (void)registerForSecurityNotifications
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10001ADF8;
  v11[4] = sub_10001AE08;
  double v2 = self;
  int v12 = v2;
  BOOL v3 = (const char *)[kLockdownNotificationTrustedPTPAttached cStringUsingEncoding:4];
  id v4 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001AE10;
  handler[3] = &unk_100048850;
  handler[4] = v11;
  notify_register_dispatch(v3, &v2->_trustedHostToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AE6C;
  v9[3] = &unk_100048850;
  v9[4] = v11;
  notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &v2->_lockStatusToken, (dispatch_queue_t)&_dispatch_main_q, v9);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001AEC8;
  v8[3] = &unk_100048850;
  v8[4] = v11;
  notify_register_dispatch("com.apple.ptpd.photoStorageChanged", &v2->_photoStorageToken, (dispatch_queue_t)&_dispatch_main_q, v8);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AF24;
  v7[3] = &unk_100048850;
  v7[4] = v11;
  notify_register_dispatch("com.apple.ptpd.photoLibraryChanged", &v2->_photoLibraryToken, (dispatch_queue_t)&_dispatch_main_q, v7);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AF80;
  v6[3] = &unk_100048850;
  v6[4] = v11;
  notify_register_dispatch("com.apple.ImageCaptureFramework.prefsChanged", &v2->_prefsChangedToken, (dispatch_queue_t)&_dispatch_main_q, v6);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AFD8;
  v5[3] = &unk_100048850;
  v5[4] = v11;
  notify_register_dispatch("com.apple.ImageCaptureFramework.throttleRateChanged", &v2->_throttleChangedToken, (dispatch_queue_t)&_dispatch_main_q, v5);

  _Block_object_dispose(v11, 8);
}

- (void)unregisterForSecurityNotifications
{
  notify_cancel(self->_trustedHostToken);
  notify_cancel(self->_lockStatusToken);
  notify_cancel(self->_prefsChangedToken);
  notify_cancel(self->_photoStorageToken);
  notify_cancel(self->_photoLibraryToken);
  int throttleChangedToken = self->_throttleChangedToken;

  notify_cancel(throttleChangedToken);
}

- (BOOL)hostIsTrusted
{
  return self->_hostIsTrusted;
}

- (BOOL)deviceWasUnlocked
{
  return self->_deviceWasUnlocked;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end