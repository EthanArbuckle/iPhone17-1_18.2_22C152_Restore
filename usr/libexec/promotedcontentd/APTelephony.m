@interface APTelephony
+ (id)connectionTypeToString:(int64_t)a3;
+ (id)telephony;
- (APReachability)reachability;
- (APTelephony)init;
- (APUnfairLock)lock;
- (BOOL)deviceIsLocked;
- (BOOL)networkDataValid;
- (BOOL)networkInfoUpdatingInProgress;
- (BOOL)telephonyDataValid;
- (CTXPCServiceSubscriptionContext)ctSubscriptionContext;
- (CoreTelephonyClient)ctClient;
- (NSError)networkError;
- (NSError)telephonyError;
- (NSNumber)latestCellularSignalStrength;
- (NSNumber)signalStrength;
- (OS_dispatch_queue)queue;
- (id)disableTelephonyMethod;
- (int64_t)dataIndicatorToConnectionType:(int)a3;
- (int64_t)networkType;
- (void)_deviceLockStateChanged;
- (void)_resumeTelephonyAndReachability;
- (void)_startMonitoringTelephony;
- (void)_suspendTelephonyAndReachability;
- (void)preferredDataSimChanged:(id)a3;
- (void)reachabilityChanged:(int64_t)a3;
- (void)setCtClient:(id)a3;
- (void)setCtSubscriptionContext:(id)a3;
- (void)setDeviceIsLocked:(BOOL)a3;
- (void)setDisableTelephonyMethod:(id)a3;
- (void)setLatestCellularSignalStrength:(id)a3;
- (void)setLock:(id)a3;
- (void)setNetworkError:(id)a3;
- (void)setNetworkInfoUpdatingInProgress:(BOOL)a3;
- (void)setNetworkType:(int64_t)a3;
- (void)setReachability:(id)a3;
- (void)setTelephonyError:(id)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)updateCellularSignalStrength;
- (void)updateTelephonyProperties;
@end

@implementation APTelephony

+ (id)telephony
{
  if (qword_100289720 != -1) {
    dispatch_once(&qword_100289720, &stru_100234AB0);
  }
  v2 = (void *)qword_100289718;

  return v2;
}

- (APTelephony)init
{
  v22.receiver = self;
  v22.super_class = (Class)APTelephony;
  v2 = [(APTelephony *)&v22 init];
  v3 = v2;
  if (v2)
  {
    v2->_networkType = -1;
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ap.promotedcontentd.telephony-networking", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    dword_100289728 = -1;
    v3->_deviceIsLocked = MKBGetDeviceLockState() != 0;
    v7 = v3->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100083484;
    handler[3] = &unk_100234AD8;
    v8 = v3;
    v21 = v8;
    uint32_t v9 = notify_register_dispatch("com.apple.springboard.lockstate", &dword_100289728, v7, handler);
    if (v9)
    {
      uint32_t v10 = v9;
      v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138478083;
        v24 = v12;
        __int16 v25 = 1026;
        uint32_t v26 = v10;
        id v13 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to register for lockstate notification - error %{public}d", buf, 0x12u);
      }
    }
    v14 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    lock = v8->_lock;
    v8->_lock = v14;

    v16 = [[APReachability alloc] initWithDelegate:v8];
    reachability = v8->_reachability;
    v8->_reachability = v16;

    [(APTelephony *)v8 _startMonitoringTelephony];
    v18 = [(APTelephony *)v8 reachability];
    [v18 startMonitoring];
  }
  return v3;
}

- (BOOL)networkDataValid
{
  v2 = self;
  v3 = [(APTelephony *)self lock];
  [v3 lock];
  LOBYTE(v2) = v2->_networkError == 0;
  [v3 unlock];

  return (char)v2;
}

