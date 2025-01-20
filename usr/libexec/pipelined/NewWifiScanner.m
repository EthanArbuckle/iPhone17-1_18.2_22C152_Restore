@interface NewWifiScanner
+ (duration<long)expectedScanDuration:(id)a3;
- (BOOL)scanning;
- (BOOL)sensorPresent;
- (MonotonicTimerProtocol)scanTimer;
- (NewWifiScanner)initWithDelegate:(id)a3;
- (NewWifiScanner)initWithPlatform:(id)a3 andTimer:(id)a4 andDelegate:(id)a5;
- (OS_dispatch_queue)wifiScanQueue;
- (WifiScannerDelegateProtocol)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)onQueueHandleScan:(id)a3 forSettings:(id)a4;
- (void)onQueueHandleScanFailed:(id)a3 forSettings:(id)a4;
- (void)onQueueHandleScanTimer;
- (void)onQueueInvalidate;
- (void)onQueueScanAfter:(duration<long)long;
- (void)onQueueScheduleScanFromSettingsWithFailure:(BOOL)a3;
- (void)onQueueStartScanning;
- (void)onQueueStopScanning;
- (void)setScanTimer:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setWifiScanQueue:(id)a3;
- (void)startListeningCachedScans;
- (void)startScanning;
- (void)stopListeningCachedScans;
- (void)stopScanning;
- (void)wifiCachedScanResult:(id)a3 withSettings:(id)a4;
- (void)wifiScanFailed:(id)a3 withSettings:(id)a4;
- (void)wifiScanResult:(id)a3 withSettings:(id)a4;
@end

@implementation NewWifiScanner

- (BOOL)sensorPresent
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  wifiScanQueue = self->_wifiScanQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100097240;
  v5[3] = &unk_100468940;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(wifiScanQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)onQueueScanAfter:(duration<long)long
{
  if (![(NewWifiScanner *)self scanning])
  {
    if (qword_10047BED8 == -1)
    {
      v5 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      v5 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    LOWORD(v8) = 0;
    uint64_t v6 = "attempt to scan while stopped";
    goto LABEL_9;
  }
  if (self->_scansInProgress < 1)
  {
    if (qword_10047BED8 == -1)
    {
      v7 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
      {
LABEL_13:
        [(MonotonicTimerProtocol *)self->_scanTimer setDelay:a3.__rep_];
        [(MonotonicTimerProtocol *)self->_scanTimer resume];
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      v7 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    int v8 = 134217984;
    int64_t v9 = a3.__rep_ / 1000000;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting scan timer to run in %lldms", (uint8_t *)&v8, 0xCu);
    goto LABEL_13;
  }
  if (qword_10047BED8 == -1)
  {
    v5 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      LOWORD(v8) = 0;
      uint64_t v6 = "not scheduling new scan while scan still in progress; next will schedule when previous one returns or fails";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    v5 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
  }
}

- (WifiScannerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WifiScannerDelegateProtocol *)WeakRetained;
}

- (NewWifiScanner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(WifiScannerBackend);
  uint64_t v6 = [(NewWifiScanner *)self initWithPlatform:v5 andTimer:0 andDelegate:v4];

  return v6;
}

- (void)onQueueStartScanning
{
  if (![(NewWifiScanner *)self scanning])
  {
    id v4 = [(NewWifiScanner *)self delegate];
    if (!v4)
    {
      if (qword_10047BED8 == -1)
      {
        int v8 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004689B8);
        int v8 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
      }
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No delegate - cannot start scanning", (uint8_t *)&v10, 2u);
      goto LABEL_18;
    }
    if (qword_10047BED8 == -1)
    {
      uint64_t v6 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      uint64_t v6 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        [(NewWifiScanner *)self setScanning:1];
        [v4 updateWifiSettingsForNextScan:self->_scanSettings];
        if (qword_10047BED8 == -1)
        {
          v5 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
          {
LABEL_13:
            [(NewWifiScanner *)self onQueueScanAfter:0];
LABEL_18:

            return;
          }
        }
        else
        {
          dispatch_once(&qword_10047BED8, &stru_1004689B8);
          v5 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
            goto LABEL_13;
          }
        }
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "starting scan timer", (uint8_t *)&v10, 2u);
        goto LABEL_13;
      }
    }
    int v10 = 134217984;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "wifi scanner %p: start scanning", (uint8_t *)&v10, 0xCu);
    goto LABEL_10;
  }
  if (qword_10047BED8 == -1)
  {
    char v3 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
    {
LABEL_4:
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "WARNING: Already scanning", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    char v3 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
  }
}

