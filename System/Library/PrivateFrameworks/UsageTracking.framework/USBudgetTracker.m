@interface USBudgetTracker
+ (USBudgetTracker)sharedTracker;
+ (_TtC18UsageTrackingAgent22DeviceActivityQuerying)usageQuerying;
+ (id)_getRemainingTimeForBudgets:(id)a3 referenceDate:(id)a4 error:(id *)a5;
+ (id)_getRemainingTimeForEvents:(id)a3 referenceDate:(id)a4 error:(id *)a5;
+ (void)_checkStatusOfBudgets:(id)a3 withError:(id)a4 completionHandler:(id)a5;
+ (void)checkStatusOfAllBudgetsWithCompletionHandler:(id)a3;
+ (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5;
+ (void)startTracking;
- (BMBiomeScheduler)applicationScheduler;
- (BMBiomeScheduler)nowPlayingScheduler;
- (BMBiomeScheduler)videoScheduler;
- (BMBiomeScheduler)webDomainScheduler;
- (BOOL)_deviceActivityBudgetWasAddedOrUpdated:(id)a3 didCollectLocalActivity:(BOOL)a4;
- (BOOL)_notifyExtensionThatEventDidReachThreshold:(id)a3 activity:(id)a4 clientIdentifier:(id)a5 extensionIdentifier:(id)a6 isWarning:(BOOL)a7;
- (BOOL)_notifyExtensionThatEventDidUnreachThreshold:(id)a3 activity:(id)a4 clientIdentifier:(id)a5 extensionIdentifier:(id)a6;
- (BOOL)_notifyForBudgets:(id)a3 events:(id)a4 nextNotificationEventName:(const char *)a5 syncForImpendingBudgets:(BOOL)a6;
- (BOOL)_setAlarmsOrNotifyExtensionsForDeviceActivityBudgets:(id)a3 notifyForIntervalEnd:(BOOL)a4 isEndOfInterval:(BOOL)a5 includePastActivityIfNeeded:(BOOL)a6;
- (BOOL)_setWarningAlarmOrNotifyExtensionWithComponents:(id)a3 referenceDate:(id)a4 budgetID:(id)a5 activity:(id)a6 clientIdentifier:(id)a7 extensionIdentifier:(id)a8 warnForStartOfInterval:(BOOL)a9;
- (BPSSink)applicationSubscription;
- (BPSSink)nowPlayingSubscription;
- (BPSSink)videoSubscription;
- (BPSSink)webDomainSubscription;
- (NSBackgroundActivityScheduler)resetDeviceActivityAlarms;
- (NSDate)lastSyncDate;
- (OS_dispatch_queue)schedulerQueue;
- (USBudgetTracker)init;
- (_CDContextualChangeRegistration)applicationRegistration;
- (_CDContextualChangeRegistration)nowPlayingRegistration;
- (_CDContextualChangeRegistration)videoRegistration;
- (_CDContextualChangeRegistration)webDomainRegistration;
- (void)_applicationAlarmDidFire;
- (void)_applicationRegistrationDidFire;
- (void)_budgetIntervalAlarmDidFire:(const char *)a3 isWarning:(BOOL)a4 isEndOfInterval:(BOOL)a5;
- (void)_budgetsResetAlarmDidFire:(id)a3;
- (void)_checkBudgetStatusForAllCurrentUsage;
- (void)_checkBudgetStatusForApplications:(id)a3;
- (void)_checkBudgetStatusForNowPlayingCategories:(id)a3;
- (void)_checkBudgetStatusForVideoBundleIdentifiers:(id)a3;
- (void)_checkBudgetStatusForVideoWebDomains:(id)a3;
- (void)_checkBudgetStatusForWebDomains:(id)a3;
- (void)_clearPostedNotificationsForNoLongerExpiredBudgets;
- (void)_completion:(id)a3 streamIdentifier:(id)a4;
- (void)_deviceActivityBudgetWasAddedOrUpdated:(id)a3;
- (void)_deviceActivityBudgetsWereRemoved:(id)a3;
- (void)_deviceActivitySyncCoordinatorDidIdle:(id)a3;
- (void)_didCollectLocalActivityForApplications:(id)a3;
- (void)_didCollectLocalActivityForDeviceActivityAlarmReset;
- (void)_didCollectLocalActivityForIdleSyncCoordinator;
- (void)_didCollectLocalActivityForNowPlayingCategories:(id)a3;
- (void)_didCollectLocalActivityForVideoBundleIdentifiers:(id)a3;
- (void)_didCollectLocalActivityForVideoWebDomains:(id)a3;
- (void)_didCollectLocalActivityForWebDomains:(id)a3;
- (void)_duetSyncCoordinatorDidIdle;
- (void)_notifyExtensionThatIntervalDidEndForActivity:(id)a3 clientIdentifier:(id)a4 extensionIdentifier:(id)a5 isWarning:(BOOL)a6;
- (void)_notifyExtensionThatIntervalDidStartForActivity:(id)a3 clientIdentifier:(id)a4 extensionIdentifier:(id)a5 isWarning:(BOOL)a6;
- (void)_nowPlayingAlarmDidFire;
- (void)_nowPlayingRegistrationDidFire;
- (void)_registerForAllUsage;
- (void)_registerForApplicationUsage;
- (void)_registerForNowPlayingUsage;
- (void)_registerForVideoUsage;
- (void)_registerForWebDomainUsage;
- (void)_registeredBudgetsDidChange:(id)a3;
- (void)_resetDeviceActivityAlarms;
- (void)_startTracking;
- (void)_subscribeForApplicationUsage;
- (void)_subscribeForNowPlayingUsage;
- (void)_subscribeForVideoUsage;
- (void)_subscribeForWebDomainUsage;
- (void)_systemTimeDidChange;
- (void)_tombstoneEventDidFire:(const char *)a3;
- (void)_videoAlarmDidFire;
- (void)_videoRegistrationDidFire;
- (void)_webDomainAlarmDidFire;
- (void)_webDomainRegistrationDidFire;
- (void)setApplicationRegistration:(id)a3;
- (void)setApplicationSubscription:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setNowPlayingRegistration:(id)a3;
- (void)setNowPlayingSubscription:(id)a3;
- (void)setVideoRegistration:(id)a3;
- (void)setVideoSubscription:(id)a3;
- (void)setWebDomainRegistration:(id)a3;
- (void)setWebDomainSubscription:(id)a3;
@end

@implementation USBudgetTracker

+ (_TtC18UsageTrackingAgent22DeviceActivityQuerying)usageQuerying
{
  if (qword_1000961A8 != -1) {
    dispatch_once(&qword_1000961A8, &stru_10008A280);
  }
  v2 = (void *)qword_1000961A0;
  return (_TtC18UsageTrackingAgent22DeviceActivityQuerying *)v2;
}

- (USBudgetTracker)init
{
  v17.receiver = self;
  v17.super_class = (Class)USBudgetTracker;
  v2 = [(USBudgetTracker *)&v17 init];
  v3 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.UsageTrackingAgent.activity.reset-device-activity-alarms"];
  resetDeviceActivityAlarms = v2->_resetDeviceActivityAlarms;
  v2->_resetDeviceActivityAlarms = v3;

  if (_os_feature_enabled_impl())
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.UsageTrackingAgent.scheduler-queue", v5);
    schedulerQueue = v2->_schedulerQueue;
    v2->_schedulerQueue = (OS_dispatch_queue *)v6;

    v8 = (BMBiomeScheduler *)[objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.UsageTrackingAgent.application-scheduler" targetQueue:v2->_schedulerQueue];
    applicationScheduler = v2->_applicationScheduler;
    v2->_applicationScheduler = v8;

    v10 = (BMBiomeScheduler *)[objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.UsageTrackingAgent.web-domain-scheduler" targetQueue:v2->_schedulerQueue];
    webDomainScheduler = v2->_webDomainScheduler;
    v2->_webDomainScheduler = v10;

    v12 = (BMBiomeScheduler *)[objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.UsageTrackingAgent.now-playing-scheduler" targetQueue:v2->_schedulerQueue];
    nowPlayingScheduler = v2->_nowPlayingScheduler;
    v2->_nowPlayingScheduler = v12;

    v14 = (BMBiomeScheduler *)[objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.UsageTrackingAgent.video-scheduler" targetQueue:v2->_schedulerQueue];
    videoScheduler = v2->_videoScheduler;
    v2->_videoScheduler = v14;
  }
  return v2;
}

+ (USBudgetTracker)sharedTracker
{
  if (qword_1000961B8 != -1) {
    dispatch_once(&qword_1000961B8, &stru_10008A2A0);
  }
  v2 = (void *)qword_1000961B0;
  return (USBudgetTracker *)v2;
}

+ (void)startTracking
{
  id v2 = [a1 sharedTracker];
  [v2 _startTracking];
}

- (void)_startTracking
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting tracking: setting XPC alarm and notification event handlers, budget change notification handlers, and checking for screen/application/web change registration.", buf, 2u);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100011DE8;
  handler[3] = &unk_10008A2C8;
  handler[4] = self;
  handler[5] = a2;
  xpc_set_event_stream_handler("com.apple.alarm", 0, handler);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012034;
  v11[3] = &unk_10008A2C8;
  v11[4] = self;
  v11[5] = a2;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000121A4;
  v10[3] = &unk_10008A2F0;
  v10[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v10);
  +[MOEffectiveSettings startObservingChangesWithHandler:&stru_10008A330];
  v4 = [(USBudgetTracker *)self resetDeviceActivityAlarms];
  [v4 setPreregistered:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000126C0;
  v9[3] = &unk_10008A3D8;
  v9[4] = self;
  [v4 scheduleWithBlock:v9];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_registeredBudgetsDidChange:" name:@"RegisteredBudgetsDidChange" object:0];
  [v5 addObserver:self selector:"_deviceActivityBudgetWasAddedOrUpdated:" name:@"DeviceActivityBudgetWasAddedOrUpdated" object:0];
  [v5 addObserver:self selector:"_deviceActivityBudgetsWereRemoved:" name:@"DeviceActivityBudgetsWereRemoved" object:0];
  dispatch_queue_t v6 = +[SyncCoordinator privateEngineDidIdleNotificationName];
  [v5 addObserver:self selector:"_deviceActivitySyncCoordinatorDidIdle:" name:v6 object:0];

  int v7 = MKBUserUnlockedSinceBoot();
  int v8 = v7;
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006AC48(v8);
    }
  }
  else if (v7 == 1)
  {
    [(USBudgetTracker *)self _registerForAllUsage];
  }
}

- (void)_registeredBudgetsDidChange:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Budgets changed, checking application/web change registration", v4, 2u);
  }
  [(USBudgetTracker *)self _registerForAllUsage];
}

- (void)_deviceActivityBudgetWasAddedOrUpdated:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device activity budget was added or updated, checking application/web change registration", buf, 2u);
  }
  if ([(USBudgetTracker *)self _deviceActivityBudgetWasAddedOrUpdated:v4 didCollectLocalActivity:0])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000128C4;
    v5[3] = &unk_10008A198;
    v5[4] = self;
    id v6 = v4;
    +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v5];
  }
}

- (BOOL)_deviceActivityBudgetWasAddedOrUpdated:(id)a3 didCollectLocalActivity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  int v7 = [v6 userInfo];
  int v8 = [v7 objectForKeyedSubscript:@"BudgetID"];
  v9 = [v7 objectForKeyedSubscript:@"ClientIdentifier"];
  v10 = +[USBudgetRegistration sharedRegistration];
  v11 = [v8 URIRepresentation];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  objc_super v17 = sub_100012A74;
  v18 = &unk_10008A400;
  v21 = &v23;
  v19 = self;
  BOOL v22 = v4;
  id v12 = v8;
  id v20 = v12;
  [v10 fetchBudgetForDeviceActivityWithURI:v11 clientIdentifier:v9 completionHandler:&v15];

  if (v4) {
    [(USBudgetTracker *)self _registerForAllUsage];
  }
  char v13 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (void)_deviceActivityBudgetsWereRemoved:(id)a3
{
  v3 = [a3 userInfo];
  BOOL v4 = [v3 objectForKeyedSubscript:@"BudgetMetadata"];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v33 = *(void *)v35;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v9 = [v8 budgetID];
        v10 = [v9 URIRepresentation];
        v11 = [v10 absoluteString];

        id v12 = objc_alloc((Class)NSString);
        char v13 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.alarm.start-"];
        id v14 = [v12 initWithFormat:@"%@%@", v13, v11];

        id v15 = v14;
        [v15 UTF8String];
        xpc_set_event();
        id v16 = objc_alloc((Class)NSString);
        objc_super v17 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.alarm.start-warning-"];
        id v18 = [v16 initWithFormat:@"%@%@", v17, v11];

        id v19 = v18;
        [v19 UTF8String];
        xpc_set_event();
        id v20 = objc_alloc((Class)NSString);
        v21 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.alarm.end-"];
        id v22 = [v20 initWithFormat:@"%@%@", v21, v11];

        id v23 = v22;
        [v23 UTF8String];
        xpc_set_event();
        id v24 = objc_alloc((Class)NSString);
        uint64_t v25 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.end-warning-"];
        id v26 = [v24 initWithFormat:@"%@%@", v25, v11];

        id v27 = v26;
        [v27 UTF8String];
        xpc_set_event();
        if ([v8 intervalDidStart])
        {
          v28 = [v8 activity];
          v29 = [v8 clientIdentifier];
          v30 = [v8 extensionIdentifier];
          [(USBudgetTracker *)self _notifyExtensionThatIntervalDidEndForActivity:v28 clientIdentifier:v29 extensionIdentifier:v30 isWarning:0];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v6);
  }

  [(USBudgetTracker *)self _registerForAllUsage];
}

- (void)_registerForAllUsage
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(USBudgetTracker *)self schedulerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013050;
    block[3] = &unk_100089DD8;
    block[4] = self;
    dispatch_async(v3, block);
  }
  else
  {
    [(USBudgetTracker *)self _registerForApplicationUsage];
    [(USBudgetTracker *)self _registerForWebDomainUsage];
    [(USBudgetTracker *)self _registerForNowPlayingUsage];
    [(USBudgetTracker *)self _registerForVideoUsage];
  }
}

