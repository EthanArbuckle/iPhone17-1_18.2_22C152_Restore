@interface BKSystemShellSentinel
+ (BKSystemShellSentinel)sharedInstance;
+ (id)dataMigrationQueue;
- (BKSystemShellDescriptor)primarySystemShell;
- (BKSystemShellSentinel)init;
- (BOOL)_lock_blockSystemApp;
- (BOOL)_lock_unblockSystemApp;
- (BOOL)_pingSystemShellForCollectiveWatchdog:(id)a3;
- (BOOL)auditTokenRepresentsSystemApp:(id *)a3;
- (BOOL)blockSystemApp;
- (BOOL)collectiveWatchdogPing;
- (BOOL)unblockSystemApp;
- (NSArray)systemShells;
- (NSSet)shellsFinishedStartup;
- (NSString)activeAlternateSystemAppBundleIdentifier;
- (NSString)description;
- (id)_collectivePingSystemShellSet;
- (id)_lock_currentConnectionShell;
- (id)addSystemShellObserver:(id)a3 reason:(id)a4;
- (id)systemShellState;
- (void)_addSystemShellToCollectivePingSet:(id)a3;
- (void)_lock_bootstrapSystemApp;
- (void)_lock_checkInWithRemoteCompletionBlock:(id)a3;
- (void)_lock_completeCheckInForShell:(id)a3;
- (void)_lock_completeCheckInForShell:(id)a3 completionBlock:(id)a4;
- (void)_lock_handleRelaunchRequestFromSystemApp:(id)a3 withOptions:(unint64_t)a4;
- (void)_lock_updatePrimarySystemApp;
- (void)_removeSystemShellFromCollectivePingSet:(id)a3;
- (void)checkInAfterDataMigrationUsingCompletionBlock:(id)a3;
- (void)checkInBypassingDataMigrationUsingCompletionBlock:(id)a3;
- (void)dataMigratorDidComplete;
- (void)finishedLaunching;
- (void)invalidate;
- (void)restartWithOptions:(id)a3;
- (void)setActiveAlternateSystemAppBundleIdentifier:(id)a3;
- (void)setWatchdogMonitoringEnabled:(id)a3;
- (void)startServerWithDataMigration;
- (void)startServerWithoutDataMigration;
- (void)systemShellDidConnect:(id)a3 connection:(id)a4;
- (void)systemShellDidTerminate:(int)a3;
- (void)terminateShellWithJobLabel:(id)a3;
@end

@implementation BKSystemShellSentinel

- (BOOL)auditTokenRepresentsSystemApp:(id *)a3
{
  uint64_t v4 = BSPIDForAuditToken();
  if ((int)v4 < 1) {
    return 0;
  }
  uint64_t v5 = v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToClient = self->_lock_pidToClient;
  v8 = +[NSNumber numberWithInt:v5];
  v9 = [(NSMutableDictionary *)lock_pidToClient objectForKey:v8];
  BOOL v10 = v9 != 0;

  os_unfair_lock_unlock(p_lock);
  return v10;
}

+ (BKSystemShellSentinel)sharedInstance
{
  if (qword_1001230B0 != -1) {
    dispatch_once(&qword_1001230B0, &stru_1000F7FE8);
  }
  v2 = (void *)qword_1001230A8;

  return (BKSystemShellSentinel *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_collectivePingDataLock_collectivePingShells, 0);
  objc_storeStrong((id *)&self->_lock_activeAlternateSystemAppJobLabel, 0);
  objc_storeStrong((id *)&self->_lock_activeAlternateSystemAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_checkinCompletionsBySystemApp, 0);
  objc_storeStrong((id *)&self->_lock_shellsFinishedStartup, 0);
  objc_storeStrong((id *)&self->_lock_connectedSystemApps, 0);
  objc_storeStrong((id *)&self->_lock_pidToClient, 0);
  objc_storeStrong((id *)&self->_lock_systemApp, 0);
  objc_storeStrong((id *)&self->_heartbeat, 0);
  objc_storeStrong((id *)&self->_controlListener, 0);

  objc_storeStrong((id *)&self->_shellListener, 0);
}

