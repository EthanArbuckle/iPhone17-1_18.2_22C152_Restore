@interface COSProfileInstallDeviceSwitchTracker
+ (id)selectDevice:(id)a3 currentDevice:(id)a4 completionBlock:(id)a5;
- (BPSTinkerConnectionTracker)connectionTracker;
- (NRDevice)currentActiveDevice;
- (NRDevice)switchToDevice;
- (OS_dispatch_source)tinkerConnectionTimeout;
- (UIActivityIndicatorView)activityIndicator;
- (id)block;
- (void)_cancelConnectionTimeout;
- (void)_connectionFinishedWithSuccess:(BOOL)a3;
- (void)connectToDevice;
- (void)didBTConnectDevice:(id)a3;
- (void)didIDSConnectDevice:(id)a3;
- (void)didUpdateAsDisconnectedDevice:(id)a3;
- (void)rollback;
- (void)setActivityIndicator:(id)a3;
- (void)setBlock:(id)a3;
- (void)setConnectionTracker:(id)a3;
- (void)setCurrentActiveDevice:(id)a3;
- (void)setSwitchToDevice:(id)a3;
- (void)setTinkerConnectionTimeout:(id)a3;
@end

@implementation COSProfileInstallDeviceSwitchTracker

+ (id)selectDevice:(id)a3 currentDevice:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446722;
    v14 = "+[COSProfileInstallDeviceSwitchTracker selectDevice:currentDevice:completionBlock:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: selected device: %@; current device: %@",
      (uint8_t *)&v13,
      0x20u);
  }

  v11 = objc_alloc_init(COSProfileInstallDeviceSwitchTracker);
  [(COSProfileInstallDeviceSwitchTracker *)v11 setSwitchToDevice:v7];
  [(COSProfileInstallDeviceSwitchTracker *)v11 setCurrentActiveDevice:v8];
  [(COSProfileInstallDeviceSwitchTracker *)v11 setBlock:v9];

  return v11;
}

- (void)rollback
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    switchToDevice = self->_switchToDevice;
    currentActiveDevice = self->_currentActiveDevice;
    int v8 = 136315650;
    id v9 = "-[COSProfileInstallDeviceSwitchTracker rollback]";
    __int16 v10 = 2112;
    v11 = switchToDevice;
    __int16 v12 = 2112;
    int v13 = currentActiveDevice;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Canceling switch to %@. Switching back to %@", (uint8_t *)&v8, 0x20u);
  }

  [(COSProfileInstallDeviceSwitchTracker *)self _cancelConnectionTimeout];
  connectionTracker = self->_connectionTracker;
  self->_connectionTracker = 0;

  id v7 = +[UIApplication sharedApplication];
  [v7 setActiveWatch:self->_currentActiveDevice startedBlock:0 completionBlock:0];
}

- (void)connectToDevice
{
  objc_initWeak(&location, self);
  v3 = [(NRDevice *)self->_switchToDevice valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v4 = [v3 BOOLValue];
  connectionTracker = self->_connectionTracker;
  if (v4)
  {
    if (!connectionTracker)
    {
      v6 = pbb_bridge_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating connection tracker.", buf, 2u);
      }

      id v7 = (BPSTinkerConnectionTracker *)[objc_alloc((Class)BPSTinkerConnectionTracker) initWithDevice:self->_switchToDevice];
      int v8 = self->_connectionTracker;
      self->_connectionTracker = v7;

      [(BPSTinkerConnectionTracker *)self->_connectionTracker setDelegate:self];
    }
    if (!self->_tinkerConnectionTimeout)
    {
      id v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      dispatch_time_t v10 = dispatch_time(0, 0xDF8476000);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100088680;
      handler[3] = &unk_100245298;
      handler[4] = self;
      objc_copyWeak(&v21, &location);
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(v9);
      tinkerConnectionTimeout = self->_tinkerConnectionTimeout;
      self->_tinkerConnectionTimeout = (OS_dispatch_source *)v9;
      __int16 v12 = v9;

      objc_destroyWeak(&v21);
    }
    [(BPSTinkerConnectionTracker *)self->_connectionTracker setSelectedDevice:self->_switchToDevice];
  }
  else
  {
    self->_connectionTracker = 0;
  }
  int v13 = pbb_bridge_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    switchToDevice = self->_switchToDevice;
    *(_DWORD *)buf = 136446466;
    v24 = "-[COSProfileInstallDeviceSwitchTracker connectToDevice]";
    __int16 v25 = 2112;
    v26 = switchToDevice;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Connecting to %@", buf, 0x16u);
  }

  __int16 v15 = +[UIApplication sharedApplication];
  id v16 = self->_switchToDevice;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000887E8;
  v19[3] = &unk_100244CE0;
  v19[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000888A8;
  v17[3] = &unk_100245550;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  [v15 setActiveWatch:v16 startedBlock:v19 completionBlock:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_cancelConnectionTimeout
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088A54;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_connectionFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 136446466;
    dispatch_time_t v10 = "-[COSProfileInstallDeviceSwitchTracker _connectionFinishedWithSuccess:]";
    __int16 v11 = 2112;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: (%@)", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088C58;
  v7[3] = &unk_1002448E8;
  v7[4] = self;
  BOOL v8 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)didIDSConnectDevice:(id)a3
{
  id v4 = a3;
  connectionTracker = self->_connectionTracker;
  self->_connectionTracker = 0;

  CFStringRef v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 pairingID];
    int v8 = 136315394;
    id v9 = "-[COSProfileInstallDeviceSwitchTracker didIDSConnectDevice:]";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v8, 0x16u);
  }
  [(COSProfileInstallDeviceSwitchTracker *)self _connectionFinishedWithSuccess:1];
}

- (void)didBTConnectDevice:(id)a3
{
  id v3 = a3;
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 pairingID];
    int v6 = 136315394;
    id v7 = "-[COSProfileInstallDeviceSwitchTracker didBTConnectDevice:]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didUpdateAsDisconnectedDevice:(id)a3
{
  id v3 = a3;
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 pairingID];
    int v6 = 136315394;
    id v7 = "-[COSProfileInstallDeviceSwitchTracker didUpdateAsDisconnectedDevice:]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BPSTinkerConnectionTracker)connectionTracker
{
  return self->_connectionTracker;
}

- (void)setConnectionTracker:(id)a3
{
}

- (NRDevice)switchToDevice
{
  return self->_switchToDevice;
}

- (void)setSwitchToDevice:(id)a3
{
}

- (NRDevice)currentActiveDevice
{
  return self->_currentActiveDevice;
}

- (void)setCurrentActiveDevice:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_source)tinkerConnectionTimeout
{
  return self->_tinkerConnectionTimeout;
}

- (void)setTinkerConnectionTimeout:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_tinkerConnectionTimeout, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_currentActiveDevice, 0);
  objc_storeStrong((id *)&self->_switchToDevice, 0);

  objc_storeStrong((id *)&self->_connectionTracker, 0);
}

@end