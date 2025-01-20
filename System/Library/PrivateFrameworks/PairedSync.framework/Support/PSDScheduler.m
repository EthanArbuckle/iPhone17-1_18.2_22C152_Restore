@interface PSDScheduler
+ (BOOL)_isInternalInstall;
+ (BOOL)_isSyncShameDisabled;
+ (id)sharedScheduler;
- (BOOL)_canAttemptRetryForActivity:(id)a3;
- (BOOL)_shouldHandleCallbackForActivity:(id)a3;
- (BOOL)buddyPastActivation;
- (BOOL)buddyPastAppleID;
- (BOOL)buddyPastApplePay;
- (BOOL)buddyPastInstallAllAppsSelection;
- (BOOL)buddyStageDependencyClearedForActivity:(id)a3;
- (BOOL)completedNanoPreferencesSync;
- (BOOL)scheduleSyncSession:(id)a3;
- (BOOL)shouldLaunchAsDryRun;
- (NSEnumerator)testInputsEnumerator;
- (NSMapTable)schedulerObservers;
- (NSMutableArray)activityQueue;
- (NSMutableArray)runningActivityQueue;
- (NSMutableDictionary)timeoutTimers;
- (NSUUID)monitoredPairing;
- (PSDScheduler)init;
- (PSYLinkUpgradeMonitor)linkUpgradeMonitor;
- (PSYOptions)options;
- (PSYSyncSession)syncSession;
- (double)_timeoutForActivity:(id)a3;
- (double)syncTopicTimeout;
- (id)_localizedString:(id)a3;
- (id)_syncOptionsForActivity:(id)a3;
- (id)activitiesForSessionActivites:(id)a3;
- (id)nrDeviceForPairingIdentifier:(id)a3;
- (int)_indexOfNextEligibleActivity;
- (int64_t)_maxSupportedActivitiesForCurrentLink;
- (int64_t)currentNRLinkType;
- (int64_t)maxSupportedParallelActivitiesPreferenceValue;
- (unint64_t)_maximumInterruptionCountForActivity:(id)a3;
- (unsigned)effectiveCompletedBuddyStages;
- (void)_abortActivity:(id)a3;
- (void)_abortRunningActivities;
- (void)_activityDidTimeout:(id)a3;
- (void)_activityTimeoutHandler:(id)a3;
- (void)_activityWasInterrupted:(id)a3;
- (void)_cancelAllActivityTimers;
- (void)_clearActivityTimer:(id)a3;
- (void)_currentProgressUpdated:(float)a3 forActivity:(id)a4;
- (void)_dequeueNextActivityAfter:(id)a3;
- (void)_finishActivity:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_popATimeoutAlert:(unint64_t)a3;
- (void)_queue_cleanup;
- (void)_queue_enumerateSchedulerObserversWithBlock:(id)a3;
- (void)_queue_tellObserversDidClearSyncSession:(id)a3 withBlock:(id)a4;
- (void)_queue_tellObserversDidUpdateSyncSessionWithUpdate:(id)a3;
- (void)_queue_tellObserversWillStartSyncSession;
- (void)_queue_updateSyncSessionActivity:(id)a3;
- (void)_queue_updateWithSyncSession:(id)a3;
- (void)_resetLinkMonitor;
- (void)_scheduleNextActivityIfPossible;
- (void)_scheduleTimeoutForActivity:(id)a3;
- (void)_scheduledActivitiesDidComplete;
- (void)_setupLinkMonitorForDevice:(id)a3;
- (void)_startActivity:(id)a3;
- (void)_takeStackshotSequenceWithLabel:(id)a3;
- (void)_updateDefaults;
- (void)activity:(id)a3 didUpdateProgress:(float)a4;
- (void)activityDidCompleteSending:(id)a3;
- (void)addSchedulerObserver:(id)a3;
- (void)cancelSyncSession;
- (void)linkChangedToLinkType:(int64_t)a3;
- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5;
- (void)removeSchedulerObserver:(id)a3;
- (void)setActivityQueue:(id)a3;
- (void)setBuddyPastActivation:(BOOL)a3;
- (void)setBuddyPastAppleID:(BOOL)a3;
- (void)setBuddyPastApplePay:(BOOL)a3;
- (void)setBuddyPastInstallAllAppsSelection:(BOOL)a3;
- (void)setCompletedNanoPreferencesSync:(BOOL)a3;
- (void)setCurrentNRLinkType:(int64_t)a3;
- (void)setEffectiveCompletedBuddyStages:(unsigned int)a3;
- (void)setLinkUpgradeMonitor:(id)a3;
- (void)setMaxSupportedParallelActivitiesPreferenceValue:(int64_t)a3;
- (void)setMonitoredPairing:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRunningActivityQueue:(id)a3;
- (void)setSchedulerObservers:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)setSyncTopicTimeout:(double)a3;
- (void)setTestInputsEnumerator:(id)a3;
- (void)setTimeoutTimers:(id)a3;
@end

@implementation PSDScheduler

+ (id)sharedScheduler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012964;
  block[3] = &unk_10002C778;
  block[4] = a1;
  if (qword_1000384F0 != -1) {
    dispatch_once(&qword_1000384F0, block);
  }
  v2 = (void *)qword_1000384E8;

  return v2;
}