- (void)startListeningCachedScans
{
  wifiScanQueue = self->_wifiScanQueue;
  v5 = self;
  char v3 = wifiScanQueue;
  id v4 = std::promise<void>::promise(&v8);
  std::promise<void>::get_future(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009B90;
  block[3] = &unk_100460678;
  block[4] = &v5;
  block[5] = &v8;
  dispatch_sync(v3, block);
  std::future<void>::get(&v7);
  std::future<void>::~future(&v7);
  std::promise<void>::~promise(&v8);
}

- (void)onQueueHandleScanTimer
{
  if ([(NewWifiScanner *)self scanning])
  {
    char v3 = [(NewWifiScanner *)self delegate];
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [v3 wifiScanInitiating];
      }
      if (qword_10047BED8 == -1)
      {
        id v4 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004689B8);
        id v4 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
        {
LABEL_8:
          if (!self->_scansInProgress)
          {
            platform = self->_platform;
            scanSettings = self->_scanSettings;
            v13 = _NSConcreteStackBlock;
            uint64_t v14 = 3321888768;
            v15 = sub_100019A04;
            v16 = &unk_100468960;
            int v10 = self;
            id v11 = v3;
            v12 = v10;
            v17 = v12;
            id v18 = v11;
            [(WifiScannerBackendProtocol *)platform scanAsync:scanSettings initiated:&v13];

            ++self->_scansInProgress;
            [v12[3] pause:v13, v14, v15, v16];

            goto LABEL_20;
          }
          if (qword_10047BED8 == -1)
          {
            v5 = qword_10047BEE0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
            {
LABEL_20:

              return;
            }
          }
          else
          {
            dispatch_once(&qword_10047BED8, &stru_1004689B8);
            v5 = qword_10047BEE0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
              goto LABEL_20;
            }
          }
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "scan already in progress, ignoring scan timer firing", buf, 2u);
          goto LABEL_20;
        }
      }
      *(_DWORD *)buf = 134217984;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "scan timer tick - %p requesting scan & pausing timer", buf, 0xCu);
      goto LABEL_8;
    }
    if (qword_10047BED8 == -1)
    {
      std::future<void> v7 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        [(NewWifiScanner *)self onQueueStopScanning];
        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      std::future<void> v7 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "delegate disappeared while running - stopping scanning", buf, 2u);
    goto LABEL_18;
  }
  if (qword_10047BED8 == -1)
  {
    uint64_t v6 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      return;
    }
LABEL_14:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "ignoring scan tick - scanning stopped", buf, 2u);
    return;
  }
  dispatch_once(&qword_10047BED8, &stru_1004689B8);
  uint64_t v6 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
}

- (NewWifiScanner)initWithPlatform:(id)a3 andTimer:(id)a4 andDelegate:(id)a5
{
  id v9 = a3;
  int v10 = (DispatchMonotonicTimer *)a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)NewWifiScanner;
  v12 = [(NewWifiScanner *)&v26 init];
  v13 = v12;
  uint64_t v14 = v12;
  if (!v12) {
    goto LABEL_10;
  }
  if (!v11)
  {
    CFStringRef v22 = @"delegate for scanner is nil";
    goto LABEL_16;
  }
  if (!v9)
  {
    CFStringRef v22 = @"scanning backend is nil";
LABEL_16:
    id v23 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
  objc_storeWeak((id *)&v12->_delegate, v11);
  v15 = objc_alloc_init(WifiScannerSettings);
  scanSettings = v14->_scanSettings;
  v14->_scanSettings = v15;

  if (v14->_scanSettings
    && (dispatch_queue_t v17 = dispatch_queue_create("com.apple.wifiscanner", 0),
        wifiScanQueue = v14->_wifiScanQueue,
        v14->_wifiScanQueue = (OS_dispatch_queue *)v17,
        wifiScanQueue,
        v14->_wifiScanQueue))
  {
    objc_storeStrong((id *)&v13->_platform, a3);
    [(WifiScannerBackendProtocol *)v14->_platform setDelegate:v14];
    objc_initWeak(location, v14);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100005128;
    v24[3] = &unk_100468918;
    objc_copyWeak(&v25, location);
    v19 = objc_retainBlock(v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
    if (!v10)
    {
      int v10 = [[DispatchMonotonicTimer alloc] initWithName:@"com.apple.wifiscanner.timer"];
      if (!v10)
      {
        sub_1000AE4B0(location, "");
        sub_10016A2C4((uint64_t)location, 0, 0);
        if (v29 < 0) {
          operator delete(location[0]);
        }
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    p_scanTimer = (id *)&v13->_scanTimer;
    objc_storeStrong(p_scanTimer, v10);
    [(MonotonicTimerProtocol *)v14->_scanTimer setEventHandler:v19 onQueue:v14->_wifiScanQueue];
    [*p_scanTimer setDelay:0x7FFFFFFFFFFFFFFFLL];
    [*p_scanTimer setInterval:0x7FFFFFFFFFFFFFFFLL];
    v14->_scansInProgress = 0;
    v13 = v14;
  }
  else
  {
    v13 = 0;
  }
LABEL_10:

  return v13;
}

- (void)startScanning
{
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000971FC;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_sync(wifiScanQueue, block);
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (BOOL)scanning
{
  return self->_scanning;
}

+ (duration<long)expectedScanDuration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dwell];
  v5 = [v3 channels];
  uint64_t v6 = 1000000 * (void)v4 * (void)[v5 count];

  return (duration<long long, std::ratio<1, 1000000000>>)v6;
}

- (void)dealloc
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    id v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "wifi scanner %p: dealloc", buf, 0xCu);
  }
