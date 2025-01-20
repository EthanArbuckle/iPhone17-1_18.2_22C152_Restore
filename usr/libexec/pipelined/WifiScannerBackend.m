@interface WifiScannerBackend
+ (id)copySupportedChannelDicts:(__WiFiDeviceClient *)a3;
- (BOOL)onQueueAllocManagerWithRunLoop:(__CFRunLoop *)a3;
- (BOOL)sensorPresent;
- (OS_dispatch_semaphore)wifiThreadShutdown;
- (WifiScannerBackend)init;
- (__CFRunLoop)wifiThreadRunLoop;
- (id).cxx_construct;
- (unique_ptr<ScanInformation,)initiateScanOnDevice:(__WiFiDeviceClient *)a3 withSettings:(id)a4 deviceNumber:(unint64_t)a5;
- (void)invalidate;
- (void)onQueueDeleteCompletedScan:(void *)a3;
- (void)onQueueHandleDeviceAttached:(__WiFiDeviceClient *)a3;
- (void)onQueueHandleScanFor:(__WiFiDeviceClient *)a3 withResults:(id)a4 forScan:(void *)a5 withSettings:(id)a6 withRequest:(id)a7 withError:(int)a8;
- (void)onQueueHandlerServerRestart;
- (void)onQueueInitiateScan:(id)a3 initiated:(id)a4;
- (void)onQueueNotifyWifiError:(int)a3 withSettings:(id)a4 forScanInitiated:(duration<long)long;
- (void)onQueueRegisterCallbacks;
- (void)onQueueScanTimedOut:(void *)a3 withReason:(int)a4 errorCode:(int)a5 forScanInitiated:(duration<long)long;
- (void)onQueueTeardown;
- (void)scanAsync:(id)a3 initiated:(id)a4;
- (void)setWifiThreadRunLoop:(__CFRunLoop *)a3;
- (void)setWifiThreadShutdown:(id)a3;
- (void)startListeningCachedScans;
- (void)stopListeningCachedScans;
@end

@implementation WifiScannerBackend

- (BOOL)sensorPresent
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_wifiDevices;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v8 != v4) {
        objc_enumerationMutation(v2);
      }
      if (WiFiDeviceClientGetPower()) {
        break;
      }
      if (v3 == (id)++v5)
      {
        id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return 1;
}

- (void)onQueueTeardown
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = self->_wifiDevices;
  id v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v26;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v2);
        }
        if (qword_10047BED8 == -1)
        {
          v6 = (id)qword_10047BEE0;
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
            goto LABEL_9;
          }
LABEL_8:
          id v7 = [ (id) WiFiDeviceClientGetInterfaceName() UTF8String];
          LODWORD(buf.version) = 136315138;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Tearing down exiting device %s", (uint8_t *)&buf, 0xCu);
          goto LABEL_9;
        }
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        v6 = (id)qword_10047BEE0;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
LABEL_9:

        WiFiDeviceClientScanCancel();
        if (qword_10047BED8 == -1)
        {
          long long v8 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
            goto LABEL_12;
          }
LABEL_11:
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unregistering per-device callbacks", (uint8_t *)&buf, 2u);
          goto LABEL_12;
        }
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        long long v8 = qword_10047BEE0;
        if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_11;
        }
