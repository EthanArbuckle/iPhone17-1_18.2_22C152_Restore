@interface MBBackupScheduler
+ (BOOL)backupOnWiFiWithDAS;
+ (BOOL)isBackupDisabledByMCPolicy;
+ (MBBackupScheduler)sharedInstance;
+ (id)lastOnConditionEventsForAccount:(id)a3;
+ (void)postBackupCompletionNotificationWithAccount:(id)a3 completionError:(id)a4;
+ (void)setLastOnConditionEvents:(id)a3 account:(id)a4;
- ($3C5213C2FB734B7CA09EF95E8A7A7A2F)conditions;
- (BOOL)_backupOnBatteryAllowed;
- (BOOL)_fetchNextBackupDateAcrossAccountsOnWifi:(id *)a3 cellular:(id *)a4 battery:(id *)a5 error:(id *)a6;
- (BOOL)_fetchNextBackupDateOnWiFi:(id *)a3 nextBackupDateOnCellular:(id *)a4 nextBackupDateOnBattery:(id *)a5 lastBackupDate:(id *)a6 account:(id)a7 connection:(id)a8 error:(id *)a9;
- (BOOL)_isBackupAllowed;
- (BOOL)_isBackupOnCellularAllowedForAccount:(id)a3;
- (BOOL)_shouldStartBackupWithAccount:(id)a3 reason:(int64_t)a4;
- (BOOL)_startBackupForNextAvailableAccountWithRequest:(id)a3;
- (BOOL)_startBackupRequestForActivity:(int)a3;
- (BOOL)allowBackupOnExpensiveCellular;
- (BOOL)isAutoBackupOnCellularAllowed;
- (BOOL)isBackupOnCellularEnabled;
- (BOOL)isEnabled;
- (BOOL)isLocked;
- (BOOL)isOnCellular;
- (BOOL)isOnExpensiveCellular;
- (BOOL)isOnPower;
- (BOOL)isOnWiFi;
- (MBAutomaticBackupRequest)initiatedBackupRequest;
- (MBBackupScheduler)initWithServiceManager:(id)a3;
- (MBNetworkPathMonitor)networkPathMonitor;
- (MBXPCActivityCoordinator)activityCoordinator;
- (NSArray)accounts;
- (NSDate)dateOfLastUnlockSeenByDaemon;
- (NSDate)lastOnConditionDate;
- (NSDate)scheduledDateOnWiFi;
- (NSMutableArray)accountsToBackup;
- (NSMutableDictionary)nextBackupDatesByActivityType;
- (NSMutableDictionary)osTransactionsByActivityType;
- (NSObject)backupObserver;
- (OS_dispatch_group)firstConditionsGroup;
- (OS_xpc_object)alarm;
- (double)backupPeriod;
- (id)_backoffDateForAccount:(id)a3 softCancelled:(BOOL)a4;
- (id)_conditionLossTimerWithSeconds:(int64_t)a3 changes:(id)a4;
- (id)_dateOfLastBackupFromCloudWithConnection:(id)a3 account:(id)a4 error:(id *)a5;
- (id)_dateOfLastBackupFromLockdown;
- (id)_descriptionForTTR:(id)a3 account:(id)a4;
- (id)_fetchAccountsAndIsEnabled:(BOOL *)a3 isBackupOnCellularEnabled:(BOOL *)a4;
- (id)_lastSnapshotFromCacheWithAccount:(id)a3;
- (id)_nilBackupDateFetchDateForAccount:(id)a3;
- (id)_onBatteryRetryAfterDateForAccount:(id)a3;
- (id)_retryAfterDateForAccount:(id)a3;
- (id)dateOfLastBackupWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)dateOfNextScheduledBackupWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)internalNotificationRef;
- (int64_t)_determineInternalNotificationActionForErrors:(id)a3 dateOfLastUnlock:(id)a4;
- (int64_t)_scheduleBackupOnWiFi:(BOOL)a3 onCellular:(BOOL)a4 onBattery:(BOOL)a5;
- (int64_t)ignoredLastOnConditionEvent;
- (int64_t)nextBackupDelta;
- (unint64_t)_lastPendingSnapshotSizeForAccount:(id)a3;
- (unint64_t)lastOnConditionChargingType;
- (void)_cancelAlarm;
- (void)_cancelBackupWithActivityType:(int)a3 changes:(id)a4;
- (void)_cancelInitiatedBackupWithChanges:(id)a3 isDeferred:(BOOL)a4;
- (void)_cancelInternalNotification;
- (void)_cancelLossTimers;
- (void)_cancelPowerLossTimer;
- (void)_cancelWiFiLossTimer;
- (void)_checkinXPCActivities;
- (void)_clearAllFailureCountsForAccount:(id)a3;
- (void)_clearAllRetryAfterDatesForAccount:(id)a3;
- (void)_clearFailureCountWithKey:(id)a3 account:(id)a4;
- (void)_clearLastPendingSnapshotSizeForAccount:(id)a3;
- (void)_clearRetryAfterDateWithKey:(id)a3 account:(id)a4;
- (void)_handleAlarm;
- (void)_holdWorkAssertion;
- (void)_installMonitors;
- (void)_managerDidFailBackupWithAccount:(id)a3 error:(id)a4;
- (void)_managerDidFinishBackupWithAccount:(id)a3;
- (void)_notifyStateChanged:(id)a3 conditions:(id)a4;
- (void)_onQueue_warnUserOfDelayedRestoreWithAccount:(id)a3;
- (void)_onQueue_warnUserOfLateBackupWithAccount:(id)a3;
- (void)_refreshRetryAfterDateForAccount:(id)a3 softCancelled:(BOOL)a4;
- (void)_registerAlarmHandler;
- (void)_releaseWorkAssertion;
- (void)_scheduleNextBackup;
- (void)_stateDidChange:(id)a3 conditions:(id)a4;
- (void)_tearDownScheduledBackupWithActivityType:(int)a3;
- (void)_triggerInternalNotificationWithAccount:(id)a3;
- (void)_updateFailureCountsForAccount:(id)a3 lastBackupError:(id)a4 canceled:(BOOL)a5 lowCellularBudget:(BOOL)a6;
- (void)_updateNilBackupDateFetchDate:(id)a3 account:(id)a4;
- (void)_updateRetryAfterDate:(id)a3 forKey:(id)a4 account:(id)a5;
- (void)_updateRetryAfterDate:(id)a3 forKey:(id)a4 account:(id)a5 ignoreExistingDate:(BOOL)a6;
- (void)_updateRetryAfterDateAfterUnlockForAccount:(id)a3;
- (void)_warnUserOfLateBackupWithAccount:(id)a3;
- (void)accountChanged;
- (void)backupActivityIsRunnable:(int)a3;
- (void)clearNilBackupDateFetchDateForAccount:(id)a3;
- (void)dealloc;
- (void)setAccounts:(id)a3;
- (void)setAccountsToBackup:(id)a3;
- (void)setActivityCoordinator:(id)a3;
- (void)setAlarm:(id)a3;
- (void)setAllowBackupOnExpensiveCellular:(BOOL)a3;
- (void)setBackupObserver:(id)a3;
- (void)setBackupPeriod:(double)a3;
- (void)setDateOfLastUnlockSeenByDaemon:(id)a3;
- (void)setFirstConditionsGroup:(id)a3;
- (void)setIgnoredLastOnConditionEvent:(int64_t)a3;
- (void)setInitiatedBackupRequest:(id)a3;
- (void)setInternalNotificationRef:(id)a3;
- (void)setIsAutoBackupOnCellularAllowed:(BOOL)a3;
- (void)setIsBackupOnCellularEnabled:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsOnCellular:(BOOL)a3;
- (void)setIsOnExpensiveCellular:(BOOL)a3;
- (void)setIsOnPower:(BOOL)a3;
- (void)setIsOnWiFi:(BOOL)a3;
- (void)setLastOnConditionChargingType:(unint64_t)a3;
- (void)setLastOnConditionDate:(id)a3;
- (void)setNetworkPathMonitor:(id)a3;
- (void)setNextBackupDatesByActivityType:(id)a3;
- (void)setNextBackupDelta:(int64_t)a3;
- (void)setOsTransactionsByActivityType:(id)a3;
- (void)setScheduledDateOnWiFi:(id)a3;
- (void)warnUserOfDelayedRestoreWithAccount:(id)a3;
@end

@implementation MBBackupScheduler

+ (MBBackupScheduler)sharedInstance
{
  +[MBCKManager sharedInstance];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021EEDC;
  block[3] = &unk_100411128;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = qword_100482728;
  id v3 = v7;
  if (v2 != -1) {
    dispatch_once(&qword_100482728, block);
  }
  v4 = (MBBackupScheduler *)(id)qword_100482720;

  return v4;
}

- (MBBackupScheduler)initWithServiceManager:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBBackupScheduler initWithServiceManager:]", "MBBackupScheduler.m", 238, "serviceManager");
  }
  v6 = v5;
  v47.receiver = self;
  v47.super_class = (Class)MBBackupScheduler;
  id v7 = [(MBBackupScheduler *)&v47 init];
  if (v7)
  {
    time_t v8 = time(0);
    srand48(v8);
    atomic_store(0, (unsigned int *)v7 + 22);
    *((void *)v7 + 13) = -1;
    *((_DWORD *)v7 + 28) = -1;
    objc_storeStrong((id *)v7 + 1, a3);
    dispatch_group_t v9 = dispatch_group_create();
    [v7 setFirstConditionsGroup:v9];

    v10 = [v7 firstConditionsGroup];
    dispatch_group_enter(v10);

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.backupd.followup", v12);
    v14 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v13;

    v15 = dispatch_queue_attr_make_initially_inactive(v12);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.backupd.scheduler", v15);
    v17 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v16;

    uint64_t v18 = objc_opt_new();
    v19 = (void *)*((void *)v7 + 19);
    *((void *)v7 + 19) = v18;

    uint64_t v20 = objc_opt_new();
    v21 = (void *)*((void *)v7 + 20);
    *((void *)v7 + 20) = v20;

    v22 = *((void *)v7 + 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021F404;
    block[3] = &unk_100411128;
    v23 = v7;
    id v46 = v23;
    dispatch_async(v22, block);
    v24 = [v6 account];
    v25 = [v24 persona];

    char v44 = 0;
    unsigned int v26 = [v25 getBooleanValueForKey:@"AllowBackupOnExpensiveCellular" keyExists:&v44];
    if (v44)
    {
      v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v49 = @"AllowBackupOnExpensiveCellular";
        __int16 v50 = 1024;
        unsigned int v51 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scheduler= %{public}@:%d", buf, 0x12u);
        CFStringRef v38 = @"AllowBackupOnExpensiveCellular";
        uint64_t v39 = v26;
        _MBLog();
      }
    }
    objc_msgSend(v23, "setAllowBackupOnExpensiveCellular:", v26 != 0, v38, v39);
    char v44 = 0;
    if ([v25 getBooleanValueForKey:@"IgnorePowerState" keyExists:&v44]) {
      BOOL v28 = v44 == 0;
    }
    else {
      BOOL v28 = 1;
    }
    char v29 = !v28;
    v23[101] = v23[101] & 0xFE | v29;
    [v23 _checkinXPCActivities];
    v30 = *((void *)v7 + 2);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10021F4B0;
    v42[3] = &unk_100411128;
    v31 = v23;
    id v43 = v31;
    dispatch_async(v30, v42);
    v32 = objc_opt_new();
    [v32 setName:@"com.apple.backupd.scheduler"];
    [v32 setUnderlyingQueue:*((void *)v7 + 2)];
    objc_initWeak((id *)buf, v31);
    v33 = +[NSNotificationCenter defaultCenter];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10021F4EC;
    v40[3] = &unk_100414720;
    objc_copyWeak(&v41, (id *)buf);
    uint64_t v34 = [v33 addObserverForName:@"com.apple.backup.scheduler.backupFinished" object:0 queue:v32 usingBlock:v40];
    v35 = (void *)v31[30];
    v31[30] = v34;

    v36 = (void *)v31[32];
    v31[32] = 0;

    dispatch_activate(*((dispatch_object_t *)v7 + 2));
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
  return (MBBackupScheduler *)v7;
}

- (void)dealloc
{
  if (self->_backupObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_backupObserver];
  }
  v4 = [(MBBackupScheduler *)self networkPathMonitor];
  [v4 cancel];

  [(MBBackupScheduler *)self _cancelLossTimers];
  int powerToken = self->_powerToken;
  if (powerToken != -1) {
    notify_cancel(powerToken);
  }
  int lockScreenToken = self->_lockScreenToken;
  if (lockScreenToken != -1) {
    notify_cancel(lockScreenToken);
  }
  int keyBagLockToken = self->_keyBagLockToken;
  if (keyBagLockToken != -1) {
    notify_cancel(keyBagLockToken);
  }
  v8.receiver = self;
  v8.super_class = (Class)MBBackupScheduler;
  [(MBBackupScheduler *)&v8 dealloc];
}

- (void)_installMonitors
{
  p_stateQueue = &self->_stateQueue;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10021FC60;
  v19[3] = &unk_1004167D0;
  objc_copyWeak(&v20, &location);
  v4 = objc_retainBlock(v19);
  notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &self->_keyBagLockToken, (dispatch_queue_t)*p_stateQueue, v4);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10021FCC4;
  v17[3] = &unk_1004167D0;
  objc_copyWeak(&v18, &location);
  id v5 = objc_retainBlock(v17);
  notify_register_dispatch(kSBSLockStateNotifyKey, &self->_lockScreenToken, (dispatch_queue_t)self->_stateQueue, v5);
  ((void (*)(void *, void))v5[2])(v5, self->_lockScreenToken);
  ((void (*)(void *, void))v4[2])(v4, self->_keyBagLockToken);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10021FE0C;
  v15[3] = &unk_1004167D0;
  objc_copyWeak(&v16, &location);
  v6 = objc_retainBlock(v15);
  p_int powerToken = &self->_powerToken;
  uint32_t v8 = notify_register_dispatch("com.apple.system.powersources.source", &self->_powerToken, (dispatch_queue_t)self->_stateQueue, v6);
  if (v8)
  {
    *p_int powerToken = -1;
    dispatch_group_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "com.apple.system.powersources.source";
      __int16 v24 = 1024;
      uint32_t v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=scheduler= notify_register_dispatch(%{public}s) failed: %u", buf, 0x12u);
      _MBLog();
    }
  }
  ((void (*)(void *, void))v6[2])(v6, *p_powerToken);
  id v10 = [objc_alloc((Class)MBNetworkPathMonitor) initWithQueue:self->_stateQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10021FF08;
  v13[3] = &unk_100416AE8;
  objc_copyWeak(&v14, &location);
  [v10 setBackupOnCellularSupportUpdateHandler:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10021FF5C;
  v11[3] = &unk_1004129E8;
  objc_copyWeak(&v12, &location);
  [v10 setNetworkPathUpdateHandler:v11];
  [(MBBackupScheduler *)self setNetworkPathMonitor:v10];
  [v10 start];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

+ (void)postBackupCompletionNotificationWithAccount:(id)a3 completionError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(17, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002200C8;
  v10[3] = &unk_1004110B0;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

+ (id)lastOnConditionEventsForAccount:(id)a3
{
  id v3 = [a3 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"LastOnConditionEvents" class:objc_opt_class()];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v10 = v5;
LABEL_11:

  return v10;
}

+ (void)setLastOnConditionEvents:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = [a4 persona];
  [v6 setPreferencesValue:v5 forKey:@"LastOnConditionEvents"];
}

- (void)_checkinXPCActivities
{
  id v3 = [[MBXPCActivityCoordinator alloc] initWithDelegate:self];
  v30 = [(MBXPCActivityCoordinator *)v3 checkInBackupActivity:1];
  xpc_object_t v4 = xpc_activity_copy_criteria(v30);
  id v5 = xpc_dictionary_get_value(v4, XPC_ACTIVITY_DELAY);
  id v6 = +[NSDate now];
  if (v5)
  {
    id v7 = [v6 dateByAddingTimeInterval:(double)xpc_int64_get_value(v5)];
    [(NSMutableDictionary *)self->_nextBackupDatesByActivityType setObject:v7 forKeyedSubscript:&off_10043A140];
  }
  BOOL v28 = [(MBXPCActivityCoordinator *)v3 checkInBackupActivity:2];
  xpc_object_t v8 = xpc_activity_copy_criteria(v28);

  id v9 = xpc_dictionary_get_value(v8, XPC_ACTIVITY_DELAY);

  if (v9)
  {
    id v10 = [v6 dateByAddingTimeInterval:(double)xpc_int64_get_value(v9)];
    [(NSMutableDictionary *)self->_nextBackupDatesByActivityType setObject:v10 forKeyedSubscript:&off_10043A158];
  }
  unsigned int v26 = [(MBXPCActivityCoordinator *)v3 checkInBackupActivity:3];
  xpc_object_t v11 = xpc_activity_copy_criteria(v26);

  v27 = v11;
  long long v12 = xpc_dictionary_get_value(v11, XPC_ACTIVITY_DELAY);

  if (v12)
  {
    long long v13 = [v6 dateByAddingTimeInterval:(double)xpc_int64_get_value(v12)];
    [(NSMutableDictionary *)self->_nextBackupDatesByActivityType setObject:v13 forKeyedSubscript:&off_10043A170];
  }
  uint32_t v25 = v12;
  char v29 = v6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v14 = self->_nextBackupDatesByActivityType;
  id v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = MBBackupXPCActivityNameWithType((int)[v19 intValue]);
          v22 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:v19];
          *(_DWORD *)buf = 136315394;
          v36 = v21;
          __int16 v37 = 2114;
          CFStringRef v38 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=scheduler= Found already scheduled backup for %s at %{public}@", buf, 0x16u);

          MBBackupXPCActivityNameWithType((int)[v19 intValue]);
          __int16 v24 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:v19];
          _MBLog();
        }
      }
      id v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v16);
  }

  activityCoordinator = self->_activityCoordinator;
  self->_activityCoordinator = v3;
}

- (BOOL)_backupOnBatteryAllowed
{
  _os_feature_enabled_impl();
  id v3 = [(MBServiceManager *)self->_serviceManager account];
  xpc_object_t v4 = [v3 persona];

  char v11 = 0;
  unsigned int v5 = [v4 getBooleanValueForKey:@"AllowBackupOnBattery" keyExists:&v11];
  if (v11) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  if (!v6)
  {
    unsigned int v8 = v5;
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v13 = @"AllowBackupOnBattery";
      __int16 v14 = 1024;
      unsigned int v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scheduler= %{public}@:%d", buf, 0x12u);
      _MBLog();
    }
  }
  return v7;
}