- (void)_subscribeForApplicationUsage
{
  id v2 = self;
  v3 = [(USBudgetTracker *)self applicationSubscription];
  [v3 cancel];

  xpc_set_event();
  BOOL v4 = +[USBudgetRegistration sharedRegistration];
  id v71 = 0;
  id v5 = [v4 areCategoriesBudgeted:&v71];
  id v6 = v71;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006ADF4();
    }
    unsigned int v14 = 0;
    v11 = 0;
    goto LABEL_50;
  }
  if ([v5 BOOLValue])
  {
    int v7 = BiomeLibrary();
    int v8 = [v7 ScreenTime];
    v9 = [v8 AppUsage];
    v10 = [v9 DSLPublisher];

    v11 = [v10 filterWithKeyPath:@"eventBody.starting" value:&__kCFBooleanTrue];
    if ([0 count])
    {
      uint64_t v12 = [v11 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:0];

      v11 = (void *)v12;
    }

    if (_os_feature_enabled_impl())
    {
      id v13 = +[DeviceActivityQuerying currentBundleIdentifiers];
    }
    else
    {
      v61 = v11;
      v62 = v5;
      v64 = v4;
      v66 = v2;
      uint64_t v24 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
      uint64_t v25 = +[_CDContextQueries appUsageBundleID];
      id v26 = +[_CDContextQueries appUsageType];
      v56 = +[_CDClientContext userContext];
      v58 = (void *)v24;
      id v27 = [v56 objectForKeyedSubscript:v24];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v28 = [v27 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v28)
      {
        id v29 = v28;
        id v30 = 0;
        uint64_t v31 = *(void *)v73;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v73 != v31) {
              objc_enumerationMutation(v27);
            }
            uint64_t v33 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            long long v34 = [v33 objectForKeyedSubscript:v26];
            long long v35 = v34;
            if (!v34 || [v34 integerValue] == (id)1)
            {
              if (v30)
              {
                long long v36 = [v33 objectForKeyedSubscript:v25];
                [v30 addObject:v36];
              }
              else
              {
                id v37 = objc_alloc((Class)NSMutableOrderedSet);
                long long v36 = [v33 objectForKeyedSubscript:v25];
                id v30 = objc_msgSend(v37, "initWithObjects:", v36, 0);
              }
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v29);
      }
      else
      {
        id v30 = 0;
      }
      id v13 = v30;

      BOOL v4 = v64;
      id v2 = v66;
      v11 = v61;
      id v5 = v62;
    }
    unsigned int v14 = [v13 count] != 0;

LABEL_50:
    id v16 = v6;
    goto LABEL_55;
  }
  id v70 = v6;
  id v15 = [v4 fetchAllBudgetedApplicationsAndReturnError:&v70];
  id v16 = v70;

  if ([v15 count])
  {
    objc_super v17 = [v15 set];
    id v18 = BiomeLibrary();
    id v19 = [v18 ScreenTime];
    id v20 = [v19 AppUsage];
    v21 = [v20 DSLPublisher];

    v11 = [v21 filterWithKeyPath:@"eventBody.starting" value:&__kCFBooleanTrue];
    if ([v17 count])
    {
      uint64_t v22 = [v11 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:v17];

      v11 = (void *)v22;
    }

    if (_os_feature_enabled_impl())
    {
      id v23 = +[DeviceActivityQuerying currentBundleIdentifiers];
    }
    else
    {
      v59 = v15;
      id v60 = v16;
      v63 = v5;
      v65 = v4;
      v67 = v2;
      uint64_t v38 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
      v39 = +[_CDContextQueries appUsageBundleID];
      v40 = +[_CDContextQueries appUsageType];
      v55 = +[_CDClientContext userContext];
      v57 = (void *)v38;
      v41 = [v55 objectForKeyedSubscript:v38];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v42 = [v41 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v42)
      {
        id v43 = v42;
        id v44 = 0;
        uint64_t v45 = *(void *)v73;
        do
        {
          for (j = 0; j != v43; j = (char *)j + 1)
          {
            if (*(void *)v73 != v45) {
              objc_enumerationMutation(v41);
            }
            v47 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
            v48 = [v47 objectForKeyedSubscript:v40];
            v49 = v48;
            if (!v48 || [v48 integerValue] == (id)1)
            {
              if (v44)
              {
                v50 = [v47 objectForKeyedSubscript:v39];
                [v44 addObject:v50];
              }
              else
              {
                id v51 = objc_alloc((Class)NSMutableOrderedSet);
                v50 = [v47 objectForKeyedSubscript:v39];
                id v44 = objc_msgSend(v51, "initWithObjects:", v50, 0);
              }
            }
          }
          id v43 = [v41 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v43);
      }
      else
      {
        id v44 = 0;
      }
      id v23 = v44;

      BOOL v4 = v65;
      id v2 = v67;
      id v5 = v63;
      id v15 = v59;
      id v16 = v60;
    }
    unsigned int v14 = [v23 intersectsOrderedSet:v15];
  }
  else
  {
    if (!v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006AE64();
    }
    unsigned int v14 = 0;
    v11 = 0;
  }

LABEL_55:
  v52 = [(USBudgetTracker *)v2 applicationScheduler];
  v53 = [v11 subscribeOn:v52];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_10001382C;
  v69[3] = &unk_10008A428;
  v69[4] = v2;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_100013844;
  v68[3] = &unk_10008A450;
  v68[4] = v2;
  v54 = [v53 sinkWithCompletion:v69 receiveInput:v68];
  [(USBudgetTracker *)v2 setApplicationSubscription:v54];

  if (v14) {
    [(USBudgetTracker *)v2 _applicationRegistrationDidFire];
  }
}

- (void)_registerForApplicationUsage
{
  BOOL v4 = [(USBudgetTracker *)self applicationRegistration];
  if (v4)
  {
    id v5 = +[_CDClientContext userContext];
    [v5 deregisterCallback:v4];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deregistered from CoreDuet user context application usage status changes", buf, 2u);
    }
  }
  xpc_set_event();
  id v6 = +[USBudgetRegistration sharedRegistration];
  id v19 = 0;
  int v7 = [v6 areCategoriesBudgeted:&v19];
  id v8 = v19;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006AED4();
    }
    goto LABEL_24;
  }
  v9 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  if ([v7 BOOLValue])
  {
    v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v9];
    v11 = "";
    id v12 = v8;
  }
  else
  {
    id v18 = v8;
    id v13 = [v6 fetchAllBudgetedApplicationsAndReturnError:&v18];
    id v12 = v18;

    if ([v13 count])
    {
      unsigned int v14 = +[_CDContextQueries appUsageBundleID];
      v10 = +[_CDContextualPredicate predicateForKeyPath:v9, @"ANY SELF.%@.value.%K IN %@", v9, v14, v13 withFormat];
    }
    else
    {
      if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006AF44();
      }
      v10 = 0;
    }

    v11 = " not";
  }

  if (!v10)
  {
    id v8 = v12;
LABEL_24:
    [(USBudgetTracker *)self setApplicationRegistration:0];
    id v12 = v8;
    goto LABEL_25;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013BDC;
  v17[3] = &unk_10008A478;
  v17[4] = self;
  v17[5] = a2;
  id v15 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.UsageTrackingAgent.registration.application" contextualPredicate:v10 clientIdentifier:@"com.apple.UsageTrackingAgent" callback:v17];
  [(USBudgetTracker *)self setApplicationRegistration:v15];
  id v16 = +[_CDClientContext userContext];
  [v16 registerCallback:v15];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registered for CoreDuet user context application usage status changes, categories are%{public}s budgeted", buf, 0xCu);
  }
  if (([v10 firesOnAnyChange] & 1) != 0
    || [v16 evaluatePredicate:v10])
  {
    [(USBudgetTracker *)self _applicationRegistrationDidFire];
  }

LABEL_25:
}

- (void)_subscribeForWebDomainUsage
{
  id v2 = self;
  v3 = [(USBudgetTracker *)self webDomainSubscription];
  [v3 cancel];

  xpc_set_event();
  BOOL v4 = +[USBudgetRegistration sharedRegistration];
  id v49 = 0;
  id v5 = [v4 areCategoriesBudgeted:&v49];
  id v6 = v49;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006AFB4();
    }
    unsigned int v13 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  if ([v5 BOOLValue])
  {
    int v7 = BiomeLibrary();
    id v8 = [v7 App];
    v9 = [v8 WebUsage];
    v10 = [v9 DSLPublisher];

    v11 = [v10 filterWithKeyPath:@"eventBody.usageState" value:&off_10008CE90];
    if ([0 count])
    {
      uint64_t v12 = [v11 filterWithKeyPath:@"eventBody.webDomain" comparison:3 value:0];

      v11 = (void *)v12;
    }

    unsigned int v13 = 1;
LABEL_9:
    id v14 = v6;
    goto LABEL_36;
  }
  id v48 = v6;
  id v15 = [v4 fetchAllBudgetedWebDomainsAndReturnError:&v48];
  id v14 = v48;

  if ([v15 count])
  {
    id v16 = [v15 set];
    objc_super v17 = BiomeLibrary();
    id v18 = [v17 App];
    id v19 = [v18 WebUsage];
    id v20 = [v19 DSLPublisher];

    v11 = [v20 filterWithKeyPath:@"eventBody.usageState" value:&off_10008CE90];
    if ([v16 count])
    {
      uint64_t v21 = [v11 filterWithKeyPath:@"eventBody.webDomain" comparison:3 value:v16];

      v11 = (void *)v21;
    }

    if (_os_feature_enabled_impl())
    {
      id v22 = +[DeviceActivityQuerying currentWebDomains];
    }
    else
    {
      v41 = v15;
      id v42 = v14;
      id v43 = v5;
      id v44 = v4;
      uint64_t v45 = v2;
      uint64_t v23 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
      uint64_t v24 = +[_CDContextQueries appWebUsageWebDomain];
      uint64_t v25 = +[_CDContextQueries appWebUsageType];
      v39 = +[_CDClientContext userContext];
      v40 = (void *)v23;
      id v26 = [v39 objectForKeyedSubscript:v23];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v27)
      {
        id v28 = v27;
        id v29 = 0;
        uint64_t v30 = *(void *)v51;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v51 != v30) {
              objc_enumerationMutation(v26);
            }
            v32 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            uint64_t v33 = [v32 objectForKeyedSubscript:v25];
            if ([v33 integerValue] == (id)1)
            {
              if (v29)
              {
                long long v34 = [v32 objectForKeyedSubscript:v24];
                [v29 addObject:v34];
              }
              else
              {
                id v35 = objc_alloc((Class)NSMutableOrderedSet);
                long long v34 = [v32 objectForKeyedSubscript:v24];
                id v29 = objc_msgSend(v35, "initWithObjects:", v34, 0);
              }
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v28);
      }
      else
      {
        id v29 = 0;
      }
      id v22 = v29;

      BOOL v4 = v44;
      id v2 = v45;
      id v14 = v42;
      id v5 = v43;
      id v15 = v41;
    }
    unsigned int v13 = [v22 intersectsOrderedSet:v15];
  }
  else
  {
    if (!v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B024();
    }
    unsigned int v13 = 0;
    v11 = 0;
  }

LABEL_36:
  long long v36 = [(USBudgetTracker *)v2 webDomainScheduler];
  id v37 = [v11 subscribeOn:v36];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10001420C;
  v47[3] = &unk_10008A428;
  v47[4] = v2;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100014224;
  v46[3] = &unk_10008A450;
  v46[4] = v2;
  uint64_t v38 = [v37 sinkWithCompletion:v47 receiveInput:v46];
  [(USBudgetTracker *)v2 setWebDomainSubscription:v38];

  if (v13) {
    [(USBudgetTracker *)v2 _webDomainRegistrationDidFire];
  }
}

- (void)_registerForWebDomainUsage
{
  BOOL v4 = [(USBudgetTracker *)self webDomainRegistration];
  if (v4)
  {
    id v5 = +[_CDClientContext userContext];
    [v5 deregisterCallback:v4];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deregistered from CoreDuet user context web usage status changes", buf, 2u);
    }
  }
  xpc_set_event();
  id v6 = +[USBudgetRegistration sharedRegistration];
  id v19 = 0;
  int v7 = [v6 areCategoriesBudgeted:&v19];
  id v8 = v19;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B094();
    }
    goto LABEL_24;
  }
  v9 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
  if ([v7 BOOLValue])
  {
    v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v9];
    v11 = "";
    id v12 = v8;
  }
  else
  {
    id v18 = v8;
    unsigned int v13 = [v6 fetchAllBudgetedWebDomainsAndReturnError:&v18];
    id v12 = v18;

    if ([v13 count])
    {
      id v14 = +[_CDContextQueries appWebUsageWebDomain];
      v10 = +[_CDContextualPredicate predicateForKeyPath:v9, @"ANY SELF.%@.value.%K IN %@", v9, v14, v13 withFormat];
    }
    else
    {
      if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006B104();
      }
      v10 = 0;
    }

    v11 = " not";
  }

  if (!v10)
  {
    id v8 = v12;
LABEL_24:
    [(USBudgetTracker *)self setWebDomainRegistration:0];
    id v12 = v8;
    goto LABEL_25;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000145BC;
  v17[3] = &unk_10008A478;
  v17[4] = self;
  v17[5] = a2;
  id v15 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.UsageTrackingAgent.registration.web-domain" contextualPredicate:v10 clientIdentifier:@"com.apple.UsageTrackingAgent" callback:v17];
  [(USBudgetTracker *)self setWebDomainRegistration:v15];
  id v16 = +[_CDClientContext userContext];
  [v16 registerCallback:v15];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registered for CoreDuet user context web usage status changes, categories are%{public}s budgeted", buf, 0xCu);
  }
  if (([v10 firesOnAnyChange] & 1) != 0
    || [v16 evaluatePredicate:v10])
  {
    [(USBudgetTracker *)self _webDomainRegistrationDidFire];
  }

LABEL_25:
}

