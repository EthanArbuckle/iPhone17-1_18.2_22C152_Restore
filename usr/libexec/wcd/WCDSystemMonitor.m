@interface WCDSystemMonitor
+ (id)sharedSystemMonitor;
- (BKSApplicationStateMonitor)monitor;
- (BOOL)activeDeviceConnected;
- (BOOL)initialSetUpComplete;
- (BOOL)initialSetUpFailed;
- (BOOL)isAltAccount;
- (BOOL)isPaired;
- (BOOL)notifyingOfInstalledAppsChange;
- (BOOL)remoteFirstUnlocked;
- (BOOL)retrySetupInitialStateIfNeeded;
- (BOOL)watchConnectivityServiceAvailable;
- (NSHashTable)observers;
- (NSMutableDictionary)monitoredBundleIDs;
- (NSNumber)altAccountCache;
- (NSOperationQueue)notifyOperationQueue;
- (NSOperationQueue)operationQueue;
- (NSSet)iOSApplicationsContainingActiveComplications;
- (NSSet)pairedDevicesPairingIDs;
- (NSSet)runningIndependentlyWatchApps;
- (NSSet)standaloneWatchApps;
- (NSString)deviceInformation;
- (NSString)pairedDeviceInformation;
- (NSString)pairingID;
- (NSString)state;
- (OS_dispatch_semaphore)duetComplicationsCreationSemaphore;
- (WCDApplicationWorkspace)applicationWorkspace;
- (WCDSystemMonitor)init;
- (_CDComplications)duetComplications;
- (id)applicationStateStringForState:(unsigned int)a3;
- (id)dataContainerURLForApplicationInfo:(id)a3;
- (id)loadInstalledWatchApps;
- (id)newSerialOperationQueue;
- (id)notifyObserversQueued:(SEL)a3;
- (id)notifyObserversQueued:(SEL)a3 completion:(id)a4;
- (id)pairingIDForBTUUID:(id)a3;
- (unsigned)applicationStateForBundleID:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationWorkspace:(id)a3 didUpdateRunningIndependentlyWatchApps:(id)a4;
- (void)applicationWorkspace:(id)a3 didUpdateStandaloneWatchApps:(id)a4;
- (void)applicationWorkspace:(id)a3 didUpdateiOSApplicationsContainingComplications:(id)a4;
- (void)applicationWorkspace:(id)a3 didUpdateiOSApplicationsContainingWatchApp:(id)a4;
- (void)applicationWorkspace:(id)a3 didUpdateiOSApplicationsWithWatchAppInstalled:(id)a4;
- (void)copyVoucher;
- (void)createDuetComplications;
- (void)handleActiveComplicationsChanged;
- (void)handleApplicationStateChange:(id)a3;
- (void)handleCompanionApplicationsChanged:(id)a3;
- (void)handleDeviceBecameActiveNotification:(id)a3;
- (void)handleDeviceBecameInactiveNotification:(id)a3;
- (void)handleInstalledApplicationsChanged;
- (void)handlePairingChangedNotification:(id)a3;
- (void)handleRemainingComplicationUserInfoTransfersReset;
- (void)handleSwitchStartedByIDS;
- (void)handleWatchAppUIStatesChanged:(id)a3 error:(id)a4;
- (void)notifyObservers:(SEL)a3;
- (void)onqueue_handleSwitch;
- (void)onqueue_retrievedIOSApplicationsContainingActiveComplications:(id)a3;
- (void)onqueue_retrievedInstalledAppsList:(id)a3;
- (void)onqueue_retrievedPairingStateIsPaired:(BOOL)a3 pairingID:(id)a4 pairedDeviceInformation:(id)a5 pairedDevicesPairingIDs:(id)a6;
- (void)onqueue_switchIfReady;
- (void)releaseVoucher;
- (void)removeObserver:(id)a3;
- (void)resetInitialState;
- (void)retryInstalledAppsUpdate;
- (void)saveInstalledWatchApps:(id)a3;
- (void)setActiveDeviceConnected:(BOOL)a3;
- (void)setAltAccountCache:(id)a3;
- (void)setDeviceInformation:(id)a3;
- (void)setDuetComplications:(id)a3;
- (void)setDuetComplicationsCreationSemaphore:(id)a3;
- (void)setIOSApplicationsContainingActiveComplications:(id)a3;
- (void)setInitialSetUpFailed:(BOOL)a3;
- (void)setIsPaired:(BOOL)a3 pairingID:(id)a4 pairedDeviceInformation:(id)a5 pairedDevicesPairingIDs:(id)a6;
- (void)setMonitor:(id)a3;
- (void)setMonitoredBundleIDs:(id)a3;
- (void)setNotifyingOfInstalledAppsChange:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setPairedDeviceInformation:(id)a3;
- (void)setRemoteFirstUnlocked:(BOOL)a3;
- (void)setRunningIndependentlyWatchApps:(id)a3;
- (void)setStandaloneWatchApps:(id)a3;
- (void)setUpApplicationStateMonitor;
- (void)setUpInitialState;
- (void)startMonitoringBundleID:(id)a3;
- (void)stopMonitoringBundleID:(id)a3;
- (void)subscribeToAllNotifications;
@end

@implementation WCDSystemMonitor