- (void)terminateShellWithJobLabel:(id)a3
{
  uint64_t v4 = (id *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = BKLogSystemShell();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disable watchdog for job label: %{public}@", buf, 0xCu);
  }

  v7 = v4;
  sub_10003C6CC((uint64_t)[v7 UTF8String], 0);
  id v8 = [(NSMutableOrderedSet *)self->_lock_connectedSystemApps copy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  v11 = (id *)v9;
  if (!v10) {
    goto LABEL_20;
  }
  id v12 = v10;
  uint64_t v13 = *(void *)v27;
LABEL_5:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v27 != v13) {
      objc_enumerationMutation(v9);
    }
    v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
    v16 = v15 ? (void *)v15[2] : 0;
    id v17 = v16;
    v18 = [v17 jobLabel];
    unsigned __int8 v19 = [v7 isEqualToString:v18];

    if (v19) {
      break;
    }
    if (v12 == (id)++v14)
    {
      id v20 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v12 = v20;
      if (!v20)
      {
        v11 = (id *)v9;
        goto LABEL_20;
      }
      goto LABEL_5;
    }
  }
  v11 = v15;

  if (v15)
  {
    v21 = BKLogSystemShell();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Shell exists; will terminate %{public}@",
        buf,
        0xCu);
    }

    id v22 = v11[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D600;
    block[3] = &unk_1000F8E78;
    id v25 = v22;
    id v23 = v22;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_20:
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setWatchdogMonitoringEnabled:(id)a3
{
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(BKSystemShellSentinel *)v3 _lock_currentConnectionShell];
  LODWORD(v3) = [v5 BOOLValue];

  sub_10007C428((uint64_t)v6, (int)v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)restartWithOptions:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v7 = [(BKSystemShellSentinel *)self _lock_currentConnectionShell];
  unsigned int v6 = [v5 unsignedIntValue];

  [(BKSystemShellSentinel *)self _lock_handleRelaunchRequestFromSystemApp:v7 withOptions:v6];
  os_unfair_lock_unlock(p_lock);
}

- (void)finishedLaunching
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(BKSystemShellSentinel *)self _lock_currentConnectionShell];
  id v5 = BKLogSystemShell();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      unsigned int v6 = *(void **)(v4 + 16);
    }
    else {
      unsigned int v6 = 0;
    }
    id v7 = v6;
    id v8 = [v7 bundleIdentifier];
    if (v4) {
      id v9 = *(void **)(v4 + 32);
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    [v10 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    v41 = v8;
    __int16 v42 = 2048;
    double v43 = -v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System shell \"%{public}@\" finished startup after %.2fs.", buf, 0x16u);
  }
  if (v4) {
    *(unsigned char *)(v4 + 10) = 1;
  }
  [(NSMutableSet *)self->_lock_shellsFinishedStartup addObject:v4];
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp == (BKSystemShellClient *)v4)
  {
    io_registry_entry_t v13 = IORegistryEntryFromPath(kIOMainPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
    IORegistryEntrySetCFProperty(v13, @"System Boot Complete", kCFBooleanTrue);
    if (v4) {
      uint64_t v14 = *(void **)(v4 + 16);
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
    [v15 systemIdleSleepInterval];
    double v17 = v16;

    int v18 = (int)v17;
    if ((int)v17 <= 1) {
      int v18 = 1;
    }
    int valuePtr = v18;
    CFNumberRef v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    IORegistryEntrySetCFProperty(v13, @"System Idle Seconds", v19);
    CFRelease(v19);
    int v20 = (int)(v17 * 1000.0);
    if (v20 <= 1) {
      int v20 = 1;
    }
    int v37 = v20;
    CFNumberRef v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v37);
    IORegistryEntrySetCFProperty(v13, @"System Idle Milliseconds", v21);
    CFRelease(v21);
    id v22 = BKLogSystemShell();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting system idle interval to %d.", buf, 8u);
    }

    if (!self->_enableIdleSleepAssertionID)
    {
      id v23 = BKLogSystemShell();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Telling IOKit that idle sleep is now enabled.", buf, 2u);
      }

      IOPMAssertionCreateWithName(@"EnableIdleSleep", 0xFFu, @"com.apple.backboardd.enable-idle-sleep", &self->_enableIdleSleepAssertionID);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007DC2C;
    block[3] = &unk_1000F8E78;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (v4) {
    v24 = *(void **)(v4 + 16);
  }
  else {
    v24 = 0;
  }
  id v25 = v24;
  os_unfair_lock_unlock(p_lock);
  if (lock_systemApp == (BKSystemShellClient *)v4)
  {
    long long v26 = [(BSCompoundAssertion *)self->_observers context];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = [v26 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * i) systemShellDidFinishLaunching:v25];
        }
        id v28 = [v26 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v28);
    }
    v31 = +[BKSDefaults localDefaults];
    [v31 setHideAppleLogoOnLaunch:0];
  }
}