LABEL_12:
        WiFiDeviceClientRegisterPowerCallback();
        WiFiDeviceClientRegisterScanUpdateCallback();
        ++v5;
      }
      while (v3 != v5);
      long long v9 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
      id v3 = v9;
    }
    while (v9);
  }

  wifiDevices = self->_wifiDevices;
  self->_wifiDevices = 0;

  if (self->_wifiManager)
  {
    memset(&buf, 0, sizeof(buf));
    v11 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &buf);
    CFRunLoopAddSource(self->_wifiThreadRunLoop, v11, kCFRunLoopDefaultMode);
    if (qword_10047BED8 == -1)
    {
      v12 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      v12 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:
        WiFiManagerClientRegisterServerRestartCallback();
        WiFiManagerClientRegisterDeviceAttachmentCallback();
        WiFiManagerClientUnscheduleFromRunLoop();
        if (qword_10047BED8 == -1)
        {
          v13 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
          {
LABEL_26:
            wifiManager = self->_wifiManager;
            self->_wifiManager = 0;
            wifiThreadRunLoop = self->_wifiThreadRunLoop;
            self->_wifiThreadRunLoop = 0;
            v16 = self->_scannerThread;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100336354;
            block[3] = &unk_1004681B8;
            v21 = wifiManager;
            v17 = v16;
            v20 = v17;
            v22 = wifiThreadRunLoop;
            v23 = v11;
            CFRunLoopPerformBlock(wifiThreadRunLoop, kCFRunLoopCommonModes, block);
            CFRunLoopWakeUp(wifiThreadRunLoop);

            return;
          }
        }
        else
        {
          dispatch_once(&qword_10047BED8, &stru_1004682C0);
          v13 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_26;
          }
        }
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Releasing the WiFi manager", v24, 2u);
        goto LABEL_26;
      }
    }
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Tearing down existing manager", v24, 2u);
    goto LABEL_23;
  }
}

- (void)startListeningCachedScans
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10000FA64;
  block[3] = &unk_1004681D8;
  uint64_t v5 = self;
  id v3 = v5;
  dispatch_async(q, block);
}

- (BOOL)onQueueAllocManagerWithRunLoop:(__CFRunLoop *)a3
{
  [(WifiScannerBackend *)self onQueueTeardown];
  self->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate();
  uint64_t v5 = (NSArray *)WiFiManagerClientCopyDevices();
  wifiDevices = self->_wifiDevices;
  self->_wifiDevices = v5;

  id v7 = self->_wifiDevices;
  if (!v7 || ![(NSArray *)v7 count])
  {
    if (qword_10047BED8 == -1)
    {
      v16 = qword_10047BEE0;
      BOOL v15 = os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR);
      if (!v15) {
        return v15;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      v16 = qword_10047BEE0;
      BOOL v15 = os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR);
      if (!v15) {
        return v15;
      }
    }
    *(_WORD *)CFRunLoopSourceContext buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Platform doesn't contain any wifi devices", buf, 2u);
    LOBYTE(v15) = 0;
    return v15;
  }
  sub_100097790((uint64_t)&self->_supportedChannelsPerDevice, [(NSArray *)self->_wifiDevices count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v8 = self->_wifiDevices;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = +[WifiScannerBackend copySupportedChannelDicts:*(void *)(*((void *)&v19 + 1) + 8 * (void)v11)];
        id v18 = v12;
        var0 = (id *)self->_supportedChannelsPerDevice.var0;
        if (var0 >= self->_supportedChannelsPerDevice.var1.__value_)
        {
          v14 = (__end_cap_ **)sub_1003395B8(&self->_supportedChannelsPerDevice.__begin_, (uint64_t *)&v18);
        }
        else
        {
          id v18 = 0;
          id *var0 = v12;
          v14 = (__end_cap_ **)(var0 + 1);
        }
        self->_supportedChannelsPerDevice.var0 = v14;

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  [(WifiScannerBackend *)self onQueueRegisterCallbacks];
  WiFiManagerClientScheduleWithRunLoop();
  WiFiManagerClientSetType();
  self->_wifiThreadRunLoop = a3;
  LOBYTE(v15) = 1;
  return v15;
}

- (void)onQueueRegisterCallbacks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_wifiDevices;
  id v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        if (qword_10047BED8 == -1)
        {
          v6 = (id)qword_10047BEE0;
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
            goto LABEL_9;
          }
LABEL_8:
          id v7 = [ (id) WiFiDeviceClientGetInterfaceName() UTF8String];
          *(_DWORD *)CFRunLoopSourceContext buf = 134217984;
          id v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering callbacks for device %p", buf, 0xCu);
          goto LABEL_9;
        }
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        v6 = (id)qword_10047BEE0;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
LABEL_9:

        WiFiDeviceClientRegisterPowerCallback();
        ++v5;
      }
      while (v3 != v5);
      long long v8 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
      id v3 = v8;
    }
    while (v8);
  }

  WiFiManagerClientRegisterServerRestartCallback();
  WiFiManagerClientRegisterDeviceAttachmentCallback();
}

