@interface FMFFencesMgr
+ (id)sharedInstance;
- (BOOL)isFenceBeingMonitored:(id)a3;
- (BOOL)isNetworkAvailable;
- (CLLocationManager)locMgr;
- (FMDataArchiver)dataArchiver;
- (FMFFencesMgr)init;
- (FMFFencesMgrDelegate)delegate;
- (FenceProvider)fenceProvider;
- (FenceSchedulerProtocol)scheduler;
- (NSArray)fencesToMonitor;
- (NSDictionary)monitoredFences;
- (NSSet)allFences;
- (NSString)fenceVersion;
- (NSString)triggerURL;
- (double)triggerValidityDuration;
- (id)CLErrorAsString:(int64_t)a3;
- (id)_currentFences;
- (id)_fencesCacheFileURL;
- (id)createFenceProvider;
- (id)createFenceScheduler;
- (id)fenceWithID:(id)a3;
- (id)findMyLocateSession;
- (id)updatedFenceForFence:(id)a3;
- (void)__updateMonitoredFences;
- (void)_readFencesToMonitorCache;
- (void)_trigger:(int64_t)a3 forRegionWithID:(id)a4 atLocation:(id)a5;
- (void)_updateCL;
- (void)_updateFencesToMonitorCache;
- (void)_updateGeoFences;
- (void)_updateMonitoredFences;
- (void)checkIfThisDeviceIsBeingUsedToShareLocation:(id)a3;
- (void)cleanupLocMgr;
- (void)dealloc;
- (void)fenceSchedulerCurrentSchedulesDidChange:(id)a3;
- (void)fmf_triggerFence:(id)a3 atLocation:(id)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)networkReachabilityUpdated:(BOOL)a3;
- (void)registerAlarms;
- (void)schedulerCurrentSchedulesDidChange:(id)a3;
- (void)setAllFences:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFenceVersion:(id)a3;
- (void)setFencesToMonitor:(id)a3;
- (void)setFencesToMonitor:(id)a3 withFenceVersion:(id)a4 triggerValidityDuration:(double)a5 andTriggerURL:(id)a6;
- (void)setLocMgr:(id)a3;
- (void)setMonitoredFences:(id)a3;
- (void)setNetworkAvailable:(BOOL)a3;
- (void)setTriggerURL:(id)a3;
- (void)setTriggerValidityDuration:(double)a3;
- (void)setupSessionCallbacks:(id)a3;
- (void)showDebugFenceTriggerAlertIfNeededWithTitle:(id)a3 text:(id)a4;
- (void)start;
- (void)stop;
- (void)triggerFence:(id)a3 atLocation:(id)a4;
- (void)updateGeoFences;
@end

@implementation FMFFencesMgr

+ (id)sharedInstance
{
  if (qword_10006D430 != -1) {
    dispatch_once(&qword_10006D430, &stru_1000598F0);
  }
  v2 = (void *)qword_10006D438;

  return v2;
}

- (FMFFencesMgr)init
{
  v22.receiver = self;
  v22.super_class = (Class)FMFFencesMgr;
  v2 = [(FMFFencesMgr *)&v22 init];
  if (v2)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = sub_10001F020();
      CFStringRef v5 = @"ON";
      if (v4) {
        CFStringRef v5 = @"OFF";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Fence_Migration feature flag: %@", buf, 0xCu);
    }

    id v6 = objc_alloc((Class)FMDataArchiver);
    v7 = [(FMFFencesMgr *)v2 _fencesCacheFileURL];
    id v8 = [v6 initWithFileURL:v7];
    [(FMFFencesMgr *)v2 setDataArchiver:v8];

    v9 = [(FMFFencesMgr *)v2 dataArchiver];
    [v9 setDataProtectionClass:4];

    v10 = [(FMFFencesMgr *)v2 dataArchiver];
    [v10 setBackedUp:0];

    v11 = [(FMFFencesMgr *)v2 dataArchiver];
    [v11 setCreateDirectories:1];

    uint64_t v12 = [(FMFFencesMgr *)v2 createFenceScheduler];
    scheduler = v2->_scheduler;
    v2->_scheduler = (FenceSchedulerProtocol *)v12;

    [(FMFFencesMgr *)v2 registerAlarms];
    uint64_t v14 = +[NSSet set];
    allFences = v2->_allFences;
    v2->_allFences = (NSSet *)v14;

    uint64_t v16 = [(FMFFencesMgr *)v2 createFenceProvider];
    fenceProvider = v2->_fenceProvider;
    v2->_fenceProvider = (FenceProvider *)v16;

    v18 = v2->_fenceProvider;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100015644;
    v20[3] = &unk_100059918;
    v21 = v2;
    [(FenceProvider *)v18 getFences:v20];
  }
  return v2;
}

