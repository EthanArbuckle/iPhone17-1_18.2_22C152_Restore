@interface CLGatheringBluetoothClient
+ (BOOL)hasAopPath;
- (BOOL)_isSignedIn;
- (BOOL)getEnablementStatus;
- (CLGatheringBluetoothClient)initWithQueue:(id)a3 withSettings:(id)a4;
- (CLGatheringSettings)settings;
- (OS_dispatch_queue)queue;
- (void)_accountStoreDidChange:(id)a3;
- (void)_armPeriodicScanTimer;
- (void)_cancelApSleepWakeCallBack;
- (void)_cancelExistingStopScanningBlock;
- (void)_cancelICloudMonitor;
- (void)_cancelPeriodicScanTimer;
- (void)_cancelScreenWakeMonitor;
- (void)_installApSleepWakeCallBack;
- (void)_installICloudMonitor;
- (void)_installScreenWakeMonitor;
- (void)_runAdv;
- (void)_runScan;
- (void)_startAdvertising;
- (void)_startPermanentScanning;
- (void)_startTimedScanningWithReason:(int64_t)a3;
- (void)_stopAdvertising;
- (void)_stopScanning;
- (void)_stopScanningWithReason:(int64_t)a3;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setQueue:(id)a3;
- (void)setScannerDelegate:(id)a3;
- (void)setSettings:(id)a3;
- (void)stop;
@end

@implementation CLGatheringBluetoothClient

+ (BOOL)hasAopPath
{
  if (qword_102480A98 != -1) {
    dispatch_once(&qword_102480A98, &stru_1022F1570);
  }
  return byte_102480A90;
}

- (CLGatheringBluetoothClient)initWithQueue:(id)a3 withSettings:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CLGatheringBluetoothClient;
  v6 = [(CLGatheringBluetoothClient *)&v12 init];
  v7 = v6;
  if (v6)
  {
    [(CLGatheringBluetoothClient *)v6 setQueue:a3];
    [(CLGatheringBluetoothClient *)v7 setSettings:a4];
    if (+[CLGatheringBluetoothClient hasAopPath]) {
      BOOL v8 = ![(CLGatheringSettings *)[(CLGatheringBluetoothClient *)v7 settings] scanForceNoAopPolicy];
    }
    else {
      BOOL v8 = 0;
    }
    v7->_scanningWithAop = v8;
    v7->_gascanner = [[CLGatheringBluetoothScanner alloc] initWithQueue:[(CLGatheringBluetoothClient *)v7 queue] withSettings:a4 withPolicy:v7->_scanningWithAop];
    v7->_iCloudSignedIn = [(CLGatheringBluetoothClient *)v7 _isSignedIn];
    [(CLGatheringBluetoothClient *)v7 _installICloudMonitor];
    id v9 = objc_alloc((Class)CBCentralManager);
    queue = v7->_queue;
    uint64_t v13 = CBCentralManagerOptionReceiveSystemEvents;
    v14 = &__kCFBooleanTrue;
    v7->_centralManager = (CBCentralManager *)[v9 initWithDelegate:v7 queue:queue options:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)];
    v7->_bluetoothIsON = 1;
    v7->_rootDomainConnect = 0;
    v7->_notifyPortRef = 0;
    v7->_notifierObject = 0;
  }
  return v7;
}

- (void)dealloc
{
  [(CLGatheringBluetoothClient *)self setQueue:0];
  [(CLGatheringBluetoothClient *)self setSettings:0];

  self->_gascanner = 0;
  [(CBAdvertiser *)self->_advertiser invalidate];

  self->_advertiser = 0;
  id timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
  if (timeoutDiscoveryBlock)
  {
    dispatch_block_cancel(timeoutDiscoveryBlock);

    self->_id timeoutDiscoveryBlock = 0;
  }
  [(CLGatheringBluetoothClient *)self _cancelExistingStopScanningBlock];

  [(CLGatheringBluetoothClient *)self _cancelICloudMonitor];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)CLGatheringBluetoothClient;
  [(CLGatheringBluetoothClient *)&v5 dealloc];
}

- (void)setScannerDelegate:(id)a3
{
}

- (void)_runAdv
{
}

