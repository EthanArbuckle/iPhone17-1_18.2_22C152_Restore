@interface BTAppInteraction
+ (id)instance;
- (BOOL)isBackgroundingSupported:(id)a3 central:(BOOL)a4;
- (BOOL)isPrivilegedBundleID:(id)a3;
- (BTAppInteraction)init;
- (int)pidForIdentifier:(id)a3;
- (unsigned)applicationStateForProcess:(id)a3;
- (unsigned)translateApplicationState:(unsigned int)a3;
- (void)appLaunchCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)applicationStateChanged:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)assertionInvalidationCallback:(id)a3;
- (void)assertionTimerFired;
- (void)btControllerTapToRadar:(int)a3 reason:(id)a4 cid:(id)a5 cname:(id)a6 cvers:(id)a7;
- (void)cancelAppLaunchAlert:(id)a3;
- (void)cancelPairingAlert:(id)a3;
- (void)createAssertionForBundleID:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5 withPid:(int)a6;
- (void)disableHIP;
- (void)displayAirWaveLaunchNotification:(id *)a3 forProduct:(unsigned int)a4 reason:(unsigned __int8)a5 findMySerialNumber:(id)a6;
- (void)invalidateAssertionTimer;
- (void)launchApplication:(id)a3 restoringCentrals:(id)a4 peripherals:(id)a5;
- (void)openBundle:(id)a3 options:(id)a4;
- (void)openBundle:(id)a3 options:(id)a4 attempt:(int)a5;
- (void)openTapToRadarWithAccessoryLogs:(id)a3 reason:(int)a4 pid:(unint64_t)a5;
- (void)pairingAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)powerAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)printDebug;
- (void)registerApplication:(id)a3 pid:(int)a4;
- (void)setCentralBackgroundingSupported:(id)a3;
- (void)setListener:(AppFrameworkListener *)a3;
- (void)setPeripheralBackgroundingSupported:(id)a3;
- (void)showAppLaunchAlert:(id)a3 device:(id)a4 type:(int)a5;
- (void)showFileRadarNotification:(id)a3 reason:(int)a4 pid:(unint64_t)a5;
- (void)showFoundAccessoryCrashAlert:(id)a3 productID:(unint64_t)a4 accessoryName:(id)a5 firmwareVersion:(id)a6;
- (void)showFoundAccessoryLogAlert:(id)a3 isCrash:(BOOL)a4 pid:(unint64_t)a5 accessoryName:(id)a6;
- (void)showPairingAlert:(id)a3 type:(int)a4 passkey:(unint64_t)a5;
- (void)showPowerAlert:(id)a3 forDenylistMode:(BOOL)a4 validateBundle:(BOOL)a5;
- (void)startAssertionTimer;
- (void)takeAssertionForProcess:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5;
- (void)unregisterApplication:(id)a3;
- (void)updateApplicationAliveStatus:(id)a3 isAlive:(BOOL)a4;
- (void)updateApplicationState:(int)a3;
- (void)urgentAssertionInvalidationCallback:(id)a3;
@end

@implementation BTAppInteraction

- (void)registerApplication:(id)a3 pid:(int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F700;
  block[3] = &unk_1009997C8;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)applicationStateChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000426A4;
  v7[3] = &unk_100998510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unregisterApplication:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F39C;
  v7[3] = &unk_100998510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isBackgroundingSupported:(id)a3 central:(BOOL)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000510A4;
  v10[3] = &unk_1009C04D0;
  v10[4] = self;
  id v11 = v6;
  v12 = &v14;
  BOOL v13 = a4;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (unsigned)applicationStateForProcess:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D9F0;
  block[3] = &unk_1009C04A8;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return queue;
}

+ (id)instance
{
  v2 = (void *)qword_100A147C0;
  if (!qword_100A147C0)
  {
    if (qword_100A147C8 != -1) {
      dispatch_once(&qword_100A147C8, &stru_1009C03C8);
    }
    v2 = (void *)qword_100A147C0;
  }
  id v3 = v2;

  return v3;
}