+ (id)sharedSystemMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E6FC;
  block[3] = &unk_100044E28;
  block[4] = a1;
  if (qword_100051708 != -1) {
    dispatch_once(&qword_100051708, block);
  }
  v2 = (void *)qword_100051700;

  return v2;
}

- (WCDSystemMonitor)init
{
  v18.receiver = self;
  v18.super_class = (Class)WCDSystemMonitor;
  v2 = [(WCDSystemMonitor *)&v18 init];
  if (v2)
  {
    v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(WCDSystemMonitor *)v2 deviceInformation];
      *(_DWORD *)buf = 138543362;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device Information: %{public}@", buf, 0xCu);
    }
    v5 = [(WCDSystemMonitor *)v2 newSerialOperationQueue];
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v5;

    v7 = [(WCDSystemMonitor *)v2 newSerialOperationQueue];
    notifyOperationQueue = v2->_notifyOperationQueue;
    v2->_notifyOperationQueue = v7;

    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    v11 = objc_alloc_init(WCDApplicationWorkspace);
    applicationWorkspace = v2->_applicationWorkspace;
    v2->_applicationWorkspace = v11;

    [(WCDApplicationWorkspace *)v2->_applicationWorkspace setDelegate:v2];
    uint64_t v13 = objc_opt_new();
    monitor = v2->_monitor;
    v2->_monitor = (BKSApplicationStateMonitor *)v13;

    uint64_t v15 = +[NSMutableDictionary dictionaryWithDictionary:&off_100046C48];
    monitoredBundleIDs = v2->_monitoredBundleIDs;
    v2->_monitoredBundleIDs = (NSMutableDictionary *)v15;

    [(WCDSystemMonitor *)v2 resetInitialState];
    [(WCDSystemMonitor *)v2 subscribeToAllNotifications];
    [(WCDSystemMonitor *)v2 setUpInitialState];
    [(WCDSystemMonitor *)v2 setUpApplicationStateMonitor];
    [(WCDSystemMonitor *)v2 startMonitoringWatchAppUIStates];
    [(WCDSystemMonitor *)v2 createDuetComplications];
  }
  return v2;
}

- (id)newSerialOperationQueue
{
  v2 = objc_opt_new();
  [v2 setMaxConcurrentOperationCount:1];
  [v2 setQualityOfService:17];
  return v2;
}

- (void)retryInstalledAppsUpdate
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    v5 = "-[WCDSystemMonitor retryInstalledAppsUpdate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s Updating installed apps list for request", (uint8_t *)&v4, 0xCu);
  }

  [(WCDSystemMonitor *)self copyVoucher];
  [(WCDSystemMonitor *)self handleInstalledApplicationsChanged];
}

- (BOOL)retrySetupInitialStateIfNeeded
{
  if (!self->_initialSetUpFailed || self->_initialSetUpComplete) {
    return 0;
  }
  int v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    v6 = "-[WCDSystemMonitor retrySetupInitialStateIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s Retrying initial setup", (uint8_t *)&v5, 0xCu);
  }

  [(WCDSystemMonitor *)self setUpInitialState];
  return 1;
}