- (PSDScheduler)init
{
  v16.receiver = self;
  v16.super_class = (Class)PSDScheduler;
  v2 = [(PSDScheduler *)&v16 init];
  key = v2;
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = +[NSMapTable weakToStrongObjectsMapTable];
    schedulerObservers = v3->_schedulerObservers;
    v3->_schedulerObservers = (NSMapTable *)v4;

    [(PSDScheduler *)v3 _updateDefaults];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.pairedsyncd.scheduler", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_set_specific((dispatch_queue_t)v3->_queue, &key, (void *)1, 0);
    if ([(id)objc_opt_class() _isInternalInstall]
      && ([(id)objc_opt_class() _isSyncShameDisabled] & 1) == 0)
    {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.pairedsyncd.scheduler.alertqueue", v6);
      alertQueue = key->_alertQueue;
      key->_alertQueue = (OS_dispatch_queue *)v9;
    }
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    timeoutTimers = key->_timeoutTimers;
    key->_timeoutTimers = v11;

    v13 = key;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (void)addSchedulerObserver:(id)a3
{
  id v4 = a3;
  v5 = [[PSDSchedulerObserver alloc] initWithObserver:v4];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BA4;
  block[3] = &unk_10002CC30;
  block[4] = self;
  v10 = v5;
  id v11 = v4;
  id v7 = v4;
  v8 = v5;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)removeSchedulerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012C90;
  v7[3] = &unk_10002C8B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)_updateDefaults
{
  CFPreferencesAppSynchronize(@"com.apple.pairedsyncd");
  objc_msgSend((id)CFPreferencesCopyAppValue(@"SyncClientTimeOut", @"com.apple.pairedsyncd"), "floatValue");
  double v4 = v3;
  BOOL v5 = v3 > 0.0;
  double v6 = 300.0;
  if (v5) {
    double v6 = v4;
  }
  self->_double syncTopicTimeout = v6;
  self->_int64_t maxSupportedParallelActivitiesPreferenceValue = (int)objc_msgSend((id)CFPreferencesCopyAppValue(@"NumberOfSyncTopicsToRunSimultaneously", @"com.apple.pairedsyncd"), "intValue");
  id v7 = psd_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    dispatch_queue_t v9 = psd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double syncTopicTimeout = self->_syncTopicTimeout;
      int64_t maxSupportedParallelActivitiesPreferenceValue = self->_maxSupportedParallelActivitiesPreferenceValue;
      int v12 = 134218240;
      double v13 = syncTopicTimeout;
      __int16 v14 = 2048;
      int64_t v15 = maxSupportedParallelActivitiesPreferenceValue;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "syncTopicTimeout %f maxSupportedParallelActivitiesPreferenceValue: %zd", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_setupLinkMonitorForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = (PSYLinkUpgradeMonitor *)[objc_alloc((Class)PSYLinkUpgradeMonitor) initWithRegistryDevice:v4 delegateQueue:self->_queue];

  linkUpgradeMonitor = self->_linkUpgradeMonitor;
  self->_linkUpgradeMonitor = v5;

  [(PSYLinkUpgradeMonitor *)self->_linkUpgradeMonitor setDelegate:self];
  self->_currentNRLinkType = (int64_t)[(PSYLinkUpgradeMonitor *)self->_linkUpgradeMonitor currentLinkType];
  id v7 = self->_linkUpgradeMonitor;

  [(PSYLinkUpgradeMonitor *)v7 requestLinkUpgrade];
}

- (void)_resetLinkMonitor
{
  [(PSYLinkUpgradeMonitor *)self->_linkUpgradeMonitor resetCompanionLinkPreference];
  linkUpgradeMonitor = self->_linkUpgradeMonitor;
  self->_linkUpgradeMonitor = 0;
}

- (id)nrDeviceForPairingIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PSYRegistrySingleton registry];
    BOOL v5 = [v4 getActiveDevice];

    double v6 = [v5 pairingID];
    unsigned int v7 = [v6 isEqual:v3];

    if (v7)
    {
      id v8 = v5;
    }
    else
    {
      dispatch_queue_t v9 = +[PSYRegistrySingleton registry];
      v10 = [v9 getPairedDevices];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v11);
            }
            int64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            objc_super v16 = objc_msgSend(v15, "pairingID", (void)v19);
            unsigned int v17 = [v16 isEqual:v3];

            if (v17)
            {
              id v12 = v15;
              goto LABEL_15;
            }
          }
          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      id v8 = v12;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)scheduleSyncSession:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001318C;
  block[3] = &unk_10002C7C8;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)_localizedString:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.private.PairedSync"];
  BOOL v5 = +[NSLocale preferredLanguages];
  id v6 = [v5 firstObject];
  if (!v6) {
    sub_10001CB7C();
  }

  unsigned int v7 = +[NSLocale preferredLanguages];
  id v8 = [v7 firstObject];
  id v9 = v3;
  id v10 = v4;
  id v11 = v8;
  if (![v9 length] || !objc_msgSend(@"Localizable", "length") || !objc_msgSend(v11, "length")) {
    goto LABEL_10;
  }
  CFArrayRef v12 = [v10 localizations];
  CFArrayRef v13 = +[NSArray arrayWithObject:v11];
  CFArrayRef v14 = CFBundleCopyLocalizationsForPreferences(v12, v13);
  if (![(__CFArray *)v14 count]) {
    goto LABEL_8;
  }
  int64_t v15 = [(__CFArray *)v14 objectAtIndex:0];
  objc_super v16 = [v10 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v15];

  if (v16)
  {
    unsigned int v17 = +[NSDictionary dictionaryWithContentsOfFile:v16];
    v18 = [v17 objectForKey:v9];
  }
  else
  {
LABEL_8:
    v18 = 0;
  }

  if (!v18)
  {
LABEL_10:
    v18 = [v10 localizedStringForKey:v9 value:&stru_10002E0D0 table:@"Localizable"];
  }

  return v18;
}

