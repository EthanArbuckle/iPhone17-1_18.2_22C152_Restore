@interface MBUEAPlugin
- (BOOL)_isWithinBackupPeriodOnPower:(BOOL)a3;
- (BOOL)_updateEnabledStateForAccount:(id)a3;
- (BOOL)_updateGlobalEnabledState;
- (BOOL)enabled;
- (BOOL)isBackupOnCellularEnabled;
- (BOOL)isEnabled;
- (BOOL)isLocked;
- (BOOL)isOnCellular;
- (BOOL)isOnPower;
- (BOOL)isOnWiFi;
- (BOOL)wakeBackupOnDisconnect;
- (MBUEAPlugin)initWithEventQueue:(id)a3;
- (NSMutableSet)accountsWithBackupEnabled;
- (NSMutableSet)accountsWithBackupOnCellularEnabled;
- (id)_lastBackupDate;
- (void)_boostBackgroundRestore:(unint64_t)a3;
- (void)_clearEnabledStateForAccount:(id)a3;
- (void)_handleAccountChange:(int64_t)a3 account:(id)a4;
- (void)_install;
- (void)_notifyDaemonOfAccountChange:(id)a3;
- (void)_pcTimerFired:(id)a3;
- (void)_refetchAllAccounts;
- (void)_stateDidChange;
- (void)_updatePCTimer;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didFailRestoreWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidCancelRestore:(id)a3;
- (void)managerDidFinishBackup:(id)a3;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)notifyDaemonThatKeyBagIsLocking;
- (void)notifyDaemonThatKeyBagIsUnlocked;
- (void)setAccountsWithBackupEnabled:(id)a3;
- (void)setAccountsWithBackupOnCellularEnabled:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsOnCellular:(BOOL)a3;
- (void)setIsOnPower:(BOOL)a3;
- (void)setIsOnWiFi:(BOOL)a3;
- (void)setWakeBackupOnDisconnect:(BOOL)a3;
@end

@implementation MBUEAPlugin

- (MBUEAPlugin)initWithEventQueue:(id)a3
{
  id v5 = a3;
  if (!v5) {
    sub_853C();
  }
  v6 = v5;
  v20.receiver = self;
  v20.super_class = (Class)MBUEAPlugin;
  v7 = [(MBUEAPlugin *)&v20 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_eventQueue, a3);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MobileBackup.UEA.notifications", v10);
    notificationQueue = v8->_notificationQueue;
    v8->_notificationQueue = (OS_dispatch_queue *)v11;

    v13 = (MBManager *)[objc_alloc((Class)MBManager) initWithDelegate:v8];
    manager = v8->_manager;
    v8->_manager = v13;

    *(void *)&v8->_enabledToken = -1;
    uint64_t v15 = objc_opt_new();
    accountsWithBackupEnabled = v8->_accountsWithBackupEnabled;
    v8->_accountsWithBackupEnabled = (NSMutableSet *)v15;

    uint64_t v17 = objc_opt_new();
    accountsWithBackupOnCellularEnabled = v8->_accountsWithBackupOnCellularEnabled;
    v8->_accountsWithBackupOnCellularEnabled = (NSMutableSet *)v17;

    [(MBUEAPlugin *)v8 _install];
  }

  return v8;
}