- (void)setUpInitialState
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[WCDSystemMonitor setUpInitialState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  int v4 = [[WCDRetrieveInitialStateOperation alloc] initWithDelegate:self];
  [(WCDRetrieveInitialStateOperation *)v4 setQueuePriority:8];
  objc_initWeak((id *)buf, v4);
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_10001ECB8;
  v10 = &unk_100045228;
  objc_copyWeak(&v12, (id *)buf);
  v11 = self;
  objc_copyWeak(&v13, &location);
  [(WCDRetrieveInitialStateOperation *)v4 setCompletionBlock:&v7];
  int v5 = [(WCDSystemMonitor *)self operationQueue];
  [v5 addOperation:v4];

  v6 = [(WCDSystemMonitor *)self operationQueue];
  [v6 setSuspended:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (void)resetInitialState
{
  v3 = [(WCDSystemMonitor *)self operationQueue];
  [v3 setSuspended:1];

  int v4 = [(WCDSystemMonitor *)self notifyOperationQueue];
  [v4 setSuspended:1];

  int v5 = [(WCDSystemMonitor *)self operationQueue];
  [v5 cancelAllOperations];

  v6 = [(WCDSystemMonitor *)self notifyOperationQueue];
  [v6 cancelAllOperations];

  self->_initialSetUpComplete = 0;
  self->_initialSetUpFailed = 0;
  self->_isPaired = 0;
  pairingID = self->_pairingID;
  self->_pairingID = 0;

  pairedDeviceInformation = self->_pairedDeviceInformation;
  self->_pairedDeviceInformation = 0;

  pairedDevicesPairingIDs = self->_pairedDevicesPairingIDs;
  self->_pairedDevicesPairingIDs = 0;

  id v10 = +[NSSet set];
  [(WCDApplicationWorkspace *)self->_applicationWorkspace setValidApplications:v10];
}

- (void)setUpApplicationStateMonitor
{
  objc_initWeak(&location, self);
  monitor = self->_monitor;
  int v4 = [(WCDSystemMonitor *)self monitoredBundleIDs];
  int v5 = [v4 allKeys];
  [(BKSApplicationStateMonitor *)monitor updateInterestedBundleIDs:v5];

  v6 = self->_monitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F09C;
  v7[3] = &unk_100045250;
  objc_copyWeak(&v8, &location);
  [(BKSApplicationStateMonitor *)v6 setHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NSString)state
{
  v3 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  NSAppendPrintF();
  id v5 = v4;

  if ([(WCDSystemMonitor *)self initialSetUpComplete]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  v31 = v6;
  NSAppendPrintF();
  id v7 = v5;

  v32 = [(WCDSystemMonitor *)self deviceInformation];
  NSAppendPrintF();
  id v8 = v7;

  if ([(WCDSystemMonitor *)self isPaired]) {
    uint64_t v9 = "YES";
  }
  else {
    uint64_t v9 = "NO";
  }
  [(WCDSystemMonitor *)self pairingID];
  v39 = v33 = v9;
  NSAppendPrintF();
  id v10 = v8;

  v34 = [(WCDSystemMonitor *)self pairedDeviceInformation];
  NSAppendPrintF();
  id v11 = v10;

  if ([(WCDSystemMonitor *)self activeDeviceConnected]) {
    id v12 = "YES";
  }
  else {
    id v12 = "NO";
  }
  v35 = v12;
  NSAppendPrintF();
  id v13 = v11;

  if ([(WCDSystemMonitor *)self remoteFirstUnlocked]) {
    v14 = "YES";
  }
  else {
    v14 = "NO";
  }
  v36 = v14;
  NSAppendPrintF();
  id v15 = v13;

  v16 = [(WCDSystemMonitor *)self operationQueue];
  v17 = [(WCDSystemMonitor *)self operationQueue];
  objc_super v18 = [v17 operations];
  v40 = WCCompactStringFromCollection();
  NSAppendPrintF();
  id v19 = v15;

  v37 = [(WCDSystemMonitor *)self observers];
  NSAppendPrintF();
  id v20 = v19;

  v21 = [(WCDSystemMonitor *)self monitor];
  v22 = [(WCDSystemMonitor *)self monitoredBundleIDs];
  v41 = WCCompactStringFromCollection();
  NSAppendPrintF();
  id v23 = v20;

  v24 = [(WCDSystemMonitor *)self applicationWorkspace];
  v38 = [v24 debugDescription];
  NSAppendPrintF();
  id v25 = v23;

  v26 = [(WCDSystemMonitor *)self iOSApplicationsContainingActiveComplications];
  NSAppendPrintF();
  id v27 = v25;

  NSAppendPrintF();
  id v28 = v27;

  return (NSString *)v28;
}

- (NSString)deviceInformation
{
  v3 = &CC_MD5_ptr;
  if (!self->_deviceInformation)
  {
    v34[0] = @"BuildVersion";
    v34[1] = @"IsSimulator";
    v34[2] = @"marketing-name";
    v34[3] = @"ProductName";
    v34[4] = @"ProductType";
    v34[5] = @"ProductVersion";
    v34[6] = @"ReleaseType";
    +[NSArray arrayWithObjects:v34 count:7];
    id v4 = (void *)MGCopyMultipleAnswers();
    id v5 = [v4 objectForKeyedSubscript:@"IsSimulator"];
    unsigned int v6 = [v5 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"ReleaseType"];
    id v8 = (void *)v7;
    uint64_t v9 = @"Production";
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    id v10 = v9;
    v32 = v10;

    id v11 = @"Simulator";
    if (!v6) {
      id v11 = v10;
    }
    id v12 = v11;
    v31 = [v4 objectForKeyedSubscript:@"marketing-name"];
    id v13 = [v4 objectForKeyedSubscript:@"ProductType"];
    v14 = +[NSString stringWithFormat:@"%@ (%@)", v31, v13];
    id v15 = [v4 objectForKeyedSubscript:@"ProductName"];
    v16 = [v4 objectForKeyedSubscript:@"ProductVersion"];
    v17 = [v4 objectForKeyedSubscript:@"BuildVersion"];
    objc_super v18 = +[NSString stringWithFormat:@"%@ %@ (%@)", v15, v16, v17];
    id v19 = +[NSString stringWithFormat:@"%@: %@, %@, ", v12, v14, v18];

    deviceInformation = self->_deviceInformation;
    self->_deviceInformation = v19;

    v3 = &CC_MD5_ptr;
  }
  v33[0] = @"BatteryCurrentCapacity";
  v33[1] = @"BatteryIsCharging";
  +[NSArray arrayWithObjects:v33 count:2];
  v21 = (void *)MGCopyMultipleAnswers();
  v22 = [v21 objectForKeyedSubscript:@"BatteryIsCharging"];
  unsigned int v23 = [v22 BOOLValue];

  v24 = @"not charging";
  if (v23) {
    v24 = @"charging";
  }
  id v25 = v24;
  v26 = [v21 objectForKeyedSubscript:@"BatteryCurrentCapacity"];
  id v27 = [v26 integerValue];

  id v28 = [v3[246] stringWithFormat:@"%d%% (%@)", v27, v25];

  v29 = [(NSString *)self->_deviceInformation stringByAppendingString:v28];

  return (NSString *)v29;
}

- (BOOL)isAltAccount
{
  v3 = [(WCDSystemMonitor *)self altAccountCache];

  if (!v3)
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    id v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    unsigned int v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    uint64_t v7 = [v6 firstObject];

    id v8 = [v7 valueForProperty:NRDevicePropertyIsAltAccount];
    id v9 = [v8 BOOLValue];

    id v10 = +[NSNumber numberWithBool:v9];
    [(WCDSystemMonitor *)self setAltAccountCache:v10];
  }
  id v11 = [(WCDSystemMonitor *)self altAccountCache];
  unsigned __int8 v12 = [v11 BOOLValue];

  return v12;
}

- (void)subscribeToAllNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handlePairingChangedNotification:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
  [v3 addObserver:self selector:"handlePairingChangedNotification:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];
  [v3 addObserver:self selector:"handleDeviceBecameInactiveNotification:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];
  [v3 addObserver:self selector:"handleDeviceBecameActiveNotification:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];
  objc_initWeak(location, self);
  int out_token = 0;
  id v4 = (const char *)[ACXApplicationsUpdatedDarwinNotification UTF8String];
  id v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001FE30;
  handler[3] = &unk_100044A90;
  objc_copyWeak(&v19, location);
  notify_register_dispatch(v4, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  unsigned int v6 = (const char *)[SPActiveComplicationsDarwinNotificaton UTF8String];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001FE70;
  v16[3] = &unk_100044A90;
  objc_copyWeak(&v17, location);
  notify_register_dispatch(v6, &out_token, (dispatch_queue_t)&_dispatch_main_q, v16);

  uint64_t v7 = (const char *)[CLKActiveComplicationsFromActiveWatchChangedNotification UTF8String];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001FEB0;
  v14[3] = &unk_100044A90;
  objc_copyWeak(&v15, location);
  notify_register_dispatch(v7, &out_token, (dispatch_queue_t)&_dispatch_main_q, v14);

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  id v8 = (const char **)qword_100051710;
  uint64_t v26 = qword_100051710;
  if (!qword_100051710)
  {
    location[1] = _NSConcreteStackBlock;
    location[2] = (id)3221225472;
    location[3] = sub_10002314C;
    location[4] = &unk_100045390;
    v22 = &v23;
    id v9 = (void *)sub_10002319C();
    id v10 = dlsym(v9, "kComplicationPushLimitsResetNotification");
    *(void *)(v22[1] + 24) = v10;
    qword_100051710 = *(void *)(v22[1] + 24);
    id v8 = (const char **)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (v8)
  {
    id v11 = *v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001FEF0;
    v12[3] = &unk_100044A90;
    objc_copyWeak(&v13, location);
    notify_register_dispatch(v11, &out_token, (dispatch_queue_t)&_dispatch_main_q, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

- (void)handlePairingChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint64_t v7 = [v4 name];
  unsigned int v8 = [v7 isEqual:NRPairedDeviceRegistryDeviceDidPairNotification];

  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000201C8;
    block[3] = &unk_100044A68;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v9 = [WCDRetrievePairedListOperation alloc];
    id v10 = [(WCDSystemMonitor *)self operationQueue];
    id v11 = [(WCDAsyncOperation *)v9 initWithDelegate:self queue:v10];

    objc_initWeak((id *)buf, v11);
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000201D0;
    v13[3] = &unk_100045278;
    objc_copyWeak(&v14, (id *)buf);
    objc_copyWeak(&v15, &location);
    v13[4] = self;
    [(WCDRetrievePairedListOperation *)v11 setCompletionBlock:v13];
    unsigned __int8 v12 = [(WCDSystemMonitor *)self operationQueue];
    [v12 addOperation:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleCompanionApplicationsChanged:(id)a3
{
  id v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Installed apps on companion have changed", v5, 2u);
  }

  [(WCDSystemMonitor *)self handleInstalledApplicationsChanged];
}

- (void)handleInstalledApplicationsChanged
{
  if (![(WCDSystemMonitor *)self retrySetupInitialStateIfNeeded])
  {
    objc_initWeak(&location, self);
    v3 = [WCDRetrieveInstalledAppsListOperation alloc];
    id v4 = [(WCDSystemMonitor *)self operationQueue];
    id v5 = [(WCDAsyncOperation *)v3 initWithDelegate:self queue:v4];

    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_100020484;
    id v10 = &unk_100044B98;
    objc_copyWeak(&v11, &location);
    [(WCDRetrieveInstalledAppsListOperation *)v5 setCompletionBlock:&v7];
    -[WCDRetrieveInstalledAppsListOperation setQualityOfService:](v5, "setQualityOfService:", -1, v7, v8, v9, v10);
    unsigned int v6 = [(WCDSystemMonitor *)self operationQueue];
    [v6 addOperation:v5];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)handleActiveComplicationsChanged
{
  if (![(WCDSystemMonitor *)self retrySetupInitialStateIfNeeded])
  {
    v3 = [WCDRetrieveActiveComplicationsOperation alloc];
    id v4 = [(WCDSystemMonitor *)self operationQueue];
    unsigned int v6 = [(WCDAsyncOperation *)v3 initWithDelegate:self queue:v4];

    id v5 = [(WCDSystemMonitor *)self operationQueue];
    [v5 addOperation:v6];
  }
}

- (void)handleRemainingComplicationUserInfoTransfersReset
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    unsigned int v6 = "-[WCDSystemMonitor handleRemainingComplicationUserInfoTransfersReset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverRemainingComplicationUserInfoTransfersReset"];
}

- (void)handleDeviceBecameInactiveNotification:(id)a3
{
  id v4 = a3;
  int v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[WCDSystemMonitor handleDeviceBecameInactiveNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020764;
  v7[3] = &unk_100044B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)handleDeviceBecameActiveNotification:(id)a3
{
  id v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = "-[WCDSystemMonitor handleDeviceBecameActiveNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020994;
  block[3] = &unk_100044A68;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleSwitchStartedByIDS
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v6 = "-[WCDSystemMonitor handleSwitchStartedByIDS]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020AA0;
  block[3] = &unk_100044A68;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)onqueue_switchIfReady
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446210;
    objc_super v18 = "-[WCDSystemMonitor onqueue_switchIfReady]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v17, 0xCu);
  }

  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  int v5 = [v4 getActivePairedDevice];

  id v6 = [v5 pairingID];
  uint64_t v7 = [v6 UUIDString];

  id v8 = [(WCDSystemMonitor *)self pairingID];
  if (!v8)
  {
    id v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handling switch with nil pairing ID", (uint8_t *)&v17, 2u);
    }
  }
  if ([v8 isEqualToString:v7])
  {
    id v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      objc_super v18 = v8;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pairing ID already set to active paired device (current %@, active %@)", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    id v11 = +[WatchConnectivityDaemon sharedDaemon];
    id v10 = [v11 activeIDSDevice];

    unsigned __int8 v12 = +[NRPairedDeviceRegistry sharedInstance];
    id v13 = [v12 deviceForIDSDevice:v10];

    if (v13)
    {
      id v14 = [v13 pairingID];
      id v15 = [v14 UUIDString];

      if ([v15 isEqualToString:v7])
      {
        [(WCDSystemMonitor *)self onqueue_handleSwitch];
      }
      else
      {
        v16 = wc_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412546;
          objc_super v18 = v7;
          __int16 v19 = 2112;
          id v20 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "IDS and NR devices don't match (NR %@, IDS %@)", (uint8_t *)&v17, 0x16u);
        }
      }
    }
    else
    {
      id v15 = wc_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No matching NRDevice for active IDS device", (uint8_t *)&v17, 2u);
      }
    }
  }
}

- (void)onqueue_handleSwitch
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    int v5 = "-[WCDSystemMonitor onqueue_handleSwitch]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  [(WCDSystemMonitor *)self resetInitialState];
  [(WCDSystemMonitor *)self notifyObservers:"systemObserverActiveDeviceSwitchStarted"];
  [(WCDSystemMonitor *)self setUpInitialState];
}

- (void)onqueue_retrievedPairingStateIsPaired:(BOOL)a3 pairingID:(id)a4 pairedDeviceInformation:(id)a5 pairedDevicesPairingIDs:(id)a6
{
}

- (void)onqueue_retrievedInstalledAppsList:(id)a3
{
  id v4 = a3;
  id v5 = [(WCDSystemMonitor *)self applicationWorkspace];
  [v5 setValidApplications:v4];
}

- (void)onqueue_retrievedIOSApplicationsContainingActiveComplications:(id)a3
{
}

- (void)applicationWorkspace:(id)a3 didUpdateStandaloneWatchApps:(id)a4
{
  id v4 = [a4 bs_map:&stru_100045298];
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "standaloneWatchApps: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)applicationWorkspace:(id)a3 didUpdateRunningIndependentlyWatchApps:(id)a4
{
  id v5 = [a4 bs_map:&stru_1000452B8];
  int v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "runningIndependentlyWatchApps: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverRunningIndependentlyWatchApps"];
}

- (void)applicationWorkspace:(id)a3 didUpdateiOSApplicationsContainingWatchApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 bs_map:&stru_1000452D8];
  id v9 = wc_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "iOSApplicationsContainingWatchApp: %{public}@", buf, 0xCu);
  }

  self->_notifyingOfInstalledAppsChange = 1;
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021240;
  v11[3] = &unk_100044BC0;
  v11[4] = self;
  objc_copyWeak(&v12, (id *)buf);
  id v10 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverInstalledApplicationsChanged" completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)applicationWorkspace:(id)a3 didUpdateiOSApplicationsWithWatchAppInstalled:(id)a4
{
  id v5 = [a4 bs_map:&stru_1000452F8];
  id v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "iOSApplicationsWithWatchAppInstalled: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverWatchAppsInstalledChanged"];
  int v8 = [(WCDSystemMonitor *)self loadInstalledWatchApps];
  if ([v5 isEqual:v8])
  {
    id v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Installed watch app list didn't change from stored list", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    [(WCDSystemMonitor *)self notifyObservers:"systemObserverUpdatingInstalledApps"];
    [(WCDSystemMonitor *)self saveInstalledWatchApps:v5];
  }
}

