@interface MBBackgroundRestoreProgressMonitor
- (BOOL)_firePromptForCellular;
- (BOOL)_isContinuouslyThermallyThrottled;
- (MBBackgroundRestoreProgressMonitor)initWithAccount:(id)a3 serviceManager:(id)a4 thermalPressureMonitor:(id)a5 snapshotUUID:(id)a6;
- (MBBackgroundRestoreSizeEstimator)estimator;
- (MBCKManager)serviceManager;
- (MBRestoreNetworkAccessPrompt)restoreNetworkAccessPrompt;
- (MBServiceAccount)account;
- (MBThermalPressureMonitor)thermalPressureMonitor;
- (NSDate)dateOfThermalThrottleStart;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)followUpTimer;
- (OS_dispatch_source)networkAccessTimer;
- (OS_dispatch_source)setupAssistantTimer;
- (OS_dispatch_source)telemetryHeartBeatTimer;
- (unint64_t)estimatedBackgroundRestoreSizeWithError:(id *)a3;
- (void)_cancel;
- (void)_cancelBackgroundRestoreCellularAccessChangedNotification;
- (void)_cancelMonitoringForSetupAssistantFinished;
- (void)_cancelNetworkAccessTimer;
- (void)_cancelRestoreInProgressFollowUpTimer;
- (void)_cancelRestoreTelemetryHeartbeatTimer;
- (void)_cancelThermalPressureNotifications;
- (void)_clearRestoreInProgressFollowUp;
- (void)_firePromptForWiFi;
- (void)_handleCellularAccessChangedNotification;
- (void)_handleNetworkAccessTimer;
- (void)_postRestoreInProgressFollowUpWithReason:(id)a3;
- (void)_postRestoreTelemetryHeartbeat;
- (void)_registerForBackgroundRestoreCellularAccessChangedNotification;
- (void)_registerForThermalPressureNotifications;
- (void)_setupAssistantDidFinish;
- (void)_startMonitoringForSetupAssistantFinished;
- (void)_startNetworkAccessTimer;
- (void)_startRestoreInProgressFollowUpTimer;
- (void)_startRestoreTelemetryHeartbeatTimer;
- (void)cancel;
- (void)dealloc;
- (void)handleNetworkPathUpdateWithType:(int)a3 state:(id)a4;
- (void)setAccount:(id)a3;
- (void)setDateOfThermalThrottleStart:(id)a3;
- (void)setEstimator:(id)a3;
- (void)setFollowUpTimer:(id)a3;
- (void)setNetworkAccessTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRestoreNetworkAccessPrompt:(id)a3;
- (void)setSetupAssistantTimer:(id)a3;
- (void)setTelemetryHeartBeatTimer:(id)a3;
- (void)start;
- (void)thermalPressureLevelDidChange:(id)a3;
@end

@implementation MBBackgroundRestoreProgressMonitor

- (MBBackgroundRestoreProgressMonitor)initWithAccount:(id)a3 serviceManager:(id)a4 thermalPressureMonitor:(id)a5 snapshotUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12) {
    __assert_rtn("-[MBBackgroundRestoreProgressMonitor initWithAccount:serviceManager:thermalPressureMonitor:snapshotUUID:]", "MBBackgroundRestoreProgressMonitor.m", 61, "serviceManager");
  }
  v15 = v14;
  v29.receiver = self;
  v29.super_class = (Class)MBBackgroundRestoreProgressMonitor;
  v16 = [(MBBackgroundRestoreProgressMonitor *)&v29 init];
  v17 = v16;
  if (v16)
  {
    atomic_store(0, (unsigned __int8 *)&v16->_setupAssistantFinished);
    atomic_store(0, (unsigned __int8 *)&v16->_cancelled);
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeWeak((id *)&v17->_serviceManager, v12);
    uint64_t v18 = objc_opt_new();
    restoreNetworkAccessPrompt = v17->_restoreNetworkAccessPrompt;
    v17->_restoreNetworkAccessPrompt = (MBRestoreNetworkAccessPrompt *)v18;

    v20 = [[MBBackgroundRestoreSizeEstimator alloc] initWithAccount:v11 serviceManager:v12 snapshotUUID:v15];
    estimator = v17->_estimator;
    v17->_estimator = v20;

    *(void *)&v17->_cellularAccessToken = -1;
    v17->_wasThermallyThrottled = 0;
    v22 = (objc_class *)objc_opt_class();
    Name = class_getName(v22);
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v26 = dispatch_queue_create(Name, v25);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v17->_thermalPressureMonitor, a5);
  }

  return v17;
}