- (void)dealloc
{
  [(MBUEAPlugin *)self cancel];
  int enabledToken = self->_enabledToken;
  if (enabledToken != -1) {
    notify_cancel(enabledToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)MBUEAPlugin;
  [(MBUEAPlugin *)&v4 dealloc];
}

- (void)cancel
{
  networkMonitor = self->_networkMonitor;
  if (networkMonitor)
  {
    nw_path_monitor_cancel((nw_path_monitor_t)networkMonitor);
    objc_super v4 = self->_networkMonitor;
    self->_networkMonitor = 0;
  }
  int screenLockedToken = self->_screenLockedToken;
  if (screenLockedToken != -1)
  {
    notify_cancel(screenLockedToken);
    self->_int screenLockedToken = -1;
  }
  int powerToken = self->_powerToken;
  if (powerToken != -1)
  {
    notify_cancel(powerToken);
    self->_int powerToken = -1;
  }
  int keybagToken = self->_keybagToken;
  if (keybagToken != -1)
  {
    notify_cancel(keybagToken);
    self->_int keybagToken = -1;
  }
  pcTimer = self->_pcTimer;
  if (pcTimer)
  {
    [(PCPersistentTimer *)pcTimer invalidate];
    v9 = self->_pcTimer;
    self->_pcTimer = 0;
  }
  int restoreStateChangedToken = self->_restoreStateChangedToken;
  if (restoreStateChangedToken != -1)
  {
    notify_cancel(restoreStateChangedToken);
    self->_int restoreStateChangedToken = -1;
  }
}

- (void)_install
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (!self->_manager) {
    sub_8568();
  }
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)ACMonitoredAccountStore);
  objc_super v4 = +[NSSet setWithObject:ACAccountTypeIdentifierAppleAccount];
  id v5 = (ACMonitoredAccountStore *)[v3 initWithAccountTypes:v4 delegate:self];
  accountStore = self->_accountStore;
  self->_accountStore = v5;

  v7 = self->_accountStore;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_54F4;
  v46[3] = &unk_C330;
  objc_copyWeak(&v47, &location);
  [(ACMonitoredAccountStore *)v7 registerWithCompletion:v46];
  self->_int keybagToken = -1;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_57B0;
  v44[3] = &unk_C358;
  objc_copyWeak(&v45, &location);
  v8 = objc_retainBlock(v44);
  v9 = (const char *)kMobileKeyBagLockStatusNotifyToken;
  uint32_t v10 = notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &self->_keybagToken, (dispatch_queue_t)self->_eventQueue, v8);
  if (v10)
  {
    self->_int keybagToken = -1;
    dispatch_queue_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v50 = v9;
      __int16 v51 = 1024;
      uint32_t v52 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}s) failed: %u", buf, 0x12u);
      _MBLog();
    }
  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_58EC;
  v42[3] = &unk_C358;
  objc_copyWeak(&v43, &location);
  v12 = objc_retainBlock(v42);
  self->_int screenLockedToken = -1;
  v13 = (const char *)kSBSLockStateNotifyKey;
  uint32_t v14 = notify_register_dispatch(kSBSLockStateNotifyKey, &self->_screenLockedToken, (dispatch_queue_t)self->_eventQueue, v12);
  if (v14)
  {
    self->_int screenLockedToken = -1;
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v50 = v13;
      __int16 v51 = 1024;
      uint32_t v52 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}s) failed: %u", buf, 0x12u);
      _MBLog();
    }
  }
  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5A08;
  block[3] = &unk_C380;
  block[4] = self;
  uint64_t v17 = v12;
  id v40 = v17;
  v29 = v8;
  id v41 = v29;
  dispatch_async((dispatch_queue_t)eventQueue, block);
  v18 = (void *)CFPreferencesCopyValue(@"IgnorePowerState", @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
  atomic_store([v18 BOOLValue], (unsigned __int8 *)&self->_ignorePowerState);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_5A80;
  v37[3] = &unk_C358;
  objc_copyWeak(&v38, &location);
  v19 = objc_retainBlock(v37);
  self->_int powerToken = -1;
  uint32_t v20 = notify_register_dispatch("com.apple.system.powersources.source", &self->_powerToken, (dispatch_queue_t)self->_eventQueue, v19);
  if (v20)
  {
    self->_int powerToken = -1;
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v50 = "com.apple.system.powersources.source";
      __int16 v51 = 1024;
      uint32_t v52 = v20;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}s) failed: %u", buf, 0x12u);
      _MBLog();
    }
  }
  else
  {
    v22 = self->_eventQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_5B7C;
    v35[3] = &unk_C3A8;
    v35[4] = self;
    v36 = v19;
    dispatch_async((dispatch_queue_t)v22, v35);
    v21 = v36;
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_5B94;
  v33[3] = &unk_C358;
  objc_copyWeak(&v34, &location);
  v23 = objc_retainBlock(v33);
  v24 = (const char *)kMBManagerRestoreStateChangedNotification;
  p_int restoreStateChangedToken = &self->_restoreStateChangedToken;
  uint32_t v26 = notify_register_dispatch((const char *)[kMBManagerRestoreStateChangedNotification UTF8String], &self->_restoreStateChangedToken, (dispatch_queue_t)self->_eventQueue, v23);
  if (v26)
  {
    *p_int restoreStateChangedToken = -1;
    v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v50 = v24;
      __int16 v51 = 1024;
      uint32_t v52 = v26;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}@) failed: %u", buf, 0x12u);
      _MBLog();
    }
  }
  else
  {
    ((void (*)(void *, void))v23[2])(v23, *p_restoreStateChangedToken);
  }
  v28 = nw_path_monitor_create();
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472;
  update_handler[2] = sub_5BD8;
  update_handler[3] = &unk_C3D0;
  objc_copyWeak(&v31, &location);
  uint32_t v32 = v26;
  nw_path_monitor_set_update_handler(v28, update_handler);
  nw_path_monitor_set_queue(v28, (dispatch_queue_t)self->_eventQueue);
  objc_storeStrong((id *)&self->_networkMonitor, v28);
  nw_path_monitor_start(v28);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)_boostBackgroundRestore:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  int restoreStateChangedToken = self->_restoreStateChangedToken;
  if (notify_is_valid_token(restoreStateChangedToken))
  {
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(restoreStateChangedToken, &state64);
    if (state)
    {
      v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        unint64_t v16 = kMBManagerRestoreStateChangedNotification;
        __int16 v17 = 1024;
        LODWORD(v18) = state;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "notify_get_state for %{public}@ failed: %du", buf, 0x12u);
        _MBLog();
      }
    }
    else if (state64 == 2)
    {
      objc_initWeak(&location, self);
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v16 = a3;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Attempting to boost background restore (%llu)", buf, 0xCu);
        _MBLog();
      }

      manager = self->_manager;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_60AC;
      v11[3] = &unk_C420;
      v12[1] = (id)a3;
      objc_copyWeak(v12, &location);
      [(MBManager *)manager boostBackgroundRestoreWithCompletionHandler:v11];
      objc_destroyWeak(v12);
      objc_destroyWeak(&location);
    }
    else if (a3)
    {
      uint32_t v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v16 = state64;
        __int16 v17 = 2048;
        unint64_t v18 = a3;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Not boosting background restore for restoreState:%llu (%llu)", buf, 0x16u);
        _MBLog();
      }
    }
  }
}