- (void)cancelAppLaunchAlert:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A314;
  v7[3] = &unk_100998510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unsigned)translateApplicationState:(unsigned int)a3
{
  if (a3 - 1 >= 8) {
    char v3 = 1;
  }
  else {
    char v3 = 0x1001010108010402uLL >> (8 * (a3 - 1));
  }
  return v3 & 0x1F;
}

- (BTAppInteraction)init
{
  v21.receiver = self;
  v21.super_class = (Class)BTAppInteraction;
  v2 = [(BTAppInteraction *)&v21 init];
  if (v2)
  {
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("com.apple.MobileBluetooth.AppFramework", 0);
    v2->_loggingQueue = (dispatch_queue_s *)dispatch_queue_create("com.apple.MobileBluetooth.AppFramework.loggingAlerts", 0);
    char v3 = (BKSApplicationStateMonitor *)[objc_alloc((Class)BKSApplicationStateMonitor) initWithBundleIDs:&__NSArray0__struct states:0];
    monitor = v2->_monitor;
    v2->_monitor = v3;

    [(BKSApplicationStateMonitor *)v2->_monitor setHandler:&stru_1009C03E8];
    uint64_t v5 = objc_opt_new();
    uninstallObserver = v2->_uninstallObserver;
    v2->_uninstallObserver = (UninstallObserver *)v5;

    [(UninstallObserver *)v2->_uninstallObserver setDelegate:v2];
    uint64_t v7 = objc_opt_new();
    applicationMap = v2->_applicationMap;
    v2->_applicationMap = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    launchNotifications = v2->_launchNotifications;
    v2->_launchNotifications = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    pairingNotifications = v2->_pairingNotifications;
    v2->_pairingNotifications = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    processAssertions = v2->_processAssertions;
    v2->_processAssertions = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    urgentAssertions = v2->_urgentAssertions;
    v2->_urgentAssertions = (NSMutableDictionary *)v15;

    v2->_assertionTimer = 0;
    uint64_t v17 = +[NSMutableDictionary dictionary];
    pendingResurrection = v2->_pendingResurrection;
    v2->_pendingResurrection = (NSMutableDictionary *)v17;

    lastAirWaveNotificationDate = v2->_lastAirWaveNotificationDate;
    v2->_lastAirWaveNotificationDate = 0;
  }
  return v2;
}

- (void)setListener:(AppFrameworkListener *)a3
{
  self->_listener = a3;
}

- (int)pidForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100722CB8;
  block[3] = &unk_1009B4338;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

- (void)updateApplicationAliveStatus:(id)a3 isAlive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_applicationMap objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    [v7 setIsAlive:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19F58, OS_LOG_TYPE_ERROR))
  {
    sub_1007992AC();
  }
}

- (void)launchApplication:(id)a3 restoringCentrals:(id)a4 peripherals:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100722EC0;
  v15[3] = &unk_1009A3478;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)openBundle:(id)a3 options:(id)a4
{
}