- (void)_subscribeForNowPlayingUsage
{
  v3 = [(USBudgetTracker *)self nowPlayingSubscription];
  [v3 cancel];

  xpc_set_event();
  BOOL v4 = +[USBudgetRegistration sharedRegistration];
  id v22 = 0;
  id v5 = [v4 isCategoryBudgeted:CTCategoryIdentifierEntertainment error:&v22];
  id v6 = v22;

  if (v5)
  {
    if ([v5 BOOLValue])
    {
      int v7 = BiomeLibrary();
      id v8 = [v7 Media];
      v9 = [v8 NowPlaying];
      v10 = [v9 DSLPublisher];

      v11 = [0 filterWithKeyPath:@"eventBody.itemMediaType" value:&off_10008CE60];
      id v12 = [v11 filterWithKeyPath:@"eventBody.playbackState" value:&off_10008CE78];

      id v13 = objc_alloc((Class)NSSet);
      id v14 = objc_msgSend(v13, "initWithObjects:", USBundleIdentifierQuickLookUIServiceEmbedded, USBundleIdentifierQuickLookUIServiceMacOS, 0);
      id v15 = [v10 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:v14];

      unsigned int v16 = +[DeviceActivityQuerying isQuickLookVideoNowPlaying];
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006B174();
  }
  unsigned int v16 = 0;
  id v15 = 0;
LABEL_7:
  objc_super v17 = [(USBudgetTracker *)self nowPlayingScheduler];
  id v18 = [v15 subscribeOn:v17];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014914;
  v21[3] = &unk_10008A428;
  v21[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001492C;
  v20[3] = &unk_10008A450;
  v20[4] = self;
  id v19 = [v18 sinkWithCompletion:v21 receiveInput:v20];
  [(USBudgetTracker *)self setNowPlayingSubscription:v19];

  if (v16) {
    [(USBudgetTracker *)self _nowPlayingRegistrationDidFire];
  }
}

- (void)_registerForNowPlayingUsage
{
  BOOL v4 = [(USBudgetTracker *)self nowPlayingRegistration];
  if (v4)
  {
    id v5 = +[_CDClientContext userContext];
    [v5 deregisterCallback:v4];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deregistered from CoreDuet user context Now Playing usage status changes", buf, 2u);
    }
  }
  xpc_set_event();
  id v6 = +[USBudgetRegistration sharedRegistration];
  id v17 = 0;
  int v7 = [v6 isCategoryBudgeted:CTCategoryIdentifierEntertainment error:&v17];
  id v8 = v17;

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B1E4();
    }
    goto LABEL_15;
  }
  if (([v7 BOOLValue] & 1) == 0) {
    goto LABEL_15;
  }
  v9 = +[_CDContextQueries keyPathForNowPlayingDataDictionary];
  v10 = +[_CDContextQueries nowPlayingStatusKey];
  v11 = +[_CDContextQueries nowPlayingMediaTypeKey];
  id v12 = +[_CDContextQueries nowPlayingBundleIdKey];
  id v13 = +[_CDContextualPredicate predicateForKeyPath:v9, @"(SELF.%@.value.%K == %u) && (SELF.%@.value.%K == %@) && ((SELF.%@.value.%K == %@) || (SELF.%@.value.%K == %@))", v9, v10, 1, v9, v11, kMRMediaRemoteNowPlayingInfoTypeVideo, v9, v12, USBundleIdentifierQuickLookUIServiceMacOS, v9, v12, USBundleIdentifierQuickLookUIServiceEmbedded withFormat];

  if (!v13)
  {
LABEL_15:
    [(USBudgetTracker *)self setNowPlayingRegistration:0];
    goto LABEL_16;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100014C5C;
  v16[3] = &unk_10008A478;
  v16[4] = self;
  v16[5] = a2;
  id v14 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.UsageTrackingAgent.registration.now-playing" contextualPredicate:v13 clientIdentifier:@"com.apple.UsageTrackingAgent" callback:v16];
  [(USBudgetTracker *)self setNowPlayingRegistration:v14];
  id v15 = +[_CDClientContext userContext];
  [v15 registerCallback:v14];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registered for CoreDuet user context Now Playing usage status changes", buf, 2u);
  }
  if (([v13 firesOnAnyChange] & 1) != 0
    || [v15 evaluatePredicate:v13])
  {
    [(USBudgetTracker *)self _nowPlayingRegistrationDidFire];
  }

LABEL_16:
}

- (void)_subscribeForVideoUsage
{
  v3 = [(USBudgetTracker *)self videoSubscription];
  [v3 cancel];

  xpc_set_event();
  BOOL v4 = +[USBudgetRegistration sharedRegistration];
  id v77 = 0;
  id v5 = [v4 areCategoriesBudgeted:&v77];
  id v6 = v77;
  if (v5)
  {
    if ([v5 BOOLValue])
    {
      int v7 = BiomeLibrary();
      id v8 = [v7 App];
      v9 = [v8 MediaUsage];
      v10 = [v9 DSLPublisher];

      v11 = [v10 filterWithKeyPath:@"eventBody.starting" value:&__kCFBooleanTrue];
      if ([0 count])
      {
        uint64_t v12 = [v11 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:0];

        v11 = (void *)v12;
      }
      if ([0 count])
      {
        uint64_t v13 = [v11 filterWithKeyPath:@"eventBody.webDomain" comparison:3 value:0];

        v11 = (void *)v13;
      }

      unsigned int v14 = 1;
      goto LABEL_71;
    }
    id v76 = v6;
    id v15 = [v4 fetchAllBudgetedApplicationsAndReturnError:&v76];
    id v16 = v76;

    if (!v15)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006B2C4();
      }
      unsigned int v14 = 0;
      v11 = 0;
      id v6 = v16;
      goto LABEL_70;
    }
    id v75 = v16;
    id v17 = [v4 fetchAllBudgetedWebDomainsAndReturnError:&v75];
    id v6 = v75;

    if (v17)
    {
      if ([v15 count] || objc_msgSend(v17, "count"))
      {
        id v71 = v15;
        id v18 = [v15 set];
        id v70 = v17;
        id v19 = [v17 set];
        id v20 = v18;
        id v21 = v19;
        id v22 = BiomeLibrary();
        uint64_t v23 = [v22 App];
        uint64_t v24 = [v23 MediaUsage];
        uint64_t v25 = [v24 DSLPublisher];

        id v26 = [v25 filterWithKeyPath:@"eventBody.starting" value:&__kCFBooleanTrue];
        if ([v20 count])
        {
          uint64_t v27 = [v26 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:v20];

          long long v72 = (void *)v27;
        }
        else
        {
          long long v72 = v26;
        }
        if ([v21 count])
        {
          uint64_t v28 = [v72 filterWithKeyPath:@"eventBody.webDomain" comparison:3 value:v21];

          long long v72 = (void *)v28;
        }

        if (_os_feature_enabled_impl())
        {
          id v29 = +[DeviceActivityQuerying currentVideoIdentifiers];
        }
        else
        {
          id v68 = v6;
          v69 = v5;
          uint64_t v30 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
          uint64_t v31 = +[_CDContextQueries appMediaUsageBundleID];
          v64 = +[_CDClientContext userContext];
          v66 = (void *)v30;
          v32 = [v64 objectForKeyedSubscript:v30];
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v33 = [v32 countByEnumeratingWithState:&v78 objects:v82 count:16];
          if (v33)
          {
            id v34 = v33;
            id v35 = 0;
            uint64_t v36 = *(void *)v79;
            do
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v79 != v36) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v38 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                if (v35)
                {
                  v39 = [*(id *)(*((void *)&v78 + 1) + 8 * i) objectForKeyedSubscript:v31];
                  [v35 addObject:v39];
                }
                else
                {
                  id v40 = objc_alloc((Class)NSMutableOrderedSet);
                  v39 = [v38 objectForKeyedSubscript:v31];
                  id v35 = objc_msgSend(v40, "initWithObjects:", v39, 0);
                }
              }
              id v34 = [v32 countByEnumeratingWithState:&v78 objects:v82 count:16];
            }
            while (v34);
          }
          else
          {
            id v35 = 0;
          }
          id v41 = v35;

          unint64_t v67 = (unint64_t)v41;
          uint64_t v42 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
          id v43 = +[_CDContextQueries appMediaUsageURL];
          v63 = +[_CDClientContext userContext];
          v65 = (void *)v42;
          id v44 = [v63 objectForKeyedSubscript:v42];
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v45 = [v44 countByEnumeratingWithState:&v78 objects:v82 count:16];
          if (v45)
          {
            id v46 = v45;
            id v47 = 0;
            uint64_t v48 = *(void *)v79;
            do
            {
              for (j = 0; j != v46; j = (char *)j + 1)
              {
                if (*(void *)v79 != v48) {
                  objc_enumerationMutation(v44);
                }
                long long v50 = [*(id *)(*((void *)&v78 + 1) + 8 * (void)j) objectForKeyedSubscript:v43];
                long long v51 = v50;
                if (v50)
                {
                  long long v52 = [v50 host];
                  if (v52)
                  {
                    if (v47) {
                      [v47 addObject:v52];
                    }
                    else {
                      id v47 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithObjects:", v52, 0);
                    }
                  }
                }
              }
              id v46 = [v44 countByEnumeratingWithState:&v78 objects:v82 count:16];
            }
            while (v46);
          }
          else
          {
            id v47 = 0;
          }
          unint64_t v53 = (unint64_t)v47;

          if (v67 | v53)
          {
            id v54 = objc_alloc((Class)BPSTuple);
            v55 = (void *)v67;
            id v5 = v69;
            id v6 = v68;
            if (!v67) {
              v55 = objc_opt_new();
            }
            if (v53)
            {
              id v56 = [v54 initWithFirst:v55 second:v53];
            }
            else
            {
              v57 = objc_opt_new();
              id v56 = [v54 initWithFirst:v55 second:v57];
            }
            if (!v67) {
          }
            }
          else
          {
            id v56 = 0;
            id v5 = v69;
            id v6 = v68;
          }
          id v29 = v56;
        }
        v58 = [v29 first];
        id v15 = v71;
        id v17 = v70;
        if ([v58 intersectsOrderedSet:v71])
        {
          unsigned int v14 = 1;
        }
        else
        {
          v59 = [v29 second];
          unsigned int v14 = [v59 intersectsOrderedSet:v70];
        }
        v11 = v72;
        goto LABEL_69;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10006B334();
    }
    unsigned int v14 = 0;
    v11 = 0;
LABEL_69:

LABEL_70:
    goto LABEL_71;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006B254();
  }
  unsigned int v14 = 0;
  v11 = 0;
LABEL_71:
  id v60 = [(USBudgetTracker *)self videoScheduler];
  v61 = [v11 subscribeOn:v60];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10001559C;
  v74[3] = &unk_10008A428;
  v74[4] = self;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000155B4;
  v73[3] = &unk_10008A450;
  v73[4] = self;
  v62 = [v61 sinkWithCompletion:v74 receiveInput:v73];
  [(USBudgetTracker *)self setVideoSubscription:v62];

  if (v14) {
    [(USBudgetTracker *)self _videoRegistrationDidFire];
  }
}

- (void)_registerForVideoUsage
{
  BOOL v4 = [(USBudgetTracker *)self videoRegistration];
  id v5 = &swift_weakDestroy_ptr;
  if (v4)
  {
    id v6 = +[_CDClientContext userContext];
    [v6 deregisterCallback:v4];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deregistered from CoreDuet user context video usage status changes", buf, 2u);
    }
  }
  xpc_set_event();
  int v7 = +[USBudgetRegistration sharedRegistration];
  id v22 = 0;
  id v8 = [v7 areCategoriesBudgeted:&v22];
  id v9 = v22;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B3A4();
    }
    goto LABEL_30;
  }
  if ([v8 BOOLValue])
  {
    v10 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
    id v11 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v10];
    uint64_t v12 = "";
    goto LABEL_23;
  }
  id v21 = v9;
  v10 = [v7 fetchAllBudgetedApplicationsAndReturnError:&v21];
  id v13 = v21;

  if (v10)
  {
    id v20 = v13;
    unsigned int v14 = [v7 fetchAllBudgetedWebDomainsAndReturnError:&v20];
    id v9 = v20;

    if (!v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006B484();
      }
      id v11 = 0;
      goto LABEL_22;
    }
    id v11 = [v10 count];
    if ([v14 count])
    {
      id v15 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
      id v11 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v15];
    }
    else
    {
      if (!v11)
      {
LABEL_22:
        id v5 = &swift_weakDestroy_ptr;

        uint64_t v12 = " not";
        goto LABEL_23;
      }
      id v15 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
      id v18 = +[_CDContextQueries appMediaUsageBundleID];
      id v11 = +[_CDContextualPredicate predicateForKeyPath:v15, @"ANY SELF.%@.value.%K IN %@", v15, v18, v10 withFormat];
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006B414();
  }
  id v11 = 0;
  uint64_t v12 = " not";
  id v9 = v13;
  id v5 = &swift_weakDestroy_ptr;
LABEL_23:

  if (!v11)
  {
LABEL_30:
    [(USBudgetTracker *)self setVideoRegistration:0];
    goto LABEL_31;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015A0C;
  v19[3] = &unk_10008A478;
  v19[4] = self;
  v19[5] = a2;
  id v16 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.UsageTrackingAgent.registration.video" contextualPredicate:v11 clientIdentifier:@"com.apple.UsageTrackingAgent" callback:v19];
  [(USBudgetTracker *)self setVideoRegistration:v16];
  id v17 = [v5[223] userContext];
  [v17 registerCallback:v16];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registered for CoreDuet user context video usage status changes, categories are%{public}s budgeted", buf, 0xCu);
  }
  if (([v11 firesOnAnyChange] & 1) != 0
    || [v17 evaluatePredicate:v11])
  {
    [(USBudgetTracker *)self _videoRegistrationDidFire];
  }

LABEL_31:
}

- (void)_completion:(id)a3 streamIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 state];
  if (v7 == (id)1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B4F4((uint64_t)v6, v5);
    }
  }
  else if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_applicationAlarmDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentBundleIdentifiers];
  }
  else
  {
    id v22 = self;
    BOOL v4 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
    id v5 = +[_CDContextQueries appUsageBundleID];
    id v6 = +[_CDContextQueries appUsageType];
    id v21 = +[_CDClientContext userContext];
    id v7 = [v21 objectForKeyedSubscript:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:buf count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unsigned int v14 = [v13 objectForKeyedSubscript:v6];
          id v15 = v14;
          if (!v14 || [v14 integerValue] == (id)1)
          {
            if (v10)
            {
              id v16 = [v13 objectForKeyedSubscript:v5];
              [v10 addObject:v16];
            }
            else
            {
              id v17 = objc_alloc((Class)NSMutableOrderedSet);
              id v16 = [v13 objectForKeyedSubscript:v5];
              id v10 = objc_msgSend(v17, "initWithObjects:", v16, 0);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:buf count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
    id v3 = v10;

    self = v22;
  }
  id v18 = [v3 array];

  id v19 = [v18 count];
  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Application alarm fired, checking budgets for current applications", buf, 2u);
    }
    [(USBudgetTracker *)self _checkBudgetStatusForApplications:v18];
  }
  else if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Application alarm fired, no applications in use so not checking budgets for current applications", buf, 2u);
  }
}