- (void)scanAsync:(id)a3 initiated:(id)a4
{
  id v6 = a3;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100096F4C;
  block[3] = &unk_100468238;
  long long v8 = self;
  id v9 = v6;
  id v10 = objc_retainBlock(a4);
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  long long v12 = v8;
  id v16 = objc_retainBlock(v10);
  dispatch_async(q, block);
}

- (unique_ptr<ScanInformation,)initiateScanOnDevice:(__WiFiDeviceClient *)a3 withSettings:(id)a4 deviceNumber:(unint64_t)a5
{
  id v8 = a4;
  unint64_t v12 = a5;
  id v9 = self->_supportedChannelsPerDevice.__begin_[a5];
  if (v9)
  {
LABEL_8:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100096EF4;
    v13[3] = &unk_1004682A0;
    id v14 = v9;
    id v11 = [(BaseWifiScannerBackend *)self log];
    +[WifiScannerCommonDarwin scanSettingsToDictionary:v8 usingSupportedChannels:v13 logTo:v11];
    objc_claimAutoreleasedReturnValue();

    operator new();
  }
  id v9 = +[WifiScannerBackend copySupportedChannelDicts:a3];
  if (v9)
  {
    objc_storeStrong((id *)&self->_supportedChannelsPerDevice.__begin_[v12], v9);
    goto LABEL_8;
  }
  if (qword_10047BED8 == -1)
  {
    id v10 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      id v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_1004682C0);
    id v10 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }
  int buf = 134217984;
  *(void *)buf_4 = v12;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get supported channels dictionaries for device %zu", (uint8_t *)&buf, 0xCu);
  goto LABEL_7;
}

- (WifiScannerBackend)init
{
  self->_initialized = 0;
  v16.receiver = self;
  v16.super_class = (Class)WifiScannerBackend;
  v2 = [(BaseWifiScannerBackend *)&v16 init];
  if (!v2) {
    goto LABEL_11;
  }
  if (!MobileWiFiContainsRadio())
  {
    if (qword_10047BED8 == -1)
    {
      v13 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        unint64_t v12 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      v13 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Platform doesn't contain radio", v15, 2u);
    goto LABEL_11;
  }
  v2->_isInternalBuild = MGGetBoolAnswer();
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifi.scanner.ios", 0);
  q = v2->_q;
  v2->_q = (OS_dispatch_queue *)v3;

  if (!v2->_q) {
    goto LABEL_11;
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  wifiThreadShutdown = v2->_wifiThreadShutdown;
  v2->_wifiThreadShutdown = (OS_dispatch_semaphore *)v5;

  if (!v2->_wifiThreadShutdown) {
    goto LABEL_11;
  }
  id v7 = dispatch_semaphore_create(0);
  if (v7
    && (dispatch_semaphore_t v8 = dispatch_semaphore_create(0),
        retryingScan = v2->_retryingScan,
        v2->_retryingScan = (OS_dispatch_semaphore *)v8,
        retryingScan,
        v2->_retryingScan))
  {
    id v10 = [[WifiScannerThread alloc] initWithBackend:v2];
    scannerThread = v2->_scannerThread;
    v2->_scannerThread = v10;

    +[NSThread detachNewThreadSelector:"runWifiThread:" toTarget:v2->_scannerThread withObject:v7];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    v2->_initialized = 1;
    unint64_t v12 = v2;
  }
  else
  {
    unint64_t v12 = 0;
  }

LABEL_12:
  return v12;
}

- (void)onQueueInitiateScan:(id)a3 initiated:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSUInteger))a4;
  os_activity_t v8 = _os_activity_create((void *)&_mh_execute_header, "Wifi Scan", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  if (qword_10047BED8 == -1)
  {
    id v9 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004682C0);
  id v9 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initiating a scan with settings: %{public}@", (uint8_t *)&buf, 0xCu);
  }