- (void)_updateFailureCountsForAccount:(id)a3 lastBackupError:(id)a4 canceled:(BOOL)a5 lowCellularBudget:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  long long v12 = [v10 persona];
  id v13 = [v12 copyPreferencesValueForKey:@"MissingEncryptionKeyFailureCount" class:objc_opt_class()];

  LODWORD(v12) = +[MBError isError:v11 withCode:209];
  if (v12)
  {
    __int16 v14 = (char *)[v13 unsignedIntegerValue];
    unsigned int v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v10 accountIdentifier];
      *(_DWORD *)buf = 138544130;
      CFStringRef v32 = @"MissingEncryptionKeyFailureCount";
      __int16 v33 = 2114;
      long long v34 = v16;
      __int16 v35 = 2048;
      v36 = v14 + 1;
      __int16 v37 = 2048;
      CFStringRef v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scheduler= Updating %{public}@ for account %{public}@: %lu(%lu)", buf, 0x2Au);

      char v29 = [v10 accountIdentifier];
      _MBLog();
    }
    uint64_t v17 = [v10 persona];
    id v18 = +[NSNumber numberWithUnsignedInteger:v14 + 1];
    [v17 setPreferencesValue:v18 forKey:@"MissingEncryptionKeyFailureCount"];
  }
  else
  {
    uint64_t v19 = 1;
    if (v13) {
      uint64_t v19 = 2;
    }
    if (!v7 || v6) {
      BOOL v20 = v19;
    }
    else {
      BOOL v20 = v13 != 0;
    }
    if (v20)
    {
      v21 = [v10 persona];
      id v22 = [v21 copyPreferencesValueForKey:@"FailureCount" class:objc_opt_class()];
      v23 = (char *)[v22 unsignedIntegerValue];

      __int16 v24 = &v23[v20];
      uint32_t v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v26 = [v10 accountIdentifier];
        *(_DWORD *)buf = 138544130;
        CFStringRef v32 = @"FailureCount";
        __int16 v33 = 2114;
        long long v34 = v26;
        __int16 v35 = 2048;
        v36 = v24;
        __int16 v37 = 2048;
        CFStringRef v38 = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=scheduler= Updating %{public}@ for account %{public}@: %lu(%lu)", buf, 0x2Au);

        v30 = [v10 accountIdentifier];
        _MBLog();
      }
      v27 = [v10 persona];
      BOOL v28 = +[NSNumber numberWithUnsignedInteger:v24];
      [v27 setPreferencesValue:v28 forKey:@"FailureCount"];
    }
    if (v13) {
      [(MBBackupScheduler *)self _clearFailureCountWithKey:@"MissingEncryptionKeyFailureCount" account:v10];
    }
  }
}

- (void)_clearFailureCountWithKey:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isEqualToString:@"FailureCount"] & 1) == 0
    && ([v5 isEqualToString:@"MissingEncryptionKeyFailureCount"] & 1) == 0)
  {
    __assert_rtn("-[MBBackupScheduler _clearFailureCountWithKey:account:]", "MBBackupScheduler.m", 528, "[key isEqualToString:kMBFailureCountKey] || [key isEqualToString:kMBMissingEncryptionKeyFailureCountKey]");
  }
  BOOL v7 = [v6 persona];
  id v8 = [v7 copyPreferencesValueForKey:v5 class:objc_opt_class()];

  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 accountIdentifier];
    *(_DWORD *)buf = 138543874;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scheduler= Clearing %{public}@ (%{public}@) for account %{public}@", buf, 0x20u);

    long long v12 = [v6 accountIdentifier];
    _MBLog();
  }
  id v11 = [v6 persona];
  [v11 setPreferencesValue:0 forKey:v5];
}

- (void)_clearAllFailureCountsForAccount:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [&off_10043B550 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(&off_10043B550);
        }
        [(MBBackupScheduler *)self _clearFailureCountWithKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) account:v4];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [&off_10043B550 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_backoffDateForAccount:(id)a3 softCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
  if (v4)
  {
    double v8 = 30.0;
    long long v9 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
    CFStringRef v10 = @"RetryAfter";
  }
  else
  {
    long long v11 = [v6 persona];
    id v12 = [v11 copyPreferencesValueForKey:@"MissingEncryptionKeyFailureCount" class:objc_opt_class()];

    if (v12)
    {
      id v13 = [v12 unsignedIntegerValue];
      if ((unint64_t)v13 <= 1) {
        unint64_t v14 = 1;
      }
      else {
        unint64_t v14 = (unint64_t)v13;
      }
      uint64_t v15 = 5;
      if (v14 < 5) {
        uint64_t v15 = v14;
      }
      double v16 = dbl_1003B3790[v15 - 1];
      __int16 v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)v30 = @"MissingEncryptionKeyFailureCount";
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = v14;
        *(_WORD *)&v30[18] = 2048;
        *(double *)&v30[20] = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "=scheduler= %{public}@, failureCount:%lu, backoff:%G", buf, 0x20u);
        _MBLog();
      }
      CFStringRef v10 = @"MissingEncryptionKeyRetryAfter";
    }
    else
    {
      id v18 = [v6 persona];
      id v19 = [v18 copyPreferencesValueForKey:@"FailureCount" class:objc_opt_class()];
      id v20 = [v19 unsignedIntegerValue];

      uint64_t v21 = 6;
      if ((unint64_t)v20 < 6) {
        uint64_t v21 = (uint64_t)v20;
      }
      double v16 = dbl_1003B37B8[v21];
      __int16 v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)v30 = @"FailureCount";
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = v20;
        *(_WORD *)&v30[18] = 2048;
        *(double *)&v30[20] = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "=scheduler= %{public}@, failureCount:%lu, backoff:%G", buf, 0x20u);
        _MBLog();
      }
      CFStringRef v10 = @"RetryAfter";
    }

    if (v16 <= 0.0) {
      __assert_rtn("-[MBBackupScheduler _backoffDateForAccount:softCancelled:]", "MBBackupScheduler.m", 585, "0.0 < backoff");
    }
    double v8 = v16 + (drand48() + -0.5) * floor(v16 * 0.25);
    long long v9 = +[NSDate dateWithTimeIntervalSinceNow:v8];
    id v22 = +[NSDate dateWithTimeIntervalSinceNow:fmax(v8, 1800.0)];
    [(MBBackupScheduler *)self _updateRetryAfterDate:v22 forKey:@"OnBatteryRetryAfter" account:v6];
  }
  if (!v9) {
    __assert_rtn("-[MBBackupScheduler _backoffDateForAccount:softCancelled:]", "MBBackupScheduler.m", 594, "backoffDate");
  }
  [v7 setObject:v9 forKeyedSubscript:v10];
  v23 = MBGetDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = MBStringWithDate();
    uint32_t v25 = [v6 accountIdentifier];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v30 = v4;
    *(_WORD *)&v30[4] = 2048;
    *(double *)&v30[6] = v8;
    *(_WORD *)&v30[14] = 2114;
    *(void *)&v30[16] = v24;
    *(_WORD *)&v30[24] = 2114;
    *(void *)&v30[26] = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "=scheduler= softCancelled:%d, backoff:%G, backoffDate:\"%{public}@\", account:%{public}@", buf, 0x26u);

    unsigned int v26 = MBStringWithDate();
    BOOL v28 = [v6 accountIdentifier];
    _MBLog();
  }
  if ([v7 count] != (id)1) {
    __assert_rtn("-[MBBackupScheduler _backoffDateForAccount:softCancelled:]", "MBBackupScheduler.m", 599, "result.count == 1");
  }

  return v7;
}

- (id)_retryAfterDateForAccount:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [&off_10043B568 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(&off_10043B568);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        CFStringRef v10 = [v3 persona];
        id v11 = [v10 copyPreferencesValueForKey:v9 class:objc_opt_class()];

        if (v11)
        {
          if (v6)
          {
            uint64_t v12 = [v11 laterDate:v6];

            id v6 = (id)v12;
          }
          else
          {
            id v6 = v11;
          }
        }
      }
      id v5 = [&off_10043B568 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  id v13 = +[NSDate dateWithTimeIntervalSinceNow:604800.0];
  unint64_t v14 = [v6 earlierDate:v13];

  return v14;
}

- (id)_onBatteryRetryAfterDateForAccount:(id)a3
{
  id v3 = [a3 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"OnBatteryRetryAfter" class:objc_opt_class()];

  id v5 = +[NSDate dateWithTimeIntervalSinceNow:604800.0];
  id v6 = [v4 earlierDate:v5];

  return v6;
}

- (void)_clearRetryAfterDateWithKey:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isEqualToString:@"RetryAfter"] & 1) == 0
    && ([v5 isEqualToString:@"MissingEncryptionKeyRetryAfter"] & 1) == 0
    && ([v5 isEqualToString:@"OnBatteryRetryAfter"] & 1) == 0)
  {
    __assert_rtn("-[MBBackupScheduler _clearRetryAfterDateWithKey:account:]", "MBBackupScheduler.m", 627, "[key isEqualToString:kMBRetryAfterKey] || [key isEqualToString:kMBMissingEncryptionKeyRetryAfterKey] || [key isEqualToString:kMBOnBatteryRetryAfterKey]");
  }
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    id v12 = v5;
    __int16 v13 = 2114;
    unint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=scheduler= Clearing %{public}@ for account %{public}@", buf, 0x16u);

    CFStringRef v10 = [v6 accountIdentifier];
    _MBLog();
  }
  uint64_t v9 = [v6 persona];
  [v9 setPreferencesValue:0 forKey:v5];
}

- (void)_clearAllRetryAfterDatesForAccount:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [&off_10043B580 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(&off_10043B580);
        }
        [(MBBackupScheduler *)self _clearRetryAfterDateWithKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) account:v4];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [&off_10043B580 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateRetryAfterDate:(id)a3 forKey:(id)a4 account:(id)a5 ignoreExistingDate:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v10 isEqualToString:@"RetryAfter"] & 1) == 0
    && ([v10 isEqualToString:@"OnBatteryRetryAfter"] & 1) == 0
    && ([v10 isEqualToString:@"MissingEncryptionKeyRetryAfter"] & 1) == 0)
  {
    __assert_rtn("-[MBBackupScheduler _updateRetryAfterDate:forKey:account:ignoreExistingDate:]", "MBBackupScheduler.m", 640, "[key isEqualToString:kMBRetryAfterKey] || [key isEqualToString:kMBOnBatteryRetryAfterKey] || [key isEqualToString:kMBMissingEncryptionKeyRetryAfterKey]");
  }
  long long v12 = [v11 persona];
  id v13 = [v12 copyPreferencesValueForKey:v10 class:objc_opt_class()];

  if (v6 || !v13)
  {
    id v14 = v9;
  }
  else
  {
    id v14 = [v9 laterDate:v13];
  }
  uint64_t v15 = v14;
  long long v16 = +[NSDate dateWithTimeIntervalSinceNow:604800.0];
  long long v17 = [v15 earlierDate:v16];

  long long v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    MBStringWithDate();
    v19 = id v26 = v9;
    id v20 = MBStringWithDate();
    uint64_t v21 = [v11 accountIdentifier];
    *(_DWORD *)buf = 138544386;
    id v28 = v10;
    __int16 v29 = 2114;
    v30 = v19;
    __int16 v31 = 2114;
    CFStringRef v32 = v20;
    __int16 v33 = 2114;
    long long v34 = v21;
    __int16 v35 = 1024;
    BOOL v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scheduler= Updating %{public}@ from \"%{public}@\" to \"%{public}@\" for account %{public}@ (%d)", buf, 0x30u);

    id v22 = MBStringWithDate();
    v23 = MBStringWithDate();
    uint32_t v25 = [v11 accountIdentifier];
    _MBLog();

    id v9 = v26;
  }

  __int16 v24 = [v11 persona];
  [v24 setPreferencesValue:v17 forKey:v10];
}

- (void)_updateRetryAfterDate:(id)a3 forKey:(id)a4 account:(id)a5
{
}

- (void)_refreshRetryAfterDateForAccount:(id)a3 softCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(MBBackupScheduler *)self _backoffDateForAccount:v6 softCancelled:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100221BC4;
  v9[3] = &unk_100416B10;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)_holdWorkAssertion
{
  if (!atomic_fetch_add(&self->_workAssertions, 1u))
  {
    id v2 = +[MBDaemon sharedDaemon];
    [v2 holdWorkAssertionWithClass:objc_opt_class()];
  }
}

- (void)_releaseWorkAssertion
{
  if (atomic_fetch_add(&self->_workAssertions, 0xFFFFFFFF) == 1)
  {
    id v2 = +[MBDaemon sharedDaemon];
    [v2 releaseWorkAssertionWithClass:objc_opt_class()];
  }
}

- (void)_cancelInitiatedBackupWithChanges:(id)a3 isDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = [(MBBackupScheduler *)self initiatedBackupRequest];
  id v8 = v7;
  if (v7 && ![v7 cancelled])
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v38 = v8;
      __int16 v39 = 2114;
      id v40 = v6;
      __int16 v41 = 1024;
      BOOL v42 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=scheduler= Canceling initiated backup %@, changes:%{public}@ isDeferred:%d", buf, 0x1Cu);
      id v23 = v6;
      BOOL v24 = v4;
      id v22 = v8;
      _MBLog();
    }

    [(MBBackupScheduler *)self _cancelLossTimers];
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = [(MBBackupScheduler *)self conditions];
    uint64_t v28 = (*(unint64_t *)&v11 >> 24) & 1;
    uint64_t v29 = HIBYTE(*(unint64_t *)&v11) & 1;
    uint64_t v33 = (*(unint64_t *)&v11 >> 40) & 1;
    uint64_t v34 = HIWORD(*(unint64_t *)&v11) & 1;
    uint64_t v26 = (*(unint64_t *)&v11 >> 16) & 1;
    uint64_t v27 = (*(unint64_t *)&v11 >> 8) & 1;
    if (v6)
    {
      id v9 = [v6 enabled];
      BOOL v36 = [v6 onPower];
      long long v12 = [v6 locked];
      id v13 = [v6 onWiFi];
      id v14 = [v6 onCellular];
      __int16 v31 = [v6 onExpensiveCellular];
      [v6 autoBackupOnCellularAllowed];
    }
    else
    {
      id v9 = +[NSNumber numberWithBool:v11.var0];
      BOOL v36 = +[NSNumber numberWithBool:(*(unint64_t *)&v11 >> 16) & 1];
      uint64_t v35 = +[NSNumber numberWithBool:(*(unint64_t *)&v11 >> 8) & 1];
      id v13 = +[NSNumber numberWithBool:(*(unint64_t *)&v11 >> 24) & 1];
      id v14 = +[NSNumber numberWithBool:v33];
      __int16 v31 = +[NSNumber numberWithBool:v34];
      long long v12 = (void *)v35;
      +[NSNumber numberWithBool:HIBYTE(*(unint64_t *)&v11) & 1];
    CFStringRef v32 = };
    if (v4) {
      uint64_t v15 = 223;
    }
    else {
      uint64_t v15 = 202;
    }
    BOOL var0 = v11.var0;
    uint32_t v25 = v14;
    if (v9 && ![v9 BOOLValue])
    {
      uint64_t v15 = 217;
    }
    else if (v36 && ![v36 BOOLValue])
    {
      uint64_t v15 = 219;
    }
    else if (v12 && ![v12 BOOLValue])
    {
      uint64_t v15 = 218;
    }
    else if (objc_msgSend(v8, "activityType", v22, v23, v24, v14) == 2 {
           && v13
    }
           && ![v13 BOOLValue])
    {
      uint64_t v15 = 220;
    }
    else if ([v8 activityType] == 1)
    {
      if (v14 && ![v14 BOOLValue])
      {
        uint64_t v15 = 221;
      }
      else if (v31 && ([v31 BOOLValue] & 1) != 0)
      {
        uint64_t v15 = 222;
      }
      else if (v32 && ![v32 BOOLValue])
      {
        uint64_t v15 = 224;
      }
    }
    long long v16 = MBBackupXPCActivityNameWithType((int)objc_msgSend(v8, "activityType", v22));
    long long v17 = +[MBEngine stringForEngineMode:1];
    long long v18 = +[MBError errorWithCode:v15, @"%@ cancelled (%s)", v17, v16 format];

    if ((+[MBError isCancelledError:v18] & 1) == 0) {
      __assert_rtn("-[MBBackupScheduler _cancelInitiatedBackupWithChanges:isDeferred:]", "MBBackupScheduler.m", 726, "[MBError isCancelledError:cancelError]");
    }
    [(MBCKManager *)self->_serviceManager cancelBackupEngineWithError:v18 connection:0];
    long long v19 = +[MBEngine stringForEngineType:3];
    id v20 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.MobileBackup", v19, @"scheduler.cancel"];

    uint64_t v21 = [[MBAnalyticsEvent alloc] initWithEventName:v20];
    [(MBAnalyticsEvent *)v21 setMetric:@"onPower" value:v26];
    [(MBAnalyticsEvent *)v21 setMetric:@"locked" value:v27];
    [(MBAnalyticsEvent *)v21 setMetric:@"onWiFi" value:v28];
    [(MBAnalyticsEvent *)v21 setMetric:@"onCellular" value:v33];
    [(MBAnalyticsEvent *)v21 setMetric:@"onExpensiveCellular" value:v34];
    [(MBAnalyticsEvent *)v21 setMetric:@"autoBackupOnCellularAllowed" value:v29];
    [(MBAnalyticsEvent *)v21 setMetric:@"enabled" value:var0];
    [(MBAnalyticsEvent *)v21 submit];
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=scheduler= Not cancelling initiated backup request %@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (BOOL)_shouldStartBackupWithAccount:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBBackupScheduler _shouldStartBackupWithAccount:reason:]", "MBBackupScheduler.m", 743, "account");
  }
  uint64_t v7 = v6;
  if ((unint64_t)(a4 - 4) >= 2 && a4 != 2) {
    __assert_rtn("-[MBBackupScheduler _shouldStartBackupWithAccount:reason:]", "MBBackupScheduler.m", 744, "reason == kMBBackupReasonScheduledOnWiFi || reason == kMBBackupReasonScheduledOnCellular || reason == kMBBackupReasonScheduledOnBattery");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if ([v7 isEnabled])
  {
    if (a4 != 4
      || [(MBBackupScheduler *)self _isBackupOnCellularAllowedForAccount:v7])
    {
      id v8 = +[NSDate now];
      id v36 = 0;
      id v37 = 0;
      id v34 = 0;
      id v35 = 0;
      id v33 = 0;
      unsigned __int8 v9 = [(MBBackupScheduler *)self _fetchNextBackupDateOnWiFi:&v37 nextBackupDateOnCellular:&v36 nextBackupDateOnBattery:&v35 lastBackupDate:&v34 account:v7 connection:0 error:&v33];
      id v10 = v37;
      id v11 = v36;
      id v12 = v35;
      id v13 = v34;
      id v14 = v33;
      if ((v9 & 1) == 0)
      {
        long long v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v39 = v14;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=scheduler= Failed to fetch the last&next backup date: %{public}@", buf, 0xCu);
          _MBLog();
        }
        goto LABEL_33;
      }
      if (v13)
      {
        [v8 timeIntervalSinceDate:v13];
        double v16 = v15;
        if (fabs(v15) < fmin(self->_backupPeriodOnWiFi, fmin(self->_backupPeriodOnCellular, self->_backupPeriodOnBattery)))
        {
          long long v18 = MBGetDefaultLog();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
LABEL_33:
            BOOL v29 = 0;
LABEL_36:

            goto LABEL_37;
          }
          v30 = MBStringWithDate();
          *(_DWORD *)buf = 134218242;
          __int16 v39 = *(NSObject **)&v16;
          __int16 v40 = 2114;
          __int16 v41 = v30;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scheduler= Already backed up recently (%.3fs): \"%{public}@\"", buf, 0x16u);

          uint64_t v21 = MBStringWithDate();
          _MBLog();
LABEL_32:

          goto LABEL_33;
        }
      }
      if (a4 == 2) {
        long long v17 = v10;
      }
      else {
        long long v17 = v11;
      }
      if (a4 != 2 && a4 != 4)
      {
        if (a4 != 5)
        {
          long long v18 = 0;
          goto LABEL_35;
        }
        long long v17 = v12;
      }
      long long v18 = v17;
      if (v18)
      {
        if ([v8 compare:v18] == (id)-1)
        {
          [v18 timeIntervalSinceDate:v8];
          double v20 = v19;
          if (v19 > 60.0)
          {
            uint64_t v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = MBStringWithDate();
              *(_DWORD *)buf = 134218242;
              __int16 v39 = *(NSObject **)&v20;
              __int16 v40 = 2114;
              __int16 v41 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=scheduler= The next backup date was pushed later (%.3fs): \"%{public}@\"", buf, 0x16u);

              CFStringRef v32 = MBStringWithDate();
              _MBLog();
            }
            goto LABEL_32;
          }
        }
      }