- (id)_lastBackupDate
{
  v2 = (void *)CFPreferencesCopyValue(@"BackupStateInfo", @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
  id v3 = [v2 objectForKeyedSubscript:@"errors"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint32_t v10 = [v9 objectForKeyedSubscript:@"code"];
        if (![v10 longValue])
        {
          uint64_t v11 = [v9 objectForKeyedSubscript:@"date"];

          v6 = (void *)v11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isWithinBackupPeriodOnPower:(BOOL)a3
{
  id v4 = [(MBUEAPlugin *)self _lastBackupDate];
  if (v4)
  {
    id v5 = +[NSDate now];
    v6 = (void *)CFPreferencesCopyValue(@"BackupPeriod", @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      double v9 = v8;
    }
    else
    {
      double v9 = 86400.0;
    }

    uint64_t v11 = (void *)CFPreferencesCopyValue(@"BackupPeriodOnBattery", @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
    v12 = v11;
    if (v11)
    {
      [v11 doubleValue];
      double v14 = v13;
    }
    else
    {
      double v14 = 604800.0;
    }
    [v5 timeIntervalSinceDate:v4];
    double v16 = v15;
    __int16 v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint32_t v20 = v4;
      __int16 v21 = 2048;
      double v22 = v9;
      __int16 v23 = 2048;
      double v24 = v14;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Last successful backup was %@, backupPeriod: %f(%f)", buf, 0x20u);
      _MBLog();
    }

    if (v16 < v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v16 < v14) & ~a3;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_stateDidChange
{
  unsigned int v3 = [(MBUEAPlugin *)self isEnabled];
  BOOL v4 = [(MBUEAPlugin *)self isOnPower];
  unsigned int v5 = [(MBUEAPlugin *)self isLocked];
  unsigned int v6 = [(MBUEAPlugin *)self isOnWiFi];
  unsigned int v7 = [(MBUEAPlugin *)self isOnCellular];
  unsigned int v8 = [(MBUEAPlugin *)self isBackupOnCellularEnabled];
  double v9 = (void *)CFPreferencesCopyValue(@"AllowBackupOnBattery", @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
  unsigned int v10 = [v9 BOOLValue];
  unsigned int v11 = v10;
  if (!v3 || (v4 | v10 ? (v12 = v5 == 0) : (v12 = 1), !v12 ? (BOOL v13 = (v6 | v7 & v8) == 0) : (BOOL v13 = 1), v13))
  {
    __int16 v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110656;
      unsigned int v21 = v3;
      __int16 v22 = 1024;
      BOOL v23 = v4;
      __int16 v24 = 1024;
      unsigned int v25 = v11;
      __int16 v26 = 1024;
      unsigned int v27 = v5;
      __int16 v28 = 1024;
      unsigned int v29 = v6;
      __int16 v30 = 1024;
      unsigned int v31 = v7;
      __int16 v32 = 1024;
      unsigned int v33 = v8;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "Not waking up backupd, enabled:%d, onPower:%d(%d), locked:%d, onWiFi:%d, onCellular:%d, backupOnCellularEnabled:%d", buf, 0x2Cu);
      _MBLog();
    }
  }
  else
  {
    unsigned int v14 = [(MBUEAPlugin *)self _isWithinBackupPeriodOnPower:v4];
    double v15 = MBGetDefaultLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Not waking backupd up prematurely", buf, 2u);
        _MBLog();
      }
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Waking backupd", buf, 2u);
        _MBLog();
      }

      notificationQueue = self->_notificationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_6998;
      block[3] = &unk_C448;
      block[4] = self;
      dispatch_async((dispatch_queue_t)notificationQueue, block);
    }
  }
}

- (BOOL)isEnabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isEnabled);
  return v2 & 1;
}