- (void)applicationWorkspace:(id)a3 didUpdateiOSApplicationsContainingComplications:(id)a4
{
  id v5 = [a4 bs_map:&stru_100045318];
  id v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "iOSApplicationsContainingComplications: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverComplicationsInstalledChanged"];
}

- (void)setIOSApplicationsContainingActiveComplications:(id)a3
{
  id v5 = a3;
  if (([(NSSet *)self->_iOSApplicationsContainingActiveComplications isEqual:v5] & 1) == 0)
  {
    id v6 = wc_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)&self->_iOSApplicationsContainingActiveComplications, a3);
    id v7 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverActiveComplicationsChanged"];
  }
}

- (void)setActiveDeviceConnected:(BOOL)a3
{
  if (self->_activeDeviceConnected != a3)
  {
    BOOL v3 = a3;
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      if (v3) {
        id v6 = "YES";
      }
      int v8 = 136315138;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
    }

    self->_activeDeviceConnected = v3;
    id v7 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverActiveDeviceConnectedChanged"];
  }
}

- (void)setIsPaired:(BOOL)a3 pairingID:(id)a4 pairedDeviceInformation:(id)a5 pairedDevicesPairingIDs:(id)a6
{
  id v8 = a4;
  int v9 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = wc_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v11;
    id v16 = v8;
    id v17 = a6;
    if (v9) {
      objc_super v18 = "YES";
    }
    else {
      objc_super v18 = "NO";
    }
    WCCompactStringFromCollection();
    __int16 v19 = v23 = v13;
    *(_DWORD *)buf = 136315906;
    uint64_t v25 = v18;
    a6 = v17;
    id v8 = v16;
    id v11 = v15;
    __int16 v26 = 2114;
    id v27 = v15;
    __int16 v28 = 2114;
    v29 = v19;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isPaired: %s, pairingID: %{public}@, pairedDevicesPairingIDs: %{public}@, pairedDeviceInformation: '%{public}@'", buf, 0x2Au);

    id v13 = v23;
  }

  if (([(NSString *)self->_pairedDeviceInformation isEqual:v12] & 1) == 0) {
    objc_storeStrong((id *)&self->_pairedDeviceInformation, a5);
  }
  int isPaired = self->_isPaired;
  if (isPaired != v9) {
    self->_int isPaired = v9;
  }
  if ([(NSString *)self->_pairingID isEqual:v11])
  {
    p_pairedDevicesPairingIDs = &self->_pairedDevicesPairingIDs;
    if ([(NSSet *)self->_pairedDevicesPairingIDs isEqual:v13])
    {
      if (isPaired == v9) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_pairingID, v8);
  p_pairedDevicesPairingIDs = &self->_pairedDevicesPairingIDs;
  if (([(NSSet *)self->_pairedDevicesPairingIDs isEqual:v13] & 1) == 0) {
LABEL_15:
  }
    objc_storeStrong((id *)p_pairedDevicesPairingIDs, a6);
LABEL_16:
  id v22 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverPairedListChanged"];
LABEL_17:
}