- (NSNumber)signalStrength
{
  v3 = [(APTelephony *)self lock];
  [v3 lock];
  if ((id)[(APTelephony *)self networkType] == (id)1)
  {
    [v3 unlock];
    v4 = &off_1002490E0;
  }
  else
  {
    dispatch_queue_t v5 = [(APTelephony *)self ctClient];

    if (v5)
    {
      v6 = [(APTelephony *)self latestCellularSignalStrength];
      [v3 unlock];
      if (!v6) {
        [(APTelephony *)self updateCellularSignalStrength];
      }
      v4 = [(APTelephony *)self latestCellularSignalStrength];
    }
    else
    {
      [v3 unlock];
      v4 = [(APTelephony *)self latestCellularSignalStrength];
    }
  }

  return (NSNumber *)v4;
}

- (BOOL)telephonyDataValid
{
  v2 = self;
  v3 = [(APTelephony *)self lock];
  [v3 lock];
  v4 = [(APTelephony *)v2 telephonyError];
  LOBYTE(v2) = v4 == 0;

  [v3 unlock];
  return (char)v2;
}

- (void)_startMonitoringTelephony
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_1000836E4;
  v7 = &unk_100234B00;
  objc_copyWeak(&v8, &location);
  dispatch_async(queue, &v4);
  [(APTelephony *)self updateTelephonyProperties];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)reachabilityChanged:(int64_t)a3
{
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "APTelephony notification from reachability: new network type = %ld", buf, 0xCu);
  }

  uint64_t v6 = -1;
  if ((a3 & 2) != 0) {
    uint64_t v6 = 1;
  }
  if (a3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  [(APTelephony *)self setNetworkType:v7];
  if (![(APTelephony *)self networkInfoUpdatingInProgress])
  {
    [(APTelephony *)self setNetworkInfoUpdatingInProgress:1];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    uint32_t v9 = [(APTelephony *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100083974;
    block[3] = &unk_100234B00;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dispatch_time_t v8 = [(APTelephony *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083ADC;
  block[3] = &unk_100234B28;
  objc_copyWeak(&v12, &location);
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(APTelephony *)self lock];
  [v5 lock];
  [(APTelephony *)self setCtSubscriptionContext:v4];

  [v5 unlock];
}

- (void)updateCellularSignalStrength
{
  v3 = [(APTelephony *)self lock];
  [v3 lock];
  uint64_t v4 = [(APTelephony *)self ctClient];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(APTelephony *)self ctSubscriptionContext];

    if (v6)
    {
      id v7 = [(APTelephony *)self ctClient];
      dispatch_time_t v8 = [(APTelephony *)self ctSubscriptionContext];
      id v22 = 0;
      id v9 = [v7 getSignalStrengthInfo:v8 error:&v22];
      id v10 = v22;

      if (v10)
      {
        id v11 = APLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v12 = "Unable to retrieve CT signal strength.";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
        }
      }
      else
      {
        [(APTelephony *)self setTelephonyError:0];
        v14 = [v9 maxDisplayBars];
        [v14 doubleValue];
        double v16 = v15;

        v17 = [v9 bars];
        [v17 doubleValue];
        double v19 = v18;

        if (v16 > 0.0)
        {
          v20 = +[NSNumber numberWithUnsignedInteger:vcvtad_u64_f64(v19 / v16 * 100.0)];
          [(APTelephony *)self setLatestCellularSignalStrength:v20];

          id v11 = APLogForCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v21 = [(APTelephony *)self latestCellularSignalStrength];
            *(_DWORD *)buf = 138543362;
            v24 = v21;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Update latest signal strength to %{public}@.", buf, 0xCu);
          }
          goto LABEL_15;
        }
        id v11 = APLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v12 = "Unable to retrieve CT signal strength because maxBars is 0.";
          goto LABEL_14;
        }
      }
LABEL_15:

      [v3 unlock];
      goto LABEL_16;
    }
  }
  int64_t v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CoreTelephony client or CoreTelephonySubScriptionContext is not created.", buf, 2u);
  }

  [v3 unlock];
LABEL_16:
}