- (BOOL)isBackupOnCellularEnabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isBackupOnCellularEnabled);
  return v2 & 1;
}

- (void)setIsOnPower:(BOOL)a3
{
  if (((((atomic_exchange((atomic_uchar *volatile)&self->_isOnPower, a3) & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    unsigned int v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v7 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "isOnPower changed: %d", buf, 8u);
      _MBLog();
    }

    [(MBUEAPlugin *)self _stateDidChange];
  }
}

- (BOOL)isOnPower
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_ignorePowerState);
  if (v2) {
    return 1;
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isOnPower);
  return v3 & 1;
}

- (void)setIsLocked:(BOOL)a3
{
  if (((((atomic_exchange((atomic_uchar *volatile)&self->_isLocked, a3) & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    unsigned int v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v7 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "isLocked changed: %d", buf, 8u);
      _MBLog();
    }

    [(MBUEAPlugin *)self _stateDidChange];
  }
}

- (BOOL)isLocked
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isLocked);
  return v2 & 1;
}

- (void)setIsOnWiFi:(BOOL)a3
{
  if (((((atomic_exchange((atomic_uchar *volatile)&self->_isOnWiFi, a3) & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    unsigned int v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v7 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "isOnWiFi changed: %d", buf, 8u);
      _MBLog();
    }

    [(MBUEAPlugin *)self _stateDidChange];
  }
}

- (BOOL)isOnWiFi
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isOnWiFi);
  return v2 & 1;
}

- (void)setIsOnCellular:(BOOL)a3
{
  if (((((atomic_exchange((atomic_uchar *volatile)&self->_isOnCellular, a3) & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    unsigned int v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v7 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "isOnCellular changed: %d", buf, 8u);
      _MBLog();
    }

    [(MBUEAPlugin *)self _stateDidChange];
  }
}

- (BOOL)isOnCellular
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isOnCellular);
  return v2 & 1;
}