- (void)setRemoteFirstUnlocked:(BOOL)a3
{
  if (self->_remoteFirstUnlocked != a3)
  {
    self->_remoteFirstUnlocked = a3;
    id v3 = [(WCDSystemMonitor *)self notifyObserversQueued:"systemObserverRemoteFirstUnlockedChanged"];
  }
}

- (BOOL)watchConnectivityServiceAvailable
{
  v2 = [(WCDSystemMonitor *)self pairingID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)handleApplicationStateChange:(id)a3
{
  id v17 = a3;
  id v4 = [v17 objectForKeyedSubscript:BKSApplicationStateDisplayIDKey];
  id v5 = [v17 objectForKeyedSubscript:BKSApplicationStateKey];
  id v6 = [v5 unsignedIntegerValue];

  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(WCDSystemMonitor *)v7 observers];
  int v9 = [v8 allObjects];

  objc_sync_exit(v7);
  int v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(WCDSystemMonitor *)v7 applicationStateStringForState:v6];
    *(_DWORD *)buf = 136315394;
    id v24 = [v11 UTF8String];
    __int16 v25 = 2114;
    __int16 v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s for bundleID: %{public}@", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v15);
        if (v6 == 1)
        {
          if (objc_opt_respondsToSelector()) {
            [v16 systemObserverAppDidTerminateForBundleID:v4];
          }
        }
        else if v6 == 2 && (objc_opt_respondsToSelector())
        {
          [v16 systemObserverAppDidSuspendForBundleID:v4];
        }
        if (objc_opt_respondsToSelector()) {
          [v16 systemObserverProcessStateChangedForBundleID:v4];
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)startMonitoringBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WCDSystemMonitor *)self monitoredBundleIDs];
    objc_sync_enter(v5);
    id v6 = [(WCDSystemMonitor *)self monitoredBundleIDs];
    id v7 = [v6 objectForKeyedSubscript:v4];

    id v8 = [(WCDSystemMonitor *)self monitoredBundleIDs];
    if (v7)
    {
      int v9 = [v8 objectForKeyedSubscript:v4];
      int v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v9 integerValue] + 1);
      id v11 = [(WCDSystemMonitor *)self monitoredBundleIDs];
      [v11 setObject:v10 forKeyedSubscript:v4];
    }
    else
    {
      [v8 setObject:&off_100046B90 forKeyedSubscript:v4];

      monitor = self->_monitor;
      id v8 = [(WCDSystemMonitor *)self monitoredBundleIDs];
      int v9 = [v8 allKeys];
      [(BKSApplicationStateMonitor *)monitor updateInterestedBundleIDs:v9];
    }

    id v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(WCDSystemMonitor *)self monitoredBundleIDs];
      id v15 = [v14 objectForKeyedSubscript:v4];
      int v16 = 138543618;
      id v17 = v4;
      __int16 v18 = 2048;
      id v19 = [v15 integerValue];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@, numMonitored: %ld", (uint8_t *)&v16, 0x16u);
    }
    objc_sync_exit(v5);
  }
  else
  {
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002C9C4();
    }
  }
}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WCDSystemMonitor *)self monitoredBundleIDs];
    objc_sync_enter(v5);
    id v6 = [(WCDSystemMonitor *)self monitoredBundleIDs];
    id v7 = [v6 objectForKeyedSubscript:v4];
    uint64_t v8 = (uint64_t)[v7 integerValue];

    if (v8 >= 1)
    {
      int v9 = [(WCDSystemMonitor *)self monitoredBundleIDs];
      int v10 = [v9 objectForKeyedSubscript:v4];
      id v11 = (char *)[v10 integerValue];

      id v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543618;
        id v20 = v4;
        __int16 v21 = 2048;
        id v22 = v11 - 1;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@, numMonitored: %ld", (uint8_t *)&v19, 0x16u);
      }

      if (v11 == (char *)1)
      {
        id v15 = [(WCDSystemMonitor *)self monitoredBundleIDs];
        [v15 removeObjectForKey:v4];

        monitor = self->_monitor;
        id v17 = [(WCDSystemMonitor *)self monitoredBundleIDs];
        __int16 v18 = [v17 allKeys];
        [(BKSApplicationStateMonitor *)monitor updateInterestedBundleIDs:v18];

        id v13 = wc_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543362;
          id v20 = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "removed %{public}@", (uint8_t *)&v19, 0xCu);
        }
      }
      else
      {
        id v13 = +[NSNumber numberWithInteger:v11 - 1];
        uint64_t v14 = [(WCDSystemMonitor *)self monitoredBundleIDs];
        [v14 setObject:v13 forKeyedSubscript:v4];
      }
    }
    objc_sync_exit(v5);
  }
  else
  {
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002C9C4();
    }
  }
}