- (void)dealloc
{
  [(MBBackgroundRestoreProgressMonitor *)self _cancel];
  v3.receiver = self;
  v3.super_class = (Class)MBBackgroundRestoreProgressMonitor;
  [(MBBackgroundRestoreProgressMonitor *)&v3 dealloc];
}

- (void)_cancel
{
  [(MBBackgroundRestoreProgressMonitor *)self _cancelMonitoringForSetupAssistantFinished];
  [(MBBackgroundRestoreProgressMonitor *)self _cancelBackgroundRestoreCellularAccessChangedNotification];
  [(MBBackgroundRestoreProgressMonitor *)self _cancelNetworkAccessTimer];
  [(MBBackgroundRestoreProgressMonitor *)self _cancelThermalPressureNotifications];
  [(MBBackgroundRestoreProgressMonitor *)self _cancelRestoreInProgressFollowUpTimer];
  [(MBBackgroundRestoreProgressMonitor *)self _cancelRestoreTelemetryHeartbeatTimer];
}

- (void)cancel
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_cancelled, 1u) & 1) == 0)
  {
    objc_super v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling background restore progress monitor", buf, 2u);
      _MBLog();
    }

    [(MBBackgroundRestoreProgressMonitor *)self _clearRestoreInProgressFollowUp];
    v4 = [(MBBackgroundRestoreProgressMonitor *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FEF54;
    block[3] = &unk_100411128;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)start
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting background restore progress monitor", buf, 2u);
    _MBLog();
  }

  v4 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FF040;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_startMonitoringForSetupAssistantFinished
{
  objc_super v3 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancelled);
  if ((v4 & 1) == 0)
  {
    v5 = [(MBBackgroundRestoreProgressMonitor *)self queue];
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

    dispatch_time_t v7 = dispatch_time(0, 0);
    dispatch_source_set_timer(v6, v7, 0x6FC23AC00uLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001FF2BC;
    handler[3] = &unk_100411128;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    [(MBBackgroundRestoreProgressMonitor *)self setSetupAssistantTimer:v6];
    dispatch_resume(v6);
    id v8 = BYSetupAssistantFinishedDarwinNotification;
    v9 = (const char *)[v8 UTF8String];
    p_setupAssistantFinishedToken = &self->_setupAssistantFinishedToken;
    id v11 = [(MBBackgroundRestoreProgressMonitor *)self queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001FF34C;
    v15[3] = &unk_1004166A0;
    id v12 = v8;
    id v16 = v12;
    v17 = self;
    uint32_t v13 = notify_register_dispatch(v9, &self->_setupAssistantFinishedToken, v11, v15);

    if (v13)
    {
      int *p_setupAssistantFinishedToken = -1;
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v20 = v12;
        __int16 v21 = 1024;
        uint32_t v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}@) failed: %u", buf, 0x12u);
        _MBLog();
      }
    }
  }
}

- (void)_cancelMonitoringForSetupAssistantFinished
{
  int setupAssistantFinishedToken = self->_setupAssistantFinishedToken;
  self->_int setupAssistantFinishedToken = -1;
  if (setupAssistantFinishedToken != -1) {
    notify_cancel(setupAssistantFinishedToken);
  }
  source = [(MBBackgroundRestoreProgressMonitor *)self setupAssistantTimer];
  [(MBBackgroundRestoreProgressMonitor *)self setSetupAssistantTimer:0];
  unsigned __int8 v4 = source;
  if (source)
  {
    dispatch_source_cancel(source);
    unsigned __int8 v4 = source;
  }
}