- (void)_runScan
{
  if ([(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly])
  {
    [(CLGatheringBluetoothClient *)self _installScreenWakeMonitor];
  }
  if (self->_scanningWithAop)
  {
    [(CLGatheringBluetoothClient *)self _startPermanentScanning];
  }
  else
  {
    [(CLGatheringBluetoothClient *)self _armPeriodicScanTimer];
    [(CLGatheringBluetoothClient *)self _installApSleepWakeCallBack];
  }
}

- (void)run
{
  if (self->_iCloudSignedIn && self->_bluetoothIsON)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    v3 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "btclient run", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      BOOL v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient run]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    [(CLGatheringBluetoothClient *)self _runAdv];
    [(CLGatheringBluetoothClient *)self _runScan];
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    v4 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      BOOL iCloudSignedIn = self->_iCloudSignedIn;
      BOOL bluetoothIsON = self->_bluetoothIsON;
      *(_DWORD *)buf = 67109376;
      BOOL v10 = iCloudSignedIn;
      __int16 v11 = 1024;
      BOOL v12 = bluetoothIsON;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "btclient not run: _iCloudSignedIn %d _bluetoothIsON %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient run]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)_stopScanning
{
  [(CLGatheringBluetoothClient *)self _stopScanningWithReason:0];
  [(CLGatheringBluetoothClient *)self _cancelApSleepWakeCallBack];
  [(CLGatheringBluetoothClient *)self _cancelPeriodicScanTimer];

  [(CLGatheringBluetoothClient *)self _cancelScreenWakeMonitor];
}

- (void)stop
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "btclient stop", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient stop]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLGatheringBluetoothClient *)self _stopAdvertising];
  [(CLGatheringBluetoothClient *)self _stopScanning];
}

- (BOOL)getEnablementStatus
{
  return self->_iCloudSignedIn && self->_bluetoothIsON;
}

- (void)_startPermanentScanning
{
  double v3 = sub_10016C458();
  if (self->_screenIsON) {
    unsigned __int8 v4 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly];
  }
  else {
    unsigned __int8 v4 = 0;
  }
  if (![(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanEnabled]
    || (v4 & 1) != 0)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    BOOL v8 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanEnabled];
      BOOL bluetoothIsON = self->_bluetoothIsON;
      BOOL screenIsON = self->_screenIsON;
      *(_DWORD *)buf = 67109888;
      unsigned int v15 = v9;
      __int16 v16 = 1024;
      BOOL v17 = bluetoothIsON;
      __int16 v18 = 1024;
      BOOL v19 = screenIsON;
      __int16 v20 = 1024;
      unsigned int v21 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "did not _startPermanentScanning: s.scanEnabled %d, _bluetoothIsON %d, _screenIsON %d, s.forceScreenOffOnly %d", buf, 0x1Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanEnabled];
      [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly];
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startPermanentScanning]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    objc_super v5 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_startPermanentScanning", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      BOOL v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startPermanentScanning]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    self->_lastTimedScanningStartTime = v3;
    [(CLGatheringBluetoothScanner *)self->_gascanner startPermanentDeviceDiscovery];
    v6 = [(CLGatheringBluetoothScanner *)self->_gascanner delegate];
    if (self->_screenIsON) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [(CLGatheringBluetoothScannerDelegate *)v6 markScanStartTimeFromBoot:v7 withReason:[(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanAonDutyCycle] withRate:v3];
  }
}