LABEL_35:
      BOOL v29 = 1;
      goto LABEL_36;
    }
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v7 accountIdentifier];
      uint64_t v27 = [v7 persona];
      uint64_t v28 = [v27 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      __int16 v39 = v26;
      __int16 v40 = 2112;
      __int16 v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=scheduler= Not starting automatic backup on cellular for account %@/%@ because it's disabled from remote configuration", buf, 0x16u);

      id v8 = [v7 accountIdentifier];
      id v10 = [v7 persona];
      id v11 = [v10 personaIdentifier];
      goto LABEL_28;
    }
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v7 accountIdentifier];
      BOOL v24 = [v7 persona];
      uint32_t v25 = [v24 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      __int16 v39 = v23;
      __int16 v40 = 2112;
      __int16 v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=scheduler= Ignoring backup start request since the account %@/%@ isn't enabled", buf, 0x16u);

      id v8 = [v7 accountIdentifier];
      id v10 = [v7 persona];
      id v11 = [v10 personaIdentifier];
LABEL_28:
      _MBLog();
      BOOL v29 = 0;
LABEL_37:

      goto LABEL_38;
    }
  }
  BOOL v29 = 0;
LABEL_38:

  return v29;
}

- (BOOL)_startBackupForNextAvailableAccountWithRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (![v4 activityType]) {
    __assert_rtn("-[MBBackupScheduler _startBackupForNextAvailableAccountWithRequest:]", "MBBackupScheduler.m", 803, "request.activityType != MBBackupXPCActivityTypeNone");
  }
  id v5 = [(MBBackupScheduler *)self accountsToBackup];

  if (!v5)
  {
    id v6 = [(MBBackupScheduler *)self accounts];
    id v7 = [v6 mutableCopy];
    [(MBBackupScheduler *)self setAccountsToBackup:v7];
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [(MBBackupScheduler *)self accountsToBackup];
    id v10 = [v9 count];
    id v11 = [(MBBackupScheduler *)self accountsToBackup];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=scheduler= Found %lu accounts to back up: %@", buf, 0x16u);

    id v12 = [(MBBackupScheduler *)self accountsToBackup];
    id v13 = [v12 count];
    [(MBBackupScheduler *)self accountsToBackup];
    v33 = id v32 = v13;
    _MBLog();
  }
  do
  {

    id v14 = [(MBBackupScheduler *)self accountsToBackup];
    id v15 = [v14 count];

    if (!v15) {
      goto LABEL_18;
    }
    double v16 = [(MBBackupScheduler *)self accountsToBackup];
    id v8 = [v16 popFirstObject];
  }
  while (!-[MBBackupScheduler _shouldStartBackupWithAccount:reason:](self, "_shouldStartBackupWithAccount:reason:", v8, [v4 reason]));
  if (v8)
  {
    if ([v4 reason] == (id)4)
    {
      unint64_t v17 = [(MBBackupScheduler *)self _lastPendingSnapshotSizeForAccount:v8];
      +[MBCKManager inexpensiveCellularBalance];
      double v19 = v18;
      double v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched the inexpensive cellular balance (start): %.2f, lastPendingSnapshotSize:%llu", buf, 0x16u);
        id v33 = (void *)v17;
        id v32 = v19;
        _MBLog();
      }
    }
    uint64_t v21 = [(MBBackupScheduler *)self activityCoordinator];
    id v22 = objc_msgSend(v21, "xpcActivityForBackupActivity:", objc_msgSend(v4, "activityType"));

    if (v22)
    {
      if (xpc_activity_should_defer((xpc_activity_t)v22))
      {
        id v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v24 = [v4 activityType];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v24;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=scheduler= Ignoring backup start request since the XPC activity (%d) needs to be deferred: %{public}@", buf, 0x12u);
          [v4 activityType];
          _MBLog();
        }

        BOOL v25 = 0;
LABEL_30:

        goto LABEL_21;
      }
    }
    else if (([(id)objc_opt_class() backupOnWiFiWithDAS] & 1) != 0 {
           || [v4 activityType] != 2)
    }
    {
      __assert_rtn("-[MBBackupScheduler _startBackupForNextAvailableAccountWithRequest:]", "MBBackupScheduler.m", 831, "xpcActivity || (![self.class backupOnWiFiWithDAS] && request.activityType == MBBackupXPCActivityTypeWiFi)");
    }
    uint64_t v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scheduler= Starting automatic backup for %@ ", buf, 0xCu);
      _MBLog();
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v40 = 0;
    uint64_t v28 = [v8 persona];
    BOOL v29 = [v28 personaIdentifier];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100222E68;
    v34[3] = &unk_100416B38;
    CFStringRef v38 = buf;
    v34[4] = self;
    id v35 = v4;
    id v36 = v22;
    v30 = v8;
    id v37 = v30;
    id v31 = +[DMCPersonaHelper performBlockUnderPersona:v29 block:v34];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      [(MBBackupScheduler *)self _refreshRetryAfterDateForAccount:v30 softCancelled:0];
      BOOL v25 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    }
    else
    {
      BOOL v25 = 0;
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
LABEL_18:
  -[MBBackupScheduler setAccountsToBackup:](self, "setAccountsToBackup:", 0, v32, v33);
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=scheduler= No accounts left to back up", buf, 2u);
    _MBLog();
  }
  BOOL v25 = 0;
LABEL_21:

  return v25;
}

+ (BOOL)isBackupDisabledByMCPolicy
{
  id v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = ([v2 isEphemeralMultiUser] & 1) != 0
    || [v2 effectiveBoolValueForSetting:MCFeatureCloudBackupAllowed] == 2;

  return v3;
}

- (int64_t)_determineInternalNotificationActionForErrors:(id)a3 dateOfLastUnlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSDate now];
  uint64_t v8 = (uint64_t)[v5 count];
  if (v8 < 1)
  {
    unsigned __int8 v9 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    int64_t v25 = 0;
LABEL_49:
    BOOL v29 = MBGetDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219011;
      uint64_t v37 = v23;
      __int16 v38 = 2048;
      uint64_t v39 = v24;
      __int16 v40 = 2048;
      uint64_t v41 = 5;
      __int16 v42 = 2113;
      id v43 = v6;
      __int16 v44 = 2048;
      int64_t v45 = v25;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "=scheduler= =ttr= Found %lu failures 1 day ago and %lu failures between 1 day and %lu days ago. dateOfLastUnlock:%{private}@ action:%ld", buf, 0x34u);
      _MBLog();
    }

    goto LABEL_52;
  }
  id v33 = v6;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  char v32 = 0;
  unsigned __int8 v9 = 0;
  uint64_t v10 = v8 + 1;
  double v11 = 0.0;
  while (1)
  {
    id v12 = [v5 objectAtIndexedSubscript:v10 - 2];
    id v13 = [v12 userInfo];
    id v14 = [v13 objectForKeyedSubscript:@"kMBErrorDateKey"];

    if (v14) {
      break;
    }
LABEL_10:

    if ((unint64_t)--v10 <= 1)
    {
      uint64_t v23 = v35;
      BOOL v26 = v11 <= 432000.0 || v35 <= 0;
      goto LABEL_36;
    }
  }
  [v7 timeIntervalSinceDate:v14];
  double v11 = v15;
  double v16 = [v12 userInfo];
  unint64_t v17 = [v16 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (v11 > 432000.0)
  {

    uint64_t v23 = v35;
    BOOL v26 = v35 <= 0;
LABEL_36:
    uint64_t v24 = v34;
    int v28 = !v26 && v34 > 3;
    if (v32)
    {
      if (v28)
      {
        int64_t v25 = 2;
LABEL_48:
        id v6 = v33;
        goto LABEL_49;
      }
    }
    else if (v28)
    {
      int64_t v25 = 1;
      goto LABEL_48;
    }
    int64_t v25 = 0;
    goto LABEL_48;
  }
  if (+[MBError isError:v12 withCode:0]) {
    goto LABEL_54;
  }
  if (+[MBError isError:withCodes:](MBError, "isError:withCodes:", v12, 17, 303, 308, 218, 219, 223, 300, 0) & 1) != 0|| +[MBError isCKError:withCode:](MBError, "isCKError:withCode:", v12, 25)|| +[MBError isError:withCode:](MBError, "isError:withCode:", v12, 202)&& ((+[MBError isError:withCode:](MBError, "isError:withCode:", v17, 218) & 1) != 0|| (+[MBError isError:withCode:](MBError, "isError:withCode:", v17, 219) & 1) != 0|| (+[MBError isError:withCode:](MBError, "isError:withCode:", v17, 222) & 1) != 0|| (+[MBError isError:v17 withCode:223]))
  {
    goto LABEL_8;
  }
  if (+[MBError isError:v12 withCode:209])
  {
    if (v33)
    {
      objc_msgSend(v14, "timeIntervalSinceDate:");
      if (v19 <= 0.0)
      {
        if (!v9 || ([v9 timeIntervalSinceDate:v14], v20 >= 28800.0))
        {
          id v31 = v7;
          id v18 = v14;
          goto LABEL_24;
        }
      }
    }
LABEL_8:
    id v18 = v9;
LABEL_9:

    unsigned __int8 v9 = v18;
    goto LABEL_10;
  }
  id v31 = v7;
  id v18 = 0;
LABEL_24:

  uint64_t v21 = v34;
  uint64_t v22 = v35;
  if (v11 > 86400.0) {
    uint64_t v21 = v34 + 1;
  }
  else {
    uint64_t v22 = v35 + 1;
  }
  uint64_t v34 = v21;
  uint64_t v35 = v22;
  if (!+[MBError isError:v12 withCode:203]) {
    goto LABEL_30;
  }
  if ((v22 + v21 == 1) | v32 & 1)
  {
    char v32 = 1;
LABEL_30:
    id v7 = v31;
    goto LABEL_9;
  }
  unsigned __int8 v9 = v18;
  id v7 = v31;
LABEL_54:

  int64_t v25 = 0;
  id v6 = v33;
LABEL_52:

  return v25;
}

- (void)_cancelInternalNotification
{
  if (MBIsInternalInstall())
  {
    BOOL v3 = [(MBBackupScheduler *)self internalNotificationRef];
    id v4 = v3;
    if (v3)
    {
      SInt32 v5 = CFUserNotificationCancel(v3);
      if (v5)
      {
        SInt32 v6 = v5;
        id v7 = MBGetDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          unsigned __int8 v9 = v4;
          __int16 v10 = 1024;
          SInt32 v11 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=scheduler= Failed to cancel internal notification %p (%d)", buf, 0x12u);
          _MBLog();
        }
      }
    }
  }
}

- (id)_descriptionForTTR:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = MBBuildVersion();
  uint64_t v22 = v6;
  unsigned __int8 v9 = [v6 dsid];
  [v7 appendFormat:@"Build Version %@ dsid %@\n", v8, v9];

  objc_msgSend(v7, "appendFormat:", @"Last %lld backup attempts:\n", 5);
  uint64_t v10 = (uint64_t)[v5 count];
  if (v10 >= 5) {
    uint64_t v11 = v10 - 5;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10 > v11)
  {
    uint64_t v12 = v10;
    do
    {
      id v13 = [v5 objectAtIndexedSubscript:--v12];
      id v14 = [v13 userInfo];
      double v15 = [v14 objectForKeyedSubscript:@"kMBErrorDateKey"];

      double v16 = [v13 domain];
      id v17 = [v13 code];
      id v18 = [v13 localizedDescription];
      [v7 appendFormat:@"date:%@ error:%@/%ld %@\n", v15, v16, v17, v18];
    }
    while (v12 > v11);
  }
  double v19 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  double v20 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v19];

  return v20;
}

- (void)_triggerInternalNotificationWithAccount:(id)a3
{
  id v4 = a3;
  if (MBIsInternalInstall())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_followUpQueue);
    id v5 = [(MBCKManager *)self->_serviceManager backupStateInfoForInitialMegaBackup:0 account:v4];
    id v6 = [v5 errors];
    id v7 = [(MBBackupScheduler *)self dateOfLastUnlockSeenByDaemon];
    int64_t v8 = [(MBBackupScheduler *)self _determineInternalNotificationActionForErrors:v6 dateOfLastUnlock:v7];

    if (v8)
    {
      unsigned __int8 v9 = +[NSDate now];
      uint64_t v10 = [v4 persona];
      id v11 = [v10 copyPreferencesValueForKey:@"AccountEnabledDate" class:objc_opt_class()];

      if (v11)
      {
        [v9 timeIntervalSinceDate:v11];
        if (v12 >= 432000.0)
        {
          id v13 = [v4 persona];
          id v14 = [v13 copyPreferencesValueForKey:@"UserNotificationEvents" class:objc_opt_class()];

          double v15 = [v14 objectForKeyedSubscript:@"LastTTRDateForConsecutiveBackupFailures"];
          if (!v15 || ([v9 timeIntervalSinceDate:v15], v16 >= 172800.0))
          {
            if (v14) {
              id v17 = [v14 mutableCopy];
            }
            else {
              id v17 = (id)objc_opt_new();
            }
            id v18 = v17;
            [v17 setObject:v9 forKeyedSubscript:@"LastTTRDateForConsecutiveBackupFailures"];
            double v19 = [v4 persona];
            [v19 setPreferencesValue:v18 forKey:@"UserNotificationEvents"];

            double v20 = [(MBBackupScheduler *)self internalNotificationRef];
            if (v20)
            {
              uint64_t v21 = MBGetDefaultLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v27 = v20;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "=scheduler= =ttr= Not posting internal notification, %p is in-flight", buf, 0xCu);
                _MBLog();
              }
            }
            else
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100223998;
              block[3] = &unk_100412888;
              void block[4] = self;
              int64_t v25 = v8;
              id v23 = v4;
              id v24 = v5;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
          }
        }
      }
    }
  }
}

- (BOOL)_isBackupAllowed
{
  unsigned int v2 = [(id)objc_opt_class() isBackupDisabledByMCPolicy];
  if (v2)
  {
    BOOL v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "=scheduler= Backup is disabled by the current MC policy - not checking for an overdue backup", v5, 2u);
      _MBLog();
    }
  }
  return v2 ^ 1;
}