- (void)openBundle:(id)a3 options:(id)a4 attempt:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = qword_100A19F58;
  if (os_log_type_enabled((os_log_t)qword_100A19F58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    int v29 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting To Launch Bundle: %{public}@ Options: %@ Attempt: %d", buf, 0x1Cu);
  }
  dispatch_time_t v11 = dispatch_time(0, 3000000000);
  if (a5 < 3)
  {
    dispatch_time_t v14 = v11;
    uint64_t v15 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    id v16 = +[FBSOpenApplicationOptions optionsWithDictionary:v9];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1007234FC;
    v17[3] = &unk_1009C0460;
    dispatch_time_t v20 = v14;
    v18[0] = v8;
    v18[1] = self;
    id v19 = v9;
    int v21 = a5;
    [v15 openApplication:v18[0] withOptions:v16 completion:v17];

    id v13 = (id *)v18;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19F58, OS_LOG_TYPE_ERROR)) {
      sub_100799374();
    }
    uint64_t v12 = sub_100019878();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100723498;
    v22[3] = &unk_100997450;
    id v23 = v8;
    sub_100013018(v12, v22);
    id v13 = &v23;
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100723820;
  v7[3] = &unk_100998510;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateApplicationState:(int)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100723C28;
  v4[3] = &unk_100997550;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setCentralBackgroundingSupported:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100723D5C;
  v7[3] = &unk_100998510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)setPeripheralBackgroundingSupported:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100723ED8;
  v7[3] = &unk_100998510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)takeAssertionForProcess:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10072410C;
  v11[3] = &unk_1009999E8;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)createAssertionForBundleID:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5 withPid:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (v7)
  {
    dispatch_time_t v11 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "(EE) Creating URGENT Process Assertion", buf, 2u);
    }
    uint64_t v12 = 3;
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v13 = sub_100035F54();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v13 + 344))(v13)) {
    BOOL v14 = [[ProcessAssertion alloc] initWithPID:v6 flags:v12 reason:5 name:v10];
  }
  else {
    BOOL v14 = [[ProcessAssertion alloc] initWithBundleIdentifier:v10 flags:v12 reason:5 name:v10];
  }
  uint64_t v15 = v14;
  if (v14 && [(ProcessAssertion *)v14 acquire])
  {
    id v16 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_INFO))
    {
      id v17 = [v10 UTF8String];
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Acquired process assertion for application \"%{public}s\"", buf, 0xCu);
    }
    [(ProcessAssertion *)v15 setSecondsLeft:a4];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v15);
    if (v7)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1007247F8;
      v24[3] = &unk_1009A0318;
      id v18 = &v25;
      objc_copyWeak(&v25, (id *)buf);
      [(ProcessAssertion *)v15 setInvalidationHandler:v24];
      [(NSMutableDictionary *)self->_urgentAssertions setObject:v15 forKeyedSubscript:v10];
    }
    else
    {
      id v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      int v21 = sub_10072487C;
      v22 = &unk_1009A0318;
      id v18 = &v23;
      objc_copyWeak(&v23, (id *)buf);
      [(ProcessAssertion *)v15 setInvalidationHandler:&v19];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processAssertions, "setObject:forKeyedSubscript:", v15, v10, v19, v20, v21, v22);
    }
    objc_destroyWeak(v18);
    if (([(NSMutableDictionary *)self->_processAssertions count]
       || [(NSMutableDictionary *)self->_urgentAssertions count])
      && !self->_assertionTimer)
    {
      [(BTAppInteraction *)self startAssertionTimer];
    }
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
      sub_100799584((uint64_t)[v10 UTF8String], (uint64_t)buf);
    }
    [(ProcessAssertion *)v15 invalidate];
  }
}

- (void)urgentAssertionInvalidationCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100724998;
  v7[3] = &unk_100998510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)assertionInvalidationCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100724B00;
  v7[3] = &unk_100998510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startAssertionTimer
{
  [(BTAppInteraction *)self invalidateAssertionTimer];
  char v3 = qword_100A19E50;
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating Assertion Timer", buf, 2u);
  }
  id v4 = (dispatch_source_s *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_assertionTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100724D64;
  handler[3] = &unk_100997450;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  assertionTimer = self->_assertionTimer;
  dispatch_time_t v6 = dispatch_time(0, 0);
  dispatch_source_set_timer(assertionTimer, v6, 0x3B9ACA00uLL, 0);
  dispatch_resume((dispatch_object_t)self->_assertionTimer);
}

- (void)invalidateAssertionTimer
{
  char v3 = qword_100A19E50;
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating Assertion Timer", v5, 2u);
  }
  assertionTimer = self->_assertionTimer;
  if (assertionTimer)
  {
    dispatch_source_cancel(assertionTimer);
    dispatch_release((dispatch_object_t)self->_assertionTimer);
    self->_assertionTimer = 0;
  }
}