- (void)checkInBypassingDataMigrationUsingCompletionBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(BKSystemShellSentinel *)self _lock_checkInWithRemoteCompletionBlock:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)checkInAfterDataMigrationUsingCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSystemShellSentinel dataMigrationQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock(&self->_lock);
  [(BKSystemShellSentinel *)self _lock_checkInWithRemoteCompletionBlock:v4];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_checkInWithRemoteCompletionBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_assert_owner(p_lock);
  unsigned int v6 = [(BKSystemShellSentinel *)self _lock_currentConnectionShell];
  id v7 = BKLogSystemShell();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      double v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "checkIn: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    [(BKSystemShellSentinel *)self _lock_completeCheckInForShell:v6 completionBlock:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "checkIn: shell not found for current connection", (uint8_t *)&v10, 2u);
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    v5[2](v5, v9);

    id v5 = (void (**)(id, uint64_t))v9;
  }
}

- (void)_lock_completeCheckInForShell:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007E0E0;
  v20[3] = &unk_1000F8130;
  v20[4] = self;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  int v10 = objc_retainBlock(v20);
  if (v8 && v8[11])
  {
    int v11 = 1;
LABEL_4:
    id v12 = BKLogSystemShell();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      io_registry_entry_t v13 = sub_10007C3B0(v8);
      BOOL lock_systemAppBlocked = self->_lock_systemAppBlocked;
      *(_DWORD *)buf = 138543874;
      v24 = v13;
      __int16 v25 = 1024;
      int v26 = v11;
      __int16 v27 = 1024;
      BOOL v28 = lock_systemAppBlocked;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "checkInAndWaitForDataMigration: Telling %{public}@ it can start immediately (alternate:%{BOOL}u blocked:%{BOOL}u)", buf, 0x18u);
    }
    ((void (*)(void *))v10[2])(v10);
    goto LABEL_11;
  }
  if (!self->_lock_systemAppBlocked)
  {
    int v11 = 0;
    goto LABEL_4;
  }
  id v15 = BKLogSystemShell();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = sub_10007C3B0(v8);
    BOOL v17 = self->_lock_systemAppBlocked;
    *(_DWORD *)buf = 138543618;
    v24 = v16;
    __int16 v25 = 1024;
    int v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Pending %{public}@ completion because systemAppBlocked:%{BOOL}u", buf, 0x12u);
  }
  lock_checkinCompletionsBySystemApp = self->_lock_checkinCompletionsBySystemApp;
  id v19 = [v10 copy];
  [(NSMapTable *)lock_checkinCompletionsBySystemApp setObject:v19 forKey:v8];

LABEL_11:
  [(BKSystemShellSentinel *)self _lock_updatePrimarySystemApp];
}