- (void)_applicationRegistrationDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentBundleIdentifiers];
  }
  else
  {
    id v22 = self;
    BOOL v4 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
    id v5 = +[_CDContextQueries appUsageBundleID];
    id v6 = +[_CDContextQueries appUsageType];
    id v21 = +[_CDClientContext userContext];
    id v7 = [v21 objectForKeyedSubscript:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:buf count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unsigned int v14 = [v13 objectForKeyedSubscript:v6];
          id v15 = v14;
          if (!v14 || [v14 integerValue] == (id)1)
          {
            if (v10)
            {
              id v16 = [v13 objectForKeyedSubscript:v5];
              [v10 addObject:v16];
            }
            else
            {
              id v17 = objc_alloc((Class)NSMutableOrderedSet);
              id v16 = [v13 objectForKeyedSubscript:v5];
              id v10 = objc_msgSend(v17, "initWithObjects:", v16, 0);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:buf count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
    id v3 = v10;

    self = v22;
  }
  id v18 = [v3 array];

  id v19 = [v18 count];
  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Application CoreDuet registration fired, unregistering alarm and checking budgets for current applications", buf, 2u);
    }
    [(USBudgetTracker *)self _checkBudgetStatusForApplications:v18];
  }
  else if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Application CoreDuet registration fired, unregistering alarm; no applications in use so not checking budgets for c"
      "urrent applications",
      buf,
      2u);
  }
}

- (void)_webDomainAlarmDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentWebDomains];
  }
  else
  {
    id v21 = self;
    BOOL v4 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
    id v5 = +[_CDContextQueries appWebUsageWebDomain];
    id v6 = +[_CDContextQueries appWebUsageType];
    BOOL v20 = +[_CDClientContext userContext];
    id v7 = [v20 objectForKeyedSubscript:v4];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:buf count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unsigned int v14 = [v13 objectForKeyedSubscript:v6];
          if ([v14 integerValue] == (id)1)
          {
            if (v10)
            {
              id v15 = [v13 objectForKeyedSubscript:v5];
              [v10 addObject:v15];
            }
            else
            {
              id v16 = objc_alloc((Class)NSMutableOrderedSet);
              id v15 = [v13 objectForKeyedSubscript:v5];
              id v10 = objc_msgSend(v16, "initWithObjects:", v15, 0);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:buf count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
    id v3 = v10;

    self = v21;
  }
  id v17 = [v3 array];

  id v18 = [v17 count];
  BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Web alarm fired, checking budgets for current web domains", buf, 2u);
    }
    [(USBudgetTracker *)self _checkBudgetStatusForWebDomains:v17];
  }
  else if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Web alarm fired, no web domains in use so not checking budgets for current web domains", buf, 2u);
  }
}

- (void)_webDomainRegistrationDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentWebDomains];
  }
  else
  {
    id v21 = self;
    BOOL v4 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
    id v5 = +[_CDContextQueries appWebUsageWebDomain];
    id v6 = +[_CDContextQueries appWebUsageType];
    BOOL v20 = +[_CDClientContext userContext];
    id v7 = [v20 objectForKeyedSubscript:v4];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:buf count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unsigned int v14 = [v13 objectForKeyedSubscript:v6];
          if ([v14 integerValue] == (id)1)
          {
            if (v10)
            {
              id v15 = [v13 objectForKeyedSubscript:v5];
              [v10 addObject:v15];
            }
            else
            {
              id v16 = objc_alloc((Class)NSMutableOrderedSet);
              id v15 = [v13 objectForKeyedSubscript:v5];
              id v10 = objc_msgSend(v16, "initWithObjects:", v15, 0);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:buf count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
    id v3 = v10;

    self = v21;
  }
  id v17 = [v3 array];

  id v18 = [v17 count];
  BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Web CoreDuet registration fired, unregistering alarm and checking budgets for current web domains", buf, 2u);
    }
    [(USBudgetTracker *)self _checkBudgetStatusForWebDomains:v17];
  }
  else if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Web CoreDuet registration fired, unregistering alarm; no web domains in use so not checking budgets for current web domains",
      buf,
      2u);
  }
}

- (void)_nowPlayingAlarmDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    if (+[DeviceActivityQuerying isQuickLookVideoNowPlaying])
    {
      id v3 = objc_alloc((Class)NSMutableOrderedSet);
      id v4 = objc_msgSend(v3, "initWithObjects:", CTCategoryIdentifierEntertainment, 0);
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v5 = +[_CDClientContext userContext];
    id v6 = +[_CDContextQueries keyPathForNowPlayingDataDictionary];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7 && usageContextContainsPlayingQuickLookVideo())
    {
      id v8 = objc_alloc((Class)NSMutableOrderedSet);
      id v4 = objc_msgSend(v8, "initWithObjects:", CTCategoryIdentifierEntertainment, 0);
    }
    else
    {
      id v4 = 0;
    }
  }
  id v9 = [v4 array];

  id v10 = [v9 count];
  BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Now Playing alarm fired, checking budgets for current Now Playing", buf, 2u);
    }
    [(USBudgetTracker *)self _checkBudgetStatusForNowPlayingCategories:v9];
  }
  else if (v11)
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Now Playing alarm fired, no Now Playing in use so not checking budgets for current Now Playing", v12, 2u);
  }
}

- (void)_nowPlayingRegistrationDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    if (+[DeviceActivityQuerying isQuickLookVideoNowPlaying])
    {
      id v3 = objc_alloc((Class)NSMutableOrderedSet);
      id v4 = objc_msgSend(v3, "initWithObjects:", CTCategoryIdentifierEntertainment, 0);
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v5 = +[_CDClientContext userContext];
    id v6 = +[_CDContextQueries keyPathForNowPlayingDataDictionary];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7 && usageContextContainsPlayingQuickLookVideo())
    {
      id v8 = objc_alloc((Class)NSMutableOrderedSet);
      id v4 = objc_msgSend(v8, "initWithObjects:", CTCategoryIdentifierEntertainment, 0);
    }
    else
    {
      id v4 = 0;
    }
  }
  id v9 = [v4 array];

  id v10 = [v9 count];
  BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Now Playing CoreDuet registration fired, unregistering alarm and checking budgets for current Now Playing", buf, 2u);
    }
    [(USBudgetTracker *)self _checkBudgetStatusForNowPlayingCategories:v9];
  }
  else if (v11)
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Now Playing CoreDuet registration fired, unregistering alarm; no Now Playing in use so not checking budgets for cu"
      "rrent Now Playing",
      v12,
      2u);
  }
}

- (void)_videoAlarmDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentVideoIdentifiers];
    goto LABEL_40;
  }
  id v4 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
  id v5 = +[_CDContextQueries appMediaUsageBundleID];
  id v6 = +[_CDClientContext userContext];
  id v7 = [v6 objectForKeyedSubscript:v4];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v42 objects:buf count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (v10)
        {
          unsigned int v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) objectForKeyedSubscript:v5];
          [v10 addObject:v14];
        }
        else
        {
          id v15 = objc_alloc((Class)NSMutableOrderedSet);
          unsigned int v14 = [v13 objectForKeyedSubscript:v5];
          id v10 = objc_msgSend(v15, "initWithObjects:", v14, 0);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v42 objects:buf count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }
  unint64_t v16 = (unint64_t)v10;

  uint64_t v17 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
  id v18 = +[_CDContextQueries appMediaUsageURL];
  id v40 = +[_CDClientContext userContext];
  id v41 = (void *)v17;
  BOOL v19 = [v40 objectForKeyedSubscript:v17];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v42 objects:buf count:16];
  if (v20)
  {
    id v21 = v20;
    id v22 = 0;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v19);
        }
        long long v25 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)j) objectForKeyedSubscript:v18];
        long long v26 = v25;
        if (v25)
        {
          uint64_t v27 = [v25 host];
          if (v27)
          {
            if (v22) {
              [v22 addObject:v27];
            }
            else {
              id v22 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithObjects:", v27, 0);
            }
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v42 objects:buf count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }
  unint64_t v28 = (unint64_t)v22;

  if (!(v16 | v28))
  {
    id v31 = 0;
    goto LABEL_39;
  }
  id v29 = objc_alloc((Class)BPSTuple);
  uint64_t v30 = (void *)v16;
  if (v16)
  {
    if (v28) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v30 = objc_opt_new();
    if (v28)
    {
LABEL_33:
      id v31 = [v29 initWithFirst:v30 second:v28];
      if (!v16) {
        goto LABEL_38;
      }
      goto LABEL_39;
    }
  }
  v32 = objc_opt_new();
  id v31 = [v29 initWithFirst:v30 second:v32];

  if (!v16) {
LABEL_38:
  }

LABEL_39:
  id v3 = v31;

LABEL_40:
  id v33 = [v3 first];
  id v34 = [v33 array];

  id v35 = [v3 second];
  uint64_t v36 = [v35 array];

  unint64_t v37 = (unint64_t)[v34 count];
  unint64_t v38 = (unint64_t)[v36 count];
  if (v37 | v38)
  {
    unint64_t v39 = v38;
    if (v37)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Video alarm fired, checking budgets for current video bundle identifiers", buf, 2u);
      }
      [(USBudgetTracker *)self _checkBudgetStatusForVideoBundleIdentifiers:v34];
    }
    if (v39)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Video alarm fired, checking budgets for current video web domains", buf, 2u);
      }
      [(USBudgetTracker *)self _checkBudgetStatusForVideoWebDomains:v36];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Video alarm fired, no video in use so not checking budgets for current video", buf, 2u);
  }
}

- (void)_videoRegistrationDidFire
{
  xpc_set_event();
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentVideoIdentifiers];
    goto LABEL_40;
  }
  id v4 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
  id v5 = +[_CDContextQueries appMediaUsageBundleID];
  id v6 = +[_CDClientContext userContext];
  id v7 = [v6 objectForKeyedSubscript:v4];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v42 objects:buf count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (v10)
        {
          unsigned int v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) objectForKeyedSubscript:v5];
          [v10 addObject:v14];
        }
        else
        {
          id v15 = objc_alloc((Class)NSMutableOrderedSet);
          unsigned int v14 = [v13 objectForKeyedSubscript:v5];
          id v10 = objc_msgSend(v15, "initWithObjects:", v14, 0);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v42 objects:buf count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }
  unint64_t v16 = (unint64_t)v10;

  uint64_t v17 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
  id v18 = +[_CDContextQueries appMediaUsageURL];
  id v40 = +[_CDClientContext userContext];
  id v41 = (void *)v17;
  BOOL v19 = [v40 objectForKeyedSubscript:v17];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v42 objects:buf count:16];
  if (v20)
  {
    id v21 = v20;
    id v22 = 0;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v19);
        }
        long long v25 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)j) objectForKeyedSubscript:v18];
        long long v26 = v25;
        if (v25)
        {
          uint64_t v27 = [v25 host];
          if (v27)
          {
            if (v22) {
              [v22 addObject:v27];
            }
            else {
              id v22 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithObjects:", v27, 0);
            }
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v42 objects:buf count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }
  unint64_t v28 = (unint64_t)v22;

  if (!(v16 | v28))
  {
    id v31 = 0;
    goto LABEL_39;
  }
  id v29 = objc_alloc((Class)BPSTuple);
  uint64_t v30 = (void *)v16;
  if (v16)
  {
    if (v28) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v30 = objc_opt_new();
    if (v28)
    {
LABEL_33:
      id v31 = [v29 initWithFirst:v30 second:v28];
      if (!v16) {
        goto LABEL_38;
      }
      goto LABEL_39;
    }
  }
  v32 = objc_opt_new();
  id v31 = [v29 initWithFirst:v30 second:v32];

  if (!v16) {
LABEL_38:
  }

LABEL_39:
  id v3 = v31;

LABEL_40:
  id v33 = [v3 first];
  id v34 = [v33 array];

  id v35 = [v3 second];
  uint64_t v36 = [v35 array];

  unint64_t v37 = (unint64_t)[v34 count];
  unint64_t v38 = (unint64_t)[v36 count];
  if (v37 | v38)
  {
    unint64_t v39 = v38;
    if (v37)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Video CoreDuet registration fired, unregistering alarm and checking budgets for current video bundle identifiers", buf, 2u);
      }
      [(USBudgetTracker *)self _checkBudgetStatusForVideoBundleIdentifiers:v34];
    }
    if (v39)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Video CoreDuet registration fired, unregistering alarm and checking budgets for current video web domains", buf, 2u);
      }
      [(USBudgetTracker *)self _checkBudgetStatusForVideoWebDomains:v36];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Video CoreDuet registration fired, unregistering alarm; no video in use so not checking budgets for current video",
      buf,
      2u);
  }
}

- (void)_duetSyncCoordinatorDidIdle
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received Duet sync coordinator did idle distributed notification, checking all budgets", buf, 2u);
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100017684;
  v3[3] = &unk_100089DD8;
  v3[4] = self;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v3];
}

- (void)_deviceActivitySyncCoordinatorDidIdle:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received Device Activity sync coordinator did idle notification, checking all budgets", buf, 2u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017754;
  v4[3] = &unk_100089DD8;
  v4[4] = self;
  +[DeviceActivityCollector collectLocalActivityWithOptions:1 shouldSync:0 completionHandler:v4];
}

- (void)_didCollectLocalActivityForIdleSyncCoordinator
{
  id v3 = +[USBudgetRegistration sharedRegistration];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000177EC;
  v4[3] = &unk_10008A4A0;
  v4[4] = self;
  [v3 fetchAllRegisteredBudgetsAndEventsWithCompletionHandler:v4];
}