- (void)_onQueue_warnUserOfLateBackupWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBBackupScheduler _onQueue_warnUserOfLateBackupWithAccount:]", "MBBackupScheduler.m", 1069, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_followUpQueue);
  if (![(MBCKManager *)self->_serviceManager isRestoringAccount:v5]
    && (BYSetupAssistantNeedsToRun() & 1) == 0
    && [(MBBackupScheduler *)self _isBackupAllowed])
  {
    id v6 = +[NSDate now];
    id v7 = +[MBCKManager restoreInfoForAccount:v5];
    int64_t v8 = [v7 date];

    unsigned __int8 v9 = +[NSFileManager defaultManager];
    id v72 = 0;
    uint64_t v10 = [v9 attributesOfItemAtPath:@"/private/var" error:&v72];
    id v11 = v72;

    v69 = v10;
    if (v10)
    {
      id v12 = [v10 objectForKeyedSubscript:NSFileCreationDate];
      id v13 = v8;
      if (v13)
      {
        id v14 = v13;
        if (v12)
        {
          [v13 laterDate:v12];
          uint64_t v16 = v15 = v12;

          id v14 = (id)v16;
          id v12 = v15;
          char v17 = 0;
          if (!v14) {
            goto LABEL_18;
          }
          goto LABEL_16;
        }
LABEL_14:
        char v17 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v76 = @"/private/var";
        __int16 v77 = 2112;
        id v78 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=scheduler= Failed to fetch the attributes for %{public}@: %@", buf, 0x16u);
        CFStringRef v59 = @"/private/var";
        v61 = v11;
        _MBLog();
      }

      id v19 = v8;
      id v12 = 0;
      if (v19)
      {
        id v14 = v19;
        goto LABEL_14;
      }
    }
    id v12 = v12;
    char v17 = 1;
    id v14 = v12;
    if (!v12)
    {
LABEL_18:
      v70 = v12;
      goto LABEL_19;
    }
LABEL_16:
    objc_msgSend(v6, "timeIntervalSinceDate:", v14, v59, v61);
    v70 = v12;
    if (v20 > 604800.0) {
      [(MBBackupScheduler *)self _triggerInternalNotificationWithAccount:v5];
    }
LABEL_19:
    id v71 = v11;
    uint64_t v21 = -[MBBackupScheduler dateOfLastBackupWithAccount:connection:error:](self, "dateOfLastBackupWithAccount:connection:error:", v5, 0, &v71, v59);
    id v22 = v71;

    if (!v21 && v22) {
      goto LABEL_51;
    }
    id v23 = v21;

    id v14 = v23;
    v68 = v6;
    if (!v21)
    {
      id v24 = v22;
      int64_t v25 = [v5 persona];
      id v26 = [v25 copyPreferencesValueForKey:@"AccountEnabledDate" class:objc_opt_class()];

      if (!v26)
      {
        id v6 = v68;
        id v22 = v24;
        if (![v5 isEnabled])
        {
          id v14 = 0;
          goto LABEL_51;
        }
        v48 = [v5 persona];
        [v48 setPreferencesValue:v68 forKey:@"AccountEnabledDate"];
        id v14 = 0;
        goto LABEL_50;
      }
      id v14 = v26;
      uint64_t v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        MBStringWithDate();
        int v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        CFStringRef v76 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "=scheduler= Using the account enabled date a reference, referenceDate:\"%{public}@\"", buf, 0xCu);

        MBStringWithDate();
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
        _MBLog();
      }
      id v6 = v68;
      id v22 = v24;
    }
    id v67 = v22;
    if ((v17 & 1) == 0)
    {
      BOOL v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        MBStringWithDate();
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v31 = MBStringWithDate();
        *(_DWORD *)buf = 138543618;
        CFStringRef v76 = v30;
        __int16 v77 = 2114;
        id v78 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "=scheduler= Using the foreground restore end date as a reference, fgRestoreEndDate:\"%{public}@\", referenceDate:\"%{public}@\"", buf, 0x16u);

        MBStringWithDate();
        char v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        MBStringWithDate();
        v61 = v60 = v32;
        _MBLog();

        id v6 = v68;
      }

      uint64_t v33 = [v14 laterDate:v8];

      id v14 = (id)v33;
      if (!v33) {
        __assert_rtn("-[MBBackupScheduler _onQueue_warnUserOfLateBackupWithAccount:]", "MBBackupScheduler.m", 1125, "referenceDate");
      }
    }
    if (v70)
    {
      uint64_t v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = MBStringWithDate();
        id v36 = MBStringWithDate();
        *(_DWORD *)buf = 138543874;
        CFStringRef v76 = @"/private/var";
        __int16 v77 = 2114;
        id v78 = v35;
        __int16 v79 = 2114;
        v80 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "=scheduler= Using the %{public}@ creation date as a reference, creationDate:\"%{public}@\", referenceDate:\"%{public}@\"", buf, 0x20u);

        uint64_t v37 = MBStringWithDate();
        MBStringWithDate();
        v62 = v61 = v37;
        v60 = @"/private/var";
        _MBLog();

        id v6 = v68;
      }

      uint64_t v38 = [v14 laterDate:v70];

      id v14 = (id)v38;
      if (!v38) {
        __assert_rtn("-[MBBackupScheduler _onQueue_warnUserOfLateBackupWithAccount:]", "MBBackupScheduler.m", 1131, "referenceDate");
      }
    }
    objc_msgSend(v6, "timeIntervalSinceDate:", v14, v60, v61, v62);
    double v40 = v39;
    uint64_t v41 = MBGetDefaultLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v42 = MBStringWithDate();
      id v43 = MBStringWithDate();
      *(_DWORD *)buf = 134218498;
      CFStringRef v76 = *(const __CFString **)&v40;
      __int16 v77 = 2114;
      id v78 = v42;
      __int16 v79 = 2114;
      v80 = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "=scheduler= drySpellDuration:%.3fs, referenceDate:\"%{public}@\", lastBackupDate:\"%{public}@\"", buf, 0x20u);

      __int16 v44 = MBStringWithDate();
      v63 = MBStringWithDate();
      _MBLog();

      id v6 = v68;
    }

    self->_double initialBackupWarningPeriod = sub_100224950(v5, @"InitialBackupPeriod", 604800.0, 1209600.0);
    double initialBackupWarningPeriod = sub_100224950(v5, @"BackupWarningPeriod", 604800.0, 1209600.0);
    self->_backupWarningPeriod = initialBackupWarningPeriod;
    if (!v21) {
      double initialBackupWarningPeriod = self->_initialBackupWarningPeriod;
    }
    if (v40 < initialBackupWarningPeriod)
    {
      id v22 = v67;
LABEL_51:

      goto LABEL_52;
    }
    id v46 = MBGetDefaultLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "=scheduler= Warning the user an iCloud backup is overdue", buf, 2u);
      _MBLog();
    }

    objc_super v47 = +[MBFollowUpManager sharedManager];
    v48 = [v47 postFollowUpForDrySpellForAccount:v5 duration:v21 == 0 firstBackup:v40];

    if (v48
      && ((MBIsInternalInstall() & 1) != 0
       || (+[MCProfileConnection sharedConnection],
           CFStringRef v49 = objc_claimAutoreleasedReturnValue(),
           unsigned int v50 = [v49 isDiagnosticSubmissionAllowed],
           v49,
           v50)))
    {
      v66 = v8;
      id v51 = objc_alloc((Class)NSMutableDictionary);
      v74[0] = v48;
      v73[0] = @"drySpellType";
      v73[1] = @"lastBackup";
      v65 = +[NSDateFormatter ISO8601Formatter];
      v64 = [v65 stringFromDate:v14];
      v74[1] = v64;
      v73[2] = @"duration";
      v52 = +[NSString stringWithFormat:@"%.3f", *(void *)&v40];
      v74[2] = v52;
      v73[3] = @"notified";
      v53 = +[NSDateFormatter ISO8601Formatter];
      v54 = [v53 stringFromDate:v68];
      v74[3] = v54;
      v55 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
      id v56 = [v51 initWithDictionary:v55];

      v57 = +[MBBackupScheduler lastOnConditionEventsForAccount:v5];
      if ([v57 count])
      {
        v58 = [v57 lastObject];
        [v56 setValue:v58 forKey:@"lastOnConditionEvent"];
      }
      +[MBCKStatusReporter reportStatusForAccount:v5 manager:self->_serviceManager key:@"BackupDrySpell" values:v56];

      id v6 = v68;
      int64_t v8 = v66;
    }
    else
    {
      id v6 = v68;
    }
    id v22 = v67;
LABEL_50:

    goto LABEL_51;
  }
LABEL_52:
}

- (void)_warnUserOfLateBackupWithAccount:(id)a3
{
  id v4 = a3;
  followUpQueue = self->_followUpQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100224CFC;
  v7[3] = &unk_1004110B0;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(followUpQueue, v7);
}

- (void)_onQueue_warnUserOfDelayedRestoreWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBBackupScheduler _onQueue_warnUserOfDelayedRestoreWithAccount:]", "MBBackupScheduler.m", 1181, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_followUpQueue);
  if (([v5 isEnabledForBackup] & 1) == 0)
  {
    id v7 = MBGetDefaultLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    id v22 = [v5 accountIdentifier];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=scheduler= The account %{public}@ is not enabled for backup", buf, 0xCu);

    id v8 = [v5 accountIdentifier];
    _MBLog();
LABEL_16:

    goto LABEL_17;
  }
  if ([(MBCKManager *)self->_serviceManager isBackgroundRestoringAccount:v5]
    && (BYSetupAssistantNeedsToRun() & 1) == 0
    && [(MBBackupScheduler *)self _isBackupAllowed])
  {
    id v6 = +[MBCKManager restoreInfoForAccount:v5];
    id v7 = [v6 date];

    if (v7)
    {
      id v8 = +[NSDate now];
      [v8 timeIntervalSinceDate:v7];
      uint64_t v10 = v9;
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = MBStringWithDate();
        *(_DWORD *)buf = 134218242;
        BOOL v29 = v10;
        __int16 v30 = 2114;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=scheduler= Warning the user an iCloud backup is overdue, drySpellDuration:%.3fs, fgRestoreEndDate:\"%{public}@\"", buf, 0x16u);

        id v24 = MBStringWithDate();
        id v23 = v10;
        _MBLog();
      }
      id v13 = +[MBFollowUpManager sharedManager];
      id v14 = [v13 postFollowUpForRestoreTimeoutForAccount:v5];

      if (v14)
      {
        if ((MBIsInternalInstall() & 1) != 0
          || (+[MCProfileConnection sharedConnection],
              id v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v15 isDiagnosticSubmissionAllowed],
              v15,
              v16))
        {
          v26[0] = @"drySpellType";
          v26[1] = @"restoring";
          v27[0] = v14;
          v27[1] = @"YES";
          v26[2] = @"fgRestoreEndDate";
          int64_t v25 = +[NSDateFormatter ISO8601Formatter];
          char v17 = [v25 stringFromDate:v7];
          v27[2] = v17;
          v26[3] = @"duration";
          id v18 = +[NSString stringWithFormat:@"%.3f", v10];
          v27[3] = v18;
          v26[4] = @"notified";
          id v19 = +[NSDateFormatter ISO8601Formatter];
          double v20 = [v19 stringFromDate:v8];
          v27[4] = v20;
          uint64_t v21 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];

          +[MBCKStatusReporter reportStatusForAccount:v5 manager:self->_serviceManager key:@"BackupDrySpell" values:v21];
        }
      }
    }
    else
    {
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=scheduler= nil foreground restore end date", buf, 2u);
        _MBLog();
      }
      id v7 = 0;
    }
    goto LABEL_16;
  }
LABEL_18:
}

- (void)warnUserOfDelayedRestoreWithAccount:(id)a3
{
  id v4 = a3;
  followUpQueue = self->_followUpQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100225270;
  v7[3] = &unk_1004110B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(followUpQueue, v7);
}

- (void)_managerDidFinishBackupWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBBackupScheduler _managerDidFinishBackupWithAccount:]", "MBBackupScheduler.m", 1230, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 accountIdentifier];
    *(_DWORD *)buf = 138543362;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "=scheduler= Scheduler received backup completion notification for account %{public}@", buf, 0xCu);

    id v11 = [v5 accountIdentifier];
    _MBLog();
  }
  [(MBBackupScheduler *)self _clearAllFailureCountsForAccount:v5];
  [(MBBackupScheduler *)self _clearAllRetryAfterDatesForAccount:v5];
  [(MBBackupScheduler *)self _clearLastPendingSnapshotSizeForAccount:v5];
  [(MBBackupScheduler *)self clearNilBackupDateFetchDateForAccount:v5];
  id v8 = +[MBFollowUpManager sharedManager];
  [v8 clearPendingFollowUpsWithAccount:v5 identifiers:&off_10043B598];

  unsigned __int8 v9 = [(MBBackupScheduler *)self initiatedBackupRequest];
  if (!v9
    || ![(MBBackupScheduler *)self _startBackupForNextAvailableAccountWithRequest:v9])
  {
    uint64_t v10 = [(MBBackupScheduler *)self activityCoordinator];
    objc_msgSend(v10, "finishBackupActivity:", objc_msgSend(v9, "activityType"));

    [(MBBackupScheduler *)self setInitiatedBackupRequest:0];
    [(MBBackupScheduler *)self _cancelInternalNotification];
    [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:2];
    [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:1];
    [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:3];
    [(MBBackupScheduler *)self _scheduleNextBackup];
    [(MBBackupScheduler *)self setAccountsToBackup:0];
  }
}

- (void)_managerDidFailBackupWithAccount:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBBackupScheduler _managerDidFailBackupWithAccount:error:]", "MBBackupScheduler.m", 1262, "account");
  }
  id v8 = v7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  unsigned __int8 v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    CFStringRef v37 = v10;
    __int16 v38 = 2112;
    *(void *)double v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scheduler= Scheduler received backup failure notification for account %{public}@: %@", buf, 0x16u);

    double v29 = [v6 accountIdentifier];
    __int16 v30 = v8;
    _MBLog();
  }
  id v11 = [(MBBackupScheduler *)self initiatedBackupRequest];
  id v12 = +[MBError isCancelledError:v8];
  if (v11
    && +[MBError isCancelledXPCActivityDeferredError:v8]&& ($3C5213C2FB734B7CA09EF95E8A7A7A2F v13 = [(MBBackupScheduler *)self conditions], (~*(void *)&v13 & 0x10000010101) == 0))
  {
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v14 = v13;
    +[MBCKManager inexpensiveCellularBalance];
    double v16 = v15;
    if (v15 <= 0.0) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = HIWORD(*(unint64_t *)&v14) & 1;
    }
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = (*(unint64_t *)&v14 & 0x1000000000000) >> 48;
      *(_DWORD *)buf = 134218496;
      CFStringRef v37 = *(const __CFString **)&v16;
      __int16 v38 = 1024;
      *(_DWORD *)double v39 = v17;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched the inexpensive cellular balance (deferred): %.2f, lowCellularBudget:%d, isOnExpensiveCellular:%d", buf, 0x18u);
      __int16 v30 = (void *)v17;
      unint64_t v32 = v19;
      double v29 = v16;
      _MBLog();
    }

    if (((v17 ^ 1 | v12) & 1) == 0) {
      __assert_rtn("-[MBBackupScheduler _managerDidFailBackupWithAccount:error:]", "MBBackupScheduler.m", 1282, "!lowCellularBudget || canceled");
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  -[MBBackupScheduler _updateFailureCountsForAccount:lastBackupError:canceled:lowCellularBudget:](self, "_updateFailureCountsForAccount:lastBackupError:canceled:lowCellularBudget:", v6, v8, v12, v17, *(void *)&v29, v30, v32);
  if (v12)
  {
    [(MBBackupScheduler *)self _clearAllRetryAfterDatesForAccount:v6];
    [(MBBackupScheduler *)self _refreshRetryAfterDateForAccount:v6 softCancelled:1];
  }
  id v35 = 0;
  unsigned int v20 = +[MBError isRetryAfterError:v8 retryAfterDate:&v35];
  id v21 = v35;
  id v22 = v21;
  if (!v20)
  {
    id v24 = v21;
    if (!v11) {
      goto LABEL_24;
    }
LABEL_23:
    followUpQueue = self->_followUpQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022596C;
    block[3] = &unk_1004110B0;
    void block[4] = self;
    id v34 = v6;
    dispatch_async(followUpQueue, block);

    int v28 = [(MBBackupScheduler *)self activityCoordinator];
    objc_msgSend(v28, "finishBackupActivity:", objc_msgSend(v11, "activityType"));

    [(MBBackupScheduler *)self setInitiatedBackupRequest:0];
    [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:2];
    [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:1];
    [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:3];
    [(MBBackupScheduler *)self _scheduleNextBackup];
    [(MBBackupScheduler *)self setAccountsToBackup:0];
    goto LABEL_24;
  }
  id v23 = +[NSDate dateWithTimeIntervalSinceNow:604800.0];
  id v24 = [v22 earlierDate:v23];

  int64_t v25 = MBGetDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [v6 accountIdentifier];
    *(_DWORD *)buf = 138543874;
    CFStringRef v37 = @"RetryAfter";
    __int16 v38 = 2114;
    *(void *)double v39 = v26;
    *(_WORD *)&v39[8] = 2114;
    double v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=scheduler= Updating %{public}@ based on server response for account %{public}@: %{public}@", buf, 0x20u);

    id v31 = [v6 accountIdentifier];
    _MBLog();
  }
  [(MBBackupScheduler *)self _updateRetryAfterDate:v24 forKey:@"RetryAfter" account:v6];

  if (v11) {
    goto LABEL_23;
  }
LABEL_24:
}

- (id)_fetchAccountsAndIsEnabled:(BOOL *)a3 isBackupOnCellularEnabled:(BOOL *)a4
{
  unsigned int v32 = [(id)objc_opt_class() isBackupDisabledByMCPolicy];
  if (v32)
  {
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "=scheduler= Backup is disabled by the current MC policy", buf, 2u);
      _MBLog();
    }
  }
  id v35 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = +[MBServiceAccount allServiceAccounts];
  id v5 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        unsigned int v12 = objc_msgSend(v11, "isEnabled", v27, v28, v29, v30, v31);
        char v37 = 0;
        $3C5213C2FB734B7CA09EF95E8A7A7A2F v13 = [v11 persona];
        unsigned int v14 = [v13 getBooleanValueForKey:@"EnableBackupScheduling" keyExists:&v37];

        if (v14) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v37 == 0;
        }
        if (!v15 || v12 == 0)
        {
          id v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v11;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=scheduler= Auto backup is not enabled for %@", buf, 0xCu);
            uint64_t v27 = v11;
            _MBLog();
          }
        }
        else
        {
          [v35 addObject:v11];
          uint64_t v17 = [v11 persona];
          id v18 = [v17 personaIdentifier];

          unsigned int v19 = [v11 isBackupOnCellularEnabled];
          unsigned int v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v11 accountIdentifier];
            unsigned int v23 = [v11 isPrimaryAccount];
            *(_DWORD *)buf = 138413314;
            id v43 = v22;
            __int16 v44 = 2112;
            int64_t v45 = v18;
            __int16 v46 = 1024;
            unsigned int v47 = v23;
            __int16 v48 = 1024;
            int v49 = 1;
            __int16 v50 = 1024;
            unsigned int v51 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched account:(%@/%@), primary:%d, isEnabledForBackup:%d, isBackupOnCellularEnabled:%d", buf, 0x28u);

            id v24 = [v11 accountIdentifier];
            uint64_t v30 = 1;
            uint64_t v31 = v19;
            int v28 = v18;
            uint64_t v29 = [v11 isPrimaryAccount];
            uint64_t v27 = v24;
            _MBLog();
          }
          v7 |= v19;

          char v8 = 1;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
    char v8 = 0;
  }

  *a3 = (v32 ^ 1) & v8;
  *a4 = v8 & v7 & 1;
  id v25 = [v35 copy];

  return v25;
}

- (void)accountChanged
{
  BOOL v3 = (void *)os_transaction_create();
  stateQueue = self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100225DE4;
  v6[3] = &unk_1004110B0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(stateQueue, v6);
}

- (void)_cancelPowerLossTimer
{
  if (self->_powerLossTimer)
  {
    BOOL v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "=scheduler= Canceling the power loss timer", v5, 2u);
      _MBLog();
    }

    dispatch_source_cancel((dispatch_source_t)self->_powerLossTimer);
    powerLossTimer = self->_powerLossTimer;
    self->_powerLossTimer = 0;
  }
}

- (void)_cancelWiFiLossTimer
{
  if (self->_wifiLossTimer)
  {
    BOOL v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "=scheduler= Canceling the WiFi loss timer", v5, 2u);
      _MBLog();
    }

    dispatch_source_cancel((dispatch_source_t)self->_wifiLossTimer);
    wifiLossTimer = self->_wifiLossTimer;
    self->_wifiLossTimer = 0;
  }
}

- (void)_cancelLossTimers
{
  [(MBBackupScheduler *)self _cancelPowerLossTimer];
  [(MBBackupScheduler *)self _cancelWiFiLossTimer];
}

- (id)_conditionLossTimerWithSeconds:(int64_t)a3 changes:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_stateQueue);
  dispatch_time_t v8 = dispatch_walltime(0, 1000000000 * a3);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002261F8;
  v14[3] = &unk_100412888;
  uint64_t v9 = v7;
  BOOL v15 = v9;
  double v16 = self;
  id v17 = v6;
  int64_t v18 = a3;
  id v10 = v6;
  dispatch_source_set_event_handler(v9, v14);
  id v11 = v17;
  unsigned int v12 = v9;

  return v12;
}