- (void)_lock_completeCheckInForShell:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = BKLogSystemShell();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v14) = 138543362;
    *(void *)((char *)&v14 + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "completeCheckInForShell: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v6 = sub_10001C32C();
  id v7 = (void *)v6;
  if (v6)
  {
    id v8 = *(NSObject **)(v6 + 8);
    *(void *)&long long v14 = _NSConcreteStackBlock;
    *((void *)&v14 + 1) = 3221225472;
    id v15 = sub_100095728;
    double v16 = &unk_1000F8E78;
    BOOL v17 = v7;
    dispatch_async(v8, &v14);
  }

  if (v4) {
    *((_WORD *)v4 + 4) = 256;
  }
  id v9 = +[NSDate date];
  int v10 = v9;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 4, v9);

    int v11 = (void *)*((void *)v4 + 2);
  }
  else
  {

    int v11 = 0;
  }
  id v12 = v11;
  id v13 = [v12 watchdogType];

  if (v13) {
    sub_10007C428((uint64_t)v4, 1);
  }
  else {
    [(BKSystemShellSentinel *)self _addSystemShellToCollectivePingSet:v4];
  }
}

- (BOOL)_lock_unblockSystemApp
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL lock_systemAppBlocked = self->_lock_systemAppBlocked;
  if (self->_lock_systemAppBlocked)
  {
    lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
    if (lock_activeAlternateSystemAppJobLabel) {
      sub_10003C6CC((uint64_t)[(NSString *)lock_activeAlternateSystemAppJobLabel UTF8String], 0);
    }
    self->_BOOL lock_systemAppBlocked = 0;
    id v5 = BKLogSystemShell();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unblocking system apps.", v7, 2u);
    }

    [(BKSystemShellSentinel *)self _lock_bootstrapSystemApp];
  }
  return lock_systemAppBlocked;
}

- (BOOL)_lock_blockSystemApp
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL lock_systemAppBlocked = self->_lock_systemAppBlocked;
  if (!self->_lock_systemAppBlocked)
  {
    self->_BOOL lock_systemAppBlocked = 1;
    id v4 = BKLogSystemShell();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Blocking system apps.", buf, 2u);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = self->_lock_connectedSystemApps;
    id v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          sub_10007C428(*(void *)(*((void *)&v25 + 1) + 8 * i), 0);
        }
        id v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v7);
    }

    lock_connectedSystemApps = self->_lock_connectedSystemApps;
    if (self->_shellListener)
    {
      [(NSMutableOrderedSet *)lock_connectedSystemApps bs_map:&stru_1000F80E8];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007E660;
      block[3] = &unk_1000F8E78;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = v24;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      id v11 = [(NSMutableOrderedSet *)lock_connectedSystemApps bs_map:&stru_1000F8108];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v31 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (j = 0; j != v13; j = (char *)j + 1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
            BOOL v17 = BKLogSystemShell();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v30 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Killing %{public}@.", buf, 0xCu);
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v19 objects:v31 count:16];
        }
        while (v13);
      }
    }
  }
  return !lock_systemAppBlocked;
}

- (void)_lock_handleRelaunchRequestFromSystemApp:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v7 = BKLogSystemShell();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = BKSRestartActionOptionsDescription();
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling exit request from %{public}@ with options: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
  {
    id v9 = +[BKSDefaults localDefaults];
    [v9 setHideAppleLogoOnLaunch:1];
  }
  sub_10003A2D8();
  exit(0);
}

- (void)_lock_updatePrimarySystemApp
{
  os_unfair_lock_assert_owner(&self->_lock);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v3 = self->_lock_connectedSystemApps;
  id v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v51;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(BKSystemShellClient **)(*((void *)&v50 + 1) + 8 * i);
        if (v8 && !v8->_pendingCheckIn && v8->_checkedIn)
        {
          long long v20 = BKLogSystemShell();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v57 = v8;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updating primary system app to: %{public}@", buf, 0xCu);
          }

          long long v21 = v8;
          goto LABEL_43;
        }
      }
      id v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (self->_lock_systemAppBlocked)
  {
    v3 = self->_lock_activeAlternateSystemAppBundleIdentifier;
    if (v3)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v9 = self->_lock_connectedSystemApps;
      id v10 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v47;
        while (2)
        {
          id v13 = 0;
          do
          {
            if (*(void *)v47 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v13);
            if (v14) {
              id v15 = (void *)v14[2];
            }
            else {
              id v15 = 0;
            }
            id v16 = v15;
            BOOL v17 = [v16 bundleIdentifier];
            unsigned __int8 v18 = [v17 isEqualToString:v3];

            if (v18)
            {
              long long v21 = v14;

              if (!v14) {
                goto LABEL_39;
              }
              id v24 = BKLogSystemShell();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v57 = v21;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating primary system the alternate system app: %{public}@", buf, 0xCu);
              }
              goto LABEL_42;
            }
            id v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v19 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
          id v11 = v19;
          if (v19) {
            continue;
          }
          break;
        }
      }
    }