- (void)setWakeBackupOnDisconnect:(BOOL)a3
{
}

- (BOOL)wakeBackupOnDisconnect
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_wakeBackupOnDisconnect);
  return v2 & 1;
}

- (void)_updatePCTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  unsigned int v3 = [(MBUEAPlugin *)self isEnabled];
  pcTimer = self->_pcTimer;
  if (v3)
  {
    if (!pcTimer)
    {
      unsigned int v5 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"MobileBackupRegularWake" serviceIdentifier:self target:"_pcTimerFired:" selector:0 userInfo:86400.0];
      unsigned int v6 = self->_pcTimer;
      self->_pcTimer = v5;

      BOOL v7 = self->_pcTimer;
      eventQueue = self->_eventQueue;
      [(PCPersistentTimer *)v7 scheduleInQueue:eventQueue];
    }
  }
  else if (pcTimer)
  {
    [(PCPersistentTimer *)pcTimer invalidate];
    double v9 = self->_pcTimer;
    self->_pcTimer = 0;
  }
}

- (void)_pcTimerFired:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  BOOL v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "PC timer fired", buf, 2u);
    _MBLog();
  }

  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_70E4;
  block[3] = &unk_C448;
  block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
  pcTimer = self->_pcTimer;
  self->_pcTimer = 0;

  [(MBUEAPlugin *)self _updatePCTimer];
}

- (void)accountWasAdded:(id)a3
{
}

- (void)accountWasModified:(id)a3
{
}

- (void)accountWasRemoved:(id)a3
{
}

- (void)accountCredentialChanged:(id)a3
{
}

- (void)_handleAccountChange:(int64_t)a3 account:(id)a4
{
  id v6 = a4;
  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7208;
  block[3] = &unk_C470;
  unsigned int v11 = self;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)eventQueue, block);
}

- (void)_refetchAllAccounts
{
  unsigned __int8 v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Refetching all accounts", buf, 2u);
    _MBLog();
  }

  __int16 v24 = objc_opt_new();
  BOOL v23 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  id v3 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    uint64_t v6 = kAccountDataclassBackup;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "identifier", v19, v20, v21, v22);
        unsigned int v10 = [v8 isEnabledForDataclass:v6];
        unsigned int v11 = objc_msgSend(v8, "aa_isPrimaryEmailVerified");
        unsigned int v12 = v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13) {
          [v24 addObject:v9];
        }
        manager = self->_manager;
        id v27 = 0;
        id v15 = [(MBManager *)manager isBackupOnCellularAllowedWithAccount:v8 error:&v27];
        id v16 = v27;
        if (v16)
        {
          __int16 v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unsigned int v33 = v8;
            __int16 v34 = 2112;
            *(void *)v35 = v16;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Failed to check if backup on cellular is allowed for %@: %@", buf, 0x16u);
            v19 = v8;
            id v20 = v16;
            _MBLog();
          }

          id v15 = 0;
        }
        else if (v15)
        {
          [v23 addObject:v9];
          id v15 = &dword_0 + 1;
        }
        unint64_t v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          unsigned int v33 = v9;
          __int16 v34 = 1024;
          *(_DWORD *)v35 = v10;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v12;
          __int16 v36 = 1024;
          int v37 = (int)v15;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Found account %@ (%d,%d,%d)", buf, 0x1Eu);
          uint64_t v21 = v12;
          id v22 = v15;
          v19 = v9;
          id v20 = (id)v10;
          _MBLog();
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v4);
  }

  [(MBUEAPlugin *)self setAccountsWithBackupEnabled:v24];
  [(MBUEAPlugin *)self setAccountsWithBackupOnCellularEnabled:v23];
}