- (void)_budgetsResetAlarmDidFire:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received budget reset alarm %{public}@; clearing all posted notifications, reseting alarms and checking all budget"
      "s for current usage",
      buf,
      0xCu);
  }
  id v5 = v4;
  [v5 UTF8String];
  id v6 = (void *)xpc_copy_event();
  id v7 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v6, "CalendarIdentifier")];
  id v8 = +[USBudgetRegistration sharedRegistration];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100017A30;
  v11[3] = &unk_10008A4C8;
  id v12 = v7;
  id v13 = v5;
  unsigned int v14 = self;
  id v9 = v5;
  id v10 = v7;
  [v8 clearPostedNotificationTimesWithCalendarIdentifier:v10 completionHandler:v11];
}

- (void)_budgetIntervalAlarmDidFire:(const char *)a3 isWarning:(BOOL)a4 isEndOfInterval:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = (void *)xpc_copy_event();
  id v9 = v8;
  if (v8)
  {
    string = xpc_dictionary_get_string(v8, "BudgetID");
    if (string)
    {
      id v11 = objc_alloc((Class)NSURL);
      id v12 = +[NSString stringWithUTF8String:string];
      id v13 = [v11 initWithString:v12];

      if (v13)
      {
        xpc_set_event();
        BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (!v14) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = string;
          *(_WORD *)&buf[12] = 1026;
          *(_DWORD *)&buf[14] = v6;
          id v15 = "Received budget interval end alarm for %{public}s, isWarning: %{public}d";
        }
        else
        {
          if (!v14) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = string;
          *(_WORD *)&buf[12] = 1026;
          *(_DWORD *)&buf[14] = v6;
          id v15 = "Received budget interval start alarm for %{public}s, isWarning: %{public}d";
        }
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0x12u);
LABEL_12:
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        char v21 = 0;
        id v16 = +[USBudgetRegistration sharedRegistration];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10001818C;
        v17[3] = &unk_10008A4F0;
        BOOL v18 = v5;
        BOOL v19 = v6;
        v17[4] = self;
        v17[5] = buf;
        void v17[6] = string;
        [v16 fetchBudgetForDeviceActivityWithURI:v13 completionHandler:v17];

        if (!v6 && *(unsigned char *)(*(void *)&buf[8] + 24)) {
          [(USBudgetTracker *)self _registerForAllUsage];
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_16;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10006B678();
  }
LABEL_16:
}

- (void)_tombstoneEventDidFire:(const char *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received Duet tombstone event %{public}s; clearing eligible posted notifications, reseting alarms and checking all"
      " budgets for current usage",
      buf,
      0xCu);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000183D0;
  v5[3] = &unk_100089DD8;
  v5[4] = self;
  +[DeviceActivityCollector collectLocalActivityWithOptions:0 shouldSync:1 completionHandler:v5];
}

- (void)_clearPostedNotificationsForNoLongerExpiredBudgets
{
  id v3 = +[USBudgetRegistration sharedRegistration];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000184D8;
  v4[3] = &unk_10008A4A0;
  v4[4] = self;
  [v3 fetchBudgetsAndEventsWithPostedNotificationsWithCompletionHandler:v4];

  [(USBudgetTracker *)self _checkBudgetStatusForAllCurrentUsage];
}

- (void)_systemTimeDidChange
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received system time change notification; clearing eligible posted notifications, resetting alarms and checking al"
      "l budgets for current usage",
      v3,
      2u);
  }
  +[NSTimeZone resetSystemTimeZone];
  [(USBudgetTracker *)self _resetDeviceActivityAlarms];
  [(USBudgetTracker *)self _clearPostedNotificationsForNoLongerExpiredBudgets];
}

- (void)_resetDeviceActivityAlarms
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100018E50;
  v2[3] = &unk_100089DD8;
  v2[4] = self;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v2];
}

- (void)_didCollectLocalActivityForDeviceActivityAlarmReset
{
  id v3 = +[USBudgetRegistration sharedRegistration];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018EE8;
  v4[3] = &unk_10008A518;
  v4[4] = self;
  [v3 fetchAllDeviceActivityBudgetsWithCompletionHandler:v4];
}

+ (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[USBudgetRegistration sharedRegistration];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019064;
  v13[3] = &unk_10008A540;
  id v14 = v8;
  id v15 = a1;
  id v12 = v8;
  [v11 fetchBudgetsWithIdentifiers:v10 clientIdentifier:v9 completionHandler:v13];
}

+ (void)checkStatusOfAllBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[USBudgetRegistration sharedRegistration];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019130;
  v7[3] = &unk_10008A540;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 fetchAllBudgetsWithCompletionHandler:v7];
}

+ (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[USBudgetRegistration sharedRegistration];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019230;
  v13[3] = &unk_10008A540;
  id v14 = v8;
  id v15 = a1;
  id v12 = v8;
  [v11 fetchBudgetsWithIdentifiers:v10 clientIdentifiers:v9 completionHandler:v13];
}

+ (void)_checkStatusOfBudgets:(id)a3 withError:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void, void, void, void, void))v9;
  if (v8)
  {
    id v11 = objc_opt_new();
    id v37 = 0;
    id v12 = [a1 _getRemainingTimeForBudgets:v8 referenceDate:v11 error:&v37];
    id v13 = v37;

    if (v12)
    {
      id v29 = v13;
      id v31 = v10;
      id v32 = v8;
      id v14 = [v12 count];
      id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v14];
      id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v14];
      id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v14];
      id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v14];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v30 = v12;
      id v19 = v12;
      id v20 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            long long v25 = [v24 identifier];
            [v15 addObject:v25];

            long long v26 = [v24 clientIdentifier];
            [v16 addObject:v26];

            uint64_t v27 = [v24 darwinNotificationName];
            [v17 addObject:v27];

            unint64_t v28 = [v19 objectForKey:v24];
            [v18 addObject:v28];
          }
          id v21 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v21);
      }

      id v10 = v31;
      ((void (**)(void, id, id, id, id, void))v31)[2](v31, v15, v16, v17, v18, 0);

      id v8 = v32;
      id v13 = v29;
      id v12 = v30;
    }
    else
    {
      ((void (**)(void, void, void, void, void, id))v10)[2](v10, 0, 0, 0, 0, v13);
    }
  }
  else
  {
    (*((void (**)(id, void, void, void, void, id))v9 + 2))(v9, 0, 0, 0, 0, a4);
  }
}

- (void)_checkBudgetStatusForApplications:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000195D0;
  v4[3] = &unk_10008A198;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v4];
}

- (void)_didCollectLocalActivityForApplications:(id)a3
{
  id v4 = a3;
  id v5 = +[USBudgetRegistration sharedRegistration];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019698;
  v7[3] = &unk_10008A568;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchBudgetsAndEventsForApplications:v6 completionHandler:v7];
}

- (void)_checkBudgetStatusForWebDomains:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000197E4;
  v4[3] = &unk_10008A198;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v4];
}

- (void)_didCollectLocalActivityForWebDomains:(id)a3
{
  id v4 = a3;
  id v5 = +[USBudgetRegistration sharedRegistration];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000198AC;
  v7[3] = &unk_10008A568;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchBudgetsAndEventsForWebDomains:v6 completionHandler:v7];
}

- (void)_checkBudgetStatusForNowPlayingCategories:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000199F8;
  v4[3] = &unk_10008A198;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v4];
}

- (void)_didCollectLocalActivityForNowPlayingCategories:(id)a3
{
  id v4 = a3;
  id v5 = +[USBudgetRegistration sharedRegistration];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019AC0;
  v7[3] = &unk_10008A568;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchBudgetsAndEventsForCategories:v6 completionHandler:v7];
}

- (void)_checkBudgetStatusForVideoBundleIdentifiers:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019C0C;
  v4[3] = &unk_10008A198;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v4];
}

- (void)_didCollectLocalActivityForVideoBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[USBudgetRegistration sharedRegistration];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019CD4;
  v7[3] = &unk_10008A568;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchBudgetsAndEventsForApplications:v6 completionHandler:v7];
}

- (void)_checkBudgetStatusForVideoWebDomains:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019E20;
  v4[3] = &unk_10008A198;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[DeviceActivityCollector collectLocalActivityWithOptions:2 shouldSync:0 completionHandler:v4];
}

- (void)_didCollectLocalActivityForVideoWebDomains:(id)a3
{
  id v4 = a3;
  id v5 = +[USBudgetRegistration sharedRegistration];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019EE8;
  v7[3] = &unk_10008A568;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchBudgetsAndEventsForWebDomains:v6 completionHandler:v7];
}

- (void)_checkBudgetStatusForAllCurrentUsage
{
  id v2 = self;
  if (_os_feature_enabled_impl())
  {
    id v3 = +[DeviceActivityQuerying currentBundleIdentifiers];
  }
  else
  {
    uint64_t v4 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
    id v5 = +[_CDContextQueries appUsageBundleID];
    id v6 = +[_CDContextQueries appUsageType];
    v89 = +[_CDClientContext userContext];
    v92 = (void *)v4;
    id v7 = [v89 objectForKeyedSubscript:v4];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v95 objects:buf count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v96;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v96 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          id v14 = [v13 objectForKeyedSubscript:v6];
          id v15 = v14;
          if (!v14 || [v14 integerValue] == (id)1)
          {
            if (v10)
            {
              id v16 = [v13 objectForKeyedSubscript:v5];
              [v10 addObject:v16];
            }
            else
            {
              id v17 = objc_alloc((Class)NSMutableOrderedSet);
              id v16 = [v13 objectForKeyedSubscript:v5];
              id v10 = objc_msgSend(v17, "initWithObjects:", v16, 0);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v95 objects:buf count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
    id v3 = v10;

    id v2 = self;
  }
  id v18 = [v3 array];

  id v19 = [v18 count];
  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking budgets for current applications", buf, 2u);
    }
    [(USBudgetTracker *)v2 _checkBudgetStatusForApplications:v18];
  }
  else if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No applications in use so not checking budgets for current applications", buf, 2u);
  }
  v93 = v18;
  if (_os_feature_enabled_impl())
  {
    id v21 = +[DeviceActivityQuerying currentWebDomains];
  }
  else
  {
    uint64_t v22 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
    uint64_t v23 = +[_CDContextQueries appWebUsageWebDomain];
    long long v24 = +[_CDContextQueries appWebUsageType];
    v87 = +[_CDClientContext userContext];
    v90 = (void *)v22;
    long long v25 = [v87 objectForKeyedSubscript:v22];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v26 = [v25 countByEnumeratingWithState:&v95 objects:buf count:16];
    if (v26)
    {
      id v27 = v26;
      id v28 = 0;
      uint64_t v29 = *(void *)v96;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v96 != v29) {
            objc_enumerationMutation(v25);
          }
          id v31 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
          id v32 = [v31 objectForKeyedSubscript:v24];
          if ([v32 integerValue] == (id)1)
          {
            if (v28)
            {
              long long v33 = [v31 objectForKeyedSubscript:v23];
              [v28 addObject:v33];
            }
            else
            {
              id v34 = objc_alloc((Class)NSMutableOrderedSet);
              long long v33 = [v31 objectForKeyedSubscript:v23];
              id v28 = objc_msgSend(v34, "initWithObjects:", v33, 0);
            }
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v95 objects:buf count:16];
      }
      while (v27);
    }
    else
    {
      id v28 = 0;
    }
    id v21 = v28;

    id v18 = v93;
    id v2 = self;
  }
  long long v35 = [v21 array];

  id v36 = [v35 count];
  BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v36)
  {
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking budgets for current web domains", buf, 2u);
    }
    [(USBudgetTracker *)v2 _checkBudgetStatusForWebDomains:v35];
  }
  else if (v37)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No web domains in use so not checking budgets for current web domains", buf, 2u);
  }
  if (_os_feature_enabled_impl())
  {
    if (+[DeviceActivityQuerying isQuickLookVideoNowPlaying])
    {
      id v38 = objc_alloc((Class)NSMutableOrderedSet);
      id v39 = objc_msgSend(v38, "initWithObjects:", CTCategoryIdentifierEntertainment, 0);
    }
    else
    {
      id v39 = 0;
    }
  }
  else
  {
    id v40 = +[_CDClientContext userContext];
    id v41 = +[_CDContextQueries keyPathForNowPlayingDataDictionary];
    long long v42 = [v40 objectForKeyedSubscript:v41];

    if (v42 && usageContextContainsPlayingQuickLookVideo())
    {
      id v43 = objc_alloc((Class)NSMutableOrderedSet);
      id v39 = objc_msgSend(v43, "initWithObjects:", CTCategoryIdentifierEntertainment, 0);
    }
    else
    {
      id v39 = 0;
    }
  }
  long long v44 = [v39 array];

  id v45 = [v44 count];
  BOOL v46 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v45)
  {
    if (v46)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking budgets for current Now Playing", buf, 2u);
    }
    [(USBudgetTracker *)v2 _checkBudgetStatusForNowPlayingCategories:v44];
  }
  else if (v46)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No Now Playing in use so not checking budgets for current Now Playing", buf, 2u);
  }
  if (_os_feature_enabled_impl())
  {
    id v47 = +[DeviceActivityQuerying currentVideoIdentifiers];
    goto LABEL_102;
  }
  v88 = v44;
  v91 = v35;
  uint64_t v48 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
  id v49 = +[_CDContextQueries appMediaUsageBundleID];
  long long v50 = +[_CDClientContext userContext];
  v85 = (void *)v48;
  long long v51 = [v50 objectForKeyedSubscript:v48];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v52 = [v51 countByEnumeratingWithState:&v95 objects:buf count:16];
  if (v52)
  {
    id v53 = v52;
    id v54 = 0;
    uint64_t v55 = *(void *)v96;
    do
    {
      for (k = 0; k != v53; k = (char *)k + 1)
      {
        if (*(void *)v96 != v55) {
          objc_enumerationMutation(v51);
        }
        v57 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
        if (v54)
        {
          v58 = [*(id *)(*((void *)&v95 + 1) + 8 * (void)k) objectForKeyedSubscript:v49];
          [v54 addObject:v58];
        }
        else
        {
          id v59 = objc_alloc((Class)NSMutableOrderedSet);
          v58 = [v57 objectForKeyedSubscript:v49];
          id v54 = objc_msgSend(v59, "initWithObjects:", v58, 0);
        }
      }
      id v53 = [v51 countByEnumeratingWithState:&v95 objects:buf count:16];
    }
    while (v53);
  }
  else
  {
    id v54 = 0;
  }
  unint64_t v60 = (unint64_t)v54;

  uint64_t v61 = +[_CDContextQueries keyPathForAppMediaUsageDataDictionaries];
  v62 = +[_CDContextQueries appMediaUsageURL];
  v84 = +[_CDClientContext userContext];
  v86 = (void *)v61;
  v63 = [v84 objectForKeyedSubscript:v61];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v64 = [v63 countByEnumeratingWithState:&v95 objects:buf count:16];
  if (v64)
  {
    id v65 = v64;
    id v66 = 0;
    uint64_t v67 = *(void *)v96;
    do
    {
      for (m = 0; m != v65; m = (char *)m + 1)
      {
        if (*(void *)v96 != v67) {
          objc_enumerationMutation(v63);
        }
        v69 = [*(id *)(*((void *)&v95 + 1) + 8 * (void)m) objectForKeyedSubscript:v62];
        id v70 = v69;
        if (v69)
        {
          id v71 = [v69 host];
          if (v71)
          {
            if (v66) {
              [v66 addObject:v71];
            }
            else {
              id v66 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithObjects:", v71, 0);
            }
          }
        }
      }
      id v65 = [v63 countByEnumeratingWithState:&v95 objects:buf count:16];
    }
    while (v65);
  }
  else
  {
    id v66 = 0;
  }
  unint64_t v72 = (unint64_t)v66;

  if (!(v60 | v72))
  {
    id v75 = 0;
    id v18 = v93;
    id v2 = self;
    long long v44 = v88;
    long long v35 = v91;
    goto LABEL_101;
  }
  id v73 = objc_alloc((Class)BPSTuple);
  long long v74 = (void *)v60;
  id v18 = v93;
  id v2 = self;
  long long v44 = v88;
  long long v35 = v91;
  if (v60)
  {
    if (v72) {
      goto LABEL_95;
    }
  }
  else
  {
    long long v74 = objc_opt_new();
    if (v72)
    {
LABEL_95:
      id v75 = [v73 initWithFirst:v74 second:v72];
      if (!v60) {
        goto LABEL_100;
      }
      goto LABEL_101;
    }
  }
  id v76 = objc_opt_new();
  id v75 = [v73 initWithFirst:v74 second:v76];

  if (!v60) {
LABEL_100:
  }