LABEL_4:
  [(NewWifiScanner *)self onQueueInvalidate];
  [(WifiScannerBackendProtocol *)self->_platform invalidate];
  v4.receiver = self;
  v4.super_class = (Class)NewWifiScanner;
  [(NewWifiScanner *)&v4 dealloc];
}

- (void)invalidate
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    id v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "wifi scanner %p: invalidate everything", (uint8_t *)&buf, 0xCu);
  }
LABEL_4:
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_wifiScanQueue);
  wifiScanQueue = self->_wifiScanQueue;
  v5 = self;
  std::future<void> v7 = v5;
  uint64_t v6 = wifiScanQueue;
  std::promise<void>::promise(&v9);
  std::promise<void>::get_future(&v9);
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  id v11 = sub_100340314;
  v12 = &unk_100460678;
  v13 = (id *)&v7;
  uint64_t v14 = &v9;
  dispatch_sync(v6, &buf);
  std::future<void>::get(&v8);
  std::future<void>::~future(&v8);
  std::promise<void>::~promise(&v9);

  [(WifiScannerBackendProtocol *)v5->_platform invalidate];
}

- (void)onQueueInvalidate
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    id v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    int v8 = 134217984;
    std::promise<void> v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "wifi scanner %p: invalidate timer", (uint8_t *)&v8, 0xCu);
  }
LABEL_4:
  if (self->_scansInProgress > 0 || ![(NewWifiScanner *)self scanning])
  {
    objc_super v4 = [(NewWifiScanner *)self scanTimer];
    [v4 setDelay:0x7FFFFFFFFFFFFFFFLL];

    v5 = [(NewWifiScanner *)self scanTimer];
    [v5 setInterval:0x7FFFFFFFFFFFFFFFLL];

    uint64_t v6 = [(NewWifiScanner *)self scanTimer];
    [v6 resume];
  }
  std::future<void> v7 = [(NewWifiScanner *)self scanTimer];
  [v7 invalidate];

  [(NewWifiScanner *)self setScanTimer:0];
}

- (void)stopListeningCachedScans
{
  wifiScanQueue = self->_wifiScanQueue;
  v5 = self;
  id v3 = wifiScanQueue;
  objc_super v4 = std::promise<void>::promise(&v8);
  std::promise<void>::get_future(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003403A4;
  block[3] = &unk_100460678;
  block[4] = &v5;
  void block[5] = &v8;
  dispatch_sync(v3, block);
  std::future<void>::get(&v7);
  std::future<void>::~future(&v7);
  std::promise<void>::~promise(&v8);
}

- (void)stopScanning
{
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033EF30;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_sync(wifiScanQueue, block);
}

- (void)wifiScanResult:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033F038;
  block[3] = &unk_100468998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(wifiScanQueue, block);
}

- (void)wifiCachedScanResult:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033F144;
  block[3] = &unk_100468998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(wifiScanQueue, block);
}

- (void)wifiScanFailed:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033F254;
  block[3] = &unk_100468998;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(wifiScanQueue, block);
}

- (void)onQueueScheduleScanFromSettingsWithFailure:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_10047BED8 == -1)
  {
    v5 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004689B8);
  v5 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "scheduling next scan", (uint8_t *)&v18, 2u);
  }