- (void)updateTelephonyProperties
{
  objc_initWeak(&location, self);
  v3 = [(APTelephony *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000840A4;
  v4[3] = &unk_100234B00;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (int64_t)dataIndicatorToConnectionType:(int)a3
{
  if (a3 > 0xF) {
    return -1;
  }
  else {
    return qword_1001D6F58[a3];
  }
}

+ (id)connectionTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return @"Unknown";
  }
  else {
    return off_100234B48[a3];
  }
}

- (void)_deviceLockStateChanged
{
  if (dword_100289728 == -1)
  {
    v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Device lock notify token is invalid (expected if running in the simulator)", buf, 2u);
    }
  }
  else
  {
    uint64_t state64 = 0;
    notify_get_state(dword_100289728, &state64);
    BOOL v3 = state64 == 0;
    if (((v3 ^ [(APTelephony *)self deviceIsLocked]) & 1) == 0)
    {
      [(APTelephony *)self setDeviceIsLocked:state64 != 0];
      uint64_t v4 = APLogForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        unsigned int v5 = [(APTelephony *)self deviceIsLocked];
        CFStringRef v6 = @"unlocked";
        if (v5) {
          CFStringRef v6 = @"locked";
        }
        *(_DWORD *)buf = 138543362;
        CFStringRef v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Device lock state changed to %{public}@. Queuing attempt to toggle Telephony and Reachability.", buf, 0xCu);
      }

      id v7 = [(APTelephony *)self disableTelephonyMethod];

      if (v7)
      {
        dispatch_time_t v8 = [(APTelephony *)self disableTelephonyMethod];
        dispatch_block_cancel(v8);
      }
      if ([(APTelephony *)self deviceIsLocked])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100084764;
        v15[3] = &unk_100233D50;
        v15[4] = self;
        dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v15);
        [(APTelephony *)self setDisableTelephonyMethod:v9];

        id v10 = APLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67240192;
          LODWORD(v18) = 30;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Disabling telephony and reachability in %{public}d seconds", buf, 8u);
        }

        dispatch_time_t v11 = dispatch_time(0, 30000000000);
        id v12 = [(APTelephony *)self queue];
        int64_t v13 = [(APTelephony *)self disableTelephonyMethod];
        dispatch_after(v11, v12, v13);
      }
      else
      {
        [(APTelephony *)self _resumeTelephonyAndReachability];
      }
    }
  }
}

- (void)_suspendTelephonyAndReachability
{
  BOOL v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Suspending Telephony and Reachability callbacks", v6, 2u);
  }

  uint64_t v4 = [(APTelephony *)self ctClient];
  [v4 setDelegate:0];

  [(APTelephony *)self setCtClient:0];
  unsigned int v5 = [(APTelephony *)self reachability];
  [v5 stopMonitoring];
}

- (void)_resumeTelephonyAndReachability
{
  BOOL v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Resuming Telephony and Reachability.", v5, 2u);
  }

  [(APTelephony *)self _startMonitoringTelephony];
  uint64_t v4 = [(APTelephony *)self reachability];
  [v4 startMonitoring];
}

- (int64_t)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int64_t)a3
{
  self->_networkType = a3;
}

- (NSNumber)latestCellularSignalStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLatestCellularSignalStrength:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCtClient:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)ctSubscriptionContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCtSubscriptionContext:(id)a3
{
}

- (NSError)networkError
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNetworkError:(id)a3
{
}

- (NSError)telephonyError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTelephonyError:(id)a3
{
}

- (BOOL)networkInfoUpdatingInProgress
{
  return self->_networkInfoUpdatingInProgress;
}

- (void)setNetworkInfoUpdatingInProgress:(BOOL)a3
{
  self->_networkInfoUpdatingInProgress = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (BOOL)deviceIsLocked
{
  return self->_deviceIsLocked;
}

- (void)setDeviceIsLocked:(BOOL)a3
{
  self->_deviceIsLocked = a3;
}

- (id)disableTelephonyMethod
{
  return self->_disableTelephonyMethod;
}

- (void)setDisableTelephonyMethod:(id)a3
{
}

- (APReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong(&self->_disableTelephonyMethod, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyError, 0);
  objc_storeStrong((id *)&self->_networkError, 0);
  objc_storeStrong((id *)&self->_ctSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);

  objc_storeStrong((id *)&self->_latestCellularSignalStrength, 0);
}

@end