- (PSYSyncSession)syncSession
{
  key = self;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100013A18;
  id v11 = sub_100013A28;
  id v12 = 0;
  if (dispatch_get_specific(&key) == 1)
  {
    objc_storeStrong(&v12, self->_syncSession);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013A30;
    block[3] = &unk_10002CB40;
    block[4] = self;
    void block[5] = &v7;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PSYSyncSession *)v4;
}

- (id)activitiesForSessionActivites:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [PSDActivity alloc];
        CFArrayRef v13 = objc_msgSend(v11, "activityInfo", (void)v16);
        CFArrayRef v14 = [(PSDActivity *)v12 initWithActivityInfo:v13 queue:self->_queue];

        [(PSDActivity *)v14 setDelegate:self];
        if (v14) {
          [v5 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_dequeueNextActivityAfter:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 activityInfo];
    id v6 = [v5 label];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.pairedsync.nanoprefsyncdfirst"];

    if (v7) {
      self->_completedNanoPreferencesSync = 1;
    }
    [v4 setDelegate:0];
    [(NSMutableArray *)self->_runningActivityQueue removeObject:v4];
  }

  [(PSDScheduler *)self _scheduleNextActivityIfPossible];
}

- (int)_indexOfNextEligibleActivity
{
  id v3 = [(PSDScheduler *)self activityQueue];
  id v4 = [(PSYSyncSession *)self->_syncSession completedActivityLabelsSet];
  if ([v3 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [v3 objectAtIndex:v5];
      if ([(PSDScheduler *)self buddyStageDependencyClearedForActivity:v6]) {
        break;
      }
LABEL_16:

      if ((unint64_t)[v3 count] <= ++v5) {
        goto LABEL_17;
      }
    }
    unsigned int v7 = [v6 activityInfo];
    id v8 = [v7 dependentServices];

    if (v8 && [v8 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v16;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            if (![v4 containsObject:*(void *)(*((void *)&v15 + 1) + 8 * i)])
            {

              goto LABEL_16;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
LABEL_17:
    LODWORD(v5) = -1;
  }

  return v5;
}

- (BOOL)buddyStageDependencyClearedForActivity:(id)a3
{
  id v4 = a3;
  if ([(PSYSyncSession *)self->_syncSession syncSessionType]
    || ([v4 activityInfo],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 dependentBuddyStages],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6,
        !v8))
  {
    BOOL v5 = 1;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = objc_msgSend(v4, "activityInfo", 0);
    id v10 = [v9 dependentBuddyStages];

    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
LABEL_6:
      uint64_t v14 = 0;
      while (2)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        switch((unint64_t)[*(id *)(*((void *)&v27 + 1) + 8 * v14) unsignedIntegerValue])
        {
          case 1uLL:
            if (self->_buddyPastActivation) {
              goto LABEL_17;
            }
            long long v15 = psd_log();
            BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

            BOOL v5 = 0;
            if (v16)
            {
              long long v17 = psd_log();
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_33;
              }
              long long v18 = [v4 activityInfo];
              long long v19 = [v18 label];
              *(_DWORD *)buf = 134218242;
              uint64_t v32 = 1;
              __int16 v33 = 2112;
              v34 = v19;
              goto LABEL_32;
            }
            break;
          case 2uLL:
            if (self->_buddyPastAppleID) {
              goto LABEL_17;
            }
            long long v20 = psd_log();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

            BOOL v5 = 0;
            if (v21)
            {
              long long v17 = psd_log();
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_33;
              }
              long long v18 = [v4 activityInfo];
              long long v19 = [v18 label];
              *(_DWORD *)buf = 134218242;
              uint64_t v32 = 2;
              __int16 v33 = 2112;
              v34 = v19;
              goto LABEL_32;
            }
            break;
          case 3uLL:
            if (self->_buddyPastInstallAllAppsSelection) {
              goto LABEL_17;
            }
            long long v22 = psd_log();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

            BOOL v5 = 0;
            if (v23)
            {
              long long v17 = psd_log();
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_33;
              }
              long long v18 = [v4 activityInfo];
              long long v19 = [v18 label];
              *(_DWORD *)buf = 134218242;
              uint64_t v32 = 3;
              __int16 v33 = 2112;
              v34 = v19;
              goto LABEL_32;
            }
            break;
          case 4uLL:
            if (self->_buddyPastApplePay) {
              goto LABEL_17;
            }
            v24 = psd_log();
            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

            BOOL v5 = 0;
            if (v25)
            {
              long long v17 = psd_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                long long v18 = [v4 activityInfo];
                long long v19 = [v18 label];
                *(_DWORD *)buf = 134218242;
                uint64_t v32 = 4;
                __int16 v33 = 2112;
                v34 = v19;
LABEL_32:
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "buddy stage dependency: %lu not cleared for :%@", buf, 0x16u);
              }
LABEL_33:

              BOOL v5 = 0;
            }
            break;
          default:
LABEL_17:
            if (v12 != (id)++v14) {
              continue;
            }
            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (!v12) {
              goto LABEL_19;
            }
            goto LABEL_6;
        }
        break;
      }
    }
    else
    {
LABEL_19:
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (void)_scheduleNextActivityIfPossible
{
  id v3 = (NSMutableArray *)[(NSMutableArray *)self->_runningActivityQueue count];
  int64_t maxSupportedParallelActivitiesPreferenceValue = self->_maxSupportedParallelActivitiesPreferenceValue;
  if (maxSupportedParallelActivitiesPreferenceValue <= 0) {
    int64_t maxSupportedParallelActivitiesPreferenceValue = [(PSDScheduler *)self _maxSupportedActivitiesForCurrentLink];
  }
  uint64_t v5 = maxSupportedParallelActivitiesPreferenceValue - (void)v3;
  id v6 = psd_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134218240;
      v31 = v3;
      __int16 v32 = 2048;
      v33[0] = maxSupportedParallelActivitiesPreferenceValue;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "current running: %lu maxSupported: %lu", (uint8_t *)&v30, 0x16u);
    }
  }
  if (v5 >= 1)
  {
    while (1)
    {
      unsigned int v9 = [(PSDScheduler *)self _indexOfNextEligibleActivity];
      if ((v9 & 0x80000000) != 0) {
        break;
      }
      id v10 = [(PSDScheduler *)self activityQueue];
      uint64_t v11 = v9;
      id v12 = [v10 objectAtIndex:v9];

      if (!v12) {
        goto LABEL_13;
      }
      if (self->_completedNanoPreferencesSync) {
        goto LABEL_17;
      }
      char v13 = 0;
LABEL_14:
      uint64_t v14 = [v12 activityInfo];
      long long v15 = [v14 label];
      unsigned int v16 = [v15 isEqualToString:@"com.apple.pairedsync.nanoprefsyncdfirst"];

      if (!v16)
      {
        id v20 = [(NSMutableArray *)self->_runningActivityQueue count];
        char v21 = v13 ^ 1;
        if (v20) {
          char v21 = 1;
        }
        if ((v21 & 1) != 0
          || ([(PSDScheduler *)self activityQueue],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              id v23 = [v22 count],
              v22,
              v23))
        {
          v24 = psd_log();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

          if (v25)
          {
            v26 = psd_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              runningActivityQueue = self->_runningActivityQueue;
              BOOL completedNanoPreferencesSync = self->_completedNanoPreferencesSync;
              long long v29 = [(PSDScheduler *)self activityQueue];
              int v30 = 138412802;
              v31 = runningActivityQueue;
              __int16 v32 = 1024;
              LODWORD(v33[0]) = completedNanoPreferencesSync;
              WORD2(v33[0]) = 2112;
              *(void *)((char *)v33 + 6) = v29;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Waiting for completion of running activities to finish %@ completed nano preferences sync: %d pending activities: %@", (uint8_t *)&v30, 0x1Cu);
            }
          }
        }
        else
        {
          [(PSDScheduler *)self _scheduledActivitiesDidComplete];
        }
        goto LABEL_32;
      }
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v11 = v9;
LABEL_17:
        long long v17 = [(PSDScheduler *)self activityQueue];
        [v17 removeObjectAtIndex:v11];
      }
      [(NSMutableArray *)self->_runningActivityQueue addObject:v12];
      [(PSDScheduler *)self _startActivity:v12];

      if (!--v5) {
        return;
      }
    }
    id v12 = 0;
LABEL_13:
    char v13 = 1;
    goto LABEL_14;
  }
  long long v18 = psd_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    id v12 = psd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134218240;
      v31 = v3;
      __int16 v32 = 2048;
      v33[0] = maxSupportedParallelActivitiesPreferenceValue;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cannot schedule new activity. current running: %lu maxSupported: %lu", (uint8_t *)&v30, 0x16u);
    }
LABEL_32:
  }
}

- (void)_startActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSDScheduler *)self _syncOptionsForActivity:v4];
  id v6 = [v4 activityInfo];
  BOOL v7 = [v6 label];

  id v8 = psd_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = psd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting activity %{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = [(PSYSyncSession *)self->_syncSession activityForLabel:v7];
  *(void *)buf = 0;
  unsigned __int8 v12 = +[PDRConnectivityStatus getDropoutCounter:buf];
  id v13 = objc_alloc((Class)PSYSyncSessionActivity);
  uint64_t v14 = [v11 activityInfo];
  [v11 activityProgress];
  double v16 = v15;
  long long v17 = [v11 error];
  id v18 = [v11 interruptionCount];
  LOBYTE(v21) = v12;
  id v19 = [v13 initWithActivityInfo:v14 progress:v17 error:1 state:0 finishedSending:v18 interruptionCount:*(void *)buf startDropoutCount:v16 sawADropout:v21];

  [(PSDScheduler *)self _queue_updateSyncSessionActivity:v19];
  [(PSDScheduler *)self _scheduleTimeoutForActivity:v4];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001487C;
  v25[3] = &unk_10002CCA8;
  id v26 = v4;
  long long v27 = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000149A0;
  v22[3] = &unk_10002CCD0;
  id v23 = v26;
  v24 = self;
  id v20 = v26;
  [v20 beginSyncWithOptions:v5 completion:v25 interruptionHandler:v22];
}