- (void)assertionTimerFired
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100724E64;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isPrivilegedBundleID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.teslamotors.TeslaApp"] & 1) != 0
    || ([v3 isEqualToString:@"com.teslamotors.enterpriseapp"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 hasPrefix:@"com.rivian.ios.consumer"];
  }

  return v4;
}

- (void)disableHIP
{
  [(id)qword_100A147D0 timeIntervalSinceNow];
  double v3 = fabs(v2);
  if (qword_100A147D0) {
    BOOL v4 = v3 < 2.0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    int v5 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(EE) Disabling HIP", v8, 2u);
    }
    notify_post("com.apple.request.hipuncap");
    uint64_t v6 = +[NSDate date];
    BOOL v7 = (void *)qword_100A147D0;
    qword_100A147D0 = v6;
  }
}

- (void)showPowerAlert:(id)a3 forDenylistMode:(BOOL)a4 validateBundle:(BOOL)a5
{
  id v8 = a3;
  if (([v8 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007253A4;
    block[3] = &unk_1009C0558;
    block[4] = self;
    id v11 = v8;
    BOOL v12 = a5;
    BOOL v13 = a4;
    dispatch_async(queue, block);
  }
}

- (void)powerAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007259F4;
  v5[3] = &unk_100998A38;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)showAppLaunchAlert:(id)a3 device:(id)a4 type:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100725C58;
  v13[3] = &unk_1009C0438;
  v13[4] = self;
  id v14 = v8;
  int v16 = a5;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)appLaunchCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10072649C;
  block[3] = &unk_100998570;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)showPairingAlert:(id)a3 type:(int)a4 passkey:(unint64_t)a5
{
  id v8 = a3;
  if (a4 == 5 && os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_FAULT)) {
    sub_100799828();
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10004D230;
  v13[4] = sub_10004CE94;
  id v14 = v8;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100726BC8;
  v11[3] = &unk_1009C05F0;
  v11[4] = self;
  void v11[5] = v13;
  int v12 = a4;
  v11[6] = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
  _Block_object_dispose(v13, 8);
}

- (void)cancelPairingAlert:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100727BE4;
  v7[3] = &unk_100998510;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)pairingAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100727EAC;
  block[3] = &unk_100998570;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)printDebug
{
  double v3 = qword_100A19E50;
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Active process assertions:", buf, 2u);
  }
  [(NSMutableDictionary *)self->_processAssertions enumerateKeysAndObjectsUsingBlock:&stru_1009C0630];
  id v4 = qword_100A19E50;
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Active (URGENT) process assertions:", v5, 2u);
  }
  [(NSMutableDictionary *)self->_urgentAssertions enumerateKeysAndObjectsUsingBlock:&stru_1009C0650];
}