LABEL_39:
    id v24 = BKLogSystemShell();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating primary system to nil because we are waiting for the alternate system app to launch", buf, 2u);
    }
    long long v21 = 0;
LABEL_42:

    goto LABEL_43;
  }
  if (!self->_lock_systemApp
    || !-[NSMutableOrderedSet containsObject:](self->_lock_connectedSystemApps, "containsObject:"))
  {
    long long v21 = [(NSMutableOrderedSet *)self->_lock_connectedSystemApps firstObject];
    BKLogSystemShell();
    v3 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v21;
      _os_log_impl((void *)&_mh_execute_header, &v3->super.super, OS_LOG_TYPE_DEFAULT, "Updating primary system first app: %{public}@", buf, 0xCu);
    }
LABEL_43:

    goto LABEL_44;
  }
  long long v22 = BKLogSystemShell();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    lock_systemApp = self->_lock_systemApp;
    *(_DWORD *)buf = 138543362;
    v57 = lock_systemApp;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updating primary system app to the old _systemApp: %{public}@", buf, 0xCu);
  }

  long long v21 = self->_lock_systemApp;
LABEL_44:
  p_lock_systemApp = &self->_lock_systemApp;
  if (self->_lock_systemApp != v21)
  {
    objc_storeStrong((id *)&self->_lock_systemApp, v21);
    long long v26 = *p_lock_systemApp;
    long long v27 = BKLogSystemShell();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        uint64_t v29 = *p_lock_systemApp;
        if (*p_lock_systemApp) {
          uint64_t v29 = (BKSystemShellClient *)v29->_descriptor;
        }
        uint64_t v30 = v29;
        v31 = [(BKSystemShellClient *)v30 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v57 = v31;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Now monitoring \"%{public}@\"", buf, 0xCu);
      }
    }
    else
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No system apps remain. Waiting for one to spawn...", buf, 2u);
      }

      if (self->_enableIdleSleepAssertionID)
      {
        long long v32 = BKLogSystemShell();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Telling IOKit that idle sleep is now disabled.", buf, 2u);
        }

        IOPMAssertionRelease(self->_enableIdleSleepAssertionID);
        self->_enableIdleSleepAssertionID = 0;
      }
    }
  }
  long long v33 = [(BSCompoundAssertion *)self->_observers context];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v34 = [v33 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v43;
    do
    {
      int v37 = 0;
      do
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v37);
        if (objc_opt_respondsToSelector())
        {
          if (v21) {
            descriptor = v21->_descriptor;
          }
          else {
            descriptor = 0;
          }
          v40 = descriptor;
          [v38 systemShellChangedWithPrimary:v40];
        }
        int v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v41 = [v33 countByEnumeratingWithState:&v42 objects:v54 count:16];
      id v35 = v41;
    }
    while (v41);
  }
}

- (void)_lock_bootstrapSystemApp
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_systemAppBlocked && [(NSMapTable *)self->_lock_checkinCompletionsBySystemApp count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = [(NSMapTable *)self->_lock_checkinCompletionsBySystemApp objectEnumerator];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))();
        }
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMapTable *)self->_lock_checkinCompletionsBySystemApp removeAllObjects];
  }
  [(BKSystemShellSentinel *)self _lock_updatePrimarySystemApp];
}

- (id)_lock_currentConnectionShell
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = +[BSServiceConnection currentContext];
  id v4 = [v3 remoteProcess];
  id v5 = [v4 pid];

  lock_pidToClient = self->_lock_pidToClient;
  id v7 = +[NSNumber numberWithInt:v5];
  long long v8 = [(NSMutableDictionary *)lock_pidToClient objectForKeyedSubscript:v7];

  return v8;
}