- (void)_abortRunningActivities
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_runningActivityQueue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[PSDScheduler _abortActivity:](self, "_abortActivity:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_abortActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityInfo];
  uint64_t v6 = [v5 label];

  BOOL v7 = psd_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    long long v9 = psd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Canceling activity %{public}@", buf, 0xCu);
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100014CD8;
  v14[3] = &unk_10002CCA8;
  id v15 = v4;
  double v16 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014E1C;
  v11[3] = &unk_10002CCD0;
  id v12 = v15;
  id v13 = self;
  id v10 = v15;
  [v10 abortSyncWithCompletion:v14 interruptionHandler:v11];
}

- (void)_finishActivity:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F6C;
  block[3] = &unk_10002CC30;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_clearActivityTimer:(id)a3
{
  id v4 = a3;
  id v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    id v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001CD18(v4, v7);
    }
  }
  id v8 = +[NSValue valueWithPointer:v4];
  long long v9 = [(NSMutableDictionary *)self->_timeoutTimers objectForKeyedSubscript:v8];
  [v9 invalidate];
  [(NSMutableDictionary *)self->_timeoutTimers removeObjectForKey:v8];
}

- (void)_cancelAllActivityTimers
{
  id v3 = psd_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = psd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001CDC4();
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v6 = self->_timeoutTimers;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timeoutTimers, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        [v11 invalidate];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->_timeoutTimers removeAllObjects];
}

- (void)_activityWasInterrupted:(id)a3
{
  id v4 = a3;
  [(PSDScheduler *)self _clearActivityTimer:v4];
  if ([(PSDScheduler *)self _shouldHandleCallbackForActivity:v4])
  {
    id v5 = [v4 activityInfo];
    BOOL v6 = [v5 label];

    id v7 = [(PSYSyncSession *)self->_syncSession activityForLabel:v6];
    id v28 = 0;
    unsigned __int8 v8 = +[PDRConnectivityStatus getDropoutCounter:&v28];
    BOOL v9 = 1;
    if (([v7 sawADropout] & 1) == 0 && (v8 & 1) == 0)
    {
      id v10 = [v7 startDropoutCount];
      BOOL v9 = v10 != v28;
    }
    id v11 = objc_alloc((Class)PSYSyncSessionActivity);
    long long v12 = [v7 activityInfo];
    [v7 activityProgress];
    double v14 = v13;
    long long v15 = [v7 error];
    LOBYTE(v27) = v9;
    id v16 = objc_msgSend(v11, "initWithActivityInfo:progress:error:state:finishedSending:interruptionCount:startDropoutCount:sawADropout:", v12, v15, 2, objc_msgSend(v7, "isFinishedSending"), (char *)objc_msgSend(v7, "interruptionCount") + 1, objc_msgSend(v7, "startDropoutCount"), v14, v27);

    [(PSDScheduler *)self _queue_updateSyncSessionActivity:v16];
    if ([(PSDScheduler *)self _canAttemptRetryForActivity:v4])
    {
      [(PSDScheduler *)self _startActivity:v4];
    }
    else
    {
      long long v17 = [v4 activityInfo];
      id v18 = [v17 label];

      id v19 = [(PSYSyncSession *)self->_syncSession activityForLabel:v18];
      id v20 = psd_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (v21)
      {
        long long v22 = psd_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10001CDF8((uint64_t)v4, v19, v22);
        }
      }
      id v23 = [v4 activityInfo];
      v24 = [v23 label];

      BOOL v25 = +[NSString stringWithFormat:@"Sync client %@ interrupted", v24];
      [(PSDScheduler *)self _takeStackshotSequenceWithLabel:v25];

      id v26 = +[NSError errorWithDomain:@"com.apple.pairedsync" code:42 userInfo:0];
      [(PSDScheduler *)self _finishActivity:v4 success:0 error:v26];
    }
  }
}

- (void)_activityDidTimeout:(id)a3
{
  id v4 = a3;
  [(PSDScheduler *)self _clearActivityTimer:v4];
  if ([(PSDScheduler *)self _shouldHandleCallbackForActivity:v4])
  {
    id v5 = [v4 activityInfo];
    BOOL v6 = [v5 label];

    id v7 = [(PSYSyncSession *)self->_syncSession activityForLabel:v6];
    id v18 = 0;
    unsigned __int8 v8 = +[PDRConnectivityStatus getDropoutCounter:&v18];
    id v9 = [v7 startDropoutCount];
    if (v9 != v18) {
      unsigned __int8 v8 = 1;
    }
    id v10 = psd_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      long long v12 = psd_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001CF0C();
      }
    }
    if ((v8 & 1) == 0)
    {
      double v13 = psd_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (v14)
      {
        long long v15 = psd_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10001CE98();
        }
      }
      id v16 = +[NSString stringWithFormat:@"Sync client %@ timed out", v6];
      [(PSDScheduler *)self _takeStackshotSequenceWithLabel:v16];
    }
    long long v17 = PSYErrorForCode();
    [(PSDScheduler *)self _finishActivity:v4 success:0 error:v17];
  }
}

- (void)_takeStackshotSequenceWithLabel:(id)a3
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 1;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015944;
  v13[3] = &unk_10002C7F0;
  id v4 = a3;
  id v14 = v4;
  long long v15 = v16;
  id v5 = objc_retainBlock(v13);
  ((void (*)(void))v5[2])();
  int v6 = 2;
  double v7 = 1.0;
  do
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000159C4;
    v11[3] = &unk_10002CCF8;
    id v10 = v5;
    id v12 = v10;
    dispatch_after(v8, (dispatch_queue_t)queue, v11);

    double v7 = v7 + 1.0;
    --v6;
  }
  while (v6);

  _Block_object_dispose(v16, 8);
}