- (void)displayAirWaveLaunchNotification:(id *)a3 forProduct:(unsigned int)a4 reason:(unsigned __int8)a5 findMySerialNumber:(id)a6
{
  int v6 = a5;
  id v9 = a6;
  char v32 = 0;
  uint64_t v10 = sub_100035F54();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 424))(v10))
  {
    id v11 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "displayAirWaveLaunchNotification: Unsupported source platform. Ignoring new request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v13 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v14 = [v13 applicationIsInstalled:@"com.apple.internal.WayFinder"];

  if ((v14 & 1) == 0)
  {
    id v11 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "displayAirWaveLaunchNotification: AirWave isn't installed on this device. Ignoring new request.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (self->_isPopupInQueue)
  {
    id v11 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "displayAirWaveLaunchNotification: Popup already in queue. Ignoring new request.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v15 = sub_100017768();
  sub_10004191C(buf, "AccessoryLogging");
  sub_10004191C(__p, "SuppressAllPopups");
  int v16 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v15 + 72))(v15, buf, __p, &v32);
  if (v32) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v31 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v37) < 0)
  {
    operator delete(*(void **)buf);
    if (v17) {
      goto LABEL_19;
    }
  }
  else if (v17)
  {
LABEL_19:
    id v11 = qword_100A19E50;
    if (!os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    int v12 = "displayAirWaveLaunchNotification: \"Suppress all popups\" defaults write is set to true. Ignoring new request.";
    goto LABEL_10;
  }
  if ((a4 & 0xFFFFE000) == 0x2000)
  {
    if (self->_lastAirWaveNotificationDate)
    {
      id v18 = +[NSDate now];
      id v19 = +[NSCalendar currentCalendar];
      uint64_t v20 = [v19 components:16 fromDate:self->_lastAirWaveNotificationDate toDate:v18 options:0];

      if ((uint64_t)[v20 day] <= 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
          sub_100799B50();
        }

        goto LABEL_11;
      }
    }
    int v21 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "Invalid";
      if (v6 == 1) {
        v22 = "Case Issue";
      }
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = a4;
      if (!v6) {
        v22 = "Unknown";
      }
      __int16 v34 = 1024;
      int v35 = v6;
      __int16 v36 = 2080;
      v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "displayAirWaveLaunchNotification: productID: 0x%04X, reason: %u (%s)", buf, 0x18u);
    }
    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100728BC0;
    block[3] = &unk_1009C06B8;
    block[4] = self;
    unsigned int v28 = a4;
    char v29 = v6;
    id v27 = v9;
    dispatch_async(loggingQueue, block);
    v24 = +[NSDate now];
    lastAirWaveNotificationDate = self->_lastAirWaveNotificationDate;
    self->_lastAirWaveNotificationDate = v24;

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
    sub_100799B84();
  }
LABEL_11:
}

- (void)showFoundAccessoryCrashAlert:(id)a3 productID:(unint64_t)a4 accessoryName:(id)a5 firmwareVersion:(id)a6
{
  uint64_t v8 = *(void *)a3.var0;
  id v10 = a5;
  id v11 = a6;
  char v36 = 0;
  if (self->_isPopupInQueue)
  {
    int v12 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v13 = "Warning: showFoundAccessoryCrashAlert: Suppressing duplicate popup";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  uint64_t v14 = sub_100017768();
  sub_10004191C(buf, "AccessoryLogging");
  sub_10004191C(__p, "SuppressAllPopups");
  int v15 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v14 + 72))(v14, buf, __p, &v36);
  if (v36) {
    int v16 = v15;
  }
  else {
    int v16 = 0;
  }
  if (v33 < 0) {
    operator delete(__p[0]);
  }
  if ((v35 & 0x80000000) == 0)
  {
    if (v16) {
      goto LABEL_11;
    }
LABEL_15:
    if ((a4 - 8194) <= 0xE && ((1 << (a4 - 2)) & 0x409B) != 0 || (a4 & 0xFFFFFFFFFFFFE000) != 0x2000)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
        sub_100799BEC();
      }
    }
    else
    {
      int v17 = +[CBAccessoryLogging getProductNameFromProductID:a4];
      id v18 = +[NSString stringWithFormat:@"%@ Crash Detected", v17];
      id v19 = sub_100379650(@"TITLE", v18);

      if ([v11 length])
      {
        uint64_t v20 = +[NSString stringWithFormat:@" (FW %@)", v11];
      }
      else
      {
        uint64_t v20 = &stru_1009C1AC8;
      }
      int v21 = +[NSString stringWithFormat:@"Do you want to retrieve the crash log from %@%@, then open Tap-to-Radar to report the crash?  Audio quality may be poor during retrieval (~30 sec).", v10, v20];
      v22 = sub_100379650(@"CONTENT", v21);

      loggingQueue = self->_loggingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1007294FC;
      block[3] = &unk_1009C06E0;
      block[4] = self;
      id v27 = v19;
      id v28 = v22;
      int v30 = v8;
      __int16 v31 = WORD2(v8);
      id v29 = v10;
      id v24 = v22;
      id v25 = v19;
      dispatch_async(loggingQueue, block);
    }
    goto LABEL_19;
  }
  operator delete(*(void **)buf);
  if (!v16) {
    goto LABEL_15;
  }