- (unsigned)applicationStateForBundleID:(id)a3
{
  return [(BKSApplicationStateMonitor *)self->_monitor applicationStateForApplication:a3];
}

- (id)applicationStateStringForState:(unsigned int)a3
{
  id result = @"BKSApplicationStateUnknown";
  switch(a3)
  {
    case 0u:
      return result;
    case 1u:
      id result = @"BKSApplicationStateTerminated";
      break;
    case 2u:
      id result = @"BKSApplicationStateBackgroundTaskSuspended";
      break;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      goto LABEL_6;
    case 4u:
      id result = @"BKSApplicationStateBackgroundRunning";
      break;
    case 8u:
      id result = @"BKSApplicationStateForegroundRunning";
      break;
    default:
      if (a3 == 16)
      {
        id result = @"BKSApplicationStateProcessServer";
      }
      else if (a3 == 32)
      {
        id result = @"BKSApplicationStateForegroundRunningObscured";
      }
      else
      {
LABEL_6:
        id result = @"Unexpected";
      }
      break;
  }
  return result;
}

- (void)handleWatchAppUIStatesChanged:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = wc_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002C9F8((uint64_t)v7, v8);
    }
  }
  else
  {
    int v9 = self;
    objc_sync_enter(v9);
    int v10 = [(WCDSystemMonitor *)v9 observers];
    id v11 = [v10 allObjects];

    objc_sync_exit(v9);
    id v12 = wc_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notifying observers of UI state change", buf, 2u);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = v11;
    id v13 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v8);
          }
          int v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v16 systemObserverWatchAppUIStatesChanged:v6 (void)v17];
          }
        }
        id v13 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
  }
}