- (BOOL)_pingSystemShellForCollectiveWatchdog:(id)a3
{
  v3 = a3;
  id v4 = v3;
  if (v3) {
    id v5 = (void *)v3[2];
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 watchdogType];

  if (v7 != (id)1)
  {
    long long v8 = v4 ? (void *)v4[2] : 0;
    id v9 = v8;
    [v9 pid];
    char v10 = BSPIDIsBeingDebugged();

    if ((v10 & 1) == 0)
    {
      if (v4) {
        uint64_t v12 = (void *)v4[3];
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;
      uint64_t v14 = [v13 remoteTarget];

      unsigned int v15 = [v14 collectiveWatchdogPing];
      BOOL v11 = v15;
      if (v4)
      {
        if (v15 == (*((unsigned char *)v4 + 12) != 0))
        {
LABEL_21:

          goto LABEL_22;
        }
        id v16 = BKLogSystemShell();
        BOOL v17 = v16;
        if (!v11)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "watchdogPing: system app claims it's no longer alive", buf, 2u);
          }

LABEL_20:
          *((unsigned char *)v4 + 12) = v11;
          goto LABEL_21;
        }
      }
      else
      {
        if (!v15) {
          goto LABEL_21;
        }
        BOOL v17 = BKLogSystemShell();
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "watchdogPing: system app is now alive", (uint8_t *)v19, 2u);
      }

      if (!v4) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  BOOL v11 = 1;
LABEL_22:

  return v11;
}

- (id)_collectivePingSystemShellSet
{
  p_collectivePingDataLock = &self->_collectivePingDataLock;
  os_unfair_lock_lock(&self->_collectivePingDataLock);
  id v4 = [(NSMutableSet *)self->_collectivePingDataLock_collectivePingShells copy];
  os_unfair_lock_unlock(p_collectivePingDataLock);

  return v4;
}

- (void)_removeSystemShellFromCollectivePingSet:(id)a3
{
  p_collectivePingDataLock = &self->_collectivePingDataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_collectivePingDataLock);
  [(NSMutableSet *)self->_collectivePingDataLock_collectivePingShells removeObject:v5];

  os_unfair_lock_unlock(p_collectivePingDataLock);
}

- (void)_addSystemShellToCollectivePingSet:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_collectivePingDataLock);
  collectivePingDataLock_collectivePingShells = self->_collectivePingDataLock_collectivePingShells;
  if (!collectivePingDataLock_collectivePingShells)
  {
    id v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v6 = self->_collectivePingDataLock_collectivePingShells;
    self->_collectivePingDataLock_collectivePingShells = v5;

    collectivePingDataLock_collectivePingShells = self->_collectivePingDataLock_collectivePingShells;
  }
  [(NSMutableSet *)collectivePingDataLock_collectivePingShells addObject:v7];
  os_unfair_lock_unlock(&self->_collectivePingDataLock);
}