LABEL_11:
  int v12 = qword_100A19E50;
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    BOOL v13 = "Warning: showFoundAccessoryCrashAlert: Suppressing popup for automation";
    goto LABEL_13;
  }
LABEL_19:
}

- (void)showFoundAccessoryLogAlert:(id)a3 isCrash:(BOOL)a4 pid:(unint64_t)a5 accessoryName:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  char v34 = 0;
  if (![v10 count])
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
      sub_100799C88();
    }
    goto LABEL_13;
  }
  uint64_t v12 = sub_100017768();
  sub_10004191C(buf, "AccessoryLogging");
  sub_10004191C(__p, "SuppressAllPopups");
  int v13 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v12 + 72))(v12, buf, __p, &v34);
  if (v34) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  if (v31 < 0) {
    operator delete(__p[0]);
  }
  if (v33 < 0)
  {
    operator delete(*(void **)buf);
    if (v14)
    {
LABEL_9:
      int v15 = qword_100A19E50;
      if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: showFoundAccessoryLogAlert: Suppressing popup for automation", buf, 2u);
      }
LABEL_13:
      int v16 = 0;
      id v17 = 0;
      id v18 = 0;
      goto LABEL_22;
    }
  }
  else if (v14)
  {
    goto LABEL_9;
  }
  int v16 = +[CBAccessoryLogging getProductNameFromProductID:a5];
  if (v8)
  {
    id v19 = +[NSString stringWithFormat:@"%@ Crash Detected", v16];
    sub_100379650(@"TITLE", v19);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    +[NSString stringWithFormat:@"Do you want to use Tap-to-Radar to report the failure found on %@?", v11];
  }
  else
  {
    int v21 = +[NSString stringWithFormat:@"%@ Log Collection Done", v16];
    sub_100379650(@"TITLE", v21);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    +[NSString stringWithFormat:@"Do you want to use Tap-to-Radar and attach the log from %@?", v11];
  uint64_t v20 = };
  sub_100379650(@"CONTENT", v20);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100729C10;
    block[3] = &unk_1009C0708;
    id v17 = v17;
    id v24 = v17;
    id v18 = v18;
    id v25 = v18;
    __int16 v26 = self;
    BOOL v29 = v8;
    id v27 = v10;
    unint64_t v28 = a5;
    dispatch_async(loggingQueue, block);
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR))
  {
    sub_100799CBC();
  }
LABEL_22:
}

- (void)showFileRadarNotification:(id)a3 reason:(int)a4 pid:(unint64_t)a5
{
  char v37 = 0;
  if (self->_isPopupInQueue)
  {
    int v5 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Warning: showFileRadarNotification: Suppressing duplicate popup";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v9 = *(void *)a3.var0;
  uint64_t v11 = sub_100017768();
  if (((*(uint64_t (**)(uint64_t))(*(void *)v11 + 8))(v11) & 1) == 0)
  {
    int v5 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Warning: showFileRadarNotification: Suppressing popup on external build";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (qword_1009F80A0 != -1) {
    dispatch_once(&qword_1009F80A0, &stru_1009C0838);
  }
  if (!sub_1002A86F0((uint64_t)off_1009F8098, v9 & 0xFFFFFFFFFFFFLL))
  {
    int v5 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Warning: showFileRadarNotification: No AACP connection";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  uint64_t v12 = sub_100017768();
  sub_10004191C(buf, "AccessoryLogging");
  sub_10004191C(__p, "SuppressAllPopups");
  int v13 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v12 + 72))(v12, buf, __p, &v37);
  if (v37) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  if (v34 < 0) {
    operator delete(__p[0]);
  }
  if (v36 < 0)
  {
    operator delete(*(void **)buf);
    if (v14)
    {
LABEL_15:
      int v5 = qword_100A19E50;
      if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v6 = "showFileRadarNotification: Suppressing popup for automation";
        goto LABEL_21;
      }
LABEL_22:
      id v15 = 0;
      goto LABEL_23;
    }
  }
  else if (v14)
  {
    goto LABEL_15;
  }
  id v15 = +[CBAccessoryLogging getProductNameFromProductID:a5];
  if (a4 == 5)
  {
    uint64_t v20 = +[NSString stringWithFormat:@"%@ In-Ear Anomaly", v15];
    id v17 = sub_100379650(@"TITLE", v20);

    id v18 = +[NSString stringWithFormat:@"An in-ear detection anomaly has been detected on your %@.  Would you like to file a radar?  (If you do, please keep the buds in their current state while filing.)", v15];
    uint64_t v19 = sub_100379650(@"CONTENT", v18);
    goto LABEL_29;
  }
  if (a4 == 4)
  {
    int v16 = +[NSString stringWithFormat:@"%@ Audio Stream Failure", v15];
    id v17 = sub_100379650(@"TITLE", v16);

    id v18 = +[NSString stringWithFormat:@"The audio stream to your %@ failed to properly start.  Would you like to file a radar?", v15];
    uint64_t v19 = sub_100379650(@"CONTENT", v18);
LABEL_29:
    int v21 = (void *)v19;

    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10072A1C8;
    block[3] = &unk_1009C0730;
    void block[4] = self;
    id v26 = v17;
    id v27 = v21;
    int v31 = v9;
    __int16 v32 = WORD2(v9);
    id v15 = v15;
    int v30 = a4;
    id v28 = v15;
    unint64_t v29 = a5;
    id v23 = v21;
    id v24 = v17;
    dispatch_async(loggingQueue, block);

    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
    sub_100799D28();
  }