- (id)createFenceScheduler
{
  int v3 = sub_10001F020();
  int v4 = (Class *)FMFScheduler_ptr;
  if (!v3) {
    int v4 = (Class *)&off_100058CF0;
  }
  id v5 = [objc_alloc(*v4) initWithDelegate:self];

  return v5;
}

- (id)createFenceProvider
{
  if (sub_10001F020())
  {
    id v3 = objc_alloc((Class)FMFSession);
    int v4 = +[NSOperationQueue mainQueue];
    id v5 = [v3 initWithDelegate:self delegateQueue:v4];
  }
  else
  {
    id v5 = [(FMFFencesMgr *)self findMyLocateSession];
  }

  return v5;
}

- (id)findMyLocateSession
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015840;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D448 != -1) {
    dispatch_once(&qword_10006D448, block);
  }
  return (id)qword_10006D440;
}

- (void)dealloc
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100037650(self);
  }

  [(FMFFencesMgr *)self cleanupLocMgr];
  v4.receiver = self;
  v4.super_class = (Class)FMFFencesMgr;
  [(FMFFencesMgr *)&v4 dealloc];
}

- (void)cleanupLocMgr
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(CLLocationManager *)self->_locMgr setDelegate:0];
  locMgr = self->_locMgr;
  self->_locMgr = 0;
}

- (void)checkIfThisDeviceIsBeingUsedToShareLocation:(id)a3
{
  id v4 = a3;
  if (sub_10001F020())
  {
    id v5 = +[FMFSession sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015A30;
    v7[3] = &unk_100059940;
    id v8 = v4;
    [v5 getActiveLocationSharingDevice:v7];
  }
  else
  {
    id v6 = [(FMFFencesMgr *)self findMyLocateSession];
    [v6 checkIfThisDeviceIsBeingUsedToShareLocationWithCompletionHandler:v4];
  }
}

- (void)registerAlarms
{
  id v3 = [(FMFFencesMgr *)self scheduler];
  id v4 = (const char *)[(id)objc_opt_class() alarmStream];

  id v5 = [(FMFFencesMgr *)self scheduler];
  id v6 = [(id)objc_opt_class() timerIdentifier];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015B90;
  v7[3] = &unk_100059968;
  void v7[4] = self;
  v7[5] = v6;
  xpc_set_event_stream_handler(v4, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)start
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Preparing to sanitize any inconsistent state for fences", buf, 2u);
  }

  id v4 = +[AccountManager sharedInstance];
  id v5 = [v4 allAccountsOfType:objc_opt_class()];

  if ([v5 count]
    && ([v5 objectAtIndexedSubscript:0], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    [(FMFFencesMgr *)self _readFencesToMonitorCache];
    if (sub_10001F020())
    {
      id v8 = sub_10001B6D4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [(FMFFencesMgr *)self fencesToMonitor];
        id v10 = [v9 count];
        v11 = [(FMFFencesMgr *)self locMgr];
        uint64_t v12 = [v11 monitoredRegions];
        id v13 = [v12 count];
        *(_DWORD *)buf = 134218240;
        id v17 = v10;
        __int16 v18 = 2048;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FMF has %ld fences in fmflocatord & %ld fences in CoreLocation", buf, 0x16u);
      }
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100015FD4;
      v15[3] = &unk_100059350;
      v15[4] = self;
      sub_100015F5C(v15);
    }
  }
  else
  {
    uint64_t v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Removed all fences since there is no FMF account", buf, 2u);
    }

    [(FMFFencesMgr *)self setFencesToMonitor:0 withFenceVersion:0 triggerValidityDuration:0 andTriggerURL:0.0];
  }
}