LABEL_101:
  id v47 = v75;

LABEL_102:
  id v77 = [v47 first];
  long long v78 = [v77 array];

  long long v79 = [v47 second];
  long long v80 = [v79 array];

  unint64_t v81 = (unint64_t)[v78 count];
  unint64_t v82 = (unint64_t)[v80 count];
  if (v81 | v82)
  {
    unint64_t v83 = v82;
    if (v81)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking budgets for current video bundle identifiers", buf, 2u);
      }
      [(USBudgetTracker *)v2 _checkBudgetStatusForVideoBundleIdentifiers:v78];
    }
    if (v83)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking budgets for current video web domains", buf, 2u);
      }
      [(USBudgetTracker *)v2 _checkBudgetStatusForVideoWebDomains:v80];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No videos in use so not checking budgets for current videos", buf, 2u);
  }
}

+ (id)_getRemainingTimeForBudgets:(id)a3 referenceDate:(id)a4 error:(id *)a5
{
  id v36 = a5;
  id v7 = a3;
  id v8 = a4;
  id v37 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
  id v38 = [a1 usageQuerying];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v9 = v7;
  id v41 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v41)
  {
    id obj = v9;
    uint64_t v40 = *(void *)v47;
    while (2)
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v12 = objc_alloc((Class)NSCalendar);
        id v13 = [v11 calendarIdentifier];
        id v14 = [v12 initWithCalendarIdentifier:v13];

        id v15 = [v14 components:512 fromDate:v8];
        id v16 = [v15 weekday];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v17 = [v11 schedule];
        id v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v43;
LABEL_8:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * v21);
            if (objc_msgSend(v22, "weekday", v36) == v16) {
              break;
            }
            if (v19 == (id)++v21)
            {
              id v19 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
              if (v19) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v23 = v22;

          if (!v23) {
            goto LABEL_19;
          }
          long long v24 = [v14 startOfDayForDate:v8];
          id v25 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v24 endDate:v8];
          id v26 = [v11 queryForInterval:v25];
          uint64_t v27 = [v38 query:v26 error:v36];
          if (v27)
          {
            id v28 = (void *)v27;
            [v23 timeLimit];
            double v30 = v29;
            [v28 doubleValue];
            id v32 = +[NSNumber numberWithDouble:v30 - v31];
            [v37 setObject:v32 forKey:v11];

            goto LABEL_18;
          }

          id v9 = obj;
          id v34 = 0;
          long long v33 = v37;
          goto LABEL_23;
        }
LABEL_14:
        id v23 = v17;
LABEL_18:

LABEL_19:
      }
      id v9 = obj;
      id v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }

  long long v33 = v37;
  id v34 = v37;
LABEL_23:

  return v34;
}

+ (id)_getRemainingTimeForEvents:(id)a3 referenceDate:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v46 = a4;
  id v42 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
  long long v43 = [a1 usageQuerying];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v49;
    *(void *)&long long v9 = 138543874;
    long long v40 = v9;
LABEL_3:
    uint64_t v12 = 0;
    id v44 = v10;
    while (1)
    {
      if (*(void *)v49 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
      id v47 = 0;
      id v14 = objc_msgSend(v13, "nextThresholdDate:", &v47, v40);
      id v15 = v47;
      id v16 = v15;
      if (v14) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v18 = [v13 name];
          id v19 = [v13 budget];
          uint64_t v20 = [v19 name];
          uint64_t v21 = [v13 budget];
          uint64_t v22 = [v21 clientIdentifier];
          *(_DWORD *)buf = v40;
          id v53 = v18;
          __int16 v54 = 2114;
          uint64_t v55 = v20;
          __int16 v56 = 2114;
          v57 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not calculate next threshold or next interval for %{public}@/%{public}@/%{public}@", buf, 0x20u);
LABEL_23:

          id v10 = v44;
        }
      }
      else
      {
        unsigned __int8 v23 = [v15 containsDate:v46];
        if (v23)
        {
          long long v24 = [v16 startDate];
          id v25 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v24 endDate:v46];
          id v26 = [v13 queryForInterval:v25];
          uint64_t v27 = [v43 query:v26 error:a5];
          if (!v27)
          {

            id v38 = 0;
            id v37 = v42;
            goto LABEL_28;
          }
          id v28 = (void *)v27;
          [v14 timeIntervalSinceDate:v24];
          if (v29 >= 0.0) {
            double v30 = v29;
          }
          else {
            double v30 = -v29;
          }
          [v28 doubleValue];
          double v32 = v31;
          [v13 thresholdAdjustmentTime];
          double v34 = v32 - v33;
          if (v34 < 0.0) {
            double v34 = 0.0;
          }
          +[NSNumber numberWithDouble:v30 - v34];
          v36 = uint64_t v35 = v11;
          [v42 setObject:v36 forKey:v13];

          uint64_t v11 = v35;
          id v10 = v44;

          goto LABEL_24;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v13 name];
          id v19 = [v13 budget];
          uint64_t v20 = [v19 name];
          uint64_t v21 = [v13 budget];
          uint64_t v22 = [v21 clientIdentifier];
          *(_DWORD *)buf = v40;
          id v53 = v18;
          __int16 v54 = 2114;
          uint64_t v55 = v20;
          __int16 v56 = 2114;
          v57 = v22;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring no longer applicable event: %{public}@/%{public}@/%{public}@", buf, 0x20u);
          goto LABEL_23;
        }
      }
LABEL_24:

      if (v10 == (id)++v12)
      {
        id v10 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v37 = v42;
  id v38 = v42;
LABEL_28:

  return v38;
}

- (BOOL)_notifyForBudgets:(id)a3 events:(id)a4 nextNotificationEventName:(const char *)a5 syncForImpendingBudgets:(BOOL)a6
{
  BOOL v6 = a6;
  id v98 = a3;
  id v97 = a4;
  if (v6)
  {
    long long v9 = [(USBudgetTracker *)self lastSyncDate];
    if (v9
      && (+[NSDate now],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 timeIntervalSinceDate:v9],
          double v12 = v11,
          v10,
          v12 < 300.0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10006BB64();
      }
      int v103 = 0;
    }
    else
    {
      int v103 = 1;
    }
  }
  else
  {
    int v103 = 0;
  }
  v110 = objc_opt_new();
  __uint64_t v93 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v132 = 0;
  v111 = objc_opt_new();
  id v13 = [(id)objc_opt_class() _getRemainingTimeForBudgets:v98 referenceDate:v111 error:&v132];
  id v94 = v132;
  v105 = self;
  long long v96 = v13;
  if (v13)
  {
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id obj = v13;
    id v100 = [obj countByEnumeratingWithState:&v128 objects:v143 count:16];
    if (v100)
    {
      id v102 = 0;
      uint64_t v99 = *(void *)v129;
      double v14 = 0.0;
      do
      {
        for (id i = 0; i != v100; id i = v52 + 1)
        {
          if (*(void *)v129 != v99) {
            objc_enumerationMutation(obj);
          }
          v106 = (char *)i;
          id v16 = *(void **)(*((void *)&v128 + 1) + 8 * i);
          BOOL v17 = [obj objectForKey:v16];
          [v17 doubleValue];
          double v19 = v18;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [v16 clientIdentifier];
            uint64_t v21 = [v16 identifier];
            *(_DWORD *)buf = 138543874;
            v134 = v20;
            __int16 v135 = 2114;
            double v136 = *(double *)&v21;
            __int16 v137 = 2048;
            double v138 = v19;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@/%{public}@ has %g seconds remaining", buf, 0x20u);
          }
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          uint64_t v22 = [v16 notificationTimes];
          id v23 = [v22 countByEnumeratingWithState:&v124 objects:v142 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v125;
            v112 = v22;
            v114 = v16;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v125 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void **)(*((void *)&v124 + 1) + 8 * (void)j);
                if (([v27 notificationWasPosted] & 1) == 0)
                {
                  [v27 remainingTime];
                  double v29 = v28;
                  if (v19 <= v28)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      double v31 = [v16 clientIdentifier];
                      double v32 = [v16 identifier];
                      *(_DWORD *)buf = 134218498;
                      v134 = *(const char **)&v29;
                      __int16 v135 = 2114;
                      double v136 = *(double *)&v31;
                      __int16 v137 = 2114;
                      double v138 = *(double *)&v32;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting %g second notification for %{public}@/%{public}@", buf, 0x20u);
                    }
                    id v33 = v16;
                    id v34 = v110;
                    uint64_t v35 = [v33 darwinNotificationName];
                    if ([v34 containsObject:v35])
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v134 = v35;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Already posted darwin notification %{public}@, skipping", buf, 0xCu);
                      }
                    }
                    else
                    {
                      id v36 = v35;
                      uint32_t v37 = notify_post((const char *)[v36 UTF8String]);
                      if (v37)
                      {
                        uint32_t v38 = v37;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v134 = v36;
                          __int16 v135 = 1024;
                          LODWORD(v136) = v38;
                          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to post darwin notification %{public}@: %u", buf, 0x12u);
                        }
                      }
                      else
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543362;
                          v134 = v36;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posted darwin notification %{public}@", buf, 0xCu);
                        }
                        [v34 addObject:v36];
                      }
                    }

                    [v27 setNotificationWasPosted:1];
                    id v39 = [v33 calendarIdentifier];
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v134 = v39;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registering alarm for the end of today in %{public}@", buf, 0xCu);
                    }
                    id v40 = v111;
                    id v41 = v39;
                    id v42 = objc_alloc((Class)NSString);
                    long long v43 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.alarm.budgets-reset-"];
                    id v44 = [v42 initWithFormat:@"%@%@", v43, v41];
                    [v44 UTF8String];

                    id v45 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:v41];
                    id v46 = [v45 nextDateAfterDate:v40 matchingHour:0 minute:0 second:0 options:1024];

                    xpc_object_t v47 = xpc_dictionary_create(0, 0, 0);
                    [v46 timeIntervalSince1970];
                    xpc_dictionary_set_date(v47, "Date", (uint64_t)(v48 * 1000000000.0));
                    xpc_dictionary_set_BOOL(v47, "ShouldWake", 0);
                    long long v49 = v41;
                    long long v50 = (const char *)[v49 UTF8String];

                    xpc_dictionary_set_string(v47, "CalendarIdentifier", v50);
                    xpc_set_event();

                    uint64_t v22 = v112;
                    id v16 = v114;
                  }
                  else if (v19 - v28 < v14 || v14 == 0.0)
                  {
                    double v14 = v19 - v28;
                  }
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v124 objects:v142 count:16];
            }
            while (v24);
          }

          if (v19 <= 3600.0) {
            int v51 = v103;
          }
          else {
            int v51 = 0;
          }
          if (v51 == 1)
          {
            self = v105;
            id v52 = v106;
            if (v102)
            {
              id v53 = [v16 clientIdentifier];
              __int16 v54 = [v16 identifier];
              [v102 appendFormat:@", %@/%@", v53, v54];
            }
            else
            {
              id v55 = objc_alloc((Class)NSMutableString);
              id v53 = [v16 clientIdentifier];
              __int16 v54 = [v16 identifier];
              id v102 = [v55 initWithFormat:@"%@/%@", v53, v54];
            }
          }
          else
          {
            self = v105;
            id v52 = v106;
          }
        }
        id v100 = [obj countByEnumeratingWithState:&v128 objects:v143 count:16];
      }
      while (v100);
    }
    else
    {
      id v102 = 0;
      double v14 = 0.0;
    }
  }
  else
  {
    double v14 = 0.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B7E4();
    }
    id v102 = 0;
  }
  id v123 = v94;
  __int16 v56 = [(id)objc_opt_class() _getRemainingTimeForEvents:v97 referenceDate:v111 error:&v123];
  id v57 = v123;

  v107 = v56;
  if (v56)
  {
    id v101 = v57;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v58 = v56;
    id v59 = [v58 countByEnumeratingWithState:&v119 objects:v141 count:16];
    if (v59)
    {
      id v60 = v59;
      char v115 = 0;
      uint64_t v61 = *(void *)v120;
      uint64_t v109 = *(void *)v120;
      id v108 = v58;
      do
      {
        v62 = 0;
        id v113 = v60;
        do
        {
          if (*(void *)v120 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v119 + 1) + 8 * (void)v62);
          id v64 = [v58 objectForKey:v63];
          if (([v63 didReachThreshold] & 1) == 0 && v64)
          {
            id v65 = [v63 name];
            id v66 = [v63 budget];
            uint64_t v67 = [v66 name];
            id v68 = [v66 clientIdentifier];
            [v64 doubleValue];
            double v70 = v69;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v134 = v65;
              __int16 v135 = 2114;
              double v136 = *(double *)&v67;
              __int16 v137 = 2114;
              double v138 = *(double *)&v68;
              __int16 v139 = 2048;
              double v140 = v70;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@/%{public}@/%{public}@ has %g seconds remaining", buf, 0x2Au);
            }
            if (v70 <= 0.0)
            {
              id v75 = [v66 extensionIdentifier];
              unsigned __int8 v76 = [(USBudgetTracker *)self _notifyExtensionThatEventDidReachThreshold:v65 activity:v67 clientIdentifier:v68 extensionIdentifier:v75 isWarning:0];

              if (v76)
              {
                uint64_t v77 = 1;
                [v63 setDidReachThreshold:1];
              }
              else
              {
                objc_msgSend(v63, "setDidReachThreshold:", objc_msgSend(v63, "didReachThreshold"));
                uint64_t v77 = (uint64_t)[v63 didWarnForThreshold];
              }
              char v115 = v115 & 1 | v76;
              [v63 setDidWarnForThreshold:v77];
              uint64_t v61 = v109;
            }
            else
            {
              id v71 = [v63 nextWarningTime];
              unint64_t v72 = v71;
              if (v71)
              {
                [v71 doubleValue];
                double v74 = v70 - v73;
                if (v74 <= 0.0)
                {
                  long long v78 = [v66 extensionIdentifier];
                  unsigned __int8 v79 = [(USBudgetTracker *)v105 _notifyExtensionThatEventDidReachThreshold:v65 activity:v67 clientIdentifier:v68 extensionIdentifier:v78 isWarning:1];

                  uint64_t v80 = 1;
                  if ((v79 & 1) == 0) {
                    uint64_t v80 = (uint64_t)objc_msgSend(v63, "didWarnForThreshold", 1);
                  }
                  char v115 = v115 & 1 | v79;
                  [v63 setDidWarnForThreshold:v80];
                  id v58 = v108;
                  uint64_t v61 = v109;
                }
                else if (v74 >= v70)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    v134 = v65;
                    __int16 v135 = 2114;
                    double v136 = *(double *)&v67;
                    __int16 v137 = 2114;
                    double v138 = *(double *)&v68;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@/%{public}@/%{public}@ has a warning time that comes after its threshold is reached", buf, 0x20u);
                  }
                }
                else
                {
                  double v70 = v74;
                }
              }
              if (v70 < v14 || v14 == 0.0) {
                double v14 = v70;
              }
            }
            if (v70 <= 3600.0) {
              int v82 = v103;
            }
            else {
              int v82 = 0;
            }
            self = v105;
            if (v82 == 1)
            {
              if (v102) {
                [v102 appendFormat:@", %@/%@/%@", v68, v67, v65];
              }
              else {
                id v102 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@/%@/%@", v68, v67, v65];
              }
            }

            id v60 = v113;
          }

          v62 = (char *)v62 + 1;
        }
        while (v60 != v62);
        id v60 = [v58 countByEnumeratingWithState:&v119 objects:v141 count:16];
      }
      while (v60);
    }
    else
    {
      char v115 = 0;
    }

    BOOL v83 = v115 & 1;
    id v57 = v101;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006B774();
    }
    BOOL v83 = 0;
  }
  if (!a5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_WORD *)buf = 0;
    v85 = "Skipping alarm registration after checking budget status, no notification event name";
    goto LABEL_121;
  }
  if (v14 <= 0.0)
  {
    if ([v96 count] || objc_msgSend(v107, "count"))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_WORD *)buf = 0;
      v85 = "Skipping alarm registration after checking budget status, all budgets that apply to the current device state"
            " have been exceeded";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_WORD *)buf = 0;
      v85 = "Skipping alarm registration after checking budget status, no budgets apply to the current device state";
    }