LABEL_4:
  if (v3)
  {
    id v6 = [(WifiScannerSettings *)self->_scanSettings channels];
    id v7 = [v6 count];
    v8.__rep_ = (int64_t)[(WifiScannerSettings *)self->_scanSettings dwell];

    uint64_t v9 = 1000000 * (void)v7 * v8.__rep_;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [(NewWifiScanner *)self delegate];
  [v10 updateWifiSettingsForNextScan:self->_scanSettings];
  id v11 = [(WifiScannerSettings *)self->_scanSettings channels];
  id v12 = [v11 count];
  v13.__rep_ = (int64_t)[(WifiScannerSettings *)self->_scanSettings dwell];
  [(WifiScannerSettings *)self->_scanSettings dutyCycle];
  uint64_t v15 = sub_1001664B0(v13.__rep_ * (void)v12, v14);

  uint64_t v16 = v15 + v9;
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    dispatch_queue_t v17 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  dispatch_queue_t v17 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    int v18 = 134217984;
    double v19 = (double)v16 / 1000000.0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "scheduling another scan in %lf ms", (uint8_t *)&v18, 0xCu);
  }
LABEL_10:
  [(NewWifiScanner *)self onQueueScanAfter:v16];
}

- (void)onQueueHandleScan:(id)a3 forSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 cachedScan] & 1) == 0)
  {
    if (qword_10047BED8 == -1)
    {
      uint64_t v15 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:
        --self->_scansInProgress;
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      uint64_t v15 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
    }
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Got completed scan from backend", (uint8_t *)&v19, 2u);
    goto LABEL_10;
  }
  if (qword_10047BED8 == -1)
  {
    duration<long long, std::ratio<1, 1000>> v13 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  dispatch_once(&qword_10047BED8, &stru_1004689B8);
  duration<long long, std::ratio<1, 1000>> v13 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Got cached scan from backend", (uint8_t *)&v19, 2u);
  }
LABEL_11:
  if (v6) {
    goto LABEL_16;
  }
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    duration<long long, std::ratio<1, 1000>> v8 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  duration<long long, std::ratio<1, 1000>> v8 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
  {
LABEL_14:
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "unexpected nil result from scanning platform", (uint8_t *)&v19, 2u);
  }
LABEL_15:
  id v6 = &__NSArray0__struct;
LABEL_16:
  if ([(NewWifiScanner *)self scanning])
  {
    uint64_t v9 = [(NewWifiScanner *)self delegate];
    if (v9)
    {
      if (qword_10047BED8 != -1) {
        dispatch_once(&qword_10047BED8, &stru_1004689B8);
      }
      id v10 = (id)qword_10047BEE0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v6 count];
        int v19 = 134217984;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "notifying delegate of %zu scan results", (uint8_t *)&v19, 0xCu);
      }

      [v9 wifiScanData:v6 forSettings:v7];
      if (([v7 cachedScan] & 1) == 0) {
        [(NewWifiScanner *)self onQueueScheduleScanFromSettingsWithFailure:0];
      }
      goto LABEL_32;
    }
    if (qword_10047BED8 == -1)
    {
      dispatch_queue_t v17 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
      {
LABEL_31:
        [(NewWifiScanner *)self onQueueStopScanning];
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      dispatch_queue_t v17 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
    }
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "WARNING: got scan but delegate is nil - stopping", (uint8_t *)&v19, 2u);
    goto LABEL_31;
  }
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    id v12 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    goto LABEL_26;
  }
  id v12 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_26:
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "got a scan result but no longer scanning", (uint8_t *)&v19, 2u);
  }
LABEL_33:
}

- (void)onQueueHandleScanFailed:(id)a3 forSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 cachedScan])
  {
    if (qword_10047BED8 == -1)
    {
      int v19 = (id)qword_10047BEE0;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_6:

        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      int v19 = (id)qword_10047BEE0;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    int v26 = 67109120;
    LODWORD(v27[0]) = [v6 code];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "cached scan failed with %d", (uint8_t *)&v26, 8u);
    goto LABEL_6;
  }
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004689B8);
    v21 = (id)qword_10047BEE0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v21 = (id)qword_10047BEE0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    int v26 = 67109120;
    LODWORD(v27[0]) = [v6 code];
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "our scan failed with %d", (uint8_t *)&v26, 8u);
  }
LABEL_11:

  --self->_scansInProgress;
