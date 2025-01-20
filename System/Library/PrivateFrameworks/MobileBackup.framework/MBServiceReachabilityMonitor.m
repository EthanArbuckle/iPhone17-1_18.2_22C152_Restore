@interface MBServiceReachabilityMonitor
- (BOOL)isInternetReachableViaWiFi;
- (BOOL)isMonitoring;
- (MBServiceReachabilityMonitor)init;
- (id)wifiStatusChangedCallback;
- (void)_reachabilityCallback:(unsigned int)a3;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)setMonitoring:(BOOL)a3;
- (void)setWifiStatusChangedCallback:(id)a3;
@end

@implementation MBServiceReachabilityMonitor

- (MBServiceReachabilityMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBServiceReachabilityMonitor;
  v2 = [(MBServiceReachabilityMonitor *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilebackup.reachability", v3);
  }
  return v2;
}

- (void)dealloc
{
  if (self->_isMonitoring) {
    [(MBServiceReachabilityMonitor *)self _stopMonitoring];
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_callbackQueue);
  dispatch_sync((dispatch_queue_t)self->_callbackQueue, &stru_100417DC8);
  dispatch_release((dispatch_object_t)self->_callbackQueue);
  self->_callbackQueue = 0;

  v3.receiver = self;
  v3.super_class = (Class)MBServiceReachabilityMonitor;
  [(MBServiceReachabilityMonitor *)&v3 dealloc];
}

- (void)setMonitoring:(BOOL)a3
{
  if (self->_isMonitoring != a3)
  {
    if (a3) {
      [(MBServiceReachabilityMonitor *)self _startMonitoring];
    }
    else {
      [(MBServiceReachabilityMonitor *)self _stopMonitoring];
    }
  }
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (BOOL)isInternetReachableViaWiFi
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_10029F128;
  v6[4] = sub_10029F138;
  v6[5] = self;
  callbackQueue = self->_callbackQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10029F144;
  v5[3] = &unk_100417DF0;
  v5[4] = &v7;
  v5[5] = v6;
  dispatch_sync(callbackQueue, v5);
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)_reachabilityCallback:(unsigned int)a3
{
  self->_isInternetReachableViaWiFi = (a3 & 0x40002) == 2;
  v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isInternetReachableViaWiFi) {
      objc_super v5 = "YES";
    }
    else {
      objc_super v5 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "isInternetReachableViaWiFi:%s", buf, 0xCu);
    _MBLog();
  }
  wifiStatusChangedCallback = (void (**)(id, BOOL))self->_wifiStatusChangedCallback;
  if (wifiStatusChangedCallback) {
    wifiStatusChangedCallback[2](wifiStatusChangedCallback, self->_isInternetReachableViaWiFi);
  }
}

- (void)_startMonitoring
{
  if (!self->_isMonitoring)
  {
    char v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Reachability monitor started monitoring WiFi connection", (uint8_t *)&buf, 2u);
      _MBLog();
    }
    *(void *)&address.sa_len = 528;
    *(void *)&address.sa_data[6] = 0;
    v4 = SCNetworkReachabilityCreateWithAddress(0, &address);
    self->_reachability = v4;
    if (v4)
    {
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = self;
      SCNetworkReachabilitySetCallback(v4, (SCNetworkReachabilityCallBack)sub_10029F41C, &buf);
      SCNetworkReachabilitySetDispatchQueue(self->_reachability, (dispatch_queue_t)self->_callbackQueue);
      callbackQueue = self->_callbackQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10029F50C;
      block[3] = &unk_1004149C0;
      block[4] = self;
      dispatch_async(callbackQueue, block);
      self->_isMonitoring = 1;
    }
    else
    {
      v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.version) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to setup reachability", (uint8_t *)&buf, 2u);
        _MBLog();
      }
    }
  }
}

- (void)_stopMonitoring
{
  if (self->_isMonitoring)
  {
    char v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Reachability monitor stopped monitoring WiFi connection", v6, 2u);
      _MBLog();
    }
    if (self->_callbackQueue)
    {
      reachability = self->_reachability;
      if (reachability)
      {
        SCNetworkReachabilitySetCallback(reachability, 0, 0);
        SCNetworkReachabilitySetDispatchQueue(self->_reachability, 0);
      }
    }
    objc_super v5 = self->_reachability;
    if (v5)
    {
      CFRelease(v5);
      self->_reachability = 0;
    }
    self->_isMonitoring = 0;
  }
}

- (id)wifiStatusChangedCallback
{
  return self->_wifiStatusChangedCallback;
}

- (void)setWifiStatusChangedCallback:(id)a3
{
}

@end