- (void)_updateRetryAfterDateAfterUnlockForAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBBackupScheduler _updateRetryAfterDateAfterUnlockForAccount:]", "MBBackupScheduler.m", 1428, "account");
  }
  id v5 = v4;
  id v6 = [v4 persona];
  id v7 = [v6 copyPreferencesValueForKey:@"MissingEncryptionKeyFailureCount" class:objc_opt_class()];

  if (v7)
  {
    id v8 = [v7 unsignedIntegerValue];
    if ((unint64_t)v8 <= 1) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = (unint64_t)v8;
    }
    id v10 = [v5 persona];
    id v11 = [v10 copyPreferencesValueForKey:@"MissingEncryptionKeyRetryAfter" class:objc_opt_class()];

    [v11 timeIntervalSinceNow];
    if (v11 && (double v13 = v12, v12 < 3600.0))
    {
      unsigned int v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = [v5 accountIdentifier];
        double v16 = MBStringWithDate();
        *(_DWORD *)buf = 138544386;
        CFStringRef v22 = @"MissingEncryptionKeyRetryAfter";
        __int16 v23 = 2114;
        id v24 = v15;
        __int16 v25 = 2114;
        id v26 = v16;
        __int16 v27 = 2048;
        double v28 = v13;
        __int16 v29 = 2048;
        unint64_t v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=scheduler= Not updating %{public}@ for account %{public}@: \"%{public}@\" (%.3f, %lu)", buf, 0x34u);

        id v17 = [v5 accountIdentifier];
        unsigned int v20 = MBStringWithDate();
        _MBLog();
      }
    }
    else
    {
      uint64_t v18 = 3;
      if (v9 < 3) {
        uint64_t v18 = v9;
      }
      uint64_t v19 = +[NSDate dateWithTimeIntervalSinceNow:dbl_1003B37F0[v18 - 1] + (drand48() + -0.5) * floor(dbl_1003B37F0[v18 - 1] * 0.25)];

      [(MBBackupScheduler *)self _updateRetryAfterDate:v19 forKey:@"MissingEncryptionKeyRetryAfter" account:v5 ignoreExistingDate:1];
      id v11 = (id)v19;
    }
  }
}

- (void)_cancelBackupWithActivityType:(int)a3 changes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v7 = [(MBBackupScheduler *)self initiatedBackupRequest];
  id v8 = [v6 locked];
  unint64_t v9 = v8;
  if (!v7 && v8)
  {
    if ([v8 BOOLValue]) {
      goto LABEL_15;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [(MBBackupScheduler *)self accounts];
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        unsigned int v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [(MBBackupScheduler *)self _updateRetryAfterDateAfterUnlockForAccount:*(void *)(*((void *)&v17 + 1) + 8 * (void)v14)];
          unsigned int v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  if (v7 && [v7 activityType] == v4)
  {
    [(MBBackupScheduler *)self _cancelInitiatedBackupWithChanges:v6 isDeferred:0];
    goto LABEL_19;
  }
LABEL_15:
  if (v4 == 2)
  {
    BOOL v15 = [v6 initial];
    unsigned int v16 = [v15 BOOLValue];

    if (v16) {
      [(MBBackupScheduler *)self _cancelAlarm];
    }
  }
  [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:v4];
LABEL_19:
}

- (void)_stateDidChange:(id)a3 conditions:(id)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  BOOL var0 = a4.var0;
  unint64_t v7 = *(void *)&a4 & 0x10000;
  unint64_t v8 = *(_DWORD *)&a4.var0 & 0x1000000;
  unint64_t v106 = *(_WORD *)&a4.var0 & 0x100;
  unint64_t v107 = *(void *)&a4 & 0x10000000000;
  unint64_t v108 = *(void *)&a4 & 0x1000000000000;
  unint64_t v9 = [(NSMutableDictionary *)self->_osTransactionsByActivityType objectForKeyedSubscript:&off_10043A158];

  id v10 = [(MBBackupScheduler *)self initiatedBackupRequest];
  unsigned int v109 = [v10 activityType];

  v113 = v6;
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v114 = a4;
  unint64_t v11 = *(void *)&a4 & 0x100000000000000;
  v128 = self;
  unint64_t v112 = v8;
  if (v6)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110914;
      *(_DWORD *)v140 = a4.var0;
      *(_WORD *)&v140[4] = 1024;
      *(_DWORD *)&v140[6] = v106 >> 8;
      __int16 v141 = 1024;
      int v142 = v7 >> 16;
      __int16 v143 = 1024;
      unsigned int v144 = (*(_DWORD *)&a4.var0 & 0x1000000u) >> 24;
      __int16 v145 = 1024;
      int v146 = v107 >> 40;
      __int16 v147 = 1024;
      int v148 = HIWORD(v108);
      __int16 v149 = 1024;
      int v150 = HIBYTE(v11);
      __int16 v151 = 2114;
      id v152 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=scheduler= Scheduler state changed, enabled:%d, locked:%d, onPower:%d, onWiFi:%d, onCellular:%d(%d), autoBackupOnCellularAllowed:%d, changes:%{public}@", buf, 0x36u);
      unint64_t v104 = HIBYTE(v11);
      id v105 = v6;
      unint64_t v102 = v107 >> 40;
      unint64_t v103 = HIWORD(v108);
      unint64_t v100 = v7 >> 16;
      unint64_t v101 = v8 >> 24;
      BOOL v97 = a4.var0;
      unint64_t v99 = v106 >> 8;
      unint64_t v7 = *(void *)&a4 & 0x10000;
      unint64_t v8 = *(_DWORD *)&a4.var0 & 0x1000000;
      _MBLog();
    }
  }
  if (v7) {
    [(MBBackupScheduler *)self _cancelPowerLossTimer];
  }
  if (v8) {
    [(MBBackupScheduler *)self _cancelWiFiLossTimer];
  }
  BOOL v13 = (~*(void *)&a4 & 0x100010100000000) == 0;
  if ((~*(void *)&a4 & 0x101010100000000) == 0) {
    BOOL v13 = [(MBBackupScheduler *)self allowBackupOnExpensiveCellular];
  }
  BOOL v14 = [(MBBackupScheduler *)self _backupOnBatteryAllowed];
  if (v7) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
  if (v8) {
    int v16 = 1;
  }
  else {
    int v16 = v13;
  }
  uint64_t v110 = *(_WORD *)&a4.var0 & 0x101;
  if (v110 == 257)
  {
    if (v15)
    {
      if (v16)
      {
        BOOL v17 = v14;
        if ([(MBCKManager *)self->_serviceManager isIdle])
        {
          BOOL v18 = v8 != 0;
          long long v19 = +[NSDate now];
          uint64_t v20 = MBGetChargingType();
          int64_t v21 = [(MBBackupScheduler *)self _scheduleBackupOnWiFi:v18 onCellular:v13 onBattery:v17];
          if (!v113)
          {
LABEL_51:

            goto LABEL_52;
          }
          int64_t v22 = v21;
          __int16 v23 = v19;
LABEL_50:
          [(MBBackupScheduler *)self setLastOnConditionDate:v19];
          [(MBBackupScheduler *)self setNextBackupDelta:v22];
          [(MBBackupScheduler *)self setLastOnConditionChargingType:v20];
          long long v19 = v23;
          goto LABEL_51;
        }
      }
    }
  }
  if ((~*(_DWORD *)&a4.var0 & 0x1010101) != 0
    || (const mach_header_64 *)(*(void *)&a4 & 0x10100000000) == &_mh_execute_header)
  {
    id v24 = [(MBBackupScheduler *)self lastOnConditionDate];

    if (v24)
    {
      __int16 v23 = +[NSDate now];
      __int16 v25 = [(MBBackupScheduler *)self lastOnConditionDate];
      [v23 timeIntervalSinceDate:v25];
      double v27 = v26;

      if (v27 <= 60.0)
      {
        v57 = (char *)[(MBBackupScheduler *)self ignoredLastOnConditionEvent] + 1;
      }
      else
      {
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        id obj = [(MBBackupScheduler *)self accounts];
        id v121 = [obj countByEnumeratingWithState:&v133 objects:v138 count:16];
        if (v121)
        {
          BOOL v119 = v9 != 0;
          unint64_t v117 = HIBYTE(v11);
          uint64_t v118 = *(void *)v134;
          unint64_t v116 = v7 >> 16;
          v120 = v23;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v134 != v118) {
                objc_enumerationMutation(obj);
              }
              uint64_t v127 = v28;
              __int16 v29 = *(void **)(*((void *)&v133 + 1) + 8 * v28);
              unint64_t v30 = +[MBBackupScheduler lastOnConditionEventsForAccount:v29];
              id v31 = [v30 mutableCopy];
              unsigned int v32 = v31;
              if (v31) {
                id v33 = v31;
              }
              else {
                id v33 = (id)objc_opt_new();
              }
              id v34 = v33;

              id v35 = (char *)[v34 count];
              if ((unint64_t)v35 >= 0xA) {
                objc_msgSend(v34, "removeObjectsInRange:", 0, v35 - 9);
              }
              id v36 = [(MBBackupScheduler *)v128 _retryAfterDateForAccount:v29];
              char v37 = [v29 persona];
              id v38 = [v37 copyPreferencesValueForKey:@"FailureCount" class:objc_opt_class()];
              id v123 = [v38 unsignedIntegerValue];

              double v39 = 0.0;
              double v40 = 0.0;
              if (v36)
              {
                [v36 timeIntervalSinceDate:v23];
                double v40 = v41;
              }
              v126 = v29;
              __int16 v42 = [(MBCKManager *)v128->_serviceManager backupStateInfoForInitialMegaBackup:0 account:v29];
              id v43 = [v42 errors];
              __int16 v44 = [v43 lastObject];

              int64_t v45 = [v44 userInfo];
              uint64_t v46 = [v45 objectForKeyedSubscript:@"kMBErrorDateKey"];

              if (v46)
              {
                [v23 timeIntervalSinceDate:v46];
                double v39 = v47;
              }
              v124 = v36;
              v125 = v34;
              v122 = (void *)v46;
              if (+[MBError isError:v44 withCode:0])
              {

                __int16 v44 = 0;
              }
              id v48 = [v44 code];
              uint64_t v49 = [v44 domain];
              __int16 v50 = (void *)v49;
              unsigned int v51 = &stru_100418BA8;
              if (v49) {
                unsigned int v51 = (__CFString *)v49;
              }
              v52 = v51;

              v53 = +[NSDateFormatter ISO8601Formatter];
              v54 = [(MBBackupScheduler *)v128 lastOnConditionDate];
              v55 = [v53 stringFromDate:v54];
              +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@|%.3f|%d|%d|%d|%d|%d|%d|%lld|%lld|%lld|%lu|%@|%ld|%lu|%d|%d|%d|%lld", v55, *(void *)&v27, var0, v116, v106 >> 8, v112 >> 24, v119, v109 == 2, [(MBBackupScheduler *)v128 nextBackupDelta], (uint64_t)v40, (uint64_t)v39, v123, v52, v48, [(MBBackupScheduler *)v128 lastOnConditionChargingType], v107 >> 40,
                HIWORD(v108),
                v117,
              id v56 = [(MBBackupScheduler *)v128 ignoredLastOnConditionEvent]);

              [v125 addObject:v56];
              +[MBBackupScheduler setLastOnConditionEvents:v125 account:v126];

              uint64_t v28 = v127 + 1;
              __int16 v23 = v120;
            }
            while (v121 != (id)(v127 + 1));
            id v121 = [obj countByEnumeratingWithState:&v133 objects:v138 count:16];
          }
          while (v121);
        }

        v57 = 0;
        self = v128;
      }
      [(MBBackupScheduler *)self setIgnoredLastOnConditionEvent:v57];
      long long v19 = 0;
      int64_t v22 = 0;
      uint64_t v20 = 0;
      goto LABEL_50;
    }
  }
LABEL_52:
  v58 = [(NSMutableDictionary *)self->_osTransactionsByActivityType objectForKeyedSubscript:&off_10043A158];

  CFStringRef v59 = v113;
  if (!v58 && v109 != 2) {
    goto LABEL_65;
  }
  uint64_t v60 = *(_DWORD *)&v114.var0 & 0x1010101;
  switch(v60)
  {
    case 65793:
      v65 = MBGetDefaultLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v140 = 120;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "=scheduler= The device lost WiFi but is otherwise still in condition - will wait %llds before canceling ongoing or scheduled backups", buf, 0xCu);
        uint64_t v98 = 120;
        _MBLog();
      }

      v66 = [(MBBackupScheduler *)self _conditionLossTimerWithSeconds:120 changes:v113];
      wifiLossTimer = self->_wifiLossTimer;
      self->_wifiLossTimer = v66;

      v64 = self->_wifiLossTimer;
      goto LABEL_63;
    case 16843009:
      goto LABEL_65;
    case 16777473:
      v61 = MBGetDefaultLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v140 = 60;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "=scheduler= The device lost power but is otherwise still in condition - will wait %llds before canceling ongoing or scheduled backups", buf, 0xCu);
        uint64_t v98 = 60;
        _MBLog();
      }

      v62 = [(MBBackupScheduler *)self _conditionLossTimerWithSeconds:60 changes:v113];
      powerLossTimer = self->_powerLossTimer;
      self->_powerLossTimer = v62;

      v64 = self->_powerLossTimer;
LABEL_63:
      dispatch_resume(v64);
      goto LABEL_65;
  }
  [(MBBackupScheduler *)self _cancelBackupWithActivityType:2 changes:v113];
LABEL_65:
  v68 = -[NSMutableDictionary objectForKeyedSubscript:](self->_osTransactionsByActivityType, "objectForKeyedSubscript:", &off_10043A140, v98);

  v69 = [(MBBackupScheduler *)self initiatedBackupRequest];
  unsigned int v70 = [v69 activityType];

  BOOL v71 = v70 != 1 && v68 == 0;
  if (!v71 && (*(void *)&v114 & 0x10000010101) != 0x10000010101) {
    [(MBBackupScheduler *)self _cancelBackupWithActivityType:1 changes:v113];
  }
  id v72 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:&off_10043A170];

  v73 = [(MBBackupScheduler *)self initiatedBackupRequest];
  unsigned int v74 = [v73 activityType];

  BOOL v76 = v110 != 257 || v112 == 0;
  BOOL v77 = v74 != 3 && v72 == 0;
  if (!v77 && v76) {
    [(MBBackupScheduler *)self _cancelBackupWithActivityType:3 changes:v113];
  }
  if ((~*(void *)&v114 & 0x1010100) != 0 && var0)
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v78 = [(MBBackupScheduler *)self accounts];
    id v79 = [v78 countByEnumeratingWithState:&v129 objects:v137 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v130;
      do
      {
        for (i = 0; i != v80; i = (char *)i + 1)
        {
          if (*(void *)v130 != v81) {
            objc_enumerationMutation(v78);
          }
          [(MBBackupScheduler *)self _warnUserOfLateBackupWithAccount:*(void *)(*((void *)&v129 + 1) + 8 * i)];
        }
        id v80 = [v78 countByEnumeratingWithState:&v129 objects:v137 count:16];
      }
      while (v80);
    }
  }
  if ((*(void *)&v114 & 0x10001000000) != 0
    && [(MBCKManager *)self->_serviceManager isBackgroundRestoringAnyAccount])
  {
    v83 = [v113 onWiFi];
    unsigned int v84 = [v83 BOOLValue];

    if (v84)
    {
      v85 = MBGetDefaultLog();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "=scheduler= Back on WiFi during background restore - retrying app downloads", buf, 2u);
LABEL_110:
        _MBLog();
        goto LABEL_111;
      }
      goto LABEL_111;
    }
    v86 = [v113 onCellular];
    unsigned int v87 = [v86 BOOLValue];

    if (v87)
    {
      v85 = MBGetDefaultLog();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "=scheduler= Back on cellular during background restore - retrying app downloads", buf, 2u);
        goto LABEL_110;
      }
LABEL_111:

      v92 = [(MBBackupScheduler *)self networkPathMonitor];
      id v93 = [v92 cellularRadioType];
      v94 = [(MBBackupScheduler *)self networkPathMonitor];
      id v95 = [v94 backupOnCellularSupport];

      *((void *)&v96 + 1) = v93;
      *(void *)&long long v96 = v108;
      -[MBCKManager retryAppDataDownloadsWithNetworkConnectivity:](self->_serviceManager, "retryAppDataDownloadsWithNetworkConnectivity:", HIDWORD(v107) | (*(unint64_t *)&v114 >> 24) & 1 | (unint64_t)(v96 >> 32), v95);
      CFStringRef v59 = v113;
      goto LABEL_112;
    }
    v88 = [v113 onPower];
    unsigned int v89 = [v88 BOOLValue];

    if (v89)
    {
      v85 = MBGetDefaultLog();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "=scheduler= Back on external power during background restore - retrying app downloads", buf, 2u);
        goto LABEL_110;
      }
      goto LABEL_111;
    }
    v90 = [v113 locked];

    if (v90)
    {
      v85 = MBGetDefaultLog();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        if (v106) {
          v91 = "locked";
        }
        else {
          v91 = "unlocked";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v140 = v91;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "=scheduler= Device %s - retrying app downloads", buf, 0xCu);
        goto LABEL_110;
      }
      goto LABEL_111;
    }
  }
LABEL_112:
}

- ($3C5213C2FB734B7CA09EF95E8A7A7A2F)conditions
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  $3C5213C2FB734B7CA09EF95E8A7A7A2F conditions = ($3C5213C2FB734B7CA09EF95E8A7A7A2F)v2->_conditions;
  objc_sync_exit(v2);

  return conditions;
}

- (BOOL)isOnPower
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*((unsigned char *)v2 + 101) & 1) != 0 || v2->_conditions.isOnPower;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsOnPower:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = *((unsigned __int8 *)obj + 100);
  int v5 = v4;
  if ((v4 & 4) == 0)
  {
    int v5 = v4 | 4;
    *((unsigned char *)obj + 100) = v4 | 4;
  }
  BOOL v6 = (*((unsigned __int8 *)obj + 101) | v3) & 1;
  if (obj->_conditions.isOnPower == v6)
  {
    if ((v4 & 4) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    obj->_conditions.isOnPower = v6;
  }
  if (v5 == 255)
  {
    $177B59F5AD2DC8B0470432100C1B42E3 conditions = obj->_conditions;
    objc_sync_exit(obj);

    unint64_t v8 = (MBBackupScheduler *)objc_opt_new();
    unint64_t v9 = +[NSNumber numberWithBool:v6];
    [(MBBackupScheduler *)v8 setOnPower:v9];

    [(MBBackupScheduler *)obj _notifyStateChanged:v8 conditions:conditions];
    id v10 = v8;
    goto LABEL_10;
  }
LABEL_9:
  objc_sync_exit(obj);
  id v10 = obj;
LABEL_10:
}

- (BOOL)isLocked
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isLocked = v2->_conditions.isLocked;
  objc_sync_exit(v2);

  return isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = obj;
  int v5 = *((unsigned __int8 *)obj + 100);
  if ((v5 & 2) != 0)
  {
    p_BOOL isLocked = &obj->_conditions.isLocked;
    if (obj->_conditions.isLocked == v3) {
      goto LABEL_10;
    }
LABEL_6:
    *p_BOOL isLocked = v3;
    if (v3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v5 |= 2u;
  p_BOOL isLocked = &obj->_conditions.isLocked;
  BOOL isLocked = obj->_conditions.isLocked;
  *((unsigned char *)obj + 100) = v5;
  if (isLocked != v3) {
    goto LABEL_6;
  }
  if (!v3)
  {
LABEL_7:
    uint64_t v8 = +[NSDate now];
    dateOfLastUnlockSeenByDaemon = obj->_dateOfLastUnlockSeenByDaemon;
    obj->_dateOfLastUnlockSeenByDaemon = (NSDate *)v8;

    int v4 = obj;
    int v5 = *((unsigned __int8 *)obj + 100);
  }
LABEL_8:
  if (v5 == 255)
  {
    $177B59F5AD2DC8B0470432100C1B42E3 conditions = v4->_conditions;
    objc_sync_exit(v4);

    unint64_t v11 = (MBBackupScheduler *)objc_opt_new();
    id v12 = +[NSNumber numberWithBool:v3];
    [(MBBackupScheduler *)v11 setLocked:v12];

    [(MBBackupScheduler *)obj _notifyStateChanged:v11 conditions:conditions];
    BOOL v13 = v11;
    goto LABEL_11;
  }
LABEL_10:
  objc_sync_exit(obj);
  BOOL v13 = obj;
LABEL_11:
}

- (BOOL)isOnWiFi
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isOnWiFi = v2->_conditions.isOnWiFi;
  objc_sync_exit(v2);

  return isOnWiFi;
}