- (id)dataContainerURLForApplicationInfo:(id)a3
{
  BOOL v3 = [a3 companionAppBundleIdentifier];
  id v4 = +[LSApplicationProxy applicationProxyForIdentifier:v3];

  id v5 = [v4 dataContainerURL];
  id v6 = [v5 wc_URLWithLastPathComponentAsDirectory];

  return v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [(NSHashTable *)v5->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [(NSHashTable *)v5->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (id)notifyObserversQueued:(SEL)a3
{
  return [(WCDSystemMonitor *)self notifyObserversQueued:a3 completion:0];
}

- (id)notifyObserversQueued:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new();
  objc_initWeak(&location, v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002268C;
  v12[3] = &unk_100045368;
  objc_copyWeak(v14, &location);
  void v12[4] = self;
  v14[1] = (id)a3;
  id v8 = v6;
  id v13 = v8;
  [v7 addExecutionBlock:v12];
  int v9 = NSStringFromSelector(a3);
  [v7 setName:v9];

  int v10 = [(WCDSystemMonitor *)self notifyOperationQueue];
  [v10 addOperation:v7];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v7;
}

- (void)notifyObservers:(SEL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(WCDSystemMonitor *)v4 observers];
  id v6 = [v5 allObjects];

  objc_sync_exit(v4);
  id v7 = NSStringFromSelector(a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v13 = wc_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            long long v19 = v12;
            __int16 v20 = 2114;
            __int16 v21 = v7;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ of %{public}@", buf, 0x16u);
          }

          ((void (*)(void *, SEL))[v12 methodForSelector:a3])(v12, a3);
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)copyVoucher
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_appChangedVoucher)
  {
    BOOL v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Copying voucher", v6, 2u);
    }

    uint64_t v4 = voucher_copy();
    appChangedVoucher = v2->_appChangedVoucher;
    v2->_appChangedVoucher = (OS_voucher *)v4;
  }
  objc_sync_exit(v2);
}