LABEL_4:
  long long buf = 0uLL;
  uint64_t v33 = 0;
  NSUInteger v10 = [(NSArray *)self->_wifiDevices count];
  id v11 = (void *)*((void *)&buf + 1);
  unint64_t v12 = (uint64_t)(*((void *)&buf + 1) - buf) >> 3;
  if (v10 <= v12)
  {
    if (v10 < v12)
    {
      uint64_t v13 = buf + 8 * v10;
      while (v11 != (void *)v13)
      {
        id v15 = (id *)*--v11;
        id v14 = v15;
        void *v11 = 0;
        if (v15)
        {
          sub_100338BB4(v14);
          operator delete();
        }
      }
      *((void *)&buf + 1) = v13;
    }
  }
  else
  {
    sub_100002AEC((void **)&buf, v10 - v12);
  }
  size_t v16 = [(NSArray *)self->_wifiDevices count];
  v17 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000125AC;
  block[3] = &unk_100468268;
  id v18 = self;
  long long v19 = v8;
  id v20 = v6;
  long long v21 = v18;
  long long v28 = v21;
  v29 = v19;
  id v30 = v20;
  p_long long buf = &buf;
  dispatch_apply(v16, v17, block);

  sub_1000984E0((uint64_t)&v21->_pendingScans, (uint64_t *)&v21->_pendingScans, (uint64_t *)buf, *((uint64_t **)&buf + 1));
  atomic_store(v21->_pendingScans.__size_alloc_.__value_, &v21->_pendingScanCount.__a_.__a_value);
  v7[2](v7, [(NSArray *)self->_wifiDevices count]);

  long long v22 = (void *)buf;
  if ((void)buf)
  {
    v23 = (void *)*((void *)&buf + 1);
    v24 = (void *)buf;
    if (*((void *)&buf + 1) != (void)buf)
    {
      do
      {
        long long v26 = (id *)*--v23;
        long long v25 = v26;
        void *v23 = 0;
        if (v26)
        {
          sub_100338BB4(v25);
          operator delete();
        }
      }
      while (v23 != v22);
      v24 = (void *)buf;
    }
    *((void *)&buf + 1) = v22;
    operator delete(v24);
  }
}

- (OS_dispatch_semaphore)wifiThreadShutdown
{
  return self->_wifiThreadShutdown;
}

- (__CFRunLoop)wifiThreadRunLoop
{
  return self->_wifiThreadRunLoop;
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 11) = (char *)self + 88;
  *((void *)self + 12) = (char *)self + 88;
  *((void *)self + 13) = 0;
  return self;
}

+ (id)copySupportedChannelDicts:(__WiFiDeviceClient *)a3
{
  uint64_t v4 = +[NSNumber numberWithInteger:27];

  return (id)_WiFiDeviceClientCopyProperty(a3, v4);
}

- (void)invalidate
{
  dispatch_queue_t v3 = self;
  if (self->_initialized)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_shutdownRequested);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_retryingScan);
    if (v3->_wifiThreadRunLoop)
    {
      char v13 = 0;
      q = v3->_q;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_10033613C;
      block[3] = &unk_100468180;
      id v11 = v3;
      unint64_t v12 = &v13;
      dispatch_queue_t v3 = v11;
      dispatch_sync(q, block);

      v2 = &OBJC_METACLASS___CLPrefetchFloorRequest;
      if (!v13)
      {
        if (qword_10047BED8 == -1)
        {
          id v6 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&qword_10047BED8, &stru_1004682C0);
          id v6 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
            goto LABEL_20;
          }
        }
        *(_WORD *)long long buf = 0;
        id v7 = "wifiThreadRunLoop already deallocated. Shutdown is complete.";
        goto LABEL_19;
      }
      if (qword_10047BED8 == -1)
      {
        dispatch_semaphore_t v5 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
        {
LABEL_7:
          dispatch_semaphore_wait((dispatch_semaphore_t)v3->_wifiThreadShutdown, 0xFFFFFFFFFFFFFFFFLL);
          if (v2[95].isa != (__objc2_class *)-1)
          {
            dispatch_once(&qword_10047BED8, &stru_1004682C0);
            id v6 = qword_10047BEE0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
              goto LABEL_20;
            }
            goto LABEL_9;
          }
          id v6 = qword_10047BEE0;
          if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
          {
LABEL_9:
            *(_WORD *)long long buf = 0;
            id v7 = "wifiThreadShutdown done. [IOSWifiScannerBackend invalidate] completed successfully.";
LABEL_19:
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
          }
LABEL_20:

          return;
        }