- (void)setIsOnWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = *((unsigned __int8 *)obj + 100);
  if ((v4 & 8) != 0)
  {
    p_BOOL isOnWiFi = &obj->_conditions.isOnWiFi;
    if (obj->_conditions.isOnWiFi == v3) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  v4 |= 8u;
  p_BOOL isOnWiFi = &obj->_conditions.isOnWiFi;
  BOOL isOnWiFi = obj->_conditions.isOnWiFi;
  *((unsigned char *)obj + 100) = v4;
  if (isOnWiFi != v3) {
LABEL_5:
  }
    *p_BOOL isOnWiFi = v3;
  if (v4 == 255)
  {
    $177B59F5AD2DC8B0470432100C1B42E3 conditions = obj->_conditions;
    objc_sync_exit(obj);

    uint64_t v8 = (MBBackupScheduler *)objc_opt_new();
    unint64_t v9 = +[NSNumber numberWithBool:v3];
    [(MBBackupScheduler *)v8 setOnWiFi:v9];

    [(MBBackupScheduler *)obj _notifyStateChanged:v8 conditions:conditions];
    id v10 = v8;
    goto LABEL_9;
  }
LABEL_8:
  objc_sync_exit(obj);
  id v10 = obj;
LABEL_9:
}

- (BOOL)isOnCellular
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isOnCellular = v2->_conditions.isOnCellular;
  objc_sync_exit(v2);

  return isOnCellular;
}

- (void)setIsOnCellular:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = *((unsigned __int8 *)obj + 100);
  if ((v4 & 0x20) != 0)
  {
    p_BOOL isOnCellular = &obj->_conditions.isOnCellular;
    if (obj->_conditions.isOnCellular == v3) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  v4 |= 0x20u;
  p_BOOL isOnCellular = &obj->_conditions.isOnCellular;
  BOOL isOnCellular = obj->_conditions.isOnCellular;
  *((unsigned char *)obj + 100) = v4;
  if (isOnCellular != v3) {
LABEL_5:
  }
    *p_BOOL isOnCellular = v3;
  if (v4 == 255)
  {
    $177B59F5AD2DC8B0470432100C1B42E3 conditions = obj->_conditions;
    objc_sync_exit(obj);

    uint64_t v8 = (MBBackupScheduler *)objc_opt_new();
    unint64_t v9 = +[NSNumber numberWithBool:v3];
    [(MBBackupScheduler *)v8 setOnCellular:v9];

    [(MBBackupScheduler *)obj _notifyStateChanged:v8 conditions:conditions];
    id v10 = v8;
    goto LABEL_9;
  }
LABEL_8:
  objc_sync_exit(obj);
  id v10 = obj;
LABEL_9:
}

- (BOOL)isOnExpensiveCellular
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isOnExpensiveCellular = v2->_conditions.isOnExpensiveCellular;
  objc_sync_exit(v2);

  return isOnExpensiveCellular;
}

- (void)setIsOnExpensiveCellular:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = *((unsigned __int8 *)obj + 100);
  if ((v4 & 0x40) != 0)
  {
    p_BOOL isOnExpensiveCellular = &obj->_conditions.isOnExpensiveCellular;
    if (obj->_conditions.isOnExpensiveCellular == v3) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  v4 |= 0x40u;
  p_BOOL isOnExpensiveCellular = &obj->_conditions.isOnExpensiveCellular;
  BOOL isOnExpensiveCellular = obj->_conditions.isOnExpensiveCellular;
  *((unsigned char *)obj + 100) = v4;
  if (isOnExpensiveCellular != v3) {
LABEL_5:
  }
    *p_BOOL isOnExpensiveCellular = v3;
  if (v4 == 255)
  {
    $177B59F5AD2DC8B0470432100C1B42E3 conditions = obj->_conditions;
    objc_sync_exit(obj);

    uint64_t v8 = (MBBackupScheduler *)objc_opt_new();
    unint64_t v9 = +[NSNumber numberWithBool:v3];
    [(MBBackupScheduler *)v8 setOnExpensiveCellular:v9];

    [(MBBackupScheduler *)obj _notifyStateChanged:v8 conditions:conditions];
    id v10 = v8;
    goto LABEL_9;
  }
LABEL_8:
  objc_sync_exit(obj);
  id v10 = obj;
LABEL_9:
}

- (void)setIsAutoBackupOnCellularAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = *((unsigned __int8 *)obj + 100);
  if ((v4 & 0x80) != 0)
  {
    p_BOOL isAutoBackupOnCellularAllowed = &obj->_conditions.isAutoBackupOnCellularAllowed;
    if (obj->_conditions.isAutoBackupOnCellularAllowed == v3) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  v4 |= 0x80u;
  p_BOOL isAutoBackupOnCellularAllowed = &obj->_conditions.isAutoBackupOnCellularAllowed;
  BOOL isAutoBackupOnCellularAllowed = obj->_conditions.isAutoBackupOnCellularAllowed;
  *((unsigned char *)obj + 100) = v4;
  if (isAutoBackupOnCellularAllowed != v3) {
LABEL_5:
  }
    BOOL *p_isAutoBackupOnCellularAllowed = v3;
  if (v4 == 255)
  {
    $177B59F5AD2DC8B0470432100C1B42E3 conditions = obj->_conditions;
    objc_sync_exit(obj);

    uint64_t v8 = (MBBackupScheduler *)objc_opt_new();
    unint64_t v9 = +[NSNumber numberWithBool:v3];
    [(MBBackupScheduler *)v8 setAutoBackupOnCellularAllowed:v9];

    [(MBBackupScheduler *)obj _notifyStateChanged:v8 conditions:conditions];
    id v10 = v8;
    goto LABEL_9;
  }
LABEL_8:
  objc_sync_exit(obj);
  id v10 = obj;
LABEL_9:
}

- (BOOL)isAutoBackupOnCellularAllowed
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isAutoBackupOnCellularAllowed = v2->_conditions.isAutoBackupOnCellularAllowed;
  objc_sync_exit(v2);

  return isAutoBackupOnCellularAllowed;
}

- (BOOL)isEnabled
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isEnabled = v2->_conditions.isEnabled;
  objc_sync_exit(v2);

  return isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  if ((*((unsigned char *)obj + 100) & 1) == 0) {
    *((unsigned char *)obj + 100) |= 1u;
  }
  obj->_conditions.BOOL isEnabled = a3;
  objc_sync_exit(obj);
}

- (BOOL)isBackupOnCellularEnabled
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  BOOL isBackupOnCellularEnabled = v2->_conditions.isBackupOnCellularEnabled;
  objc_sync_exit(v2);

  return isBackupOnCellularEnabled;
}

- (void)setIsBackupOnCellularEnabled:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  if ((*((unsigned char *)obj + 100) & 0x10) == 0) {
    *((unsigned char *)obj + 100) |= 0x10u;
  }
  obj->_conditions.BOOL isBackupOnCellularEnabled = a3;
  objc_sync_exit(obj);
}

- (void)_notifyStateChanged:(id)a3 conditions:(id)a4
{
  id v6 = a3;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100227EC0;
  block[3] = &unk_100412AB0;
  void block[4] = self;
  id v10 = v6;
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = a4;
  id v8 = v6;
  dispatch_async(stateQueue, block);
}

- (id)_lastSnapshotFromCacheWithAccount:(id)a3
{
  id v3 = a3;
  int v4 = +[MBCKManager sharedInstance];
  id v13 = 0;
  int v5 = [v4 openCacheWithAccount:v3 accessType:2 error:&v13];

  id v6 = v13;
  if (v5)
  {
    id v12 = v6;
    unint64_t v7 = [v5 fetchMostRecentSnapshotWithError:&v12];
    id v8 = v12;

    if (v7) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v8 == 0;
    }
    if (!v9)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=scheduler= Failed to fetch most recent snapshot from cache: %@", buf, 0xCu);
        _MBLog();
      }

      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
    id v8 = v6;
  }

  return v7;
}

- (id)_dateOfLastBackupFromCloudWithConnection:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBBackupScheduler _dateOfLastBackupFromCloudWithConnection:account:error:]", "MBBackupScheduler.m", 1880, "error");
  }
  id v10 = v9;
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = +[MBCKOperationPolicy expensiveCellularPolicy];
  [v11 setTimeoutIntervalForFetch:10.0];
  id v12 = [(MBCKManager *)self->_serviceManager databaseManager];
  id v13 = +[MBCKOperationTracker operationTrackerWithAccount:v10 databaseManager:v12 policy:v11 error:a5];

  if (v13)
  {
    BOOL v14 = [v8 processName];
    id v15 = [v11 operationGroupWithName:@"getLastBackupDate" processName:v14];
    [v13 setCkOperationGroup:v15];

    int v16 = [MBCKDevice alloc];
    BOOL v17 = MBDeviceUUID();
    BOOL v18 = -[MBCKDevice initWithUUID:cache:backupEnabled:](v16, "initWithUUID:cache:backupEnabled:", v17, 0, [v10 isEnabledForBackup]);

    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = sub_100228580;
    id v34 = sub_100228590;
    id v35 = 0;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    uint64_t v20 = [(MBCKModel *)v18 recordID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100228598;
    v26[3] = &unk_1004127D0;
    int64_t v21 = v18;
    double v27 = v21;
    __int16 v29 = &v30;
    int64_t v22 = v19;
    uint64_t v28 = v22;
    [v13 fetchRecordWithID:v20 completion:v26];

    MBSemaphoreWaitForever();
    __int16 v23 = (void *)v31[5];
    if (v23)
    {
      id v24 = 0;
      *a5 = v23;
    }
    else
    {
      id v24 = [(MBCKDevice *)v21 dateOfLastBackup];
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)_dateOfLastBackupFromLockdown
{
  unsigned int v2 = +[MBLockdown dateOfLastBackupFromLockdownPlist];
  id v3 = v2;
  if (v2)
  {
    double v4 = (double)(unint64_t)[v2 unsignedLongLongValue];
    int v5 = +[NSDate dateWithTimeIntervalSince1970:v4];
    id v6 = +[NSDate date];
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    if (v8 > 315360000.0)
    {
      uint64_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];

      int v5 = (void *)v9;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)dateOfLastBackupWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBBackupScheduler dateOfLastBackupWithAccount:connection:error:]", "MBBackupScheduler.m", 1931, "account");
  }
  if (!a5) {
    __assert_rtn("-[MBBackupScheduler dateOfLastBackupWithAccount:connection:error:]", "MBBackupScheduler.m", 1932, "error");
  }
  id v10 = v9;
  if ([v8 isPrimaryAccount])
  {
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = [(MBBackupScheduler *)self _dateOfLastBackupFromLockdown];
    id v12 = MBGetDefaultLog();
    id v13 = v12;
    if (v11)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      BOOL v14 = MBStringWithDate();
      *(_DWORD *)buf = 138543362;
      id v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched dateOfLastBackup from lockdown:\"%{public}@\"", buf, 0xCu);

      id v15 = MBStringWithDate();
LABEL_14:
      _MBLog();

      goto LABEL_29;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=scheduler= No dateOfLastBackup available from lockdown", buf, 2u);
      _MBLog();
    }
  }
  if (![(MBCKManager *)self->_serviceManager isRestoringAccount:v8])
  {
    int v16 = [(MBBackupScheduler *)self _lastSnapshotFromCacheWithAccount:v8];
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = [v16 created];

    BOOL v17 = MBGetDefaultLog();
    id v13 = v17;
    if (v11)
    {
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      BOOL v18 = MBStringWithDate();
      *(_DWORD *)buf = 138543362;
      id v38 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched dateOfLastBackup from the cache:\"%{public}@\"", buf, 0xCu);

      id v15 = MBStringWithDate();
      goto LABEL_14;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=scheduler= No dateOfLastBackup available from the cache", buf, 2u);
      _MBLog();
    }
  }
  uint64_t v19 = [(MBBackupScheduler *)self _nilBackupDateFetchDateForAccount:v8];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    int64_t v21 = +[NSDate now];
    [v21 timeIntervalSinceDate:v20];
    double v23 = v22;

    if (v23 >= 0.0 && v23 <= 43200.0)
    {
      $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = 0;
      goto LABEL_39;
    }
  }
  id v36 = 0;
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = [(MBBackupScheduler *)self _dateOfLastBackupFromCloudWithConnection:v10 account:v8 error:&v36];
  id v24 = v36;
  id v13 = v24;
  if (v11 || !v24)
  {
    __int16 v25 = MBGetDefaultLog();
    double v26 = v25;
    if (!v11)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "=scheduler= No dateOfLastBackup available from the device record", buf, 2u);
        _MBLog();
      }

      $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = +[NSDate now];
      [(MBBackupScheduler *)self _updateNilBackupDateFetchDate:v11 account:v8];
LABEL_37:

      $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = 0;
      goto LABEL_38;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = MBStringWithDate();
      *(_DWORD *)buf = 138543362;
      id v38 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched the dateOfLastBackup from the device record: \"%{public}@\"", buf, 0xCu);

      id v34 = MBStringWithDate();
      _MBLog();
    }
    [(MBBackupScheduler *)self clearNilBackupDateFetchDateForAccount:v8];
LABEL_29:

    uint64_t v28 = +[MBCKManager restoreInfoForAccount:v8];
    id v13 = [v28 date];

    if (!v13 || [v11 compare:v13] != (id)-1) {
      goto LABEL_38;
    }
    __int16 v29 = MBGetDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = MBStringWithDate();
      id v31 = MBStringWithDate();
      *(_DWORD *)buf = 138543618;
      id v38 = v30;
      __int16 v39 = 2114;
      double v40 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=scheduler= Last backup date (\"%{public}@\") is before the restore date (\"%{public}@\") - ignoring", buf, 0x16u);

      uint64_t v32 = MBStringWithDate();
      id v35 = MBStringWithDate();
      _MBLog();
    }
    goto LABEL_37;
  }
  id v13 = v24;
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = 0;
  *a5 = v13;
LABEL_38:

LABEL_39:
  return v11;
}

- (id)_nilBackupDateFetchDateForAccount:(id)a3
{
  id v3 = a3;
  double v4 = [v3 persona];
  id v5 = [v4 copyPreferencesValueForKey:@"NilBackupDateFetchDate" class:objc_opt_class()];

  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double v7 = [v3 accountIdentifier];
    id v8 = MBStringWithDate();
    *(_DWORD *)buf = 138543874;
    CFStringRef v13 = @"NilBackupDateFetchDate";
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2114;
    BOOL v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "=scheduler= Fetched %{public}@ for account %{public}@: %{public}@", buf, 0x20u);

    id v9 = [v3 accountIdentifier];
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = MBStringWithDate();
    _MBLog();
  }
  return v5;
}

- (void)clearNilBackupDateFetchDateForAccount:(id)a3
{
  id v3 = a3;
  double v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    CFStringRef v9 = @"NilBackupDateFetchDate";
    __int16 v10 = 2114;
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "=scheduler= Clearing %{public}@ for account %{public}@", buf, 0x16u);

    double v7 = [v3 accountIdentifier];
    _MBLog();
  }
  id v6 = [v3 persona];
  [v6 setPreferencesValue:0 forKey:@"NilBackupDateFetchDate"];
}

- (void)_updateNilBackupDateFetchDate:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 accountIdentifier];
    CFStringRef v9 = MBStringWithDate();
    *(_DWORD *)buf = 138543874;
    CFStringRef v14 = @"NilBackupDateFetchDate";
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    BOOL v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=scheduler= Updating %{public}@ for account %{public}@: %{public}@", buf, 0x20u);

    __int16 v10 = [v6 accountIdentifier];
    id v12 = MBStringWithDate();
    _MBLog();
  }
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = [v6 persona];
  [v11 setPreferencesValue:v5 forKey:@"NilBackupDateFetchDate"];
}