- (void)_startTimedScanningWithReason:(int64_t)a3
{
  if (a3 < 14)
  {
    double v7 = sub_10016C458();
    double v8 = v7 - self->_lastTimedScanningStartTime;
    double v9 = (double)[(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanPeriodicInterval];
    if (v8 > v9) {
      self->_double cumulativeObservationDuration = 0.0;
    }
    uint64_t v10 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanBackoffTimeout];
    double cumulativeObservationDuration = self->_cumulativeObservationDuration;
    if (self->_screenIsON) {
      unsigned __int8 v12 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly];
    }
    else {
      unsigned __int8 v12 = 0;
    }
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    double v13 = (double)v10 - cumulativeObservationDuration;
    v14 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = self->_cumulativeObservationDuration;
      *(_DWORD *)buf = 134218496;
      int64_t v52 = *(void *)&v8;
      __int16 v53 = 2048;
      *(double *)v54 = v15;
      *(_WORD *)&v54[8] = 2048;
      double v55 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "timeSinceLastTimedScan %.1f cumulativeDuration %.1f leftoverScanDuration %.1f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      double v35 = self->_cumulativeObservationDuration;
      int v43 = 134218496;
      int64_t v44 = *(void *)&v8;
      __int16 v45 = 2048;
      *(double *)v46 = v35;
      *(_WORD *)&v46[8] = 2048;
      double v47 = v13;
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
    unsigned int v16 = ![(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanEnabled];
    BOOL v17 = v13 <= 1.0 && v8 <= v9;
    if (((v16 | v12) | v17))
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      __int16 v18 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = (&off_102474150)[a3];
        unsigned int v20 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanEnabled];
        BOOL bluetoothIsON = self->_bluetoothIsON;
        BOOL screenIsON = self->_screenIsON;
        unsigned int v23 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly];
        *(_DWORD *)buf = 136316418;
        int64_t v52 = (int64_t)v19;
        __int16 v53 = 1024;
        *(_DWORD *)v54 = v20;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = bluetoothIsON;
        LOWORD(v55) = 1024;
        *(_DWORD *)((char *)&v55 + 2) = screenIsON;
        HIWORD(v55) = 2048;
        double v56 = v8;
        __int16 v57 = 1024;
        unsigned int v58 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "did not _startTimedScanningWithReason %s, s.scanEnabled %d, _bluetoothIsON %d _screenIsON %d, timeSinceLastTimedScan %.1f, s.forceScreenOffOnly %d", buf, 0x2Eu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F15B0);
        }
        v24 = (&off_102474150)[a3];
        unsigned int v25 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanEnabled];
        BOOL v26 = self->_bluetoothIsON;
        BOOL v27 = self->_screenIsON;
        int v43 = 136316418;
        int64_t v44 = (int64_t)v24;
        __int16 v45 = 1024;
        *(_DWORD *)v46 = v25;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v26;
        LOWORD(v47) = 1024;
        *(_DWORD *)((char *)&v47 + 2) = v27;
        HIWORD(v47) = 2048;
        double v48 = v8;
        __int16 v49 = 1024;
        unsigned int v50 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanForceScreenOffOnly];
        objc_super v5 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n");
        goto LABEL_32;
      }
    }
    else
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      v28 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (&off_102474150)[a3];
        *(_DWORD *)buf = 136315138;
        int64_t v52 = (int64_t)v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "_startTimedScanningWithReason %s", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F15B0);
        }
        v37 = (&off_102474150)[a3];
        int v43 = 136315138;
        int64_t v44 = (int64_t)v37;
        v38 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v38);
        if (v38 != (char *)buf) {
          free(v38);
        }
      }
      if (v8 > v9) {
        self->_lastTimedScanningStartTime = v7;
      }
      self->_lastRecoveryTimedScanningStartTime = v7;
      self->_nonAopPolicyIsScanning = 1;
      [(CLGatheringBluetoothScanner *)self->_gascanner startDeviceDiscovery];
      [(CLGatheringBluetoothScannerDelegate *)[(CLGatheringBluetoothScanner *)self->_gascanner delegate] markScanStartTimeFromBoot:a3 withReason:[(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] scanDutyCycle] withRate:v7];
      id timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
      if (timeoutDiscoveryBlock)
      {
        if (!dispatch_block_testcancel(timeoutDiscoveryBlock))
        {
          if (qword_1024194B0 != -1) {
            dispatch_once(&qword_1024194B0, &stru_1022F15B0);
          }
          v31 = qword_1024194B8;
          if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
          {
            id v32 = self->_timeoutDiscoveryBlock;
            *(_DWORD *)buf = 138412290;
            int64_t v52 = (int64_t)v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "_start dispatch_block_cancel %@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024194B0 != -1) {
              dispatch_once(&qword_1024194B0, &stru_1022F15B0);
            }
            id v40 = self->_timeoutDiscoveryBlock;
            int v43 = 138412290;
            int64_t v44 = (int64_t)v40;
            v41 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v41);
            if (v41 != (char *)buf) {
              free(v41);
            }
          }
          dispatch_block_cancel(self->_timeoutDiscoveryBlock);
        }
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F15B0);
        }
        v33 = qword_1024194B8;
        if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "invalidating timeout discovery block", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024194B0 != -1) {
            dispatch_once(&qword_1024194B0, &stru_1022F15B0);
          }
          LOWORD(v43) = 0;
          v39 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v39);
          if (v39 != (char *)buf) {
            free(v39);
          }
        }

        self->_id timeoutDiscoveryBlock = 0;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100CB1280;
      block[3] = &unk_10229FED8;
      block[4] = self;
      self->_id timeoutDiscoveryBlock = dispatch_block_create((dispatch_block_flags_t)0, block);
      dispatch_time_t v34 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      dispatch_after(v34, (dispatch_queue_t)[(CLGatheringBluetoothClient *)self queue], self->_timeoutDiscoveryBlock);
    }
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    unsigned __int8 v4 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v52 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "_startTimedScanningWithReason with unknown reason %ld!", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      int v43 = 134217984;
      int64_t v44 = a3;
      objc_super v5 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n");