- (void)_setupAssistantDidFinish
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_setupAssistantFinished, 1u) & 1) == 0)
  {
    if (MBIsInternalInstall())
    {
      objc_super v3 = [(MBServiceAccount *)self->_account persona];
      +[MBRestoreCloudFormatPolicy promptTTRIfLightrailRestoreFailed:v3];
    }
    [(MBBackgroundRestoreProgressMonitor *)self _cancelMonitoringForSetupAssistantFinished];
    unsigned __int8 v4 = [(MBBackgroundRestoreProgressMonitor *)self serviceManager];
    if (!v4) {
      __assert_rtn("-[MBBackgroundRestoreProgressMonitor _setupAssistantDidFinish]", "MBBackgroundRestoreProgressMonitor.m", 161, "serviceManager");
    }
    v5 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001FF598;
    v6[3] = &unk_1004166F0;
    v6[4] = self;
    [v4 fetchNetworkConnectivityWithBlock:v6];
  }
}

- (void)handleNetworkPathUpdateWithType:(int)a3 state:(id)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_setupAssistantFinished);
  if (v4)
  {
    id v8 = [(MBBackgroundRestoreProgressMonitor *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001FF818;
    v9[3] = &unk_100412A88;
    int v10 = a3;
    $294CB042FB18EDF8FD74FDF4F765ED39 v11 = a4;
    v9[4] = self;
    dispatch_async(v8, v9);
  }
}

- (void)_cancelNetworkAccessTimer
{
  objc_super v3 = [(MBBackgroundRestoreProgressMonitor *)self restoreNetworkAccessPrompt];
  [v3 cancel];

  unsigned __int8 v4 = self->_networkAccessTimer;
  networkAccessTimer = self->_networkAccessTimer;
  self->_networkAccessTimer = 0;

  if (v4)
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cancelling prompt timer", v7, 2u);
      _MBLog();
    }

    dispatch_source_cancel((dispatch_source_t)v4);
  }
}

- (void)_startNetworkAccessTimer
{
  objc_super v3 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MBBackgroundRestoreProgressMonitor *)self _cancelNetworkAccessTimer];
  unsigned __int8 v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting prompt timer", (uint8_t *)buf, 2u);
    _MBLog();
  }

  v5 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001FFB64;
  handler[3] = &unk_100413770;
  objc_copyWeak(&v11, buf);
  dispatch_source_set_event_handler(v6, handler);
  networkAccessTimer = self->_networkAccessTimer;
  self->_networkAccessTimer = (OS_dispatch_source *)v6;
  v9 = v6;

  dispatch_resume(v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

- (void)_handleNetworkAccessTimer
{
  objc_super v3 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MBBackgroundRestoreProgressMonitor *)self _cancelNetworkAccessTimer];
  unsigned __int8 v4 = [(MBBackgroundRestoreProgressMonitor *)self serviceManager];
  if (!v4) {
    __assert_rtn("-[MBBackgroundRestoreProgressMonitor _handleNetworkAccessTimer]", "MBBackgroundRestoreProgressMonitor.m", 236, "serviceManager");
  }
  v5 = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001FFCDC;
  v6[3] = &unk_1004166F0;
  v6[4] = self;
  [v4 fetchNetworkConnectivityWithBlock:v6];
}

- (void)_firePromptForWiFi
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  if ((v2 & 1) == 0)
  {
    unsigned __int8 v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to fire WiFi prompt", v6, 2u);
      _MBLog();
    }

    v5 = [(MBBackgroundRestoreProgressMonitor *)self restoreNetworkAccessPrompt];
    [v5 fireWiFiPromptWithCompletion:&stru_100416730];
  }
}