- (void)releaseVoucher
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_notifyingOfInstalledAppsChange && v2->_appChangedVoucher)
  {
    BOOL v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing voucher", v5, 2u);
    }

    appChangedVoucher = v2->_appChangedVoucher;
    v2->_appChangedVoucher = 0;
  }
  objc_sync_exit(v2);
}

- (id)pairingIDForBTUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v3 UUIDString];

  id v6 = [v4 deviceForBTDeviceID:v5];

  id v7 = [v6 valueForProperty:NRDevicePropertyPairingID];
  id v8 = [v7 UUIDString];

  return v8;
}

- (void)createDuetComplications
{
  if (!self->_duetComplications)
  {
    id v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    duetComplicationsCreationSemaphore = self->_duetComplicationsCreationSemaphore;
    self->_duetComplicationsCreationSemaphore = v3;

    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022C94;
    block[3] = &unk_100044A68;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (_CDComplications)duetComplications
{
  if (!self->_duetComplications)
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_duetComplicationsCreationSemaphore, v3))
    {
      uint64_t v4 = wc_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10002CA70();
      }
    }
  }
  duetComplications = self->_duetComplications;

  return duetComplications;
}

- (void)saveInstalledWatchApps:(id)a3
{
  if (a3)
  {
    id v5 = [a3 allObjects];
    dispatch_time_t v3 = +[NSUserDefaults standardUserDefaults];
    [v3 setObject:v5 forKey:@"WCDStoredInstalledWatchApps"];

    uint64_t v4 = +[NSUserDefaults standardUserDefaults];
    [v4 synchronize];
  }
}

- (id)loadInstalledWatchApps
{
  v2 = +[NSUserDefaults standardUserDefaults];
  dispatch_time_t v3 = [v2 objectForKey:@"WCDStoredInstalledWatchApps"];

  if (v3)
  {
    uint64_t v4 = +[NSSet setWithArray:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setDeviceInformation:(id)a3
{
}

- (BOOL)initialSetUpComplete
{
  return self->_initialSetUpComplete;
}

- (BOOL)activeDeviceConnected
{
  return self->_activeDeviceConnected;
}

- (BOOL)isPaired
{
  return self->_isPaired;
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (NSSet)pairedDevicesPairingIDs
{
  return self->_pairedDevicesPairingIDs;
}

- (BOOL)remoteFirstUnlocked
{
  return self->_remoteFirstUnlocked;
}

- (WCDApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (NSSet)iOSApplicationsContainingActiveComplications
{
  return self->_iOSApplicationsContainingActiveComplications;
}

- (void)setDuetComplications:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 72, 1);
}

- (NSOperationQueue)notifyOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setObservers:(id)a3
{
}

- (NSNumber)altAccountCache
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAltAccountCache:(id)a3
{
}

- (BKSApplicationStateMonitor)monitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMonitor:(id)a3
{
}

- (NSMutableDictionary)monitoredBundleIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMonitoredBundleIDs:(id)a3
{
}

- (NSSet)standaloneWatchApps
{
  return self->_standaloneWatchApps;
}

- (void)setStandaloneWatchApps:(id)a3
{
}

- (NSSet)runningIndependentlyWatchApps
{
  return self->_runningIndependentlyWatchApps;
}

- (void)setRunningIndependentlyWatchApps:(id)a3
{
}

- (NSString)pairedDeviceInformation
{
  return self->_pairedDeviceInformation;
}

- (void)setPairedDeviceInformation:(id)a3
{
}

- (BOOL)initialSetUpFailed
{
  return self->_initialSetUpFailed;
}

- (void)setInitialSetUpFailed:(BOOL)a3
{
  self->_initialSetUpFailed = a3;
}

- (BOOL)notifyingOfInstalledAppsChange
{
  return self->_notifyingOfInstalledAppsChange;
}

- (void)setNotifyingOfInstalledAppsChange:(BOOL)a3
{
  self->_notifyingOfInstalledAppsChange = a3;
}

- (OS_dispatch_semaphore)duetComplicationsCreationSemaphore
{
  return self->_duetComplicationsCreationSemaphore;
}

- (void)setDuetComplicationsCreationSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetComplicationsCreationSemaphore, 0);
  objc_storeStrong((id *)&self->_pairedDeviceInformation, 0);
  objc_storeStrong((id *)&self->_runningIndependentlyWatchApps, 0);
  objc_storeStrong((id *)&self->_standaloneWatchApps, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIDs, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_altAccountCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_duetComplications, 0);
  objc_storeStrong((id *)&self->_iOSApplicationsContainingActiveComplications, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_pairedDevicesPairingIDs, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);

  objc_storeStrong((id *)&self->_appChangedVoucher, 0);
}

@end