- (BOOL)_updateEnabledStateForAccount:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v5 = [v4 identifier];
  if (!v5)
  {
    [(MBUEAPlugin *)self _refetchAllAccounts];
    LOBYTE(self) = 1;
    goto LABEL_27;
  }
  unsigned int v6 = objc_msgSend(v4, "aa_isPrimaryEmailVerified");
  if (v6) {
    unsigned int v7 = [v4 isEnabledForDataclass:kAccountDataclassBackup];
  }
  else {
    unsigned int v7 = 0;
  }
  id v8 = [(MBUEAPlugin *)self accountsWithBackupEnabled];
  unsigned int v9 = [v8 containsObject:v5];

  if (!v7 || (v9 & 1) != 0)
  {
    if ((v7 | v9 ^ 1)) {
      goto LABEL_12;
    }
    unsigned int v10 = [(MBUEAPlugin *)self accountsWithBackupEnabled];
    [v10 removeObject:v5];
  }
  else
  {
    unsigned int v10 = [(MBUEAPlugin *)self accountsWithBackupEnabled];
    [v10 addObject:v5];
  }

LABEL_12:
  manager = self->_manager;
  id v22 = 0;
  unsigned int v12 = [(MBManager *)manager isBackupOnCellularAllowedWithAccount:v4 error:&v22];
  id v13 = v22;
  if (v13)
  {
    unsigned int v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v4;
      __int16 v25 = 2112;
      *(void *)__int16 v26 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Failed to check if backup on cellular is allowed for %@: %@", buf, 0x16u);
      id v20 = v4;
      id v21 = v13;
      _MBLog();
    }

    unsigned int v12 = 0;
  }
  id v15 = [(MBUEAPlugin *)self accountsWithBackupOnCellularEnabled];
  unsigned int v16 = [v15 containsObject:v5];

  if (v12 && (v16 & 1) == 0)
  {
    __int16 v17 = [(MBUEAPlugin *)self accountsWithBackupOnCellularEnabled];
    [v17 addObject:v5];
LABEL_21:

    goto LABEL_22;
  }
  if (((v12 | v16 ^ 1) & 1) == 0)
  {
    __int16 v17 = [(MBUEAPlugin *)self accountsWithBackupOnCellularEnabled];
    [v17 removeObject:v5];
    goto LABEL_21;
  }
LABEL_22:
  LODWORD(self) = v7 ^ v9 | v12 ^ v16;
  if (self == 1)
  {
    unint64_t v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = v5;
      __int16 v25 = 1024;
      *(_DWORD *)__int16 v26 = v7;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v6;
      __int16 v27 = 1024;
      unsigned int v28 = v12;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Updating state for account:%@ (%d,%d,%d)", buf, 0x1Eu);
      _MBLog();
    }
  }
LABEL_27:

  return (char)self;
}

- (void)_clearEnabledStateForAccount:(id)a3
{
  eventQueue = self->_eventQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)eventQueue);
  unsigned int v6 = [v5 identifier];

  if (v6)
  {
    unsigned int v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v11 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Clearing account %@", buf, 0xCu);
      _MBLog();
    }

    id v8 = [(MBUEAPlugin *)self accountsWithBackupEnabled];
    [v8 removeObject:v6];

    unsigned int v9 = [(MBUEAPlugin *)self accountsWithBackupOnCellularEnabled];
    [v9 removeObject:v6];
  }
  else
  {
    [(MBUEAPlugin *)self _refetchAllAccounts];
  }
}

- (BOOL)_updateGlobalEnabledState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v3 = [(MBUEAPlugin *)self accountsWithBackupEnabled];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(MBUEAPlugin *)self accountsWithBackupOnCellularEnabled];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  unsigned int v7 = [(ACMonitoredAccountStore *)self->_accountStore aa_primaryAppleAccount];
  id v8 = [v7 identifier];

  if (v8)
  {
    unsigned int v9 = [(MBUEAPlugin *)self accountsWithBackupEnabled];
    unsigned int v10 = [v9 containsObject:v8];
  }
  else
  {
    unsigned int v10 = 0;
  }
  p_int enabledToken = &self->_enabledToken;
  int enabledToken = self->_enabledToken;
  if (enabledToken == -1)
  {
    id v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v10;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Primary account enabled state (%d)", buf, 8u);
      _MBLog();
    }

    uint32_t v22 = notify_register_check("com.apple.private.restrict-post.MobileBackup.EnabledState", &self->_enabledToken);
    if (v22)
    {
      uint32_t v23 = v22;
      id v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v35 = v23;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "notify_register_check failed: %lu", buf, 0xCu);
        _MBLog();
      }

      *p_int enabledToken = -1;
      goto LABEL_36;
    }
    int enabledToken = *p_enabledToken;
    if (*p_enabledToken == -1) {
      goto LABEL_36;
    }
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(enabledToken, &state64);
  if (state)
  {
    uint32_t v14 = state;
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "notify_get_state failed: %lu", buf, 0xCu);
      _MBLog();
    }

    uint64_t state64 = 0;
    if (v10) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = -1;
    }