LABEL_6:
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Wait for the wifi thread runloop to terminate...", buf, 2u);
        goto LABEL_7;
      }
LABEL_22:
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      dispatch_semaphore_t v5 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    if (qword_10047BED8 == -1)
    {
      os_activity_t v8 = qword_10047BEE0;
      if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
      {
LABEL_14:
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Wi-Fi thread already shut-down", buf, 2u);
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      os_activity_t v8 = qword_10047BEE0;
      if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
    }
  }
  else if (self->_wifiThreadRunLoop)
  {
    sub_1003A72B8();
    goto LABEL_22;
  }
}

- (void)onQueueHandlerServerRestart
{
  if (qword_10047BED8 == -1)
  {
    dispatch_queue_t v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004682C0);
  dispatch_queue_t v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)dispatch_semaphore_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wifi daemon restarted", v5, 2u);
  }
LABEL_4:
  for (i = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)self->_pendingScans.__end_.__next_;
        i != &self->_pendingScans;
        i = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)i->__end_.__next_)
  {
    sub_1003368A8(i->__size_alloc_.__value_, 54);
  }
  atomic_store(0, &self->_pendingScanCount.__a_.__a_value);
}

- (void)onQueueHandleDeviceAttached:(__WiFiDeviceClient *)a3
{
  if (qword_10047BED8 == -1)
  {
    dispatch_queue_t v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_1004682C0);
    dispatch_queue_t v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      return;
    }
  }
  *(_WORD *)uint64_t v4 = 0;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "device attachment unimplemented", v4, 2u);
}

- (void)stopListeningCachedScans
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100336CE4;
  block[3] = &unk_100468208;
  dispatch_semaphore_t v5 = self;
  dispatch_queue_t v3 = v5;
  dispatch_async(q, block);
}

- (void)onQueueNotifyWifiError:(int)a3 withSettings:(id)a4 forScanInitiated:(duration<long)long
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (qword_10047BED8 == -1)
  {
    id v9 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004682C0);
  id v9 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_DWORD *)long long buf = 67109120;
    int v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "WARNING: WiFi scan failed with error %d", buf, 8u);
  }
LABEL_4:
  if (v8)
  {
    CFStringRef v14 = @"scan parameters";
    id v15 = v8;
    NSUInteger v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
  else
  {
    NSUInteger v10 = 0;
  }
  id v11 = +[NSError errorWithDomain:@"com.apple.pipeline.wifi" code:(int)v6 userInfo:v10];
  unint64_t v12 = [[WifiScannedSettings alloc] initWithSettings:v8 cached:0 at:sub_100048550() initiatedAt:a5.__rep_];
  [(WifiScannedSettings *)v12 setWifiError:v6];
  char v13 = [(BaseWifiScannerBackend *)self delegate];
  [v13 wifiScanFailed:v11 withSettings:v12];
}