LABEL_121:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v85, buf, 2u);
    goto LABEL_122;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v134 = a5;
    __int16 v135 = 2048;
    double v136 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registering alarm for %{public}s to fire %g seconds from now", buf, 0x16u);
  }
  xpc_object_t v84 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v84, "Type", "Monotonic");
  xpc_dictionary_set_uint64(v84, "Date", (unint64_t)((double)v93 + v14 * 1000000000.0));
  xpc_dictionary_set_BOOL(v84, "ShouldWake", 0);
  xpc_set_event();

LABEL_122:
  v86 = v102;
  if (v102)
  {
    v87 = +[NSDate now];
    [(USBudgetTracker *)self setLastSyncDate:v87];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v134 = (const char *)v102;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requesting medium urgency synchronization for impending budgets and events %{public}@", buf, 0xCu);
    }
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_10001C31C;
    v117[3] = &unk_10008A590;
    v86 = v102;
    id v118 = v102;
    +[SyncCoordinator uploadLocalDataWithCompletionHandler:v117];
    qos_class_t v88 = qos_class_self();
    v89 = dispatch_get_global_queue(v88, 0);
    v90 = +[_DKKnowledgeStore userKnowledgeStore];
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_10001C400;
    v116[3] = &unk_10008A590;
    v116[4] = v105;
    [v90 synchronizeWithUrgency:7 client:USDuetClientNameUsageTracking responseQueue:v89 completion:v116];
  }
  if ([v110 count]) {
    BOOL v91 = 1;
  }
  else {
    BOOL v91 = v83;
  }

  return v91;
}

- (BOOL)_setAlarmsOrNotifyExtensionsForDeviceActivityBudgets:(id)a3 notifyForIntervalEnd:(BOOL)a4 isEndOfInterval:(BOOL)a5 includePastActivityIfNeeded:(BOOL)a6
{
  BOOL v111 = a6;
  uint64_t v6 = a5;
  BOOL v95 = a4;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id obj = a3;
  id v7 = [obj countByEnumeratingWithState:&v125 objects:v136 count:16];
  if (v7)
  {
    id v8 = v7;
    char v98 = 0;
    long long v9 = &swift_weakDestroy_ptr;
    uint64_t v10 = *(void *)v126;
    uint64_t v99 = *(void *)v126;
    unsigned int v94 = v6;
    while (1)
    {
      double v11 = 0;
      id v100 = v8;
      do
      {
        if (*(void *)v126 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v125 + 1) + 8 * (void)v11);
        id v13 = v9[216];
        double v14 = [v12 intervalStart];
        id v15 = [v12 intervalEnd];
        v110 = [v13 nextIntervalForStartComponents:v14 endComponents:v15];

        if (v6) {
          unsigned int v16 = [v12 repeats] ^ 1;
        }
        else {
          LOBYTE(v16) = 0;
        }
        BOOL v17 = v12;
        if ((v16 & 1) != 0 || v110)
        {
          v104 = v11;
          uint64_t v109 = [v12 name];
          id v108 = [v12 clientIdentifier];
          v107 = [v12 extensionIdentifier];
          uint64_t v106 = [v12 warningTime];
          unsigned int v19 = [v12 intervalDidStart];
          unsigned __int8 v20 = [v12 didWarnForIntervalStart];
          unsigned __int8 v102 = [v12 didWarnForIntervalEnd];
          uint64_t v21 = [v110 startDate];
          v105 = [v110 endDate];
          if (!v21 || ([v21 timeIntervalSinceNow], v22 > 0.0))
          {
            if (!v19) {
              goto LABEL_29;
            }
            if (v95
              && (-[USBudgetTracker _notifyExtensionThatIntervalDidEndForActivity:clientIdentifier:extensionIdentifier:isWarning:](self, "_notifyExtensionThatIntervalDidEndForActivity:clientIdentifier:extensionIdentifier:isWarning:", v109, v108, v107, 0), v6)&& ([v17 repeats] & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v89 = [v17 name];
                *(_DWORD *)buf = 138543362;
                long long v131 = v89;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleting budget for one-shot activity: %{public}@", buf, 0xCu);
              }
              v90 = [v17 managedObjectContext];
              [v90 deleteObject:v17];

              char v98 = 1;
              double v11 = v104;
              id v45 = (void *)v106;
            }
            else
            {
              [v17 setIntervalStartDate:0];
              [v17 setIntervalDidStart:0];
              if (v106) {
                [v17 setDidWarnForIntervalEnd:0];
              }
              long long v114 = 0u;
              long long v115 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              id v23 = v17;
              id v24 = [v17 events];
              id v25 = [v24 countByEnumeratingWithState:&v112 objects:v129 count:16];
              if (v25)
              {
                id v26 = v25;
                uint64_t v27 = *(void *)v113;
                do
                {
                  for (id i = 0; i != v26; id i = (char *)i + 1)
                  {
                    if (*(void *)v113 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    double v29 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                    [v29 setDidReachThreshold:0];
                    [v29 setDidWarnForThreshold:0];
                    [v29 setThresholdAdjustmentTime:0.0];
                  }
                  id v26 = [v24 countByEnumeratingWithState:&v112 objects:v129 count:16];
                }
                while (v26);
              }

              char v98 = 1;
              BOOL v17 = v23;
LABEL_29:
              uint64_t v30 = v6;
              double v31 = [v17 objectID];
              double v32 = v21;
              id v33 = v21;
              id v34 = v17;
              xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
              [v33 timeIntervalSince1970];
              double v37 = v36;

              xpc_dictionary_set_date(v35, "Date", (uint64_t)(v37 * 1000000000.0));
              xpc_dictionary_set_BOOL(v35, "ShouldWake", 0);
              uint32_t v38 = [v31 URIRepresentation];
              id v39 = [v38 absoluteString];

              id v40 = v39;
              xpc_dictionary_set_string(v35, "BudgetID", (const char *)[v40 UTF8String]);
              id v41 = objc_alloc((Class)NSString);
              id v42 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.alarm.start-"];
              id v43 = [v41 initWithFormat:@"%@%@", v42, v40];

              id v44 = v43;
              [v44 UTF8String];
              xpc_set_event();

              id v45 = (void *)v106;
              if (v106) {
                char v46 = v20;
              }
              else {
                char v46 = 1;
              }
              if (v46)
              {
                double v11 = v104;
                uint64_t v6 = v30;
                uint64_t v21 = v32;
                uint64_t v10 = v99;
                id v8 = v100;
                long long v9 = &swift_weakDestroy_ptr;
              }
              else
              {
                xpc_object_t v47 = [v34 objectID];
                LOBYTE(v92) = 1;
                unsigned int v48 = [(USBudgetTracker *)self _setWarningAlarmOrNotifyExtensionWithComponents:v106 referenceDate:v33 budgetID:v47 activity:v109 clientIdentifier:v108 extensionIdentifier:v107 warnForStartOfInterval:v92];

                double v11 = v104;
                long long v49 = v34;
                uint64_t v6 = v30;
                uint64_t v21 = v32;
                uint64_t v10 = v99;
                id v8 = v100;
                long long v9 = &swift_weakDestroy_ptr;
                if (v48)
                {
                  char v98 = 1;
                  [v49 setDidWarnForIntervalStart:1];
                }
              }
            }
LABEL_80:

            goto LABEL_81;
          }
          id v97 = v21;
          if (!v19 || (v6 & 1) != 0)
          {
            if (!v19) {
              goto LABEL_50;
            }
          }
          else
          {
            long long v50 = [v17 intervalStartDate];
            int v51 = v17;
            id v52 = (char *)[v50 compare:v21];

            BOOL v53 = v52 + 1 == 0;
            BOOL v17 = v51;
            if (!v53)
            {
              if (v19)
              {
LABEL_70:
                unint64_t v72 = [v17 objectID];
                id v73 = v105;
                xpc_object_t v74 = xpc_dictionary_create(0, 0, 0);
                [v73 timeIntervalSince1970];
                double v76 = v75;

                xpc_dictionary_set_date(v74, "Date", (uint64_t)(v76 * 1000000000.0));
                xpc_dictionary_set_BOOL(v74, "ShouldWake", 0);
                uint64_t v77 = [v72 URIRepresentation];
                [v77 absoluteString];
                v79 = long long v78 = v17;

                id v80 = v79;
                xpc_dictionary_set_string(v74, "BudgetID", (const char *)[v80 UTF8String]);
                id v81 = objc_alloc((Class)NSString);
                int v82 = +[NSString stringWithUTF8String:"com.apple.UsageTrackingAgent.alarm.end-"];
                id v83 = [v81 initWithFormat:@"%@%@", v82, v80];

                id v84 = v83;
                [v84 UTF8String];
                xpc_set_event();

                id v45 = (void *)v106;
                if (v106) {
                  char v85 = v102;
                }
                else {
                  char v85 = 1;
                }
                if (v85)
                {
                  uint64_t v10 = v99;
                  double v11 = v104;
                  uint64_t v21 = v97;
                }
                else
                {
                  v86 = [v78 objectID];
                  LOBYTE(v93) = 0;
                  unsigned int v87 = [(USBudgetTracker *)self _setWarningAlarmOrNotifyExtensionWithComponents:v106 referenceDate:v73 budgetID:v86 activity:v109 clientIdentifier:v108 extensionIdentifier:v107 warnForStartOfInterval:v93];

                  uint64_t v10 = v99;
                  double v11 = v104;
                  qos_class_t v88 = v78;
                  uint64_t v21 = v97;
                  if (v87)
                  {
                    char v98 = 1;
                    [v88 setDidWarnForIntervalEnd:1];
                  }
                }
                goto LABEL_80;
              }
LABEL_50:
              [(USBudgetTracker *)self _notifyExtensionThatIntervalDidStartForActivity:v109 clientIdentifier:v108 extensionIdentifier:v107 isWarning:0];
              [v17 setIntervalStartDate:v21];
              [v17 setIntervalDidStart:1];
              if (v106) {
                [v17 setDidWarnForIntervalStart:0];
              }
              uint64_t v61 = [(id)objc_opt_class() usageQuerying];
              long long v117 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              long long v96 = v17;
              v62 = [v17 events];
              id v63 = [v62 countByEnumeratingWithState:&v117 objects:v134 count:16];
              if (v63)
              {
                id v64 = v63;
                id v65 = 0;
                uint64_t v66 = *(void *)v118;
                do
                {
                  uint64_t v67 = 0;
                  id v68 = v65;
                  do
                  {
                    if (*(void *)v118 != v66) {
                      objc_enumerationMutation(v62);
                    }
                    double v69 = *(void **)(*((void *)&v117 + 1) + 8 * (void)v67);
                    if (v111
                      && ([*(id *)(*((void *)&v117 + 1) + 8 * (void)v67) includesPastActivity] & 1) != 0)
                    {
                      id v65 = v68;
                    }
                    else
                    {
                      double v70 = [v69 queryForInterval:v110];
                      id v116 = v68;
                      id v71 = [v61 query:v70 error:&v116];
                      id v65 = v116;

                      if (v71)
                      {
                        [v71 doubleValue];
                        objc_msgSend(v69, "setThresholdAdjustmentTime:");
                      }
                      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                      {
                        sub_10006BC50(v132, (uint64_t)v65, &v133);
                      }

                      id v68 = v65;
                    }
                    uint64_t v67 = (char *)v67 + 1;
                  }
                  while (v64 != v67);
                  id v64 = [v62 countByEnumeratingWithState:&v117 objects:v134 count:16];
                }
                while (v64);
              }
              else
              {
                id v65 = 0;
              }

              char v98 = 1;
              uint64_t v6 = v94;
              id v8 = v100;
              long long v9 = &swift_weakDestroy_ptr;
              BOOL v17 = v96;
              goto LABEL_70;
            }
          }
          [(USBudgetTracker *)self _notifyExtensionThatIntervalDidEndForActivity:v109 clientIdentifier:v108 extensionIdentifier:v107 isWarning:0];
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          __int16 v54 = v17;
          id v55 = [v17 events];
          id v56 = [v55 countByEnumeratingWithState:&v121 objects:v135 count:16];
          if (v56)
          {
            id v57 = v56;
            uint64_t v58 = *(void *)v122;
            do
            {
              for (j = 0; j != v57; j = (char *)j + 1)
              {
                if (*(void *)v122 != v58) {
                  objc_enumerationMutation(v55);
                }
                id v60 = *(void **)(*((void *)&v121 + 1) + 8 * (void)j);
                [v60 setDidReachThreshold:0];
                [v60 setDidWarnForThreshold:0];
                [v60 setThresholdAdjustmentTime:0.0];
              }
              id v57 = [v55 countByEnumeratingWithState:&v121 objects:v135 count:16];
            }
            while (v57);
          }

          BOOL v17 = v54;
          goto LABEL_50;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          double v18 = [v12 name];
          *(_DWORD *)buf = 138543362;
          long long v131 = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not compute next interval for device activity: %{public}@", buf, 0xCu);
        }
LABEL_81:

        double v11 = (char *)v11 + 1;
      }
      while (v11 != v8);
      id v8 = [obj countByEnumeratingWithState:&v125 objects:v136 count:16];
      if (!v8) {
        goto LABEL_85;
      }
    }
  }
  char v98 = 0;
LABEL_85:

  return v98 & 1;
}