- (void)stop
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping FMFFencesMgr...", buf, 2u);
  }

  [(FMFFencesMgr *)self setDelegate:0];
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing the monitored fences by location manager...", v5, 2u);
  }

  [(FMFFencesMgr *)self cleanupLocMgr];
}

- (void)setFencesToMonitor:(id)a3 withFenceVersion:(id)a4 triggerValidityDuration:(double)a5 andTriggerURL:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(FMFFencesMgr *)self setFenceVersion:v11];

  [(FMFFencesMgr *)self setTriggerURL:v10];
  [(FMFFencesMgr *)self setTriggerValidityDuration:a5];
  [(FMFFencesMgr *)self setFencesToMonitor:v12];
}

- (BOOL)isFenceBeingMonitored:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFencesMgr *)self monitoredFences];
  uint64_t v6 = [v4 fenceId];

  v7 = [v5 objectForKeyedSubscript:v6];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)triggerFence:(id)a3 atLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10001F020())
  {
    [(FMFFencesMgr *)self fmf_triggerFence:v6 atLocation:v7];
  }
  else
  {
    id v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[FMFFencesMgr triggerFence:atLocation:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending trigger to FML", buf, 0xCu);
    }

    v9 = [v6 fenceId];
    id v10 = [(FMFFencesMgr *)self fenceWithID:v9];

    if (v10)
    {
      id v11 = objc_alloc((Class)NSUUID);
      id v12 = [v10 identifier];
      id v13 = [v11 initWithUUIDString:v12];

      if (v13)
      {
        uint64_t v14 = [(FMFFencesMgr *)self findMyLocateSession];
        id v15 = [v6 lastTrigger];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10001651C;
        v17[3] = &unk_100059990;
        __int16 v18 = v10;
        id v19 = v6;
        [v14 triggerFenceWithID:v13 trigger:v15 location:v7 completionHandler:v17];

        uint64_t v16 = v18;
      }
      else
      {
        uint64_t v16 = sub_10001B6D4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10003776C(v10, v16);
        }
      }
    }
    else
    {
      id v13 = sub_10001B6D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000376D4(v6, v13);
      }
    }
  }
}

- (void)fmf_triggerFence:(id)a3 atLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[FMFSession sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100016744;
  v10[3] = &unk_1000599F8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 getActiveLocationSharingDevice:v10];
}

- (void)setFencesToMonitor:(id)a3
{
  id v4 = (NSArray *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  fencesToMonitor = self->_fencesToMonitor;
  self->_fencesToMonitor = v4;

  [(FMFFencesMgr *)self _updateFencesToMonitorCache];

  [(FMFFencesMgr *)self _updateMonitoredFences];
}

- (void)setAllFences:(id)a3
{
  id v4 = (NSSet *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    allFences = self->_allFences;
    int v8 = 136315650;
    id v9 = "-[FMFFencesMgr setAllFences:]";
    __int16 v10 = 2112;
    id v11 = allFences;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: old: %@ new: %@", (uint8_t *)&v8, 0x20u);
  }

  id v7 = self->_allFences;
  self->_allFences = v4;

  [(FMFFencesMgr *)self _updateMonitoredFences];
}

- (void)_updateMonitoredFences
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__updateMonitoredFences" object:0];

  [(FMFFencesMgr *)self performSelector:"__updateMonitoredFences" withObject:0 afterDelay:1.0];
}

- (void)__updateMonitoredFences
{
  id v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(FMFFencesMgr *)self fencesToMonitor];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v11 = [v10 shouldUseCloudKitStore];
        __int16 v12 = v10;
        if (v11)
        {
          v2 = [(FMFFencesMgr *)self updatedFenceForFence:v10];
          __int16 v12 = v2;
        }
        id v13 = [v10 fenceId];
        [v4 setObject:v12 forKeyedSubscript:v13];

        if (v11) {
      }
        }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(FMFFencesMgr *)self setMonitoredFences:v4];
}