- (void)onQueueScanTimedOut:(void *)a3 withReason:(int)a4 errorCode:(int)a5 forScanInitiated:(duration<long)long
{
  uint64_t v7 = *(void *)&a5;
  if (a4 == 1)
  {
    if (qword_10047BED8 == -1)
    {
      id v15 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        WiFiDeviceClientScanCancel();
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      id v15 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
    }
    LODWORD(v17) = 67109120;
    HIDWORD(v17) = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Scan timed out with error code %d - cancelling", (uint8_t *)&v17, 8u);
    goto LABEL_10;
  }
  if (!a4)
  {
    if (a5 != 82)
    {
      if (qword_10047BED8 == -1)
      {
        uint64_t v16 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_15;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        uint64_t v16 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_15;
        }
      }
      LODWORD(v17) = 67109120;
      HIDWORD(v17) = v7;
      id v11 = "Fake timeout for scan invalidation elapsed.  Scan had failed to schedule with %d";
      unint64_t v12 = v16;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 8;
      goto LABEL_14;
    }
    if (qword_10047BED8 != -1)
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      uint64_t v10 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    uint64_t v10 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
    {
LABEL_6:
      LOWORD(v17) = 0;
      id v11 = "WiFi is powered off.";
      unint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      uint32_t v14 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
LABEL_15:
  -[WifiScannerBackend onQueueNotifyWifiError:withSettings:forScanInitiated:](self, "onQueueNotifyWifiError:withSettings:forScanInitiated:", v7, *((void *)a3 + 3), a6.__rep_, v17);
  [(WifiScannerBackend *)self onQueueDeleteCompletedScan:a3];
}

- (void)onQueueDeleteCompletedScan:(void *)a3
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004682C0);
    dispatch_semaphore_t v5 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_semaphore_t v5 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    int v12 = 134217984;
    os_log_type_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing pending scan %p", (uint8_t *)&v12, 0xCu);
  }
LABEL_4:
  p_pendingScans = &self->_pendingScans;
  next = (WifiScannerBackend *)self->_pendingScans.__end_.__next_;
  if (next == (WifiScannerBackend *)&self->_pendingScans) {
    goto LABEL_7;
  }
  while (next->super._log != a3)
  {
    next = (WifiScannerBackend *)next->super._delegate;
    if (next == (WifiScannerBackend *)p_pendingScans) {
      goto LABEL_7;
    }
  }
  if (next == (WifiScannerBackend *)p_pendingScans)
  {
LABEL_7:
    if (qword_10047BED8 == -1)
    {
      id v8 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      id v8 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    int v12 = 134217984;
    os_log_type_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Completed scan %p but don't have it in the pending list", (uint8_t *)&v12, 0xCu);
    return;
  }
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004682C0);
    id v9 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v9 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_13:
    int v12 = 134217984;
    os_log_type_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Erasing pending scan %p from the list", (uint8_t *)&v12, 0xCu);
  }
LABEL_14:
  Class isa = next->super.super.isa;
  *((void *)isa + 1) = next->super._delegate;
  *(void *)next->super._delegate = isa;
  --self->_pendingScans.__size_alloc_.__value_;
  log = (id *)next->super._log;
  next->super._log = 0;
  if (log)
  {
    sub_100338BB4(log);
    operator delete();
  }
  operator delete(next);
  atomic_store(self->_pendingScans.__size_alloc_.__value_, &self->_pendingScanCount.__a_.__a_value);
}

- (void)onQueueHandleScanFor:(__WiFiDeviceClient *)a3 withResults:(id)a4 forScan:(void *)a5 withSettings:(id)a6 withRequest:(id)a7 withError:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v15)
  {
    sub_1000AE4B0(&buf, "");
    sub_10016A2C4((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1000D11E0((uint64_t)__p);
  }
  if (!v14)
  {
    sub_1000AE4B0(&buf, "");
    sub_10016A2C4((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1000D11E0((uint64_t)__p);
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  id v18 = objc_claimAutoreleasedReturnValue();
  v63 = (const std::string::value_type *)[v18 UTF8String];
  if ((isKindOfClass & 1) == 0)
  {
    sub_1000AE4B0(__p, "");
    sub_100339920("We expect that request is of type NSDictionary, but it's not. Memory smasher? Got ", &buf);
    sub_100315E10(&v63, &v68);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 2);
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v68.__r_.__value_.__l.__data_);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_66:
        if ((v66 & 0x80000000) == 0) {
          goto LABEL_67;
        }
LABEL_74:
        operator delete(__p[0]);
LABEL_67:
        sub_1000D11E0((uint64_t)v64);
      }
    }
    else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_66;
    }
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v66 & 0x80000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_74;
  }

  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();
  id v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  id v21 = objc_claimAutoreleasedReturnValue();
  v63 = (const std::string::value_type *)[v21 UTF8String];
  if ((v19 & 1) == 0)
  {
    sub_1000AE4B0(__p, "");
    sub_100339970("We expect that scanSettings is of type WifiScannerSettings, but it's not. Memory smasher? Got ", &buf);
    sub_100315E10(&v63, &v68);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 2);
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v68.__r_.__value_.__l.__data_);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_70:
        if ((v66 & 0x80000000) == 0) {
          goto LABEL_71;
        }
