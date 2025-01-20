@interface NPTOPowerSourceInfo
- (BOOL)_hasExternalPowerSourceConnected;
- (NPTOPowerSourceInfoDelegate)delegate;
- (void)_handlePowerSourceNotification;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOPowerSourceInfo

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    id v6 = objc_storeWeak((id *)&self->_delegate, v4);

    if (v4)
    {
      objc_initWeak(&location, self);
      id v7 = objc_alloc((Class)NPTODarwinNotificationObserver);
      id v8 = &_dispatch_main_q;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100067BD0;
      v12[3] = &unk_1000931A8;
      objc_copyWeak(&v13, &location);
      v9 = (NPTODarwinNotificationObserver *)[v7 initWithNotificationName:@"com.apple.system.powersources.source" queue:&_dispatch_main_q block:v12];
      powerSourceNotificationObserver = self->_powerSourceNotificationObserver;
      self->_powerSourceNotificationObserver = v9;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v11 = self->_powerSourceNotificationObserver;
      self->_powerSourceNotificationObserver = 0;
    }
  }
}

- (BOOL)_hasExternalPowerSourceConnected
{
  v2 = (const void *)IOPSCopyPowerSourcesByType();
  if (!v2) {
    return 0;
  }
  v3 = v2;
  CFArrayRef v4 = IOPSCopyPowerSourcesList(v2);
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4) < 1)
    {
      unsigned __int8 v9 = 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
      id v7 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
      id v8 = [v7 objectForKeyedSubscript:@"Raw External Connected"];
      unsigned __int8 v9 = [v8 BOOLValue];
    }
    CFRelease(v5);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  CFRelease(v3);
  return v9;
}

- (void)_handlePowerSourceNotification
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[NPTOPowerSourceInfo _handlePowerSourceNotification]";
    __int16 v13 = 2080;
    v14 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Utilities/NPTOPowerSourceInfo.m";
    __int16 v15 = 1024;
    int v16 = 60;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v11, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(NPTOPowerSourceInfo *)self _hasExternalPowerSourceConnected];
    lastNotifiedExternalPowerSourceConnected = self->_lastNotifiedExternalPowerSourceConnected;
    if (!lastNotifiedExternalPowerSourceConnected
      || v6 != [(NSNumber *)lastNotifiedExternalPowerSourceConnected BOOLValue])
    {
      id v8 = +[NSNumber numberWithBool:v6];
      unsigned __int8 v9 = self->_lastNotifiedExternalPowerSourceConnected;
      self->_lastNotifiedExternalPowerSourceConnected = v8;

      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 powerSourceInfoHasExternalPowerSourceConnectedDidChange:self];
    }
  }
}

- (NPTOPowerSourceInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPTOPowerSourceInfoDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_powerSourceNotificationObserver, 0);

  objc_storeStrong((id *)&self->_lastNotifiedExternalPowerSourceConnected, 0);
}

@end