- (void)_popATimeoutAlert:(unint64_t)a3
{
  alertQueue = self->_alertQueue;
  if (alertQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015A48;
    block[3] = &unk_10002C778;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)alertQueue, block);
  }
}

+ (BOOL)_isInternalInstall
{
  if (qword_100038500 != -1) {
    dispatch_once(&qword_100038500, &stru_10002CD18);
  }
  return byte_1000384F8;
}

+ (BOOL)_isSyncShameDisabled
{
  if (qword_100038508 != -1) {
    dispatch_once(&qword_100038508, &stru_10002CD38);
  }
  return byte_100038228;
}

- (void)_scheduleTimeoutForActivity:(id)a3
{
  id v4 = a3;
  [(PSDScheduler *)self _timeoutForActivity:v4];
  double v6 = v5;
  double v7 = psd_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = psd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 activityInfo];
      BOOL v11 = [v10 label];
      *(_DWORD *)buf = 138543618;
      id v19 = v11;
      __int16 v20 = 2048;
      double v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduling timeout for activity %{public}@ in %1.2f seconds", buf, 0x16u);
    }
  }
  id v12 = [v4 activityInfo];
  double v13 = [v12 label];
  id v14 = +[NSString stringWithFormat:@"com.apple.pairedsync.activity.%@", v13];

  id v15 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v14 serviceIdentifier:self target:"_activityTimeoutHandler:" selector:v4 userInfo:v6];
  [v15 setMinimumEarlyFireProportion:1.0];
  timeoutTimers = self->_timeoutTimers;
  long long v17 = +[NSValue valueWithPointer:v4];
  [(NSMutableDictionary *)timeoutTimers setObject:v15 forKeyedSubscript:v17];

  [v15 scheduleInQueue:self->_queue];
}

- (void)_activityTimeoutHandler:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    double v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [v4 activityInfo];
      id v9 = [v8 label];
      int v10 = 138543362;
      BOOL v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ timed out", (uint8_t *)&v10, 0xCu);
    }
  }
  [(PSDScheduler *)self _activityDidTimeout:v4];
}

- (BOOL)_shouldHandleCallbackForActivity:(id)a3
{
  if (a3) {
    return -[NSMutableArray containsObject:](self->_runningActivityQueue, "containsObject:");
  }
  else {
    return 0;
  }
}

- (double)_timeoutForActivity:(id)a3
{
  id v4 = [a3 activityInfo];
  double v5 = [v4 timeoutSeconds];

  [v5 doubleValue];
  if (v6 <= 0.0
    || ([v5 doubleValue], v7 > self->_syncTopicTimeout)
    || ([v5 doubleValue], double syncTopicTimeout = v8, v8 == 0.0))
  {
    int v10 = +[NSUserDefaults standardUserDefaults];
    [v10 synchronize];

    BOOL v11 = +[NSUserDefaults standardUserDefaults];
    id v12 = [v11 persistentDomainForName:@"com.apple.pairedsync"];

    double v13 = [v12 objectForKey:@"activityTimeout"];
    [v13 doubleValue];
    double syncTopicTimeout = v14;
  }
  if (syncTopicTimeout == 0.0) {
    double syncTopicTimeout = self->_syncTopicTimeout;
  }

  return syncTopicTimeout;
}

- (BOOL)_canAttemptRetryForActivity:(id)a3
{
  id v4 = a3;
  double v5 = [v4 activityInfo];
  double v6 = [v5 label];

  double v7 = [(PSYSyncSession *)self->_syncSession activityForLabel:v6];
  id v8 = [v7 interruptionCount];
  unint64_t v9 = [(PSDScheduler *)self _maximumInterruptionCountForActivity:v4];

  return (unint64_t)v8 < v9;
}

- (unint64_t)_maximumInterruptionCountForActivity:(id)a3
{
  return 3;
}

- (id)_syncOptionsForActivity:(id)a3
{
  id v4 = objc_alloc_init((Class)PSYSyncOptions);
  objc_msgSend(v4, "setDryRun:", -[PSDScheduler shouldLaunchAsDryRun](self, "shouldLaunchAsDryRun"));
  double v5 = [(PSDScheduler *)self testInputsEnumerator];
  double v6 = [v5 nextObject];

  [v4 setTestInput:v6];
  double v7 = [(PSYSyncSession *)self->_syncSession pairingIdentifier];
  [v4 setPairingIdentifier:v7];

  id v8 = [(PSYSyncSession *)self->_syncSession sessionIdentifier];
  [v4 setSessionIdentifier:v8];

  objc_msgSend(v4, "setSyncSessionType:", -[PSYSyncSession syncSessionType](self->_syncSession, "syncSessionType"));

  return v4;
}