- (BOOL)_firePromptForCellular
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  if ((v2 & 1) == 0)
  {
    unsigned __int8 v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to fire cellular prompt", buf, 2u);
      _MBLog();
    }

    v5 = [(MBBackgroundRestoreProgressMonitor *)self account];
    v6 = v5;
    if (!v5)
    {
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No primary account found, skipping prompt", buf, 2u);
        _MBLog();
      }
      unsigned __int8 v10 = 0;
      goto LABEL_27;
    }
    dispatch_time_t v7 = [v5 persona];
    id v8 = [v7 copyPreferencesValueForKey:@"BackgroundCellularAccessConfirmationDate" class:objc_opt_class()];

    if (v8)
    {
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "The background restore cellular access was already confirmed on:%@, skipping prompt", buf, 0xCu);
        _MBLog();
      }
      unsigned __int8 v10 = 0;
      goto LABEL_26;
    }
    id v11 = [v6 persona];
    v9 = [v11 copyPreferencesValueForKey:@"BackgroundRestoreCellularAccess" class:objc_opt_class()];

    if (v9)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found existing background restore cellular access:%@, skipping prompt", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      uint32_t v13 = [(MBBackgroundRestoreProgressMonitor *)self estimator];
      id v25 = 0;
      id v14 = [v13 estimatedBackgroundRestoreSizeWithError:&v25];
      id v12 = v25;

      v15 = MBGetDefaultLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412290;
          v27 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error when estimating background restore size:%@", buf, 0xCu);
          _MBLog();
        }

        unsigned __int8 v10 = +[MBError isError:v12 withCode:17];
        goto LABEL_25;
      }
      if (v16)
      {
        *(_DWORD *)buf = 134217984;
        v27 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received size estimate of %llu for background restore", buf, 0xCu);
        _MBLog();
      }

      uint64_t v17 = [(MBBackgroundRestoreProgressMonitor *)self serviceManager];
      if (!v17) {
        __assert_rtn("-[MBBackgroundRestoreProgressMonitor _firePromptForCellular]", "MBBackgroundRestoreProgressMonitor.m", 307, "serviceManager");
      }
      uint64_t v18 = (void *)v17;
      v19 = [(MBBackgroundRestoreProgressMonitor *)self restoreNetworkAccessPrompt];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1002005B4;
      v22[3] = &unk_100416758;
      id v23 = v18;
      id v24 = v6;
      id v20 = v18;
      [v19 fireCellularPromptWithEstimate:v14 completion:v22];

      id v12 = 0;
    }
    unsigned __int8 v10 = 0;
LABEL_25:

LABEL_26:
LABEL_27:

    return v10;
  }
  return 0;
}

- (void)_registerForBackgroundRestoreCellularAccessChangedNotification
{
  objc_initWeak(&location, self);
  self->_cellularAccessToken = -1;
  objc_super v3 = (const char *)[kMBBackgroundRestoreCellularAccessChangedNotification UTF8String];
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100200ABC;
  handler[3] = &unk_1004167D0;
  objc_copyWeak(&v8, &location);
  uint32_t v5 = notify_register_dispatch(v3, &self->_cellularAccessToken, queue, handler);
  if (v5)
  {
    self->_cellularAccessToken = -1;
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v11 = v3;
      __int16 v12 = 1024;
      uint32_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}s) failed: %u", buf, 0x12u);
      _MBLog();
    }
  }
  else
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registered for %{public}s notifications", buf, 0xCu);
      _MBLog();
    }
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleCellularAccessChangedNotification
{
}

- (void)_cancelBackgroundRestoreCellularAccessChangedNotification
{
  int cellularAccessToken = self->_cellularAccessToken;
  self->_int cellularAccessToken = -1;
  if (cellularAccessToken != -1) {
    notify_cancel(cellularAccessToken);
  }
}

- (void)thermalPressureLevelDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint32_t v5 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100200C08;
  v6[3] = &unk_100413770;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_registerForThermalPressureNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"thermalPressureLevelDidChange:" name:@"MBThermalPressureMonitorNotification" object:0];
}