LABEL_12:
  if (![(NewWifiScanner *)self scanning])
  {
    if (qword_10047BED8 == -1)
    {
      uint64_t v9 = (id)qword_10047BEE0;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      uint64_t v9 = (id)qword_10047BEE0;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
    }
    id v10 = [v6 description];
    int v26 = 138412290;
    v27[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "got an error: %@, but not scanning anymore", (uint8_t *)&v26, 0xCu);

    goto LABEL_38;
  }
  if ([v6 code] != (id)82)
  {
    id v11 = [v7 settings];
    unsigned int v12 = [v11 lowPriorityScan];

    if (v12)
    {
      if (qword_10047BED8 != -1)
      {
        dispatch_once(&qword_10047BED8, &stru_1004689B8);
        id v23 = (id)qword_10047BEE0;
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          goto LABEL_30;
        }
        goto LABEL_24;
      }
      id v23 = (id)qword_10047BEE0;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
LABEL_24:
        unsigned int v13 = [v6 code];
        float v14 = [v6 description];
        int v26 = 67109378;
        LODWORD(v27[0]) = v13;
        WORD2(v27[0]) = 2112;
        *(void *)((char *)v27 + 6) = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "WARNING: got an error (%d) initiating a scan: %@", (uint8_t *)&v26, 0x12u);
      }
LABEL_30:

      goto LABEL_31;
    }
    if (qword_10047BED8 == -1)
    {
      id v23 = (id)qword_10047BEE0;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      id v23 = (id)qword_10047BEE0;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
    }
    unsigned int v15 = [v6 code];
    uint64_t v16 = [v6 description];
    int v26 = 67109378;
    LODWORD(v27[0]) = v15;
    WORD2(v27[0]) = 2112;
    *(void *)((char *)v27 + 6) = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "got an error (%d) initiating a scan: %@", (uint8_t *)&v26, 0x12u);

    goto LABEL_30;
  }
  if (qword_10047BED8 == -1)
  {
    duration<long long, std::ratio<1, 1000>> v8 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_31;
    }
    goto LABEL_16;
  }
  dispatch_once(&qword_10047BED8, &stru_1004689B8);
  duration<long long, std::ratio<1, 1000>> v8 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_16:
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "scan failed because wifi is powered off", (uint8_t *)&v26, 2u);
  }
LABEL_31:
  dispatch_queue_t v17 = [(NewWifiScanner *)self delegate];
  uint64_t v9 = v17;
  if (!v17)
  {
    if (qword_10047BED8 == -1)
    {
      int v18 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
      {
LABEL_37:
        [(NewWifiScanner *)self onQueueStopScanning];
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      int v18 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        goto LABEL_37;
      }
    }
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "WARNING: got scan failure but delegate is nil - stopping", (uint8_t *)&v26, 2u);
    goto LABEL_37;
  }
  [v17 wifiScanFailed:v7];
  if (([v7 cachedScan] & 1) == 0) {
    [(NewWifiScanner *)self onQueueScheduleScanFromSettingsWithFailure:1];
  }
LABEL_38:
}

- (void)onQueueStopScanning
{
  if (![(NewWifiScanner *)self scanning])
  {
    if (qword_10047BED8 == -1)
    {
      objc_super v4 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_1004689B8);
      objc_super v4 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
        return;
      }
    }
    LOWORD(v6) = 0;
    v5 = "WARNING: Already not scanning";
    goto LABEL_13;
  }
  if (!self->_scansInProgress) {
    [(MonotonicTimerProtocol *)self->_scanTimer pause];
  }
  if (qword_10047BED8 == -1)
  {
    BOOL v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_10047BED8, &stru_1004689B8);
  BOOL v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wifi scanner %p: stop scanning", (uint8_t *)&v6, 0xCu);
  }
LABEL_7:
  [(MonotonicTimerProtocol *)self->_scanTimer setDelay:0x7FFFFFFFFFFFFFFFLL];
  [(NewWifiScanner *)self setScanning:0];
  if (qword_10047BED8 == -1)
  {
    objc_super v4 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      return;
    }
    goto LABEL_9;
  }
  dispatch_once(&qword_10047BED8, &stru_1004689B8);
  objc_super v4 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    LOWORD(v6) = 0;
    v5 = "scan timer stopped";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v6, 2u);
  }
}

- (OS_dispatch_queue)wifiScanQueue
{
  return self->_wifiScanQueue;
}

- (void)setWifiScanQueue:(id)a3
{
}

- (MonotonicTimerProtocol)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scanSettings, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_wifiScanQueue, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

@end