- (BOOL)_fetchNextBackupDateOnWiFi:(id *)a3 nextBackupDateOnCellular:(id *)a4 nextBackupDateOnBattery:(id *)a5 lastBackupDate:(id *)a6 account:(id)a7 connection:(id)a8 error:(id *)a9
{
  id v12 = a7;
  id v66 = a8;
  if (!a3) {
    __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2013, "nextBackupDateOnWiFiPtr");
  }
  if (!a4) {
    __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2014, "nextBackupDateOnCellularPtr");
  }
  if (!a5) {
    __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2015, "nextBackupDateOnBatteryPtr");
  }
  if (!a6) {
    __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2016, "lastBackupDatePtr");
  }
  if (!v12) {
    __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2017, "account");
  }
  if (!a9) {
    __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2018, "error");
  }
  uint64_t v60 = a3;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  id v70 = 0;
  CFStringRef v13 = [(MBBackupScheduler *)self dateOfLastBackupWithAccount:v12 connection:v66 error:&v70];
  id v14 = v70;
  __int16 v15 = v14;
  __int16 v16 = v13;
  if (v13) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v14 == 0;
  }
  char v18 = v17;
  BOOL v64 = v18;
  if (v17)
  {
    uint64_t v19 = +[NSDate now];
    v58 = v15;
    CFStringRef v59 = (void *)v19;
    if (v13)
    {
      if ([v13 compare:v19] == (id)1)
      {
        uint64_t v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v21 = MBStringWithDate();
          *(_DWORD *)buf = 138543362;
          id v72 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=scheduler= Last backup date is forward in time (\"%{public}@\")", buf, 0xCu);

          unsigned int v51 = MBStringWithDate();
          _MBLog();
        }
        uint64_t v22 = v59;
        uint64_t v65 = v22;
        double v23 = (void *)v22;
      }
      else
      {
        self->_backupPeriodOnWiFi = sub_100224950(v12, @"BackupPeriod", 86400.0, 86400.0);
        self->_backupPeriodOnCellular = sub_100224950(v12, @"BackupPeriodOnCellular", 172800.0, 172800.0);
        self->_backupPeriodOnBattery = sub_100224950(v12, @"BackupPeriodOnBattery", 604800.0, 604800.0);
        double v23 = [v13 dateByAddingTimeInterval:self->_backupPeriodOnWiFi];
        uint64_t v65 = [v13 dateByAddingTimeInterval:self->_backupPeriodOnCellular];
        uint64_t v22 = [v13 dateByAddingTimeInterval:self->_backupPeriodOnBattery];
      }
    }
    else
    {
      id v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=scheduler= Last backup date is unknown", buf, 2u);
        _MBLog();
      }

      uint64_t v22 = 0;
      uint64_t v65 = 0;
      double v23 = 0;
    }
    __int16 v25 = -[MBBackupScheduler _retryAfterDateForAccount:](self, "_retryAfterDateForAccount:", v12, v51);
    uint64_t v61 = [(MBBackupScheduler *)self _onBatteryRetryAfterDateForAccount:v12];
    v62 = v12;
    v63 = v25;
    if (v23)
    {
      if (v25)
      {
        uint64_t v26 = [v23 laterDate:v25];

        uint64_t v27 = [(id)v65 laterDate:v25];

        uint64_t v28 = (void *)v61;
        uint64_t v29 = [(id)v22 laterDate:v61];

        uint64_t v22 = v29;
        __int16 v16 = v13;
        uint64_t v65 = v27;
        double v23 = (void *)v26;
      }
      else
      {
        uint64_t v28 = (void *)v61;
        if (v61)
        {
          uint64_t v30 = [(id)v22 laterDate:v61];

          uint64_t v22 = [v30 laterDate:0];
        }
      }
    }
    else
    {
      if (v65 | v22) {
        __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2055, "!nextBackupDateOnCellular && !nextBackupDateOnBattery");
      }
      uint64_t v22 = v25;
      uint64_t v65 = v22;
      double v23 = (void *)v22;
      uint64_t v28 = (void *)v61;
    }
    id v31 = MBGetDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = v16;
      id v33 = MBStringWithDate();
      id v34 = MBStringWithDate();
      id v35 = MBStringWithDate();
      v55 = MBStringWithDate();
      id v36 = MBStringWithDate();
      MBStringWithDate();
      char v37 = v54 = v22;
      v57 = v31;
      id v38 = [v62 persona];
      __int16 v39 = [v38 personaIdentifier];
      *(_DWORD *)buf = 138544898;
      id v72 = v33;
      __int16 v73 = 2114;
      unsigned int v74 = v34;
      __int16 v75 = 2114;
      BOOL v76 = v35;
      __int16 v77 = 2114;
      id v78 = v55;
      __int16 v79 = 2114;
      id v80 = v36;
      __int16 v81 = 2114;
      v82 = v37;
      __int16 v83 = 2112;
      unsigned int v84 = v39;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=scheduler= lastBackupDate:\"%{public}@\", retryAfterDate:\"%{public}@(%{public}@\", nextBackupDateOnWiFi:\"%{public}@\", nextBackupDateOnCellular:\"%{public}@\", nextBackupDateOnBattery:\"%{public}@\", persona:%@", buf, 0x48u);

      uint64_t v22 = v54;
      double v40 = v32;
      double v41 = MBStringWithDate();
      MBStringWithDate();
      __int16 v42 = v56 = v23;
      v53 = MBStringWithDate();
      id v43 = MBStringWithDate();
      __int16 v44 = MBStringWithDate();
      int64_t v45 = MBStringWithDate();
      uint64_t v46 = [v62 persona];
      v52 = [v46 personaIdentifier];
      _MBLog();

      __int16 v16 = v40;
      id v31 = v57;

      uint64_t v28 = (void *)v61;
      double v23 = v56;
    }
    id v12 = v62;
    if (!v23 && v65 && !v22) {
      __assert_rtn("-[MBBackupScheduler _fetchNextBackupDateOnWiFi:nextBackupDateOnCellular:nextBackupDateOnBattery:lastBackupDate:account:connection:error:]", "MBBackupScheduler.m", 2070, "nextBackupDateOnWiFi || !nextBackupDateOnCellular || nextBackupDateOnBattery");
    }
    id v47 = v23;
    id *v60 = v47;
    id v48 = (id) v65;
    *a4 = v48;
    id v49 = (id) v22;
    *a5 = v49;
    *a6 = v16;

    __int16 v15 = v58;
  }
  else
  {
    *a9 = v14;
  }

  return v64;
}

- (id)dateOfNextScheduledBackupWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBBackupScheduler dateOfNextScheduledBackupWithAccount:connection:error:]", "MBBackupScheduler.m", 2081, "account");
  }
  __int16 v10 = v9;
  char v25 = 0;
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = [v8 persona];
  unsigned int v12 = [v11 getBooleanValueForKey:@"EnableBackupScheduling" keyExists:&v25];

  if (!v25 || v12)
  {
    id v23 = 0;
    id v24 = 0;
    id v21 = 0;
    id v22 = 0;
    unsigned int v14 = [(MBBackupScheduler *)self _fetchNextBackupDateOnWiFi:&v24 nextBackupDateOnCellular:&v23 nextBackupDateOnBattery:&v22 lastBackupDate:&v21 account:v8 connection:v10 error:a5];
    id v15 = v24;
    id v16 = v23;
    id v17 = v22;
    id v18 = v21;
    CFStringRef v13 = 0;
    if (v14 && v15)
    {
      if (!v16 || !v17) {
        __assert_rtn("-[MBBackupScheduler dateOfNextScheduledBackupWithAccount:connection:error:]", "MBBackupScheduler.m", 2103, "nextBackupDateOnCellular && nextBackupDateOnBattery");
      }
      uint64_t v19 = [v15 earlierDate:v16];
      CFStringRef v13 = [v19 earlierDate:v17];
    }
  }
  else
  {
    CFStringRef v13 = 0;
  }

  return v13;
}

- (void)_scheduleNextBackup
{
  $3C5213C2FB734B7CA09EF95E8A7A7A2F v3 = [(MBBackupScheduler *)self conditions];
  [(MBBackupScheduler *)self _stateDidChange:0 conditions:v3];
}

- (unint64_t)_lastPendingSnapshotSizeForAccount:(id)a3
{
  id v3 = a3;
  double v4 = [v3 persona];
  id v5 = [v4 copyPreferencesValueForKey:@"LastPendingSnapshotSize" class:objc_opt_class()];

  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [v3 accountIdentifier];
    *(_DWORD *)buf = 138543874;
    CFStringRef v12 = @"LastPendingSnapshotSize";
    __int16 v13 = 2114;
    unsigned int v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=scheduler= Fetched %{public}@ for account %{public}@: %{public}@", buf, 0x20u);

    __int16 v10 = [v3 accountIdentifier];
    _MBLog();
  }
  id v8 = [v5 unsignedLongLongValue];

  return (unint64_t)v8;
}

- (void)_clearLastPendingSnapshotSizeForAccount:(id)a3
{
  id v3 = a3;
  double v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    CFStringRef v9 = @"LastPendingSnapshotSize";
    __int16 v10 = 2114;
    $3C5213C2FB734B7CA09EF95E8A7A7A2F v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=scheduler= Clearing %{public}@ for account %{public}@", buf, 0x16u);

    double v7 = [v3 accountIdentifier];
    _MBLog();
  }
  id v6 = [v3 persona];
  [v6 setPreferencesValue:0 forKey:@"LastPendingSnapshotSize"];
}

- (BOOL)_isBackupOnCellularAllowedForAccount:(id)a3
{
  id v3 = a3;
  double v4 = +[MBCKRemoteConfiguration sharedInstance];
  id v5 = [v4 valueForKey:@"AutomaticBackupOnCellularEnabled" account:v3];

  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v10 = @"AutomaticBackupOnCellularEnabled";
      __int16 v11 = 2114;
      CFStringRef v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=scheduler= %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }

    unsigned __int8 v7 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (BOOL)_fetchNextBackupDateAcrossAccountsOnWifi:(id *)a3 cellular:(id *)a4 battery:(id *)a5 error:(id *)a6
{
  [(MBBackupScheduler *)self accounts];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    id v32 = 0;
    CFStringRef v9 = 0;
    CFStringRef v10 = 0;
    uint64_t v11 = *(void *)v42;
    do
    {
      CFStringRef v12 = 0;
      id v33 = v8;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v12);
        if (objc_msgSend(v13, "isEnabledForBackup", v26))
        {
          id v39 = 0;
          id v40 = 0;
          id v37 = 0;
          id v38 = 0;
          id v36 = 0;
          unsigned __int8 v14 = [(MBBackupScheduler *)self _fetchNextBackupDateOnWiFi:&v40 nextBackupDateOnCellular:&v39 nextBackupDateOnBattery:&v38 lastBackupDate:&v37 account:v13 connection:0 error:&v36];
          id v15 = v40;
          id v16 = v39;
          id v17 = v38;
          id v35 = v37;
          id v18 = v36;
          if (v14)
          {
            uint64_t v31 = [v15 earlierDate:v10];

            uint64_t v19 = [v16 earlierDate:v9];

            uint64_t v20 = [v17 earlierDate:v32];

            id v32 = (id)v20;
            CFStringRef v9 = (void *)v19;
            CFStringRef v10 = (void *)v31;
          }
          else
          {
            id v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v46 = v18;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=scheduler= Failed to fetch the last&next backup date for account: %{public}@", buf, 0xCu);
              id v26 = v18;
              _MBLog();
            }

            [0 addObject:v18];
          }

          id v8 = v33;
        }
        CFStringRef v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v8);
  }
  else
  {
    id v32 = 0;
    CFStringRef v9 = 0;
    CFStringRef v10 = 0;
  }
  if (objc_msgSend(0, "count", v26) && (id v22 = objc_msgSend(0, "count"), v22 == objc_msgSend(obj, "count")))
  {
    if (a6)
    {
      +[MBError errorWithErrors:0];
      BOOL v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v23 = 0;
    }
    id v24 = v32;
  }
  else
  {
    if (a3) {
      *a3 = v10;
    }
    id v24 = v32;
    if (a4) {
      *a4 = v9;
    }
    if (a5) {
      *a5 = v32;
    }
    BOOL v23 = 1;
  }

  return v23;
}

- (int64_t)_scheduleBackupOnWiFi:(BOOL)a3 onCellular:(BOOL)a4 onBattery:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (!a3 && !a4) {
    __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2182, "onWiFi || onCellular");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  CFStringRef v9 = [(MBBackupScheduler *)self accounts];

  if (v9)
  {
    CFStringRef v10 = [(MBBackupScheduler *)self initiatedBackupRequest];
    if (v10)
    {
      uint64_t v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)id v123 = [v10 activityType];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=scheduler= Not scheduling automatic backup - XPC activity is running (%d)", buf, 8u);
        [v10 activityType];
        _MBLog();
      }
      int64_t v12 = 0;
      goto LABEL_104;
    }
    BOOL v111 = v5;
    uint64_t v11 = +[NSDate now];
    __uint64_t v109 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v120 = 0;
    id v121 = 0;
    id v118 = 0;
    id v119 = 0;
    unsigned __int8 v13 = [(MBBackupScheduler *)self _fetchNextBackupDateAcrossAccountsOnWifi:&v121 cellular:&v120 battery:&v119 error:&v118];
    id v14 = v121;
    unint64_t v15 = (unint64_t)v120;
    unint64_t v16 = (unint64_t)v119;
    id v17 = v118;
    if ((v13 & 1) == 0)
    {
      v113 = (void *)v15;
      unint64_t v18 = v16;
      uint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)id v123 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=scheduler= Failed to fetch the next backup date across all accounts: %@", buf, 0xCu);
        _MBLog();
      }
      int64_t v12 = -1;
      goto LABEL_102;
    }
    if (v7) {
      objc_storeStrong((id *)&self->_scheduledDateOnWiFi, v11);
    }
    if (v14)
    {
      if (!v15) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2216, "nextBackupDateOnCellular");
      }
      if (!v16) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2217, "nextBackupDateOnBattery");
      }
    }
    else
    {
      if (v15 | v16) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2212, "!nextBackupDateOnCellular && !nextBackupDateOnBattery");
      }
      id v14 = [v11 dateByAddingTimeInterval:1.0];
      unint64_t v15 = (unint64_t)v14;
      unint64_t v16 = (unint64_t)v14;
      if (!v14) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2215, "nextBackupDateOnWiFi");
      }
    }
    unint64_t v110 = v16;
    id v108 = v17;
    if (!v6)
    {
      v113 = (void *)v15;
      int64_t v12 = -1;
      if (v7)
      {
LABEL_69:
        v55 = -[NSMutableDictionary objectForKeyedSubscript:](self->_osTransactionsByActivityType, "objectForKeyedSubscript:", &off_10043A158, v96, v98, v99, *(void *)&v100, v101);

        if (!v55)
        {
          id v56 = (void *)os_transaction_create();
          [(NSMutableDictionary *)self->_osTransactionsByActivityType setObject:v56 forKeyedSubscript:&off_10043A158];

          [(MBBackupScheduler *)self _holdWorkAssertion];
        }
        if ([v11 compare:v14] == (id)1)
        {
          [v11 timeIntervalSinceDate:v14];
          double v58 = v57;
          CFStringRef v59 = MBGetDefaultLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v60 = MBStringWithDate();
            *(_DWORD *)buf = 138543618;
            *(void *)id v123 = v60;
            *(_WORD *)&v123[8] = 2048;
            uint64_t v124 = (uint64_t)v58;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "=scheduler= Last backup on WiFi was delayed (\"%{public}@\") (%llds)", buf, 0x16u);

            long long v96 = MBStringWithDate();
            uint64_t v98 = (uint64_t)v58;
            _MBLog();
          }
          uint64_t v61 = [v11 dateByAddingTimeInterval:1.0];
        }
        else
        {
          uint64_t v61 = v14;
        }
        if (!v61) {
          __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2319, "nextBackupDateOnWiFi");
        }
        [v61 timeIntervalSinceDate:v11];
        unint64_t v63 = vcvtpd_s64_f64(v62);
        if ((v63 & 0x8000000000000000) != 0) {
          __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2322, "0 <= delta");
        }
        uint64_t v64 = (120 - v63) & ~((uint64_t)(120 - v63) >> 63);
        int64_t v12 = v64 + v63;
        id v14 = [v61 dateByAddingTimeInterval:(double)v64];

        uint64_t v65 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:&off_10043A158];
        id v66 = v65;
        if (v65 && ([v65 timeIntervalSinceDate:v14], fabs(v67) <= 120.0))
        {
          __int16 v75 = MBGetDefaultLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)id v123 = v14;
            *(_WORD *)&v123[8] = 2112;
            uint64_t v124 = (uint64_t)v66;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "=scheduler= Not scheduling the next WiFi backup at %@ because there is already a DAS backup scheduled at %@", buf, 0x16u);
            long long v96 = v14;
            uint64_t v98 = (uint64_t)v66;
            _MBLog();
          }
        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextBackupDatesByActivityType, "setObject:forKeyedSubscript:", v14, &off_10043A158, v96, v98);
          unsigned __int8 v68 = [(id)objc_opt_class() backupOnWiFiWithDAS];
          xpc_object_t v69 = xpc_dictionary_create(0, 0, 0);
          id v70 = v69;
          if (v68)
          {
            xpc_dictionary_set_BOOL(v69, XPC_ACTIVITY_REPEATING, 0);
            xpc_dictionary_set_int64(v70, XPC_ACTIVITY_DELAY, v12);
            xpc_dictionary_set_BOOL(v70, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
            xpc_dictionary_set_string(v70, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
            xpc_dictionary_set_BOOL(v70, XPC_ACTIVITY_ALLOW_BATTERY, 0);
            xpc_dictionary_set_BOOL(v70, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
            xpc_dictionary_set_BOOL(v70, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
            xpc_dictionary_set_BOOL(v70, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
            xpc_dictionary_set_int64(v70, XPC_ACTIVITY_EXPECTED_DURATION, XPC_ACTIVITY_INTERVAL_4_HOURS);
            BOOL v71 = [(MBBackupScheduler *)self activityCoordinator];
            [v71 registerBackupActivity:2 criteria:v70];
          }
          else
          {
            xpc_dictionary_set_string(v69, "Type", "Monotonic");
            xpc_dictionary_set_uint64(v70, "Date", v109 + 1000000000 * v12);
            id v72 = v14;
            alarm = self->_alarm;
            self->_alarm = (OS_xpc_object *)v70;
            id v74 = v70;

            id v14 = v72;
            xpc_set_event();
          }

          __int16 v75 = MBGetDefaultLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v76 = MBStringWithDate();
            *(_DWORD *)buf = 138543618;
            *(void *)id v123 = v76;
            *(_WORD *)&v123[8] = 2048;
            uint64_t v124 = v12;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "=scheduler= Scheduled next backup on WiFi at \"%{public}@\" (%llds)", buf, 0x16u);

            long long v96 = MBStringWithDate();
            uint64_t v98 = v12;
            _MBLog();
          }
        }

        unint64_t v16 = v110;
      }
LABEL_88:
      if (!v111)
      {
LABEL_103:

LABEL_104:
        goto LABEL_105;
      }
      uint64_t v77 = os_transaction_create();
      if ([v11 compare:v16] == (id)1)
      {
        [v11 timeIntervalSinceDate:v16];
        double v79 = v78;
        id v80 = MBGetDefaultLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v81 = MBStringWithDate();
          *(_DWORD *)buf = 138543618;
          *(void *)id v123 = v81;
          *(_WORD *)&v123[8] = 2048;
          uint64_t v124 = (uint64_t)v79;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "=scheduler= Last backup on WiFi on battery was delayed (\"%{public}@\") (%llds)", buf, 0x16u);

          long long v96 = MBStringWithDate();
          uint64_t v98 = (uint64_t)v79;
          _MBLog();

          unint64_t v16 = v110;
        }

        v82 = [v11 dateByAddingTimeInterval:1.0];
      }
      else
      {
        v82 = (void *)v16;
      }
      id v107 = v14;
      if (!v82) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2369, "nextBackupDateOnBattery");
      }
      unint64_t v112 = (void *)v77;
      [v82 timeIntervalSinceDate:v11];
      unint64_t v84 = vcvtpd_s64_f64(v83);
      if ((v84 & 0x8000000000000000) != 0) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2372, "0 <= onBatteryDelta");
      }
      uint64_t v85 = (120 - v84) & ~((uint64_t)(120 - v84) >> 63);
      uint64_t v86 = [v82 dateByAddingTimeInterval:(double)v85];

      unsigned int v87 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:&off_10043A170];
      uint64_t v19 = v87;
      unint64_t v18 = v86;
      if (v87 && ([v87 timeIntervalSinceDate:v86], fabs(v88) <= 120.0))
      {
        v90 = MBGetDefaultLog();
        id v14 = v107;
        v94 = v112;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)id v123 = v86;
          *(_WORD *)&v123[8] = 2112;
          uint64_t v124 = (uint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "=scheduler= Not scheduling the next battery backup at %@ because there is already a DAS backup scheduled at %@", buf, 0x16u);
          _MBLog();
        }
      }
      else
      {
        id v105 = v11;
        int64_t v89 = v85 + v84;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextBackupDatesByActivityType, "setObject:forKeyedSubscript:", v86, &off_10043A170, v96, v98);
        v90 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_REPEATING, 0);
        xpc_dictionary_set_int64(v90, XPC_ACTIVITY_DELAY, v89);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
        xpc_dictionary_set_string(v90, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_ALLOW_BATTERY, 1);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_REQUIRE_BATTERY_LEVEL, 1);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
        xpc_dictionary_set_BOOL(v90, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
        xpc_dictionary_set_int64(v90, XPC_ACTIVITY_EXPECTED_DURATION, XPC_ACTIVITY_INTERVAL_4_HOURS);
        v91 = [(MBBackupScheduler *)self activityCoordinator];
        [v91 registerBackupActivity:3 criteria:v90];

        v92 = MBGetDefaultLog();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          id v93 = MBStringWithDate();
          *(_DWORD *)buf = 138543618;
          *(void *)id v123 = v93;
          *(_WORD *)&v123[8] = 2048;
          uint64_t v124 = v89;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "=scheduler= Scheduled next backup on battery at \"%{public}@\" (%llds)", buf, 0x16u);

          BOOL v97 = MBStringWithDate();
          _MBLog();
        }
        uint64_t v11 = v105;
        id v14 = v107;
        v94 = v112;
      }

      id v17 = v108;