- (void)systemShellDidTerminate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToClient = self->_lock_pidToClient;
  id v7 = +[NSNumber numberWithInt:v3];
  long long v8 = [(NSMutableDictionary *)lock_pidToClient objectForKey:v7];

  if (v8)
  {
    id v9 = BKLogSystemShell();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "System app disconnected: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    [(NSMutableOrderedSet *)self->_lock_connectedSystemApps removeObject:v8];
    [(NSMapTable *)self->_lock_checkinCompletionsBySystemApp removeObjectForKey:v8];
    char v10 = self->_lock_pidToClient;
    BOOL v11 = +[NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v10 removeObjectForKey:v11];

    [(NSMutableSet *)self->_lock_shellsFinishedStartup removeObject:v8];
    [(BKSystemShellSentinel *)self _removeSystemShellFromCollectivePingSet:v8];
    [(BKSystemShellSentinel *)self _lock_updatePrimarySystemApp];
    if (![(NSMutableOrderedSet *)self->_lock_connectedSystemApps count])
    {
      uint64_t v12 = BKLogSystemShell();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No more system apps", (uint8_t *)&v13, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)systemShellDidConnect:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [BKSystemShellClient alloc];
  id v10 = v7;
  id v11 = v8;
  if (v9)
  {
    v24.receiver = v9;
    v24.super_class = (Class)BKSystemShellClient;
    uint64_t v12 = [(BKSystemShellSentinel *)&v24 init];
    id v9 = (BKSystemShellClient *)v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_heartbeat, a4);
      objc_storeStrong((id *)&v9->_descriptor, a3);
      int v13 = (NSDate *)objc_alloc_init((Class)NSDate);
      connectDate = v9->_connectDate;
      v9->_connectDate = v13;
    }
  }

  if (v9) {
    v9->_pendingCheckIn = 1;
  }
  unsigned int v15 = [v10 bundleIdentifier];
  unsigned int v16 = [v15 isEqualToString:self->_lock_activeAlternateSystemAppBundleIdentifier];

  if (v16)
  {
    if (v9) {
      v9->_isAlternateShell = 1;
    }
    BOOL v17 = [v10 jobLabel];
    lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
    self->_lock_activeAlternateSystemAppJobLabel = v17;

    id v19 = BKLogSystemShell();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [(BKSystemShellClient *)v9 description];
      LODWORD(v24.receiver) = 138543362;
      *(id *)((char *)&v24.receiver + 4) = v20;
      long long v21 = "Alternate system shell connected: %{public}@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    id v19 = BKLogSystemShell();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [(BKSystemShellClient *)v9 description];
      LODWORD(v24.receiver) = 138543362;
      *(id *)((char *)&v24.receiver + 4) = v20;
      long long v21 = "System shell connected: %{public}@";
      goto LABEL_13;
    }
  }

  lock_pidToClient = self->_lock_pidToClient;
  id v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 pid]);
  [(NSMutableDictionary *)lock_pidToClient setObject:v9 forKey:v23];

  [(NSMutableOrderedSet *)self->_lock_connectedSystemApps addObject:v9];
  [(BKSystemShellSentinel *)self _lock_updatePrimarySystemApp];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)unblockSystemApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BKSystemShellSentinel *)v2 _lock_unblockSystemApp];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)blockSystemApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BKSystemShellSentinel *)v2 _lock_blockSystemApp];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)collectiveWatchdogPing
{
  [(BKSystemShellSentinel *)self _collectivePingSystemShellSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v9 = BKLogSystemShell();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "watchdog ping: %{public}@", buf, 0xCu);
        }

        if (![(BKSystemShellSentinel *)self _pingSystemShellForCollectiveWatchdog:v8])
        {
          id v11 = BKLogSystemShell();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v18 = v8;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ reported not alive, which is fairly unusual", buf, 0xCu);
          }

          BOOL v10 = 0;
          goto LABEL_15;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (void)dataMigratorDidComplete
{
  id v3 = [(BSCompoundAssertion *)self->_observers context];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 systemShellWillBootstrap];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  os_unfair_lock_lock(&self->_lock);
  [(BKSystemShellSentinel *)self _lock_bootstrapSystemApp];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)startServerWithDataMigration
{
}

- (void)startServerWithoutDataMigration
{
  [(BKSystemShellServiceListener *)self->_shellListener activate];
  controlListener = self->_controlListener;

  [(BKSystemShellControlServiceListener *)controlListener activate];
}