LABEL_32:
      if (v5 != buf) {
        free(v5);
      }
    }
  }
}

- (void)_stopScanningWithReason:(int64_t)a3
{
  double v5 = sub_10016C458();
  id timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
  if (timeoutDiscoveryBlock)
  {
    if (!dispatch_block_testcancel(self->_timeoutDiscoveryBlock))
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      double v7 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
      {
        id v8 = self->_timeoutDiscoveryBlock;
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "_stop dispatch_block_cancel %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F15B0);
        }
        uint64_t v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _stopScanningWithReason:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      dispatch_block_cancel(self->_timeoutDiscoveryBlock);
      id timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
    }

    self->_id timeoutDiscoveryBlock = 0;
  }
  if (self->_nonAopPolicyIsScanning)
  {
    double lastRecoveryTimedScanningStartTime = self->_lastRecoveryTimedScanningStartTime;
    if (lastRecoveryTimedScanningStartTime <= self->_lastTimedScanningStartTime) {
      double lastRecoveryTimedScanningStartTime = self->_lastTimedScanningStartTime;
    }
    self->_double cumulativeObservationDuration = self->_cumulativeObservationDuration
                                         + v5
                                         - lastRecoveryTimedScanningStartTime;
    self->_nonAopPolicyIsScanning = 0;
  }
  [(CLGatheringBluetoothScannerDelegate *)[(CLGatheringBluetoothScanner *)self->_gascanner delegate] markScanEndTimeFromBoot:a3 withReason:self->_scanningWithAop withPolicy:v5];
  [(CLGatheringBluetoothScanner *)self->_gascanner stopDeviceDiscovery];
}

- (void)_startAdvertising
{
  int64_t v3 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] advertisePeriod];
  uint64_t v4 = v3;
  if ((int)v3 > 39)
  {
    if ((int)v3 <= 44)
    {
      if (v3 == 40)
      {
        double v5 = "Medium";
        goto LABEL_25;
      }
      if (v3 == 42)
      {
        double v5 = "MediumMid";
        goto LABEL_25;
      }
    }
    else
    {
      switch(v3)
      {
        case '-':
          double v5 = "MediumHigh";
          goto LABEL_25;
        case '2':
          double v5 = "High";
          goto LABEL_25;
        case '<':
          double v5 = "Max";
          goto LABEL_25;
      }
    }
  }
  else if ((int)v3 <= 14)
  {
    if (!v3)
    {
      double v5 = "Default";
      goto LABEL_25;
    }
    if (v3 == 10)
    {
      double v5 = "Periodic";
      goto LABEL_25;
    }
  }
  else
  {
    switch(v3)
    {
      case 0xF:
        double v5 = "PeriodicHigh";
        goto LABEL_25;
      case 0x14:
        double v5 = "Background";
        goto LABEL_25;
      case 0x1E:
        double v5 = "Low";
        goto LABEL_25;
    }
  }
  double v5 = "?";