LABEL_102:

      unint64_t v16 = v18;
      goto LABEL_103;
    }
    uint64_t v20 = [(NSMutableDictionary *)self->_osTransactionsByActivityType objectForKeyedSubscript:&off_10043A140];

    if (!v20)
    {
      id v21 = (void *)os_transaction_create();
      [(NSMutableDictionary *)self->_osTransactionsByActivityType setObject:v21 forKeyedSubscript:&off_10043A140];

      [(MBBackupScheduler *)self _holdWorkAssertion];
    }
    uint64_t value = (uint64_t)fmin(fmax(self->_backupPeriodOnCellular * 0.5, 600.0), 86400.0);
    if (value <= 599) {
      __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2230, "10 * 60 <= maxGrace");
    }
    if ([v11 compare:v15] == (id)1)
    {
      [v11 timeIntervalSinceDate:v15];
      uint64_t v23 = (uint64_t)v22;
      id v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        char v25 = MBStringWithDate();
        *(_DWORD *)buf = 138543618;
        *(void *)id v123 = v25;
        *(_WORD *)&v123[8] = 2048;
        uint64_t v124 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=scheduler= Last backup on cellular was delayed (\"%{public}@\") (%llds)", buf, 0x16u);

        long long v96 = MBStringWithDate();
        uint64_t v98 = v23;
        _MBLog();
      }
      id v26 = [v11 dateByAddingTimeInterval:1.0];

      if (value >= v23) {
        uint64_t v27 = v23;
      }
      else {
        uint64_t v27 = value;
      }
      uint64_t v28 = value - v27;
      if (v28 <= 600) {
        uint64_t v28 = 600;
      }
      if (!v26) {
        __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2239, "nextBackupDateOnCellular");
      }
      uint64_t value = v28;
      unint64_t v16 = v110;
    }
    else
    {
      id v26 = (void *)v15;
    }
    objc_msgSend(v26, "timeIntervalSinceDate:", v11, v96, v98);
    unint64_t v30 = vcvtpd_s64_f64(v29);
    if ((v30 & 0x8000000000000000) != 0) {
      __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2241, "0 <= delta");
    }
    uint64_t v31 = (120 - v30) & ~((uint64_t)(120 - v30) >> 63);
    int64_t v12 = v31 + v30;
    uint64_t v32 = [v26 dateByAddingTimeInterval:(double)v31];

    id v33 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:&off_10043A140];
    id v34 = v33;
    v113 = (void *)v32;
    if (v33)
    {
      [v33 timeIntervalSinceDate:v32];
      if (fabs(v35) <= 120.0)
      {
        int64_t v45 = MBGetDefaultLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)id v123 = v32;
          *(_WORD *)&v123[8] = 2112;
          uint64_t v124 = (uint64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "=scheduler= Not scheduling the next cellular backup at %@ because there is a DAS backup scheduled at %@", buf, 0x16u);
          long long v96 = (void *)v32;
          uint64_t v98 = (uint64_t)v34;
          _MBLog();
        }
LABEL_68:

        id v17 = v108;
        if (v7) {
          goto LABEL_69;
        }
        goto LABEL_88;
      }
    }
    unint64_t v102 = v34;
    [(NSMutableDictionary *)self->_nextBackupDatesByActivityType setObject:v32 forKeyedSubscript:&off_10043A140];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v36 = [(MBBackupScheduler *)self accounts];
    id v37 = [v36 countByEnumeratingWithState:&v114 objects:v131 count:16];
    unint64_t v104 = v11;
    if (v37)
    {
      id v38 = v37;
      id v106 = v14;
      unint64_t v39 = 0;
      uint64_t v40 = *(void *)v115;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v115 != v40) {
            objc_enumerationMutation(v36);
          }
          long long v42 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          if ([v42 isEnabled]) {
            v39 += [(MBBackupScheduler *)self _lastPendingSnapshotSizeForAccount:v42];
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v114 objects:v131 count:16];
      }
      while (v38);

      BOOL v43 = v39 >> 21 < 0x7D;
      double v44 = (double)v39;
      if (v39 >> 22 > 0x7C)
      {
        double v46 = 209715200.0;
        id v14 = v106;
        goto LABEL_59;
      }
      id v14 = v106;
    }
    else
    {

      unint64_t v39 = 0;
      BOOL v43 = 1;
      double v44 = 0.0;
    }
    double v46 = 157286400.0;
LABEL_59:
    if (!v43) {
      double v44 = v46;
    }
    double v47 = round(fmax(v44, 75497472.0) * 9.31322575e-10 * 100.0) / 100.0;
    if (v47 <= 0.0 || v47 > 1.0) {
      __assert_rtn("-[MBBackupScheduler _scheduleBackupOnWiFi:onCellular:onBattery:]", "MBBackupScheduler.m", 2282, "0.0 < minCellularBudgetPercentage && minCellularBudgetPercentage <= 1.0");
    }
    int64_t v45 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v45, XPC_ACTIVITY_REPEATING, 0);
    xpc_dictionary_set_int64(v45, XPC_ACTIVITY_DELAY, v12);
    xpc_dictionary_set_int64(v45, XPC_ACTIVITY_GRACE_PERIOD, value);
    xpc_dictionary_set_BOOL(v45, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_dictionary_set_BOOL(v45, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, ![(MBBackupScheduler *)self allowBackupOnExpensiveCellular]);
    xpc_dictionary_set_string(v45, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v45, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v45, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
    xpc_dictionary_set_int64(v45, XPC_ACTIVITY_NETWORK_UPLOAD_SIZE, v39);
    xpc_dictionary_set_BOOL(v45, XPC_ACTIVITY_USES_DATA_BUDGETING, 1);
    xpc_dictionary_set_int64(v45, XPC_ACTIVITY_EXPECTED_DURATION, XPC_ACTIVITY_INTERVAL_4_HOURS);
    xpc_object_t v49 = xpc_dictionary_create(0, 0, 0);
    __int16 v50 = (const char *)[_DASCTSMinDataBudgetPercentRemainingKey UTF8String];
    xpc_object_t v51 = xpc_double_create(v47);
    xpc_dictionary_set_value(v49, v50, v51);

    xpc_dictionary_set_value(v45, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA, v49);
    v52 = [(MBBackupScheduler *)self activityCoordinator];
    [v52 registerBackupActivity:1 criteria:v45];

    v53 = MBGetDefaultLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = MBStringWithDate();
      *(_DWORD *)buf = 138544386;
      *(void *)id v123 = v54;
      *(_WORD *)&v123[8] = 2048;
      uint64_t v124 = v12;
      __int16 v125 = 2048;
      unint64_t v126 = v39;
      __int16 v127 = 2048;
      double v128 = v47;
      __int16 v129 = 2114;
      long long v130 = v45;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "=scheduler= Scheduled next backup on cellular at \"%{public}@\" (delta:%llds, estimatedUploadSize:%llu, minCellularBudgetPercentage:%.2f): %{public}@", buf, 0x34u);

      MBStringWithDate();
      unint64_t v101 = v45;
      double v100 = v47;
      uint64_t v98 = v12;
      long long v96 = v99 = v39;
      _MBLog();
    }
    int64_t v12 = -1;
    uint64_t v11 = v104;
    unint64_t v16 = v110;
    id v34 = v102;
    goto LABEL_68;
  }
  CFStringRef v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v123 = v7;
    *(_WORD *)&v123[4] = 1024;
    *(_DWORD *)&v123[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "=scheduler= Not scheduling automatic backup - no accounts, onWiFi:%d, onCellular:%d", buf, 0xEu);
    _MBLog();
  }
  int64_t v12 = -1;
LABEL_105:

  return v12;
}

- (void)_tearDownScheduledBackupWithActivityType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v3 == 2)
  {
    [(MBBackupScheduler *)self _cancelLossTimers];
    if (self->_alarm)
    {
      BOOL v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v6 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:&off_10043A158];
        MBStringWithDate();
        BOOL v7 = (char *)objc_claimAutoreleasedReturnValue();
        id v8 = MBStringWithDate();
        *(_DWORD *)buf = 138543618;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=scheduler= Canceling the backup alarm (WiFi) scheduled for \"%{public}@\" (scheduled at \"%{public}@\")", buf, 0x16u);

        CFStringRef v9 = [(NSMutableDictionary *)self->_nextBackupDatesByActivityType objectForKeyedSubscript:&off_10043A158];
        CFStringRef v10 = MBStringWithDate();
        MBStringWithDate();
        double v22 = v21 = v10;
        _MBLog();
      }
      alarm = self->_alarm;
      self->_alarm = 0;

      [(MBBackupScheduler *)self _cancelAlarm];
    }
  }
  osTransactionsByActivityType = self->_osTransactionsByActivityType;
  unsigned __int8 v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3, v21, v22);
  id v14 = [(NSMutableDictionary *)osTransactionsByActivityType objectForKeyedSubscript:v13];

  if (v14)
  {
    unint64_t v15 = self->_osTransactionsByActivityType;
    unint64_t v16 = +[NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v15 setObject:0 forKeyedSubscript:v16];

    [(MBBackupScheduler *)self _releaseWorkAssertion];
  }
  nextBackupDatesByActivityType = self->_nextBackupDatesByActivityType;
  unint64_t v18 = +[NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)nextBackupDatesByActivityType setObject:0 forKeyedSubscript:v18];

  uint64_t v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = MBBackupXPCActivityNameWithType(v3);
    *(_DWORD *)buf = 136315138;
    id v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=scheduler= Canceled scheduled backup: %s", buf, 0xCu);
    MBBackupXPCActivityNameWithType(v3);
    _MBLog();
  }
}

- (void)_registerAlarmHandler
{
  stateQueue = self->_stateQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10022BA94;
  handler[3] = &unk_100416B60;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.alarm", stateQueue, handler);
}

- (void)_cancelAlarm
{
  xpc_set_event();
  unsigned int v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v4 = "com.apple.backupd.alarm";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "=scheduler= Canceled alarm (\"%s\")", buf, 0xCu);
    _MBLog();
  }
}

- (void)_handleAlarm
{
  [(MBBackupScheduler *)self _holdWorkAssertion];
  [(MBBackupScheduler *)self _tearDownScheduledBackupWithActivityType:2];
  [(MBBackupScheduler *)self _releaseWorkAssertion];
}

- (BOOL)_startBackupRequestForActivity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  BOOL v5 = [(MBBackupScheduler *)self initiatedBackupRequest];

  if (!v5)
  {
    BOOL v6 = objc_opt_new();
    switch(v3)
    {
      case 3:
        uint64_t v11 = 5;
        break;
      case 2:
        uint64_t v11 = 2;
        break;
      case 1:
        CFStringRef v10 = objc_opt_new();
        [v10 setAllowsExpensiveNetworkAccess:0];
        [v10 setAllowsConstrainedNetworkAccess:0];
        [v6 setCellularAccess:v10];

        uint64_t v11 = 4;
        break;
      default:
        __assert_rtn("-[MBBackupScheduler _startBackupRequestForActivity:]", "MBBackupScheduler.m", 2475, "0");
    }
    CFStringRef v9 = [[MBAutomaticBackupRequest alloc] initWithReason:v11 activityType:v3 options:v6];
    if ([(MBBackupScheduler *)self _startBackupForNextAvailableAccountWithRequest:v9])
    {
      [(MBBackupScheduler *)self setInitiatedBackupRequest:v9];
      objc_initWeak((id *)buf, self);
      unsigned __int8 v13 = [(MBBackupScheduler *)self activityCoordinator];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10022BFF8;
      v16[3] = &unk_100416B88;
      objc_copyWeak(&v18, (id *)buf);
      CFStringRef v9 = v9;
      id v17 = v9;
      [v13 pollForBackupActivityDeferrals:v3 block:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      id v14 = [(MBBackupScheduler *)self initiatedBackupRequest];
      if (!v14) {
        __assert_rtn("-[MBBackupScheduler _startBackupRequestForActivity:]", "MBBackupScheduler.m", 2495, "!started || self.initiatedBackupRequest");
      }

      BOOL v12 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = MBBackupXPCActivityNameWithType(v3);
    id v8 = [(MBBackupScheduler *)self initiatedBackupRequest];
    *(_DWORD *)buf = 136446466;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    double v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=scheduler= Ignoring ready XPC activity \"%{public}s\", backup already initiated %@", buf, 0x16u);

    MBBackupXPCActivityNameWithType(v3);
    CFStringRef v9 = [(MBBackupScheduler *)self initiatedBackupRequest];
    _MBLog();
    goto LABEL_14;
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (void)backupActivityIsRunnable:(int)a3
{
  if (!a3) {
    __assert_rtn("-[MBBackupScheduler backupActivityIsRunnable:]", "MBBackupScheduler.m", 2500, "xpcActivityType != kMBBackupReasonUnspecified");
  }
  BOOL v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = MBBackupXPCActivityNameWithType(a3);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=scheduler= Received ready XPC activity \"%{public}s\"", buf, 0xCu);
    MBBackupXPCActivityNameWithType(a3);
    _MBLog();
  }

  BOOL v6 = (void *)os_transaction_create();
  BOOL v7 = [(MBBackupScheduler *)self firstConditionsGroup];
  if (!v7) {
    goto LABEL_11;
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=scheduler= Waiting for all conditions to update", buf, 2u);
    _MBLog();
  }

  dispatch_time_t v9 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(v7, v9))
  {
    CFStringRef v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=scheduler= Timed out waiting for all conditions to update", buf, 2u);
      _MBLog();
    }

    stateQueue = self->_stateQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10022C394;
    v19[3] = &unk_100416BD0;
    int v21 = a3;
    BOOL v12 = &v20;
    void v19[4] = self;
    uint64_t v20 = v6;
    id v13 = v6;
    id v14 = v19;
  }
  else
  {
LABEL_11:
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022C3E0;
    block[3] = &unk_100416BD0;
    int v18 = a3;
    BOOL v12 = &v17;
    void block[4] = self;
    id v17 = v6;
    id v15 = v6;
    id v14 = block;
  }
  dispatch_async(stateQueue, v14);
}

+ (BOOL)backupOnWiFiWithDAS
{
  if (qword_100482718 != -1) {
    dispatch_once(&qword_100482718, &stru_100416BA8);
  }
  return byte_10047F240;
}

- (MBNetworkPathMonitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
}

- (OS_dispatch_group)firstConditionsGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFirstConditionsGroup:(id)a3
{
}

- (OS_xpc_object)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
}

- (NSDate)scheduledDateOnWiFi
{
  return self->_scheduledDateOnWiFi;
}

- (void)setScheduledDateOnWiFi:(id)a3
{
}

- (NSMutableDictionary)nextBackupDatesByActivityType
{
  return self->_nextBackupDatesByActivityType;
}

- (void)setNextBackupDatesByActivityType:(id)a3
{
}

- (NSMutableDictionary)osTransactionsByActivityType
{
  return self->_osTransactionsByActivityType;
}

- (void)setOsTransactionsByActivityType:(id)a3
{
}

- (NSDate)lastOnConditionDate
{
  return self->_lastOnConditionDate;
}

- (void)setLastOnConditionDate:(id)a3
{
}

- (int64_t)nextBackupDelta
{
  return self->_nextBackupDelta;
}

- (void)setNextBackupDelta:(int64_t)a3
{
  self->_nextBackupDelta = a3;
}

- (int64_t)ignoredLastOnConditionEvent
{
  return self->_ignoredLastOnConditionEvent;
}

- (void)setIgnoredLastOnConditionEvent:(int64_t)a3
{
  self->_ignoredLastOnConditionEvent = a3;
}

- (unint64_t)lastOnConditionChargingType
{
  return self->_lastOnConditionChargingType;
}

- (void)setLastOnConditionChargingType:(unint64_t)a3
{
  self->_lastOnConditionChargingType = a3;
}

- (double)backupPeriod
{
  return self->_backupPeriod;
}

- (void)setBackupPeriod:(double)a3
{
  self->_backupPeriod = a3;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (NSMutableArray)accountsToBackup
{
  return self->_accountsToBackup;
}

- (void)setAccountsToBackup:(id)a3
{
}

- (NSDate)dateOfLastUnlockSeenByDaemon
{
  return self->_dateOfLastUnlockSeenByDaemon;
}

- (void)setDateOfLastUnlockSeenByDaemon:(id)a3
{
}

- (id)internalNotificationRef
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setInternalNotificationRef:(id)a3
{
}

- (BOOL)allowBackupOnExpensiveCellular
{
  return self->_allowBackupOnExpensiveCellular;
}

- (void)setAllowBackupOnExpensiveCellular:(BOOL)a3
{
  self->_allowBackupOnExpensiveCellular = a3;
}

- (NSObject)backupObserver
{
  return self->_backupObserver;
}

- (void)setBackupObserver:(id)a3
{
}

- (MBXPCActivityCoordinator)activityCoordinator
{
  return self->_activityCoordinator;
}

- (void)setActivityCoordinator:(id)a3
{
}

- (MBAutomaticBackupRequest)initiatedBackupRequest
{
  return self->_initiatedBackupRequest;
}

- (void)setInitiatedBackupRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatedBackupRequest, 0);
  objc_storeStrong((id *)&self->_activityCoordinator, 0);
  objc_storeStrong((id *)&self->_backupObserver, 0);
  objc_storeStrong(&self->_internalNotificationRef, 0);
  objc_storeStrong((id *)&self->_dateOfLastUnlockSeenByDaemon, 0);
  objc_storeStrong((id *)&self->_accountsToBackup, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_lastOnConditionDate, 0);
  objc_storeStrong((id *)&self->_osTransactionsByActivityType, 0);
  objc_storeStrong((id *)&self->_nextBackupDatesByActivityType, 0);
  objc_storeStrong((id *)&self->_scheduledDateOnWiFi, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_firstConditionsGroup, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_wifiLossTimer, 0);
  objc_storeStrong((id *)&self->_powerLossTimer, 0);
  objc_storeStrong((id *)&self->_followUpQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

@end