- (BOOL)_isContinuouslyThermallyThrottled
{
  id v3 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MBBackgroundRestoreProgressMonitor *)self thermalPressureMonitor];
  unsigned int v5 = [v4 thermalPressureLevel];

  if (v5 == kOSThermalPressureLevelUndefined)
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to fetch the thermal pressure level", v14, 2u);
      _MBLog();
    }

    goto LABEL_8;
  }
  if (v5 <= 0x13)
  {
LABEL_8:
    [(MBBackgroundRestoreProgressMonitor *)self setDateOfThermalThrottleStart:0];
    return 0;
  }
  id v7 = [(MBBackgroundRestoreProgressMonitor *)self dateOfThermalThrottleStart];
  if (v7)
  {
    [(MBBackgroundRestoreProgressMonitor *)self setDateOfThermalThrottleStart:v7];
  }
  else
  {
    v9 = +[NSDate now];
    [(MBBackgroundRestoreProgressMonitor *)self setDateOfThermalThrottleStart:v9];
  }
  unsigned __int8 v10 = +[NSDate now];
  id v11 = [(MBBackgroundRestoreProgressMonitor *)self dateOfThermalThrottleStart];
  [v10 timeIntervalSinceDate:v11];
  BOOL v8 = v12 >= 300.0;

  return v8;
}

- (void)_cancelThermalPressureNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_startRestoreInProgressFollowUpTimer
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting restore in progress follow-up timer", (uint8_t *)buf, 2u);
    _MBLog();
  }

  objc_initWeak(buf, self);
  id v4 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  unsigned int v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100201058;
  handler[3] = &unk_100413770;
  objc_copyWeak(&v10, buf);
  dispatch_source_set_event_handler(v5, handler);
  followUpTimer = self->_followUpTimer;
  self->_followUpTimer = (OS_dispatch_source *)v5;
  BOOL v8 = v5;

  dispatch_resume(v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_clearRestoreInProgressFollowUp
{
  id v4 = +[MBFollowUpManager sharedManager];
  id v3 = [(MBBackgroundRestoreProgressMonitor *)self account];
  [v4 clearPendingFollowUpsWithAccount:v3 identifiers:&off_10043B520];
}

- (void)_cancelRestoreInProgressFollowUpTimer
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling restore in progress follow-up timer", v6, 2u);
    _MBLog();
  }

  id v4 = self->_followUpTimer;
  followUpTimer = self->_followUpTimer;
  self->_followUpTimer = 0;

  if (v4) {
    dispatch_source_cancel((dispatch_source_t)v4);
  }
  [(MBBackgroundRestoreProgressMonitor *)self _clearRestoreInProgressFollowUp];
}

- (void)_postRestoreInProgressFollowUpWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Attempting to post restore in progress follow-up (%@)", buf, 0xCu);
    _MBLog();
  }

  dispatch_time_t v6 = [(MBBackgroundRestoreProgressMonitor *)self account];
  if (v6)
  {
    id v7 = [(MBBackgroundRestoreProgressMonitor *)self estimator];
    id v18 = 0;
    id v8 = [v7 estimatedBackgroundRestoreSizeWithError:&v18];
    v9 = v18;

    if (v9)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the background restore size estimate: %@", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      id v11 = [(MBBackgroundRestoreProgressMonitor *)self serviceManager];
      if (!v11) {
        __assert_rtn("-[MBBackgroundRestoreProgressMonitor _postRestoreInProgressFollowUpWithReason:]", "MBBackgroundRestoreProgressMonitor.m", 452, "serviceManager");
      }
      double v12 = v11;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10020147C;
      v13[3] = &unk_1004167A8;
      v13[4] = self;
      id v14 = v11;
      id v15 = v6;
      id v17 = v8;
      BOOL v16 = v4;
      id v10 = v12;
      [v10 fetchNetworkConnectivityWithBlock:v13];
    }
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No account found, skipping follow-up (%@)", buf, 0xCu);
      _MBLog();
    }
  }
}

- (unint64_t)estimatedBackgroundRestoreSizeWithError:(id *)a3
{
  id v4 = [(MBBackgroundRestoreProgressMonitor *)self estimator];
  id v5 = [v4 estimatedBackgroundRestoreSizeWithError:a3];

  return (unint64_t)v5;
}