- (BOOL)_setWarningAlarmOrNotifyExtensionWithComponents:(id)a3 referenceDate:(id)a4 budgetID:(id)a5 activity:(id)a6 clientIdentifier:(id)a7 extensionIdentifier:(id)a8 warnForStartOfInterval:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = +[USDeviceActivitySchedule nextWarningDateForComponents:v15 referenceDate:v16];
  double v22 = v21;
  if (!v21)
  {
    BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (a9)
    {
      if (v40) {
        sub_10006BC9C();
      }
    }
    else if (v40)
    {
      sub_10006BD14();
    }
    goto LABEL_13;
  }
  [v21 timeIntervalSinceNow];
  if (v23 > 0.0)
  {
    id v24 = "com.apple.UsageTrackingAgent.end-warning-";
    if (a9) {
      id v24 = "com.apple.UsageTrackingAgent.alarm.start-warning-";
    }
    id v43 = v24;
    id v25 = v17;
    id v26 = v22;
    xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
    [v26 timeIntervalSince1970];
    double v29 = v28;

    xpc_dictionary_set_date(v27, "Date", (uint64_t)(v29 * 1000000000.0));
    xpc_dictionary_set_BOOL(v27, "ShouldWake", 0);
    uint64_t v30 = [v25 URIRepresentation];

    double v31 = [v30 absoluteString];

    id v32 = v31;
    xpc_dictionary_set_string(v27, "BudgetID", (const char *)[v32 UTF8String]);
    id v44 = v20;
    id v33 = v19;
    id v34 = v18;
    id v35 = v17;
    id v36 = objc_alloc((Class)NSString);
    double v37 = +[NSString stringWithUTF8String:v43];
    id v38 = [v36 initWithFormat:@"%@%@", v37, v32];

    id v39 = v38;
    [v39 UTF8String];
    xpc_set_event();

    id v17 = v35;
    id v18 = v34;
    id v19 = v33;
    id v20 = v44;

LABEL_13:
    BOOL v41 = 0;
    goto LABEL_14;
  }
  BOOL v41 = 1;
  if (a9) {
    [(USBudgetTracker *)self _notifyExtensionThatIntervalDidStartForActivity:v18 clientIdentifier:v19 extensionIdentifier:v20 isWarning:1];
  }
  else {
    [(USBudgetTracker *)self _notifyExtensionThatIntervalDidEndForActivity:v18 clientIdentifier:v19 extensionIdentifier:v20 isWarning:1];
  }
LABEL_14:

  return v41;
}

- (void)_notifyExtensionThatIntervalDidStartForActivity:(id)a3 clientIdentifier:(id)a4 extensionIdentifier:(id)a5 isWarning:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc((Class)USDeviceActivityMonitorExtensionProxy);
  if (v11)
  {
    uint64_t v28 = 0;
    id v13 = (id *)&v28;
    id v14 = [v12 initWithBundleIdentifier:v11 error:&v28];
  }
  else
  {
    uint64_t v27 = 0;
    id v13 = (id *)&v27;
    id v14 = [v12 initWithClientIdentifier:v10 error:&v27];
  }
  id v15 = v14;
  id v16 = *v13;
  if (v15)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543874;
        id v30 = v11;
        __int16 v31 = 2114;
        id v32 = v10;
        __int16 v33 = 2114;
        id v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ will start", buf, 0x20u);
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001D504;
      v23[3] = &unk_10008A5B8;
      id v24 = v11;
      id v25 = v9;
      id v26 = v16;
      [v15 intervalWillStartWarningForActivity:v25 replyHandler:v23];

      id v18 = v24;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543874;
        id v30 = v11;
        __int16 v31 = 2114;
        id v32 = v10;
        __int16 v33 = 2114;
        id v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ did start", buf, 0x20u);
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001D554;
      v19[3] = &unk_10008A5B8;
      id v20 = v11;
      id v21 = v9;
      id v22 = v16;
      [v15 intervalDidStartForActivity:v21 replyHandler:v19];

      id v18 = v20;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006BD8C();
  }
}

- (void)_notifyExtensionThatIntervalDidEndForActivity:(id)a3 clientIdentifier:(id)a4 extensionIdentifier:(id)a5 isWarning:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc((Class)USDeviceActivityMonitorExtensionProxy);
  if (v11)
  {
    uint64_t v28 = 0;
    id v13 = (id *)&v28;
    id v14 = [v12 initWithBundleIdentifier:v11 error:&v28];
  }
  else
  {
    uint64_t v27 = 0;
    id v13 = (id *)&v27;
    id v14 = [v12 initWithClientIdentifier:v10 error:&v27];
  }
  id v15 = v14;
  id v16 = *v13;
  if (v15)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543874;
        id v30 = v11;
        __int16 v31 = 2114;
        id v32 = v10;
        __int16 v33 = 2114;
        id v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ will end", buf, 0x20u);
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001D880;
      v23[3] = &unk_10008A5B8;
      id v24 = v11;
      id v25 = v9;
      id v26 = v16;
      [v15 intervalWillEndWarningForActivity:v25 replyHandler:v23];

      id v18 = v24;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543874;
        id v30 = v11;
        __int16 v31 = 2114;
        id v32 = v10;
        __int16 v33 = 2114;
        id v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ did end", buf, 0x20u);
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001D8D0;
      v19[3] = &unk_10008A5B8;
      id v20 = v11;
      id v21 = v9;
      id v22 = v16;
      [v15 intervalDidEndForActivity:v21 replyHandler:v19];

      id v18 = v20;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006BD8C();
  }
}

- (BOOL)_notifyExtensionThatEventDidReachThreshold:(id)a3 activity:(id)a4 clientIdentifier:(id)a5 extensionIdentifier:(id)a6 isWarning:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if (v14)
  {
    uint64_t v31 = 0;
    id v15 = (id *)&v31;
    id v16 = [objc_alloc((Class)USDeviceActivityMonitorExtensionProxy) initWithBundleIdentifier:v14 error:&v31];
  }
  else
  {
    uint64_t v30 = 0;
    id v15 = (id *)&v30;
    id v16 = [objc_alloc((Class)USDeviceActivityMonitorExtensionProxy) initWithClientIdentifier:v13 error:&v30];
  }
  BOOL v17 = v16;
  id v18 = *v15;
  if (v17)
  {
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138544130;
        id v37 = v14;
        __int16 v38 = 2114;
        id v39 = v13;
        __int16 v40 = 2114;
        id v41 = v11;
        __int16 v42 = 2114;
        id v43 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ from activity %{public}@ will reach its threshold", buf, 0x2Au);
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10001DC74;
      v26[3] = &unk_10008A5E0;
      double v29 = &v32;
      id v27 = v14;
      id v28 = v11;
      [v17 eventWillReachThresholdWarning:v28 activity:v12 replyHandler:v26];
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138544130;
        id v37 = v14;
        __int16 v38 = 2114;
        id v39 = v13;
        __int16 v40 = 2114;
        id v41 = v11;
        __int16 v42 = 2114;
        id v43 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ from activity %{public}@ reached its threshold", buf, 0x2Au);
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001DCD8;
      v22[3] = &unk_10008A5E0;
      id v25 = &v32;
      id v23 = v14;
      id v24 = v11;
      [v17 eventDidReachThreshold:v24 activity:v12 replyHandler:v22];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006BD8C();
  }
  BOOL v20 = *((unsigned char *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (BOOL)_notifyExtensionThatEventDidUnreachThreshold:(id)a3 activity:(id)a4 clientIdentifier:(id)a5 extensionIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  if (v12)
  {
    uint64_t v24 = 0;
    id v13 = (id *)&v24;
    id v14 = [objc_alloc((Class)USDeviceActivityMonitorExtensionProxy) initWithBundleIdentifier:v12 error:&v24];
  }
  else
  {
    uint64_t v23 = 0;
    id v13 = (id *)&v23;
    id v14 = [objc_alloc((Class)USDeviceActivityMonitorExtensionProxy) initWithClientIdentifier:v11 error:&v23];
  }
  id v15 = v14;
  id v16 = *v13;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v30 = v12;
      __int16 v31 = 2114;
      id v32 = v11;
      __int16 v33 = 2114;
      id v34 = v9;
      __int16 v35 = 2114;
      id v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notifying extension %{public}@ with client %{public}@ that %{public}@ from activity %{public}@ unreached its threshold", buf, 0x2Au);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001DF98;
    v19[3] = &unk_10008A5E0;
    id v22 = &v25;
    id v20 = v12;
    id v21 = v9;
    [v15 eventDidUnreachThreshold:v21 activity:v10 replyHandler:v19];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006BD8C();
  }
  BOOL v17 = *((unsigned char *)v26 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return v17;
}

- (NSBackgroundActivityScheduler)resetDeviceActivityAlarms
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 8, 1);
}

- (_CDContextualChangeRegistration)applicationRegistration
{
  return (_CDContextualChangeRegistration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplicationRegistration:(id)a3
{
}

- (_CDContextualChangeRegistration)webDomainRegistration
{
  return (_CDContextualChangeRegistration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWebDomainRegistration:(id)a3
{
}

- (_CDContextualChangeRegistration)nowPlayingRegistration
{
  return (_CDContextualChangeRegistration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNowPlayingRegistration:(id)a3
{
}

- (_CDContextualChangeRegistration)videoRegistration
{
  return (_CDContextualChangeRegistration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVideoRegistration:(id)a3
{
}

- (OS_dispatch_queue)schedulerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BMBiomeScheduler)applicationScheduler
{
  return (BMBiomeScheduler *)objc_getProperty(self, a2, 56, 1);
}

- (BMBiomeScheduler)webDomainScheduler
{
  return (BMBiomeScheduler *)objc_getProperty(self, a2, 64, 1);
}

- (BMBiomeScheduler)nowPlayingScheduler
{
  return (BMBiomeScheduler *)objc_getProperty(self, a2, 72, 1);
}

- (BMBiomeScheduler)videoScheduler
{
  return (BMBiomeScheduler *)objc_getProperty(self, a2, 80, 1);
}

- (BPSSink)applicationSubscription
{
  return (BPSSink *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationSubscription:(id)a3
{
}

- (BPSSink)webDomainSubscription
{
  return (BPSSink *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWebDomainSubscription:(id)a3
{
}

- (BPSSink)nowPlayingSubscription
{
  return (BPSSink *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNowPlayingSubscription:(id)a3
{
}

- (BPSSink)videoSubscription
{
  return (BPSSink *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVideoSubscription:(id)a3
{
}

- (NSDate)lastSyncDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastSyncDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_videoSubscription, 0);
  objc_storeStrong((id *)&self->_nowPlayingSubscription, 0);
  objc_storeStrong((id *)&self->_webDomainSubscription, 0);
  objc_storeStrong((id *)&self->_applicationSubscription, 0);
  objc_storeStrong((id *)&self->_videoScheduler, 0);
  objc_storeStrong((id *)&self->_nowPlayingScheduler, 0);
  objc_storeStrong((id *)&self->_webDomainScheduler, 0);
  objc_storeStrong((id *)&self->_applicationScheduler, 0);
  objc_storeStrong((id *)&self->_schedulerQueue, 0);
  objc_storeStrong((id *)&self->_videoRegistration, 0);
  objc_storeStrong((id *)&self->_nowPlayingRegistration, 0);
  objc_storeStrong((id *)&self->_webDomainRegistration, 0);
  objc_storeStrong((id *)&self->_applicationRegistration, 0);
  objc_storeStrong((id *)&self->_resetDeviceActivityAlarms, 0);
}

@end