- (id)updatedFenceForFence:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fenceId];
  id v6 = [(FMFFencesMgr *)self fenceWithID:v5];

  if (v6)
  {
    [v6 longitude];
    [v4 setLongitude:];
    [v6 latitude];
    [v4 setLatitude:];
    [v6 radius];
    [v4 setRadius:];
    id v7 = [v6 schedule];
    [v4 setSchedule:v7];

    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fenceWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFencesMgr *)self allFences];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016EF8;
  v9[3] = &unk_100059A20;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 fm_firstObjectPassingTest:v9];

  return v7;
}

- (void)setMonitoredFences:(id)a3
{
  id v4 = (NSDictionary *)a3;
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    monitoredFences = self->_monitoredFences;
    int v12 = 136315650;
    id v13 = "-[FMFFencesMgr setMonitoredFences:]";
    __int16 v14 = 2112;
    long long v15 = monitoredFences;
    __int16 v16 = 2112;
    long long v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: old: %@ new: %@", (uint8_t *)&v12, 0x20u);
  }

  id v7 = self->_monitoredFences;
  self->_monitoredFences = v4;

  [(FMFFencesMgr *)self updateGeoFences];
  id v8 = [(FMFFencesMgr *)self monitoredFences];
  id v9 = [v8 allValues];
  id v10 = [v9 fm_map:&stru_100059A60];
  unsigned int v11 = [(FMFFencesMgr *)self scheduler];
  [v11 setSchedules:v10];
}

- (void)setNetworkAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL networkAvailable = self->_networkAvailable;
    int v7 = 136315650;
    id v8 = "-[FMFFencesMgr setNetworkAvailable:]";
    __int16 v9 = 1024;
    BOOL v10 = networkAvailable;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: old: %d new: %d", (uint8_t *)&v7, 0x18u);
  }

  if (self->_networkAvailable != v3)
  {
    self->_BOOL networkAvailable = v3;
    if (v3) {
      [(FMFFencesMgr *)self _updateCL];
    }
  }
}

- (CLLocationManager)locMgr
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  locMgr = self->_locMgr;
  if (!locMgr)
  {
    id v4 = sub_10001B6D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Creating FMF location manager for fences...", v8, 2u);
    }

    id v5 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/FMF.framework" delegate:self onQueue:&_dispatch_main_q];
    id v6 = self->_locMgr;
    self->_locMgr = v5;

    locMgr = self->_locMgr;
  }

  return locMgr;
}

- (void)updateGeoFences
{
  if (sub_10001F020())
  {
    [(FMFFencesMgr *)self _updateCL];
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100017334;
    v3[3] = &unk_100059350;
    v3[4] = self;
    sub_100015F5C(v3);
  }
}