LABEL_25:
  if (!strcmp(v5, "?"))
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    v6 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)BOOL v17 = v4;
      *(_WORD *)&v17[4] = 2080;
      *(void *)&v17[6] = "Background";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "advertisePeriod %d not recognised, defaulting to %s", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _startAdvertising]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    uint64_t v4 = 20;
  }
  if (self->_advertiser
    || ![(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] advertiseEnabled])
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    id v8 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      advertiser = self->_advertiser;
      unsigned int v10 = [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] advertiseEnabled];
      BOOL bluetoothIsON = self->_bluetoothIsON;
      BOOL iCloudSignedIn = self->_iCloudSignedIn;
      *(_DWORD *)buf = 138413058;
      *(void *)BOOL v17 = advertiser;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = v10;
      __int16 v18 = 1024;
      BOOL v19 = bluetoothIsON;
      __int16 v20 = 1024;
      BOOL v21 = iCloudSignedIn;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "did not _startAdvertising: advertiser %@ s.advertiseEnabled %d _bluetoothIsON %d _iCloudSignedIn %d", buf, 0x1Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      [(CLGatheringSettings *)[(CLGatheringBluetoothClient *)self settings] advertiseEnabled];
      double v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startAdvertising]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    double v7 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_startAdvertising", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      double v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startAdvertising]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    self->_advertiser = (CBAdvertiser *)objc_alloc_init((Class)CBAdvertiser);
    [(CBAdvertiser *)self->_advertiser setDispatchQueue:[(CLGatheringBluetoothClient *)self queue]];
    [(CBAdvertiser *)self->_advertiser setAdvertiseRate:v4];
    [(CBAdvertiser *)self->_advertiser setNearbyInfoV2DecryptedFlags:2];
    [(CBAdvertiser *)self->_advertiser setUseCase:0x80000];
    [(CBAdvertiser *)self->_advertiser activateWithCompletion:&stru_1022F1590];
  }
}

- (void)_stopAdvertising
{
  if (self->_advertiser)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    int64_t v3 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_stopAdvertising", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      double v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _stopAdvertising]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    [(CBAdvertiser *)self->_advertiser invalidate];

    self->_advertiser = 0;
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    uint64_t v4 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "did not _stopAdvertising (null)", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _stopAdvertising]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (BOOL)_isSignedIn
{
  id v2 = +[ACAccountStore defaultStore];
  id v3 = [v2 aa_primaryAppleAccount];
  if (v3)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    uint64_t v4 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = [v2 aa_primaryAppleAccount];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_isSignedIn: aa_primaryAppleAccount %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      return v3 != 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    [v2 aa_primaryAppleAccount];
    double v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _isSignedIn]", "%s\n", v5);
    if (v5 == (char *)buf) {
      return v3 != 0;
    }
LABEL_20:
    free(v5);
    return v3 != 0;
  }
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  v6 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_isSignedIn: NO", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    double v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _isSignedIn]", "%s\n", v5);
    if (v5 != (char *)buf) {
      goto LABEL_20;
    }
  }
  return v3 != 0;
}

- (void)_installICloudMonitor
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_installICloudMonitor", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    double v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installICloudMonitor]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v4 addObserver:self selector:"_accountStoreDidChange:" name:ACDAccountStoreDidChangeNotification object:0];
}

- (void)_cancelICloudMonitor
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_cancelICloudMonitor", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelICloudMonitor]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)_accountStoreDidChange:(id)a3
{
  id v5 = [a3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:ACAccountIdentifierKey];
  id v7 = [a3 userInfo];
  id v8 = [v7 objectForKeyedSubscript:ACAccountTypeIdentifierKey];
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v9 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "_accountStoreDidChange: accountIdentifier %@ accountTypeIdentifier %@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    double v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _accountStoreDidChange:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if ([v8 isEqualToString:ACAccountTypeIdentifierAppleAccount])
  {
    BOOL v10 = [(CLGatheringBluetoothClient *)self _isSignedIn];
    if (self->_iCloudSignedIn == v10)
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      __int16 v11 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "no change to iCloud sign in status - skip updating", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F15B0);
        }
        id v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _accountStoreDidChange:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
    }
    else
    {
      self->_BOOL iCloudSignedIn = v10;
      if (v10) {
        [(CLGatheringBluetoothClient *)self run];
      }
      else {
        [(CLGatheringBluetoothClient *)self stop];
      }
    }
  }
}

- (void)_armPeriodicScanTimer
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_armPeriodicScanTimer", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    __int16 v9 = 0;
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _armPeriodicScanTimer]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (!self->_periodicScanTimer)
  {
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[(CLGatheringBluetoothClient *)self queue]);
    self->_periodicScanTimer = v4;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100CB2C30;
    handler[3] = &unk_10229FED8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
    periodicScanTimer = self->_periodicScanTimer;
    dispatch_time_t v6 = dispatch_time(0x8000000000000000, 1000000000);
    dispatch_source_set_timer(periodicScanTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_periodicScanTimer);
  }
}