- (void)_postRestoreTelemetryHeartbeat
{
  id v6 = [(MBBackgroundRestoreProgressMonitor *)self serviceManager];
  if (!v6) {
    __assert_rtn("-[MBBackgroundRestoreProgressMonitor _postRestoreTelemetryHeartbeat]", "MBBackgroundRestoreProgressMonitor.m", 487, "manager");
  }
  uint64_t v3 = [(MBBackgroundRestoreProgressMonitor *)self account];
  if (!v3) {
    __assert_rtn("-[MBBackgroundRestoreProgressMonitor _postRestoreTelemetryHeartbeat]", "MBBackgroundRestoreProgressMonitor.m", 489, "account");
  }
  id v4 = (void *)v3;
  id v5 = [v6 backgroundRestoreInfoWithAccount:v3];
  +[MBCKTelemetry sendBackgroundRestoreHeartbeat:restoreInfo:](MBCKTelemetry, "sendBackgroundRestoreHeartbeat:restoreInfo:", [v6 restoreTelemetryID], v5);
}

- (void)_startRestoreTelemetryHeartbeatTimer
{
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting restore telemetry heartbeat timer", (uint8_t *)buf, 2u);
    _MBLog();
  }

  objc_initWeak(buf, self);
  id v4 = [(MBBackgroundRestoreProgressMonitor *)self queue];
  id v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

  dispatch_time_t v6 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v5, v6, 0x34630B8A000uLL, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002019E8;
  handler[3] = &unk_100413770;
  objc_copyWeak(&v10, buf);
  dispatch_source_set_event_handler(v5, handler);
  telemetryHeartBeatTimer = self->_telemetryHeartBeatTimer;
  self->_telemetryHeartBeatTimer = (OS_dispatch_source *)v5;
  id v8 = v5;

  dispatch_resume(v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_cancelRestoreTelemetryHeartbeatTimer
{
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling restore telemetry heartbeat timer", v6, 2u);
    _MBLog();
  }

  id v4 = self->_telemetryHeartBeatTimer;
  telemetryHeartBeatTimer = self->_telemetryHeartBeatTimer;
  self->_telemetryHeartBeatTimer = 0;

  if (v4) {
    dispatch_source_cancel((dispatch_source_t)v4);
  }
}

- (MBRestoreNetworkAccessPrompt)restoreNetworkAccessPrompt
{
  return self->_restoreNetworkAccessPrompt;
}

- (void)setRestoreNetworkAccessPrompt:(id)a3
{
}

- (OS_dispatch_source)setupAssistantTimer
{
  return self->_setupAssistantTimer;
}

- (void)setSetupAssistantTimer:(id)a3
{
}

- (OS_dispatch_source)networkAccessTimer
{
  return self->_networkAccessTimer;
}

- (void)setNetworkAccessTimer:(id)a3
{
}

- (OS_dispatch_source)followUpTimer
{
  return self->_followUpTimer;
}

- (void)setFollowUpTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MBCKManager)serviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceManager);
  return (MBCKManager *)WeakRetained;
}

- (NSDate)dateOfThermalThrottleStart
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDateOfThermalThrottleStart:(id)a3
{
}

- (MBBackgroundRestoreSizeEstimator)estimator
{
  return self->_estimator;
}

- (void)setEstimator:(id)a3
{
}

- (MBThermalPressureMonitor)thermalPressureMonitor
{
  return self->_thermalPressureMonitor;
}

- (OS_dispatch_source)telemetryHeartBeatTimer
{
  return self->_telemetryHeartBeatTimer;
}

- (void)setTelemetryHeartBeatTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryHeartBeatTimer, 0);
  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);
  objc_storeStrong((id *)&self->_estimator, 0);
  objc_storeStrong((id *)&self->_dateOfThermalThrottleStart, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_followUpTimer, 0);
  objc_storeStrong((id *)&self->_networkAccessTimer, 0);
  objc_storeStrong((id *)&self->_setupAssistantTimer, 0);
  objc_storeStrong((id *)&self->_restoreNetworkAccessPrompt, 0);
}

@end