- (void)_updateCL
{
  BOOL v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Synchronizing fences between fmflocatord & CL...", buf, 2u);
  }

  id v4 = [(FMFFencesMgr *)self _currentFences];
  id v5 = [(FMFFencesMgr *)self locMgr];
  id v6 = [v5 monitoredRegions];

  int v7 = sub_10001B6D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v4 count];
    id v9 = [v6 count];
    *(_DWORD *)buf = 134218240;
    id v53 = v8;
    __int16 v54 = 2048;
    id v55 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Number of current fences: fmflocatord=%ld CL=%ld", buf, 0x16u);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v47;
    *(void *)&long long v12 = 138412290;
    long long v40 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v10);
        }
        __int16 v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v17 = [v16 identifier:v40];
        __int16 v18 = [v4 objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v19 = sub_10001B6D4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = [v16 identifier];
            *(_DWORD *)buf = v40;
            id v53 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Fence %@ in CL is not present in fmflocatord. Unregistering it...", buf, 0xCu);
          }
          v21 = [(FMFFencesMgr *)self locMgr];
          [v21 stopMonitoringForRegion:v16];
        }
      }
      id v13 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v13);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v4;
  id v23 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v23)
  {
    id v25 = v23;
    uint64_t v26 = *(void *)v43;
    *(void *)&long long v24 = 138412290;
    long long v41 = v24;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v22);
        }
        v28 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v42 + 1) + 8 * (void)j), v41, (void)v42];
        [v28 latitude];
        CLLocationDegrees v30 = v29;
        [v28 longitude];
        CLLocationCoordinate2D v56 = CLLocationCoordinate2DMake(v30, v31);
        double latitude = v56.latitude;
        double longitude = v56.longitude;
        if (CLLocationCoordinate2DIsValid(v56))
        {
          id v34 = objc_alloc((Class)CLCircularRegion);
          [v28 radius];
          double v36 = v35;
          v37 = [v28 fenceId];
          v38 = [v34 initWithCenter:v37 radius:latitude identifier:v36];

          v39 = [(FMFFencesMgr *)self locMgr];
          [v39 startMonitoringForRegion:v38];
        }
        else
        {
          v38 = sub_10001B6D4();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v41;
            id v53 = v28;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Invalid 2D coord when attempting to create fence %@", buf, 0xCu);
          }
        }
      }
      id v25 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v25);
  }
}

- (void)_updateGeoFences
{
  v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Synchronizing fences between fmflocatord & CL...", buf, 2u);
  }

  BOOL v3 = [(FMFFencesMgr *)self _currentFences];
  id v4 = [v3 mutableCopy];

  id v5 = [(FMFFencesMgr *)self locMgr];
  id v6 = [v5 monitoredRegions];

  int v7 = sub_10001B6D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v4 count];
    id v9 = [v6 count];
    *(_DWORD *)buf = 134218240;
    id v54 = v8;
    __int16 v55 = 2048;
    id v56 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Number of current fences: fmflocatord=%ld CL=%ld", buf, 0x16u);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v48;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v15 = [v14 identifier];
        __int16 v16 = [v4 objectForKeyedSubscript:v15];

        long long v17 = sub_10001B6D4();
        __int16 v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v16 fenceId];
            *(_DWORD *)buf = 138412290;
            id v54 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fence is already monitored. No need to update monitored region of fence %@", buf, 0xCu);
          }
          v20 = [v14 identifier];
          [v4 removeObjectForKey:v20];
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v21 = [v14 identifier];
            *(_DWORD *)buf = 138412290;
            id v54 = v21;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Fence %@ in CL is not present in fmflocatord. Unregistering it...", buf, 0xCu);
          }
          v20 = [(FMFFencesMgr *)self locMgr];
          [v20 stopMonitoringForRegion:v14];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v11);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = v4;
  id v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v44;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
        [v27 latitude];
        CLLocationDegrees v29 = v28;
        [v27 longitude];
        CLLocationCoordinate2D v57 = CLLocationCoordinate2DMake(v29, v30);
        double latitude = v57.latitude;
        double longitude = v57.longitude;
        if (CLLocationCoordinate2DIsValid(v57))
        {
          id v33 = objc_alloc((Class)CLCircularRegion);
          [v27 radius];
          double v35 = v34;
          double v36 = [v27 fenceId];
          v37 = [v33 initWithCenter:v36 radius:latitude identifier:v35];

          v38 = sub_10001B6D4();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [v27 fenceId];
            *(_DWORD *)buf = 138412290;
            id v54 = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Starting monitoring fence %@", buf, 0xCu);
          }
          long long v40 = [(FMFFencesMgr *)self locMgr];
          [v40 startMonitoringForRegion:v37];
        }
        else
        {
          v37 = sub_10001B6D4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v54 = v27;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Invalid 2D coord when attempting to create fence %@", buf, 0xCu);
          }
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v24);
  }
}