- (void)_cancelPeriodicScanTimer
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_cancelPeriodicScanTimer", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelPeriodicScanTimer]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  periodicScanTimer = self->_periodicScanTimer;
  if (periodicScanTimer)
  {
    dispatch_source_cancel(periodicScanTimer);

    self->_periodicScanTimer = 0;
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v5 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v12 = (const __CFString *)[a3 state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "centralManagerDidUpdateState %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    [a3 state];
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient centralManagerDidUpdateState:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  BOOL v6 = [a3 state] == (id)5;
  if (self->_bluetoothIsON != v6)
  {
    self->_BOOL bluetoothIsON = v6;
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    id v7 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_bluetoothIsON) {
        CFStringRef v8 = @"On";
      }
      else {
        CFStringRef v8 = @"Off";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth state changed to %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      BOOL v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient centralManagerDidUpdateState:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (self->_bluetoothIsON) {
      [(CLGatheringBluetoothClient *)self run];
    }
    else {
      [(CLGatheringBluetoothClient *)self stop];
    }
  }
}

- (void)_installScreenWakeMonitor
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_installScreenWakeMonitor", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    __int16 v6 = 0;
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installScreenWakeMonitor]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if (!self->_backlightLevelToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100CB33D0;
    handler[3] = &unk_1022B4250;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_backlightLevelToken, (dispatch_queue_t)[(CLGatheringBluetoothClient *)self queue], handler);
  }
}

- (void)_cancelExistingStopScanningBlock
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_cancelExistingStopScanningBlock", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelExistingStopScanningBlock]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  id stopScanningBlock = self->_stopScanningBlock;
  if (stopScanningBlock)
  {
    dispatch_block_cancel(stopScanningBlock);

    self->_id stopScanningBlock = 0;
  }
}

- (void)_cancelScreenWakeMonitor
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_cancelScreenWakeMonitor", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelScreenWakeMonitor]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  int backlightLevelToken = self->_backlightLevelToken;
  if (backlightLevelToken)
  {
    notify_cancel(backlightLevelToken);
    self->_int backlightLevelToken = 0;
  }
}

- (void)_installApSleepWakeCallBack
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_installApSleepWakeCallBack", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    CFStringRef v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installApSleepWakeCallBack]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (self->_notifyPortRef)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    uint64_t v4 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_notifyPortRef is not NULL", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      id v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installApSleepWakeCallBack]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  else
  {
    io_connect_t v6 = IORegisterForSystemPower(self, &self->_notifyPortRef, (IOServiceInterestCallback)sub_100CB4224, &self->_notifierObject);
    self->_rootDomainConnect = v6;
    if (v6)
    {
      IONotificationPortSetDispatchQueue(self->_notifyPortRef, (dispatch_queue_t)[(CLGatheringBluetoothClient *)self queue]);
    }
    else
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      id v7 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "IORegisterForSystemPower failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F15B0);
        }
        __int16 v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _installApSleepWakeCallBack]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      [(CLGatheringBluetoothClient *)self _cancelApSleepWakeCallBack];
    }
  }
}

- (void)_cancelApSleepWakeCallBack
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F15B0);
  }
  id v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_cancelApSleepWakeCallBack", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (self->_notifierObject)
  {
    IODeregisterForSystemPower(&self->_notifierObject);
    self->_notifierObject = 0;
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    uint64_t v4 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_notifierObject is NULL", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      BOOL v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  io_connect_t rootDomainConnect = self->_rootDomainConnect;
  if (rootDomainConnect)
  {
    IOServiceClose(rootDomainConnect);
    self->_io_connect_t rootDomainConnect = 0;
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    io_connect_t v6 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_rootDomainConnect is NULL", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      __int16 v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  notifyPortRef = self->_notifyPortRef;
  if (notifyPortRef)
  {
    IONotificationPortSetDispatchQueue(notifyPortRef, 0);
    IONotificationPortDestroy(self->_notifyPortRef);
    self->_notifyPortRef = 0;
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F15B0);
    }
    CFStringRef v8 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_notifyPortRef is NULL", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F15B0);
      }
      CFStringRef v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (void)setQueue:(id)a3
{
}

- (CLGatheringSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  self->_settings = (CLGatheringSettings *)a3;
}

@end