LABEL_23:
}

- (void)openTapToRadarWithAccessoryLogs:(id)a3 reason:(int)a4 pid:(unint64_t)a5
{
  id v7 = a3;
  BOOL v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  [v8 setScheme:@"tap-to-radar"];
  [v8 setHost:@"new"];
  v48 = +[CBAccessoryLogging getProductNameFromProductID:a5];
  if ((a4 - 2) < 4)
  {
    if ([v7 count]) {
      +[NSURLQueryItem queryItemWithName:@"AutoDiagnostics" value:@"sysdiagnose-only"];
    }
    else {
    id v10 = +[NSURLQueryItem queryItemWithName:@"ExtensionIdentifiers" value:@"com.apple.DiagnosticExtensions.BluetoothHeadset"];
    }
    [v9 addObject:v10];

    switch(a4)
    {
      case 2:
        int v13 = +[NSURLQueryItem queryItemWithName:@"Title" value:@"Please enter your title here"];
        [v9 addObject:v13];
        break;
      case 4:
        uint64_t v20 = +[NSURLQueryItem queryItemWithName:@"Classification" value:@"Serious Bug"];
        [v9 addObject:v20];

        int v21 = +[NSString stringWithFormat:@"[%@] A2DP Stream Start Failure: ", v48];
        v22 = +[NSURLQueryItem queryItemWithName:@"Title" value:v21];
        [v9 addObject:v22];

        id v23 = +[NSString stringWithFormat:@"Please describe what you were doing with your %@ here", v48];
        id v24 = +[NSURLQueryItem queryItemWithName:@"Description" value:v23];
        [v9 addObject:v24];

        int v13 = +[NSURLQueryItem queryItemWithName:@"Keywords" value:@"1474196"];
        [v9 addObject:v13];
        break;
      case 5:
        id v15 = +[NSURLQueryItem queryItemWithName:@"Classification" value:@"Serious Bug"];
        [v9 addObject:v15];

        int v16 = +[NSString stringWithFormat:@"[%@] IED anomaly: ", v48];
        id v17 = +[NSURLQueryItem queryItemWithName:@"Title" value:v16];
        [v9 addObject:v17];

        id v18 = +[NSString stringWithFormat:@"Please describe the current bud state of your %@ (Are the buds in-ear, in-case, in hand, in pocket, sitting on a table, something else):\n\nPlease describe what you are doing with the buds (including body movement like exercising, or mouth movement like talking):", v48];
        uint64_t v19 = +[NSURLQueryItem queryItemWithName:@"Description" value:v18];
        [v9 addObject:v19];

        int v13 = +[NSURLQueryItem queryItemWithName:@"Keywords" value:@"1521114"];
        [v9 addObject:v13];
        break;
      default:
        goto LABEL_33;
    }
    goto LABEL_15;
  }
  if (a4 == 1)
  {
    uint64_t v11 = +[NSURLQueryItem queryItemWithName:@"ExtensionIdentifiers" value:@"com.apple.DiagnosticExtensions.BluetoothHeadset"];
    [v9 addObject:v11];

    uint64_t v12 = +[NSURLQueryItem queryItemWithName:@"Classification" value:@"Crash/Hang/Data Loss"];
    [v9 addObject:v12];

    int v13 = +[NSString stringWithFormat:@"%@ Crash: ", v48];
    int v14 = +[NSURLQueryItem queryItemWithName:@"Title" value:v13];
    [v9 addObject:v14];

LABEL_15:
    uint64_t v25 = sub_100035F54();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v25 + 424))(v25))
    {
      id v26 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:@"1336450"];
      [v9 addObject:v26];

      id v27 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:@"ULLA (New Bugs)"];
      [v9 addObject:v27];

      id v28 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:@"N301 Non-UI"];
      [v9 addObject:v28];
    }
    else
    {
      if (a4 == 5)
      {
        unint64_t v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", +[CBAccessoryLogging getComponentIDFromRadarReason:5]);
        int v30 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:v29];
        [v9 addObject:v30];

        int v31 = +[CBAccessoryLogging getComponentNameFromRadarReason:5];
        __int16 v32 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:v31];
        [v9 addObject:v32];

        +[CBAccessoryLogging getComponentVersionFromRadarReason:5];
      }
      else
      {
        char v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", +[CBAccessoryLogging getComponentIDFromProductID:a5]);
        char v35 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:v34];
        [v9 addObject:v35];

        char v36 = +[CBAccessoryLogging getComponentNameFromProductID:a5];
        char v37 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:v36];
        [v9 addObject:v37];

        +[CBAccessoryLogging getComponentVersionFromProductID:a5];
      id v28 = };
      char v33 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:v28];
      [v9 addObject:v33];
    }
    if ([v7 count])
    {
      v38 = objc_opt_new();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v39 = v7;
      id v40 = [v39 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v50;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v50 != v41) {
              objc_enumerationMutation(v39);
            }
            [v38 appendString:*(void *)(*((void *)&v49 + 1) + 8 * i)];
            [v38 appendString:@","];
          }
          id v40 = [v39 countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v40);
      }

      v43 = +[NSURLQueryItem queryItemWithName:@"Attachments" value:v38];
      [v9 addObject:v43];
    }
    [v8 setQueryItems:v9];
    v44 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [v8 string];
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "openTapToRadarWithAccessoryLogs: Launch Tap-to-Radar, URL = %{public}@", buf, 0xCu);
    }
    v46 = +[LSApplicationWorkspace defaultWorkspace];
    v47 = [v8 URL];
    [v46 openURL:v47 configuration:0 completionHandler:&stru_1009C0750];

    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
    sub_100799D90();
  }
LABEL_33:
}

- (void)btControllerTapToRadar:(int)a3 reason:(id)a4 cid:(id)a5 cname:(id)a6 cvers:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  loggingQueue = self->_loggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10072AF70;
  block[3] = &unk_1009C0798;
  int v26 = a3;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(loggingQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAirWaveNotificationDate, 0);
  objc_storeStrong((id *)&self->_pendingResurrection, 0);
  objc_storeStrong((id *)&self->_urgentAssertions, 0);
  objc_storeStrong((id *)&self->_processAssertions, 0);
  objc_storeStrong((id *)&self->_pairingNotifications, 0);
  objc_storeStrong((id *)&self->_launchNotifications, 0);
  objc_storeStrong((id *)&self->_powerNotification, 0);
  objc_storeStrong((id *)&self->_uninstallObserver, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_applicationMap, 0);
}

@end