- (void)_trigger:(int64_t)a3 forRegionWithID:(id)a4 atLocation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(FMFFencesMgr *)self monitoredFences];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    uint64_t v12 = +[NSDate date];
    id v36 = 0;
    unsigned int v13 = [v11 shouldTrigger:a3 forLocation:v9 atDate:v12 reason:&v36];
    uint64_t v14 = v36;

    long long v15 = sub_10001B6D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = sub_100014388(a3);
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "-[FMFFencesMgr _trigger:forRegionWithID:atLocation:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v16;
      __int16 v40 = 2112;
      long long v41 = v14;
      __int16 v42 = 2112;
      id v43 = v9;
      __int16 v44 = 2112;
      long long v45 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: shouldTrigger: %d status: %@ reason: %@ location: %@ forFence: %@", buf, 0x3Au);
    }
    if (v13)
    {
      [v11 setLastTrigger:a3];
      long long v17 = +[NSDate date];
      [v11 setLastTriggerTimestamp:v17];

      __int16 v18 = [(FMFFencesMgr *)self delegate];
      [v18 fenceTriggered:v11 atLocation:v9];

      id v19 = objc_alloc((Class)CLLocation);
      [v11 latitude];
      double v21 = v20;
      [v11 longitude];
      id v35 = [v19 initWithLatitude:v21 longitude:v22];
      [v9 distanceFromLocation:];
      double v24 = v23;
      [v11 radius];
      double v26 = v24 - v25;
      memset(buf, 0, 24);
      v27 = +[SystemConfig sharedInstance];
      double v28 = v27;
      if (v27) {
        [v27 batteryStats];
      }
      else {
        memset(buf, 0, 24);
      }

      v37[0] = @"locationManagerMonitoringFenceTriggerDistance";
      CLLocationDegrees v29 = +[NSNumber numberWithInteger:(uint64_t)v26];
      v38[0] = v29;
      v37[1] = @"locationManagerMonitoringFenceTriggerType";
      CLLocationDegrees v30 = sub_100014388(a3);
      v38[1] = v30;
      v37[2] = @"locationManagerMonitoringFenceType";
      CLLocationDegrees v31 = sub_100014360((uint64_t)[v11 triggerType]);
      v38[2] = v31;
      v37[3] = @"locationManagerMonitoringFenceTriggerBatteryLevel";
      LODWORD(v32) = *(_DWORD *)&buf[16];
      id v33 = +[NSNumber numberWithFloat:v32];
      v38[3] = v33;
      double v34 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
      AnalyticsSendEvent();
    }
  }
  else
  {
    uint64_t v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003787C();
    }
  }
}

- (void)_updateFencesToMonitorCache
{
  BOOL v3 = [(FMFFencesMgr *)self _fencesCacheFileURL];
  id v4 = [(FMFFencesMgr *)self fencesToMonitor];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = sub_10001B6D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [(FMFFencesMgr *)self fencesToMonitor];
      *(_DWORD *)buf = 134217984;
      id v25 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Saving %ld fences to cache...", buf, 0xCu);
    }
    id v8 = +[NSMutableDictionary dictionary];
    id v9 = [(FMFFencesMgr *)self fencesToMonitor];
    id v10 = [v9 fm_map:&stru_100059AA0];
    [v8 setObject:v10 forKeyedSubscript:@"fences"];

    id v11 = [(FMFFencesMgr *)self triggerURL];
    [v8 setObject:v11 forKeyedSubscript:@"triggerURL"];

    [(FMFFencesMgr *)self triggerValidityDuration];
    uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v8 setObject:v12 forKeyedSubscript:@"triggerValidityDuration"];

    unsigned int v13 = [(FMFFencesMgr *)self fenceVersion];
    [v8 setObject:v13 forKeyedSubscript:@"fenceVersion"];

    uint64_t v14 = [(FMFFencesMgr *)self dataArchiver];
    long long v15 = [v14 saveDictionary:v8];

    if (v15)
    {
      __int16 v16 = sub_10001B6D4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000379AC();
      }
    }
    goto LABEL_8;
  }
  long long v17 = [(FMFFencesMgr *)self fenceVersion];

  if (v17)
  {
    __int16 v18 = +[NSFileManager defaultManager];
    id v19 = [v3 path];
    unsigned int v20 = [v18 fileExistsAtPath:v19];

    if (v20)
    {
      double v21 = sub_10001B6D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100037968(v21);
      }

      double v22 = +[NSFileManager defaultManager];
      id v23 = 0;
      [v22 removeItemAtURL:v3 error:&v23];
      id v8 = v23;

      if (!v8) {
        goto LABEL_9;
      }
      long long v15 = sub_10001B6D4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000378F4();
      }