- (void)_scheduledActivitiesDidComplete
{
  syncSession = self->_syncSession;
  id v4 = psd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (syncSession)
  {
    if (v5)
    {
      double v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "All scheduled activities completed", buf, 2u);
      }
    }
    double v7 = [(PSDScheduler *)self monitoredPairing];

    if (v7)
    {
      id v8 = +[PSYRegistrySingleton registry];
      [v8 removeDelegate:self];

      [(PSDScheduler *)self setMonitoredPairing:0];
    }
    [(PSDScheduler *)self _resetLinkMonitor];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    unint64_t v9 = [(PSYSyncSession *)self->_syncSession activities];
    id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v29;
      while (2)
      {
        double v13 = 0;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * (void)v13) sawADropout])
          {

            [(PSDScheduler *)self _popADropoutAlert:[(PSYSyncSession *)self->_syncSession syncSessionType]];
            goto LABEL_30;
          }
          double v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v14 = [(PSYSyncSession *)self->_syncSession activities];
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        id v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v18) error];
          id v20 = [v19 code];

          if (v20 == (id)2)
          {

            [(PSDScheduler *)self _popATimeoutAlert:[(PSYSyncSession *)self->_syncSession syncSessionType]];
            goto LABEL_30;
          }
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

LABEL_30:
    double v21 = [(PSYSyncSession *)self->_syncSession syncSessionByUpdatingSyncSessionState:2];
    [(PSDScheduler *)self _queue_updateWithSyncSession:v21];
    long long v22 = +[NSNotificationCenter defaultCenter];
    [v22 postNotificationName:@"PSDSchedulerDidCompleteNotification" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, PSYDeviceSyncDidCompleteDarwinNotification, 0, 0, 1u);
    [(PSDScheduler *)self _queue_cleanup];
  }
  else
  {
    if (!v5) {
      return;
    }
    double v21 = psd_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No active sync session. Skipping", buf, 2u);
    }
  }
}

- (void)_queue_cleanup
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->_runningActivityQueue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v7) setDelegate:0];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  runningActivityQueue = self->_runningActivityQueue;
  self->_runningActivityQueue = 0;

  [(PSDScheduler *)self setActivityQueue:0];
  unint64_t v9 = self->_syncSession;
  [(PSDScheduler *)self setSyncSession:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016858;
  v11[3] = &unk_10002C840;
  uint64_t v12 = v9;
  id v10 = v9;
  [(PSDScheduler *)self _queue_tellObserversDidClearSyncSession:v10 withBlock:v11];
}

- (void)cancelSyncSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001692C;
  block[3] = &unk_10002C840;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_queue_updateSyncSessionActivity:(id)a3
{
  syncSession = self->_syncSession;
  id v8 = a3;
  id v5 = a3;
  uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];
  double v7 = -[PSYSyncSession syncSessionByUpdatingActivities:](syncSession, "syncSessionByUpdatingActivities:", v6, v8);

  if (v7) {
    [(PSDScheduler *)self _queue_updateWithSyncSession:v7];
  }
}

- (void)_queue_updateWithSyncSession:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_syncSession] & 1) == 0)
  {
    id v4 = [objc_alloc((Class)PSYSyncSessionUpdate) initWithOriginalSession:self->_syncSession updatedSession:v5];
    [(PSDScheduler *)self setSyncSession:v5];
    [(PSDScheduler *)self _queue_tellObserversDidUpdateSyncSessionWithUpdate:v4];
  }
}

- (void)_currentProgressUpdated:(float)a3 forActivity:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  LODWORD(v8) = 1.0;
  if (a3 <= 1.0) {
    *(float *)&double v8 = a3;
  }
  if (a3 >= 0.0) {
    float v9 = *(float *)&v8;
  }
  else {
    float v9 = 0.0;
  }
  id v10 = objc_msgSend(v6, "activityInfo", 0.0, v8);
  id v11 = [v10 label];

  uint64_t v12 = [(PSYSyncSession *)self->_syncSession activityForLabel:v11];
  long long v13 = v12;
  if (v12)
  {
    [v12 activityProgress];
    if (v14 < v9)
    {
      long long v15 = objc_msgSend(v13, "syncSessionActivityByUpdatingProgress:");
      syncSession = self->_syncSession;
      id v19 = v15;
      uint64_t v17 = +[NSArray arrayWithObjects:&v19 count:1];
      id v18 = [(PSYSyncSession *)syncSession syncSessionByUpdatingActivities:v17];

      [(PSDScheduler *)self _queue_updateWithSyncSession:v18];
    }
  }
}

- (void)activityDidCompleteSending:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016D18;
  v7[3] = &unk_10002C8B8;
  id v8 = v4;
  float v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)activity:(id)a3 didUpdateProgress:(float)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016FBC;
  block[3] = &unk_10002CD60;
  float v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (BOOL)shouldLaunchAsDryRun
{
  v2 = [(PSDScheduler *)self options];
  unsigned __int8 v3 = [v2 dryRun];

  return v3;
}

- (void)_queue_enumerateSchedulerObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_schedulerObservers;
  id v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      float v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[NSMapTable objectForKey:](self->_schedulerObservers, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        v4[2](v4, v10);

        float v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_queue_tellObserversWillStartSyncSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000171B8;
  v3[3] = &unk_10002CD88;
  v3[4] = self;
  [(PSDScheduler *)self _queue_enumerateSchedulerObserversWithBlock:v3];
}

- (void)_queue_tellObserversDidUpdateSyncSessionWithUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017268;
  v6[3] = &unk_10002CDB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PSDScheduler *)self _queue_enumerateSchedulerObserversWithBlock:v6];
}

- (void)_queue_tellObserversDidClearSyncSession:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  unsigned int v18 = 0;
  unsigned int v18 = [(NSMapTable *)self->_schedulerObservers count];
  if (*((_DWORD *)v16 + 6))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100017404;
    v12[3] = &unk_10002CE00;
    v14[1] = &v15;
    v14[0] = v7;
    v12[4] = self;
    id v13 = v6;
    [(PSDScheduler *)self _queue_enumerateSchedulerObserversWithBlock:v12];
    uint64_t v8 = (id *)v14;
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000175A4;
    block[3] = &unk_10002CCF8;
    uint64_t v8 = &v11;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  _Block_object_dispose(&v15, 8);
}