LABEL_77:
        operator delete(__p[0]);
LABEL_71:
        sub_1000D11E0((uint64_t)v64);
      }
    }
    else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_70;
    }
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v66 & 0x80000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_77;
  }

  if (v8)
  {
    if (a5)
    {
      if ([v14 lowPriorityScan])
      {
        if (qword_10047BED8 != -1)
        {
          dispatch_once(&qword_10047BED8, &stru_1004682C0);
          uint64_t v55 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
            goto LABEL_24;
          }
          goto LABEL_11;
        }
        uint64_t v55 = qword_10047BEE0;
        if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
        {
LABEL_11:
          LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
          HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
          long long v22 = "WARNING: An error occurred during a WiFi scan (error code %d)";
          v23 = v55;
          os_log_type_t v24 = OS_LOG_TYPE_INFO;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v23, v24, v22, (uint8_t *)&buf, 8u);
        }
LABEL_24:
        uint64_t v32 = sub_100048550();
        [(WifiScannerBackend *)self onQueueNotifyWifiError:v8 withSettings:v14 forScanInitiated:v32 - std::chrono::steady_clock::now().__d_.__rep_ + *((void *)a5 + 7)];
        [(WifiScannerBackend *)self onQueueDeleteCompletedScan:a5];
        goto LABEL_57;
      }
      if (qword_10047BED8 == -1)
      {
        uint64_t v57 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        uint64_t v57 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
      long long v22 = "An error occurred during a WiFi scan (error code %d)";
      v23 = v57;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_23;
    }
    if ([v14 lowPriorityScan])
    {
      if (qword_10047BED8 == -1)
      {
        uint64_t v59 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_57;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        uint64_t v59 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_57;
        }
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
      v29 = "WARNING: An error occurred during a WiFi scan (error code %d)";
      id v30 = v59;
      os_log_type_t v31 = OS_LOG_TYPE_INFO;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, (uint8_t *)&buf, 8u);
      goto LABEL_57;
    }
    if (qword_10047BED8 == -1)
    {
      uint64_t v61 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
      uint64_t v61 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
    v29 = "An error occurred during a WiFi scan (error code %d)";
    id v30 = v61;
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    goto LABEL_33;
  }
  if (a5)
  {
    uint64_t v25 = sub_100048550();
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = std::chrono::steady_clock::now().__d_.__rep_;
    uint64_t v27 = *((void *)a5 + 7);
    [(WifiScannerBackend *)self onQueueDeleteCompletedScan:a5];
    uint64_t v28 = v25 - rep + v27;
  }
  else
  {
    uint64_t v33 = [v15 objectForKeyedSubscript:qword_10047E2F8];
    v34 = +[NSNumber numberWithInt:getpid()];
    unsigned int v35 = [v33 isEqualToNumber:v34];

    if (v35)
    {
      if (qword_10047BED8 == -1)
      {
        v36 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_57;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        v36 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_57;
        }
      }
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Dropping cached scan results because it's for a scan we initiated", (uint8_t *)&buf, 2u);
      goto LABEL_57;
    }
    v37 = [v15 objectForKeyedSubscript:qword_10047E300];
    id v38 = v37;
    if (v37)
    {
      [v37 timeIntervalSinceNow];
      uint64_t v28 = (uint64_t)(v39 * -1000000000.0);
    }
    else
    {
      id v40 = [v14 dwell];
      v41 = [v14 channels];
      id v42 = [v41 count];

      id v38 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:(double)(unint64_t)((void)v42 * (void)v40) / -1000.0];
      uint64_t v28 = 0;
    }
    if (qword_10047BED8 != -1) {
      dispatch_once(&qword_10047BED8, &stru_1004682C0);
    }
    v43 = (id)qword_10047BEE0;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      id v44 = [v38 description];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)[v44 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Got scan request at %s", (uint8_t *)&buf, 0xCu);
    }
  }
  v45 = +[WifiScannerCommonDarwin networkResultsToScanResults:v13];
  v46 = [[WifiScannedSettings alloc] initWithSettings:v14 cached:a5 == 0 at:sub_100048550() initiatedAt:v28];
  if (!a5)
  {
    v47 = [v15 objectForKeyedSubscript:@"SCAN_RSSI_THRESHOLD"];
    v48 = v47;
    if (v47) {
      -[WifiScannedSettings setScanRssiThreshold:](v46, "setScanRssiThreshold:", ((void)[v47 intValue] << 32) | 1);
    }
    v49 = [v15 objectForKeyedSubscript:@"SCAN_MERGE"];
    v50 = v49;
    if (v49)
    {
      if ([v49 BOOLValue]) {
        uint64_t v51 = 257;
      }
      else {
        uint64_t v51 = 1;
      }
      [(WifiScannedSettings *)v46 setMerged:v51];
    }
    v52 = [v15 objectForKeyedSubscript:@"SSID_STR"];
    if (v52) {
      [(WifiScannedSettings *)v46 setTargettedSsid:1];
    }
  }
  v53 = [(BaseWifiScannerBackend *)self delegate];
  v54 = v53;
  if (a5) {
    [v53 wifiScanResult:v45 withSettings:v46];
  }
  else {
    [v53 wifiCachedScanResult:v45 withSettings:v46];
  }