LABEL_8:

LABEL_9:
    }
  }
}

- (void)_readFencesToMonitorCache
{
  BOOL v3 = [(FMFFencesMgr *)self dataArchiver];
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  id v16 = 0;
  id v5 = [v3 readDictionaryAndClasses:v4 error:&v16];
  id v6 = v16;

  int v7 = sub_10001B6D4();
  id v8 = v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFFencesMgr successfully read fences from disk.", v15, 2u);
    }

    id v10 = [v5 objectForKeyedSubscript:@"triggerURL"];
    [(FMFFencesMgr *)self setTriggerURL:v10];

    id v11 = [v5 objectForKeyedSubscript:@"triggerValidityDuration"];
    [v11 doubleValue];
    -[FMFFencesMgr setTriggerValidityDuration:](self, "setTriggerValidityDuration:");

    uint64_t v12 = [v5 objectForKeyedSubscript:@"fenceVersion"];
    [(FMFFencesMgr *)self setFenceVersion:v12];

    id v8 = [v5 objectForKeyedSubscript:@"fences"];
    unsigned int v13 = [v8 fm_map:&stru_100059AE0];
    [(FMFFencesMgr *)self setFencesToMonitor:v13];

    uint64_t v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100037A7C(self);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100037A14();
  }
}

- (id)_fencesCacheFileURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v2 count])
  {
    BOOL v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 stringByAppendingPathComponent:@"Preferences"];
    id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1 relativeToURL:0];
  }
  else
  {
    id v6 = sub_10001B6D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100037B74(v6);
    }

    id v5 = 0;
  }
  int v7 = [v5 URLByAppendingPathComponent:@"com.apple.icloud.fmflocatord.fences.notbackedup.plist" isDirectory:0];

  id v8 = sub_10001B6D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100037B00();
  }

  return v7;
}

- (id)_currentFences
{
  v2 = [(FMFFencesMgr *)self monitoredFences];
  BOOL v3 = [v2 fm_filter:&stru_100059B20];

  return v3;
}

- (void)schedulerCurrentSchedulesDidChange:(id)a3
{
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[FMFFencesMgr schedulerCurrentSchedulesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Schedules Changed, Updating CL", (uint8_t *)&v5, 0xCu);
  }

  [(FMFFencesMgr *)self _updateCL];
}

- (void)fenceSchedulerCurrentSchedulesDidChange:(id)a3
{
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[FMFFencesMgr fenceSchedulerCurrentSchedulesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Fence Schedules Changed, Updating CL", (uint8_t *)&v5, 0xCu);
  }

  [(FMFFencesMgr *)self updateGeoFences];
}