- (id)systemShellState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc_init(BKSystemShellSentinelState);
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp) {
    lock_systemApp = (BKSystemShellClient *)lock_systemApp->_descriptor;
  }
  id v7 = lock_systemApp;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);
  }

  uint64_t v8 = [(NSMutableOrderedSet *)self->_lock_connectedSystemApps array];
  long long v10 = [v8 bs_map:&stru_1000F8088];
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v9, v10, 24);
  }

  long long v11 = [(NSMutableSet *)self->_lock_shellsFinishedStartup bs_map:&stru_1000F80A8];
  long long v13 = v11;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v12, v11, 32);

    v4->_waitingForAlternateShellsToFinish = self->_lock_systemAppBlocked;
  }
  else
  {
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSSet)shellsFinishedStartup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableSet *)self->_lock_shellsFinishedStartup bs_map:&stru_1000F8068];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSArray)systemShells
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableOrderedSet *)self->_lock_connectedSystemApps array];
  id v5 = [v4 bs_map:&stru_1000F8048];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (BKSystemShellDescriptor)primarySystemShell
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp) {
    lock_systemApp = (BKSystemShellClient *)lock_systemApp->_descriptor;
  }
  id v5 = lock_systemApp;
  os_unfair_lock_unlock(p_lock);

  return (BKSystemShellDescriptor *)v5;
}

- (NSString)activeAlternateSystemAppBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSString *)self->_lock_activeAlternateSystemAppBundleIdentifier copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)setActiveAlternateSystemAppBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSString *)[v5 copy];

  lock_activeAlternateSystemAppBundleIdentifier = self->_lock_activeAlternateSystemAppBundleIdentifier;
  self->_lock_activeAlternateSystemAppBundleIdentifier = v6;

  lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
  self->_lock_activeAlternateSystemAppJobLabel = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)addSystemShellObserver:(id)a3 reason:(id)a4
{
  return [(BSCompoundAssertion *)self->_observers acquireForReason:a4 withContext:a3];
}

- (NSString)description
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendBool:self->_lock_systemAppBlocked withName:@"systemAppBlocked"];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  long long v10 = sub_10007FFC4;
  long long v11 = &unk_1000F8E50;
  id v12 = v3;
  long long v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:0 block:&v8];
  uint64_t v6 = [v5 build:v8, v9, v10, v11];

  return (NSString *)v6;
}

- (void)invalidate
{
  [(BSCompoundAssertion *)self->_observers invalidate];
  observers = self->_observers;
  self->_observers = 0;
}

- (BKSystemShellSentinel)init
{
  v2 = self;
  id v3 = [[BKSystemShellServiceListener alloc] initWithSentinel:self];
  id v4 = [[BKSystemShellControlServiceListener alloc] initWithSentinel:v2];
  id v5 = v3;
  uint64_t v6 = v4;
  if (v2)
  {
    v22.receiver = v2;
    v22.super_class = (Class)BKSystemShellSentinel;
    id v7 = [(BKSystemShellSentinel *)&v22 init];
    v2 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_shellListener, v3);
      objc_storeStrong((id *)&v2->_controlListener, v4);
      v2->_lock._os_unfair_lock_opaque = 0;
      v2->_collectivePingDataLock._os_unfair_lock_opaque = 0;
      lock_systemApp = v2->_lock_systemApp;
      v2->_lock_systemApp = 0;

      uint64_t v9 = +[NSMapTable strongToStrongObjectsMapTable];
      lock_checkinCompletionsBySystemApp = v2->_lock_checkinCompletionsBySystemApp;
      v2->_lock_checkinCompletionsBySystemApp = (NSMapTable *)v9;

      long long v11 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      lock_connectedSystemApps = v2->_lock_connectedSystemApps;
      v2->_lock_connectedSystemApps = v11;

      long long v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      lock_shellsFinishedStartup = v2->_lock_shellsFinishedStartup;
      v2->_lock_shellsFinishedStartup = v13;

      long long v15 = objc_alloc_init(BKSystemAppHeartbeat);
      heartbeat = v2->_heartbeat;
      v2->_heartbeat = v15;

      BOOL v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lock_pidToClient = v2->_lock_pidToClient;
      v2->_lock_pidToClient = v17;

      uint64_t v19 = +[BSCompoundAssertion assertionWithIdentifier:@"BKSystemShellSentinelObservers"];
      observers = v2->_observers;
      v2->_observers = (BSCompoundAssertion *)v19;
    }
  }

  return v2;
}

+ (id)dataMigrationQueue
{
  if (qword_1001230B8 != -1) {
    dispatch_once(&qword_1001230B8, &stru_1000F8008);
  }
  v2 = (void *)qword_1001230C0;

  return v2;
}

@end