- (int64_t)_maxSupportedActivitiesForCurrentLink
{
  int64_t currentNRLinkType = self->_currentNRLinkType;
  if (currentNRLinkType == 3 || currentNRLinkType == 2)
  {
    if (self->_buddyPastAppleID) {
      return 6;
    }
    else {
      return 4;
    }
  }
  else if (self->_buddyPastAppleID)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  float v9 = psd_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = psd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Buddy Registry changed", buf, 2u);
    }
  }
  long long v12 = [v7 pairingID];
  id v13 = [(PSDScheduler *)self monitoredPairing];
  if (![v12 isEqual:v13])
  {

    goto LABEL_9;
  }
  unsigned int v14 = [v8 containsObject:PDRDevicePropertyKeyWatchBuddyStage];

  if (v14)
  {
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001776C;
    v16[3] = &unk_10002C8B8;
    id v17 = v7;
    unsigned int v18 = self;
    dispatch_async((dispatch_queue_t)queue, v16);
    long long v12 = v17;
LABEL_9:
  }
}

- (void)linkChangedToLinkType:(int64_t)a3
{
  if (self->_currentNRLinkType != a3)
  {
    self->_int64_t currentNRLinkType = a3;
    id v4 = psd_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int64_t currentNRLinkType = self->_currentNRLinkType;
        int v8 = 134217984;
        int64_t v9 = currentNRLinkType;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "link changed to %lu", (uint8_t *)&v8, 0xCu);
      }
    }
    [(PSDScheduler *)self _scheduleNextActivityIfPossible];
  }
}

- (void)setSyncSession:(id)a3
{
}

- (NSMapTable)schedulerObservers
{
  return self->_schedulerObservers;
}

- (void)setSchedulerObservers:(id)a3
{
}

- (NSMutableArray)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (NSMutableArray)runningActivityQueue
{
  return self->_runningActivityQueue;
}

- (void)setRunningActivityQueue:(id)a3
{
}

- (PSYOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSEnumerator)testInputsEnumerator
{
  return self->_testInputsEnumerator;
}

- (void)setTestInputsEnumerator:(id)a3
{
}

- (NSMutableDictionary)timeoutTimers
{
  return self->_timeoutTimers;
}

- (void)setTimeoutTimers:(id)a3
{
}

- (double)syncTopicTimeout
{
  return self->_syncTopicTimeout;
}

- (void)setSyncTopicTimeout:(double)a3
{
  self->_double syncTopicTimeout = a3;
}

- (BOOL)completedNanoPreferencesSync
{
  return self->_completedNanoPreferencesSync;
}

- (void)setCompletedNanoPreferencesSync:(BOOL)a3
{
  self->_BOOL completedNanoPreferencesSync = a3;
}

- (int64_t)maxSupportedParallelActivitiesPreferenceValue
{
  return self->_maxSupportedParallelActivitiesPreferenceValue;
}

- (void)setMaxSupportedParallelActivitiesPreferenceValue:(int64_t)a3
{
  self->_int64_t maxSupportedParallelActivitiesPreferenceValue = a3;
}

- (int64_t)currentNRLinkType
{
  return self->_currentNRLinkType;
}

- (void)setCurrentNRLinkType:(int64_t)a3
{
  self->_int64_t currentNRLinkType = a3;
}

- (unsigned)effectiveCompletedBuddyStages
{
  return self->_effectiveCompletedBuddyStages;
}

- (void)setEffectiveCompletedBuddyStages:(unsigned int)a3
{
  self->_effectiveCompletedBuddyStages = a3;
}

- (BOOL)buddyPastAppleID
{
  return self->_buddyPastAppleID;
}

- (void)setBuddyPastAppleID:(BOOL)a3
{
  self->_buddyPastAppleID = a3;
}

- (BOOL)buddyPastActivation
{
  return self->_buddyPastActivation;
}

- (void)setBuddyPastActivation:(BOOL)a3
{
  self->_buddyPastActivation = a3;
}

- (BOOL)buddyPastInstallAllAppsSelection
{
  return self->_buddyPastInstallAllAppsSelection;
}

- (void)setBuddyPastInstallAllAppsSelection:(BOOL)a3
{
  self->_buddyPastInstallAllAppsSelection = a3;
}

- (BOOL)buddyPastApplePay
{
  return self->_buddyPastApplePay;
}

- (void)setBuddyPastApplePay:(BOOL)a3
{
  self->_buddyPastApplePay = a3;
}

- (NSUUID)monitoredPairing
{
  return self->_monitoredPairing;
}

- (void)setMonitoredPairing:(id)a3
{
}

- (PSYLinkUpgradeMonitor)linkUpgradeMonitor
{
  return self->_linkUpgradeMonitor;
}

- (void)setLinkUpgradeMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkUpgradeMonitor, 0);
  objc_storeStrong((id *)&self->_monitoredPairing, 0);
  objc_storeStrong((id *)&self->_timeoutTimers, 0);
  objc_storeStrong((id *)&self->_testInputsEnumerator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_runningActivityQueue, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_schedulerObservers, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_syncSession, 0);
}

@end