LABEL_14:
    __int16 v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v35 = state64;
      __int16 v36 = 2048;
      uint64_t v37 = v16;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Updating the backup enabled notify state from 0x%llx to 0x%llx", buf, 0x16u);
      _MBLog();
    }

    uint32_t v18 = notify_set_state(*p_enabledToken, v16);
    if (v18)
    {
      uint32_t v19 = v18;
      id v20 = MBGetDefaultLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v19;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "notify_set_state failed: %lu", buf, 0xCu);
    }
    else
    {
      uint32_t v25 = notify_post("com.apple.private.restrict-post.MobileBackup.EnabledState");
      if (!v25) {
        goto LABEL_36;
      }
      uint32_t v26 = v25;
      id v20 = MBGetDefaultLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v26;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "notify_post failed: %lu", buf, 0xCu);
    }
    _MBLog();
    goto LABEL_35;
  }
  if (v10) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = -1;
  }
  if (!state64 || state64 != v16) {
    goto LABEL_14;
  }
LABEL_36:
  BOOL v27 = v4 != 0;
  unsigned __int8 v28 = atomic_exchange((atomic_uchar *volatile)&self->_isEnabled, v4 != 0);
  if (v27 != (v28 & 1))
  {
    long long v29 = MBGetDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v27;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "isEnabled changed: %d", buf, 8u);
      _MBLog();
    }
  }
  unsigned __int8 v30 = v27 ^ v28;
  if (((v6 ^ ((atomic_exchange((atomic_uchar *volatile)&self->_isBackupOnCellularEnabled, v6) & 1) == 0)) & 1) == 0)
  {
    long long v31 = MBGetDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v6;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "isBackupOnCellularEnabled changed: %d", buf, 8u);
      _MBLog();
    }
  }
  if ((v30 | v6))
  {
    [(MBUEAPlugin *)self _stateDidChange];
    [(MBUEAPlugin *)self _updatePCTimer];
  }

  return (v30 | v6) & 1;
}

- (BOOL)enabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isEnabled);
  return v2 & 1;
}

- (void)_notifyDaemonOfAccountChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (sub_69E4())
  {
    notificationQueue = self->_notificationQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_81BC;
    v6[3] = &unk_C498;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)notificationQueue, v6);
  }
}

- (void)notifyDaemonThatKeyBagIsLocking
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_823C;
  block[3] = &unk_C448;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
}

- (void)notifyDaemonThatKeyBagIsUnlocked
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_82FC;
  block[3] = &unk_C448;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  if ([(MBUEAPlugin *)self wakeBackupOnDisconnect])
  {
    [(MBUEAPlugin *)self _stateDidChange];
  }
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
}

- (void)managerDidFinishBackup:(id)a3
{
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
}

- (void)managerDidFinishRestore:(id)a3
{
}

- (void)managerDidCancelRestore:(id)a3
{
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
}

- (NSMutableSet)accountsWithBackupEnabled
{
  return self->_accountsWithBackupEnabled;
}

- (void)setAccountsWithBackupEnabled:(id)a3
{
}

- (NSMutableSet)accountsWithBackupOnCellularEnabled
{
  return self->_accountsWithBackupOnCellularEnabled;
}

- (void)setAccountsWithBackupOnCellularEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsWithBackupOnCellularEnabled, 0);
  objc_storeStrong((id *)&self->_accountsWithBackupEnabled, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);

  objc_storeStrong((id *)&self->_pcTimer, 0);
}

@end