LABEL_57:
}

- (void)setWifiThreadRunLoop:(__CFRunLoop *)a3
{
  self->_wifiThreadRunLoop = a3;
}

- (void)setWifiThreadShutdown:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerThread, 0);
  objc_storeStrong((id *)&self->_retryingScan, 0);
  p_pendingScans = &self->_pendingScans;
  if (self->_pendingScans.__size_alloc_.__value_)
  {
    prev = (void **)p_pendingScans->__end_.__prev_;
    next = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)self->_pendingScans.__end_.__next_;
    uint64_t v6 = next->__end_.__prev_;
    v6[1] = *((void *)p_pendingScans->__end_.__prev_ + 1);
    *prev[1] = v6;
    self->_pendingScans.__size_alloc_.__value_ = 0;
    if (next != p_pendingScans)
    {
      do
      {
        int v12 = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)next->__end_.__next_;
        value = (id *)next->__size_alloc_.__value_;
        next->__size_alloc_.__value_ = 0;
        if (value)
        {
          sub_100338BB4(value);
          operator delete();
        }
        operator delete(next);
        next = v12;
      }
      while (v12 != p_pendingScans);
    }
  }
  objc_storeStrong((id *)&self->_wifiThreadShutdown, 0);
  begin = self->_supportedChannelsPerDevice.__begin_;
  if (begin)
  {
    var0 = self->_supportedChannelsPerDevice.var0;
    id v9 = self->_supportedChannelsPerDevice.__begin_;
    if (var0 != begin)
    {
      do
      {
        uint64_t v10 = *--var0;
      }
      while (var0 != begin);
      id v9 = self->_supportedChannelsPerDevice.__begin_;
    }
    self->_supportedChannelsPerDevice.var0 = begin;
    operator delete(v9);
  }
  objc_storeStrong((id *)&self->_wifiDevices, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end