- (void)setupSessionCallbacks:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000189F0;
    v5[3] = &unk_100059B48;
    objc_copyWeak(&v6, &location);
    [v4 setFencesUpdateCallback:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)networkReachabilityUpdated:(BOOL)a3
{
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10001B6D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100037BB8(v6);
  }

  BOOL v9 = [v6 identifier];
  id v10 = +[NSString stringWithFormat:@"Received didEnterRegion from CoreLocation for region: %@", v9];
  [(FMFFencesMgr *)self showDebugFenceTriggerAlertIfNeededWithTitle:@"Received didEnterRegion from CoreLocation" text:v10];

  id v11 = [v6 identifier];
  uint64_t v12 = [v7 location];

  [(FMFFencesMgr *)self _trigger:0 forRegionWithID:v11 atLocation:v12];
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10001B6D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100037C3C(v6);
  }

  BOOL v9 = [v6 identifier];
  id v10 = +[NSString stringWithFormat:@"Received didExitRegion from CoreLocation for region: %@", v9];
  [(FMFFencesMgr *)self showDebugFenceTriggerAlertIfNeededWithTitle:@"Received didExitRegion from CoreLocation" text:v10];

  id v11 = [v6 identifier];
  uint64_t v12 = [v7 location];

  [(FMFFencesMgr *)self _trigger:1 forRegionWithID:v11 atLocation:v12];
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10001B6D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100037D58(v9);
  }

  if (a4)
  {
    if (a4 == 1) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 3;
    }
    uint64_t v12 = [v9 identifier];
    unsigned int v13 = [v8 location];
    [(FMFFencesMgr *)self _trigger:v11 forRegionWithID:v12 atLocation:v13];
  }
  else
  {
    uint64_t v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100037CC0(v9, v14);
    }

    AnalyticsSendEvent();
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_100037DDC();
  }

  CFStringRef v9 = @"locationManagerDidFailWithError";
  id v7 = -[FMFFencesMgr CLErrorAsString:](self, "CLErrorAsString:", [v5 code]);
  id v10 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  AnalyticsSendEvent();
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  CFStringRef v9 = sub_10001B6D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_100037E50(v7, (uint64_t)v8, v9);
  }

  CFStringRef v14 = @"locationManagerMonitoringDidFailForRegionError";
  id v10 = -[FMFFencesMgr CLErrorAsString:](self, "CLErrorAsString:", [v8 code]);
  long long v15 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  AnalyticsSendEvent();

  uint64_t v12 = [v7 identifier];
  unsigned int v13 = +[NSString stringWithFormat:@"Monitoring failed for region with identifier: %@ (%@)", v12, v8];
  [(FMFFencesMgr *)self showDebugFenceTriggerAlertIfNeededWithTitle:@"Monitoring failed for region" text:v13];
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v4 = a4;
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100037EF4(v4);
  }

  AnalyticsSendEvent();
}

- (void)showDebugFenceTriggerAlertIfNeededWithTitle:(id)a3 text:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (qword_10006D458 != -1) {
    dispatch_once(&qword_10006D458, &stru_100059B68);
  }
  if (byte_10006D450)
  {
    id v6 = objc_alloc_init((Class)FMAlert);
    [v6 setCategory:qword_10006CDE8];
    [v6 setMsgTitle:v8];
    [v6 setMsgText:v5];
    [v6 setShowMsgInLockScreen:1];
    [v6 setDismissMsgOnUnlock:0];
    [v6 setDismissMsgOnLock:0];
    id v7 = +[FMAlertManager sharedInstance];
    [v7 activateAlert:v6];
  }
}

- (id)CLErrorAsString:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x12)
  {
    BOOL v3 = +[NSString stringWithFormat:@"%ld", a3];
  }
  else
  {
    BOOL v3 = *(&off_100059B88 + a3);
  }

  return v3;
}

- (NSString)triggerURL
{
  return self->_triggerURL;
}

- (void)setTriggerURL:(id)a3
{
}

- (NSString)fenceVersion
{
  return self->_fenceVersion;
}

- (void)setFenceVersion:(id)a3
{
}

- (double)triggerValidityDuration
{
  return self->_triggerValidityDuration;
}

- (void)setTriggerValidityDuration:(double)a3
{
  self->_triggerValidityDuration = a3;
}

- (FMFFencesMgrDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMFFencesMgrDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)fencesToMonitor
{
  return self->_fencesToMonitor;
}

- (NSSet)allFences
{
  return self->_allFences;
}

- (NSDictionary)monitoredFences
{
  return self->_monitoredFences;
}

- (void)setLocMgr:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (FenceProvider)fenceProvider
{
  return self->_fenceProvider;
}

- (FenceSchedulerProtocol)scheduler
{
  return self->_scheduler;
}

- (BOOL)isNetworkAvailable
{
  return self->_networkAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_fenceProvider, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_locMgr, 0);
  objc_storeStrong((id *)&self->_monitoredFences, 0);
  objc_storeStrong((id *)&self->_allFences, 0);
  objc_storeStrong((id *)&self->_fencesToMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fenceVersion, 0);

  objc_storeStrong((id *)&self->_triggerURL, 0);
}

@end