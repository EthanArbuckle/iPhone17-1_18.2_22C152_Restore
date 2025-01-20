@interface SUScheduler
+ (id)sharedInstance;
- (BOOL)_activityIsScheduled:(id)a3 cancelIfExpired:(BOOL)a4;
- (BOOL)_activityIsScheduled:(id)a3 cancelIfExpired:(BOOL)a4 scheduledActivity:(id *)a5;
- (BOOL)activityWasPreviouslyScheduledForFutureDate:(id)a3 copy:(id *)a4;
- (SUScheduler)init;
- (double)_autoDownloadTimeInterval;
- (double)_autoScanTimeInterval;
- (double)_autoScanTimeIntervalForType:(int)a3;
- (double)_randomizedAutoScanDelayForType:(int)a3;
- (id)_autoInstallActivityCriteriaWithInstallDate:(id)a3 descriptor:(id)a4;
- (id)_next7OClockFrom:(id)a3 after:(double)a4;
- (id)nextScheduledAutoScan;
- (int)scanTypeForActivityName:(id)a3;
- (void)_invalidateRetryAutoInstallaTimer;
- (void)_queue_cancelAutoInstallStartInstallTask;
- (void)_queue_handleActivity:(id)a3 info:(id)a4;
- (void)_queue_handleAnalyticsSubmission:(id)a3 info:(id)a4;
- (void)_queue_handleAutoDownload:(id)a3 info:(id)a4;
- (void)_queue_handleAutoInstallEnd:(id)a3 info:(id)a4;
- (void)_queue_handleAutoInstallGetKeybag:(id)a3 info:(id)a4;
- (void)_queue_handleAutoInstallStart:(id)a3 info:(id)a4;
- (void)_queue_handleAutoInstallUnlock:(id)a3 info:(id)a4;
- (void)_queue_handleAutoScan:(id)a3 info:(id)a4 rescheduler:(BOOL)a5;
- (void)_queue_handleCancelPresentBannerOnUnlock;
- (void)_queue_handleInstallAlert:(id)a3 info:(id)a4;
- (void)_queue_handlePresentBanner:(id)a3 info:(id)a4;
- (void)_queue_handleRollbackReboot:(id)a3 info:(id)a4;
- (void)_queue_handleScanIntervalConfigChange:(id)a3;
- (void)_queue_handleServerConfigScan:(id)a3 info:(id)a4;
- (void)_queue_invalidateRetryAutoInstallaTimer;
- (void)_queue_setAutoinstallActivity:(id)a3;
- (void)_queue_unscheduleActivity:(id)a3;
- (void)_queue_unscheduleAllActivitiesWithName:(id)a3;
- (void)_scheduleActivity:(id)a3;
- (void)_scheduleAutoInstallGetKeybagTaskForDate:(id)a3;
- (void)_unscheduleActivity:(id)a3;
- (void)cancelAllAutoInstallTasks;
- (void)cancelAllAutoInstallTasksIncludingStartInstallTask:(BOOL)a3;
- (void)cancelAllAutoscanTasks;
- (void)cancelAllBackgroundScans;
- (void)cancelAllEmergencyBackgroundScans;
- (void)cancelAllStartupTasks;
- (void)cancelAutoDownloadTask;
- (void)cancelAutoInstallGetKeybagTask;
- (void)cancelAutoInstallStartInstallTask;
- (void)cancelAutoInstallUnlockWindowStartTask;
- (void)cancelAutoInstallWindowExpirationTask;
- (void)cancelInstallAlertRegistration;
- (void)cancelInstallAlertRegistrationButKeepAlive;
- (void)cancelPresentAutoUpdateBanner;
- (void)cancelRollbackReboot;
- (void)dealloc;
- (void)handleXPCEvent:(id)a3;
- (void)scheduleAllAutoInstallUpdateTasks:(id)a3 descriptor:(id)a4;
- (void)scheduleAnalyticsSubmission:(id)a3;
- (void)scheduleAnalyticsSubmissionIfNecessary;
- (void)scheduleAutoDownloadIfNecessary;
- (void)scheduleAutoDownloadWithDate:(id)a3 requirePower:(int)a4 minimumPowerRquirement:(id)a5;
- (void)scheduleAutoInstallExpirationTask:(id)a3;
- (void)scheduleAutoInstallGetKeybagTaskForDescriptor:(id)a3;
- (void)scheduleAutoInstallStartInstallTask:(id)a3 descriptor:(id)a4;
- (void)scheduleAutoInstallStartInstallTaskWithDate:(id)a3 descriptor:(id)a4 fromFailure:(BOOL)a5;
- (void)scheduleAutoInstallUnlockWindowStartTask:(id)a3;
- (void)scheduleBackgroundScan:(id)a3;
- (void)scheduleBackgroundScan:(id)a3 scanDate:(id)a4;
- (void)scheduleBackgroundScanIfNecessary:(id)a3 scanType:(int *)a4;
- (void)scheduleDelayEndAutoScan:(id)a3;
- (void)scheduleInstallAlertRegistration:(id)a3;
- (void)schedulePresentAutoUpdateBanner;
- (void)scheduleRollbackReboot:(id)a3;
- (void)scheduleSimulatedAutoInstallTask;
- (void)scheduleSplatBackgroundScan:(id)a3;
- (void)scheduleStartupTasksIfNecessary;
- (void)serverConfigManager:(id)a3 configValuesChanged:(id)a4;
- (void)setAutoInstallActivityStateDone;
- (void)setAutoinstallActivity:(id)a3;
@end

@implementation SUScheduler

- (SUScheduler)init
{
  v38.receiver = self;
  v38.super_class = (Class)SUScheduler;
  id v2 = [(SUScheduler *)&v38 init];
  if (v2)
  {
    v3 = +[SUPreferences sharedInstance];
    *((unsigned char *)v2 + 16) = [v3 useSUCoreXPCActivityScheduler];

    if (*((unsigned char *)v2 + 16))
    {
      uint64_t v4 = [MEMORY[0x263F77BD8] sharedInstance];
      v5 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v4;

      v6 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = 0;

      SULogInfo(@"Dumping scheduler state: %@", v7, v8, v9, v10, v11, v12, v13, *((void *)v2 + 3));
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263F77B28] sharedInstance];
      v15 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v14;

      v16 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = 0;
    }
    uint64_t v17 = +[SUServerConfigurationManager sharedInstance];
    v18 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v17;

    [*((id *)v2 + 4) addListener:v2];
    if (*((unsigned char *)v2 + 16)) {
      v26 = "new";
    }
    else {
      v26 = "legacy";
    }
    SULogInfo(@"Using %s scheduler", v19, v20, v21, v22, v23, v24, v25, (uint64_t)v26);
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.softwareupdateservicesd.scheduler", v27);
    v29 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v28;

    uint64_t v30 = +[SUManagerInterfaceFactory sharedInstance];
    v31 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v30;

    v32 = +[SUManagerServer sharedInstance];
    uint64_t v33 = [v32 autoInstallManager];
    v34 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v33;

    v35 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    v36 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0;
  }
  return (SUScheduler *)v2;
}

- (void)dealloc
{
  [(SUServerConfigurationManager *)self->_serverConfigManager removeListener:self];
  [(SUScheduler *)self _invalidateRetryAutoInstallaTimer];
  v3.receiver = self;
  v3.super_class = (Class)SUScheduler;
  [(SUScheduler *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_3 != -1) {
    dispatch_once(&sharedInstance_pred_3, &__block_literal_global_16);
  }
  id v2 = (void *)sharedInstance___instance_7;
  return v2;
}

uint64_t __29__SUScheduler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUScheduler);
  uint64_t v1 = sharedInstance___instance_7;
  sharedInstance___instance_7 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)scheduleStartupTasksIfNecessary
{
  [(SUScheduler *)self scheduleBackgroundScanIfNecessary:@"com.apple.softwareupdateservicesd.activity.autoScan" scanType:0];
  [(SUScheduler *)self scheduleAutoDownloadIfNecessary];
  [(SUScheduler *)self scheduleAnalyticsSubmissionIfNecessary];
}

- (void)cancelAllStartupTasks
{
  [(SUScheduler *)self cancelAllAutoscanTasks];
  [(SUScheduler *)self cancelAutoDownloadTask];
}

- (void)cancelAllAutoscanTasks
{
  [(SUScheduler *)self cancelAllBackgroundScans];
  [(SUScheduler *)self cancelAllEmergencyBackgroundScans];
}

- (void)scheduleAllAutoInstallUpdateTasks:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUScheduler *)self scheduleAutoInstallExpirationTask:v7];
  [(SUScheduler *)self scheduleAutoInstallUnlockWindowStartTask:v7];
  [(SUScheduler *)self scheduleAutoInstallGetKeybagTaskForDescriptor:v6];
  [(SUScheduler *)self scheduleAutoInstallStartInstallTask:v7 descriptor:v6];
}

- (void)cancelAllAutoInstallTasks
{
}

- (void)cancelAllAutoInstallTasksIncludingStartInstallTask:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUScheduler *)self cancelAutoInstallWindowExpirationTask];
  [(SUScheduler *)self cancelAutoInstallUnlockWindowStartTask];
  [(SUScheduler *)self cancelAutoInstallGetKeybagTask];
  if (v3)
  {
    SULogDebug(@"Will cancelAutoInstallStartInstallTask", v5, v6, v7, v8, v9, v10, v11, v12);
    [(SUScheduler *)self cancelAutoInstallStartInstallTask];
  }
  else
  {
    SULogDebug(@"Will not cancelAutoInstallStartInstallTask", v5, v6, v7, v8, v9, v10, v11, v12);
  }
  [(SUScheduler *)self cancelPresentAutoUpdateBanner];
}

- (void)scheduleBackgroundScanIfNecessary:(id)a3 scanType:(int *)a4
{
  id v25 = a3;
  BOOL v6 = [(SUScheduler *)self _activityIsScheduled:v25 cancelIfExpired:1];
  if (!self->_useSUCoreXPCActivityManager
    || ![(SUScheduler *)self activityWasPreviouslyScheduledForFutureDate:v25 copy:0])
  {
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  uint64_t v7 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getExpectedRunDateForActivity:v25];
  uint64_t v23 = +[SUUtility prettyPrintDate:v7];
  SULogInfo(@"%@ was previously scheduled to run at %@. Re-scheduling for the same time", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v25);

  if (!v7)
  {
LABEL_6:
    [(SUScheduler *)self _randomizedAutoScanDelayForType:a4];
    uint64_t v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)(int)v15];
  }
  uint64_t v24 = +[SUUtility prettyPrintDate:v7];
  SULogInfo(@"Expired or no background scan activity found for %@. Rescheduling for %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);

  [(SUScheduler *)self scheduleBackgroundScan:v25 scanDate:v7];
LABEL_8:
}

- (void)scheduleBackgroundScan:(id)a3 scanDate:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F77B20]);
  double v15 = v7;
  if (v7)
  {
    [v7 setRunDate:v6];
    [v15 setNetworkState:2];
    [v15 setWaking:2];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:v17 options:v15];
    [(SUScheduler *)self _scheduleActivity:v16];
  }
  else
  {
    SULogError(@"Failed to create options for activity %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v17);
  }
}

- (void)scheduleBackgroundScan:(id)a3
{
}

- (void)scheduleSplatBackgroundScan:(id)a3
{
}

- (void)scheduleDelayEndAutoScan:(id)a3
{
}

- (void)cancelAllBackgroundScans
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SUScheduler_cancelAllBackgroundScans__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __39__SUScheduler_cancelAllBackgroundScans__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.autoScan");
}

- (void)cancelAllEmergencyBackgroundScans
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUScheduler_cancelAllEmergencyBackgroundScans__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __48__SUScheduler_cancelAllEmergencyBackgroundScans__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.emergencyAutoScan");
}

- (void)scheduleAutoDownloadIfNecessary
{
  if (![(SUManagerInterface *)self->_manager isDownloading])
  {
    uint64_t v10 = +[SUState currentState];
    uint64_t v11 = [v10 lastAutoDownloadDate];

    if (!v11)
    {
      SULogInfo(@"[Auto download] Setting last auto download date to now since it is nil", v12, v13, v14, v15, v16, v17, v18, v68);
      uint64_t v19 = +[SUState currentState];
      uint64_t v20 = [MEMORY[0x263EFF910] date];
      [v19 setLastAutoDownloadDate:v20];
    }
    id v71 = 0;
    BOOL v21 = [(SUScheduler *)self _activityIsScheduled:@"com.apple.softwareupdateservicesd.activity.autoDownload" cancelIfExpired:0 scheduledActivity:&v71];
    id v22 = v71;
    uint64_t v30 = v22;
    if (self->_useSUCoreXPCActivityManager)
    {
      id v70 = 0;
      BOOL v31 = [(SUScheduler *)self activityWasPreviouslyScheduledForFutureDate:@"com.apple.softwareupdateservicesd.activity.autoDownload" copy:&v70];
      id v32 = v70;
      uint64_t v33 = v32;
      if (v31)
      {
        v41 = [v32 runDate];
        if (v41)
        {
          v42 = [v33 runDate];
          SULogInfo(@"Found auto download which was previously set to run on %@ but is not currently scheduled", v43, v44, v45, v46, v47, v48, v49, (uint64_t)v42);
        }
        else
        {
          SULogInfo(@"Found auto download which was previously set to run on %@ but is not currently scheduled", v34, v35, v36, v37, v38, v39, v40, @"Unknown Date");
        }
      }
      else
      {

        uint64_t v33 = v30;
        if (!v21) {
          goto LABEL_23;
        }
      }
    }
    else
    {
      uint64_t v33 = v22;
      if (!v21) {
        goto LABEL_23;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      SULogInfo(@"[Auto download] Found auto download activity: %@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v33);
      [(SUScheduler *)self cancelAutoDownloadTask];
      v57 = [v33 runDate];
      if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v58 = [MEMORY[0x263EFF910] date];
        if ([v58 compare:v57] != 1)
        {
LABEL_26:

          uint64_t v66 = [v33 plugInState];
          v67 = [v33 batteryLevelGreaterThan];
          [(SUScheduler *)self scheduleAutoDownloadWithDate:v57 requirePower:v66 minimumPowerRquirement:v67];

          [(SUManagerInterface *)self->_manager loadBrainOnUnlock];
          goto LABEL_27;
        }
        SULogInfo(@"[Auto download] Auto download activity had a run date in the past(%@). Clearing it for next schedule attempt", v59, v60, v61, v62, v63, v64, v65, (uint64_t)v57);
      }
      else
      {
        SULogInfo(@"[Auto download] Setting runDate for autoDownload activity to nil because of invalid/unset runDate on downloadActivity object", v50, v51, v52, v53, v54, v55, v56, v69);
        v58 = v57;
      }
      v57 = 0;
      goto LABEL_26;
    }
    uint64_t v30 = v33;
LABEL_23:
    SULogInfo(@"[Auto download] Not re-scheduling autoDownload since it was not previously scheduled", v23, v24, v25, v26, v27, v28, v29, v68);
    uint64_t v33 = v30;
LABEL_27:

    return;
  }
  SULogInfo(@"[Auto download] Not scheduling auto download: Currently Downloading", v3, v4, v5, v6, v7, v8, v9, v73);
}

- (void)scheduleAutoDownloadWithDate:(id)a3 requirePower:(int)a4 minimumPowerRquirement:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 intValue];
  SULogInfo(@"Scheduling an auto download for %@; requirePower=%d, minimumPowerRequirement=%d",
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    (uint64_t)v8);
  if (v8)
  {
    id v24 = objc_alloc_init(MEMORY[0x263F77B20]);
    uint64_t v25 = v24;
    if (a4 == 1) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = a4;
    }
    [v24 setPlugInState:v26];
    [v25 setWifiState:2];
    [v25 setWaking:2];
    [v25 setRunDate:v8];
    if (a4 == 1 && v9) {
      [v25 setBatteryLevelGreaterThan:v9];
    }
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.autoDownload" options:v25];
    [(SUScheduler *)self _scheduleActivity:v27];
  }
  else
  {
    SULogInfo(@"runDate is nil for auto download; start immediately", v17, v18, v19, v20, v21, v22, v23, v29);
    schedulerQueue = self->_schedulerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__SUScheduler_scheduleAutoDownloadWithDate_requirePower_minimumPowerRquirement___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(schedulerQueue, block);
  }
}

uint64_t __80__SUScheduler_scheduleAutoDownloadWithDate_requirePower_minimumPowerRquirement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleAutoDownload:info:", @"com.apple.softwareupdateservicesd.activity.autoDownload", 0);
}

- (void)cancelAutoDownloadTask
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUScheduler_cancelAutoDownloadTask__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __37__SUScheduler_cancelAutoDownloadTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.autoDownload");
}

- (void)scheduleAutoInstallExpirationTask:(id)a3
{
  id v6 = [a3 suEndDate];
  if (v6)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F77B20]);
    [v4 setWaking:2];
    [v4 setRunDate:v6];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.autoInstallEnd" options:v4];
    [(SUScheduler *)self _scheduleActivity:v5];
  }
}

- (void)cancelAutoInstallWindowExpirationTask
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SUScheduler_cancelAutoInstallWindowExpirationTask__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __52__SUScheduler_cancelAutoInstallWindowExpirationTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.autoInstallEnd");
}

- (void)scheduleAutoInstallUnlockWindowStartTask:(id)a3
{
  id v6 = [a3 unlockStartDate];
  if (v6)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F77B20]);
    [v4 setWaking:2];
    [v4 setRunDate:v6];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.autoInstallUnlock" options:v4];
    [(SUScheduler *)self _scheduleActivity:v5];
  }
}

- (void)cancelAutoInstallUnlockWindowStartTask
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUScheduler_cancelAutoInstallUnlockWindowStartTask__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __53__SUScheduler_cancelAutoInstallUnlockWindowStartTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.autoInstallUnlock");
}

- (id)_next7OClockFrom:(id)a3 after:(double)a4
{
  id v4 = [a3 dateByAddingTimeInterval:a4];
  uint64_t v5 = specificTimeOnDate(v4, 7, 0, 0);
  id v6 = specificTimeOnDate(v4, 19, 0, 0);
  uint64_t v7 = [v5 dateByAddingTimeInterval:86400.0];
  uint64_t v8 = [v4 compare:v5];
  id v9 = v5;
  if (v8 == 1)
  {
    if ([v4 compare:v6] == 1) {
      id v9 = v7;
    }
    else {
      id v9 = v6;
    }
  }
  id v10 = v9;

  return v10;
}

- (void)_scheduleAutoInstallGetKeybagTaskForDate:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263F77B20];
    id v5 = a3;
    id v7 = objc_alloc_init(v4);
    [v7 setRunDate:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.autoInstallGetKeybag" options:v7];
    [(SUScheduler *)self _scheduleActivity:v6];
  }
}

- (void)scheduleAutoInstallGetKeybagTaskForDescriptor:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v18 = [v4 now];
  id v6 = -[SUScheduler _next7OClockFrom:after:](self, "_next7OClockFrom:after:", 0.0);
  id v7 = +[SUKeybagInterface sharedInstance];
  int v8 = [v7 installationKeybagStateForDescriptor:v5];

  if (v8 == 1)
  {
    [v6 timeIntervalSinceDate:v18];
    if (v16 > 3600.0)
    {
      uint64_t v17 = [v18 dateByAddingTimeInterval:5.0];

      id v6 = (void *)v17;
    }
  }
  SULogDebug(@"%s: trigger date = %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[SUScheduler scheduleAutoInstallGetKeybagTaskForDescriptor:]");
  [(SUScheduler *)self _scheduleAutoInstallGetKeybagTaskForDate:v6];
}

- (void)cancelAutoInstallGetKeybagTask
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUScheduler_cancelAutoInstallGetKeybagTask__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __45__SUScheduler_cancelAutoInstallGetKeybagTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.autoInstallGetKeybag");
}

- (void)scheduleAutoInstallStartInstallTask:(id)a3 descriptor:(id)a4
{
  id v7 = a4;
  id v6 = [a3 suStartDate];
  if (v6)
  {
    [(SUScheduler *)self scheduleAutoInstallStartInstallTaskWithDate:v6 descriptor:v7 fromFailure:0];
    +[SUUtility writeAUKeepAliveFile];
  }
}

- (id)_autoInstallActivityCriteriaWithInstallDate:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x263EF81C0], 0);
  if (v6)
  {
    uint64_t v9 = (const char *)*MEMORY[0x263EF81A0];
    [v6 timeIntervalSinceNow];
    xpc_dictionary_set_int64(empty, v9, (uint64_t)v10);
  }
  xpc_dictionary_set_uint64(empty, (const char *)*MEMORY[0x263EF8298], 0x1C20uLL);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF8228], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v11, (const char *)[(id)*MEMORY[0x263F3B008] UTF8String], 1);
  if ([(SUServerConfigurationManager *)self->_serverConfigManager defaultToOldInactivityPredictor])
  {
    SULogInfo(@"Defaulting to old inactivity predictor for autoInstall", v12, v13, v14, v15, v16, v17, v18, v29);
    xpc_dictionary_set_BOOL(v11, (const char *)[(id)*MEMORY[0x263F3B018] UTF8String], 1);
  }
  if (v7)
  {
    uint64_t v19 = objc_alloc_init(SUInstallOptions);
    [(SUInstallOptions *)v19 setAutomaticInstallation:1];
    uint64_t v20 = (uint64_t)(float)(SURequiredBatteryLevelForInstallation(v7, v19) * 100.0);
    SULogInfo(@"Require %lld battery for das to fire", v21, v22, v23, v24, v25, v26, v27, v20);
    xpc_dictionary_set_int64(v11, (const char *)[(id)*MEMORY[0x263F3B010] UTF8String], v20);
  }
  xpc_dictionary_set_value(empty, (const char *)*MEMORY[0x263EF81B0], v11);

  return empty;
}

- (void)scheduleAutoInstallStartInstallTaskWithDate:(id)a3 descriptor:(id)a4 fromFailure:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke;
  v18[3] = &unk_26447CD70;
  v18[4] = self;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  uint64_t v12 = (void *)MEMORY[0x223C18480](v18);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  [v10 timeIntervalSinceNow];
  schedulerQueue = self->_schedulerQueue;
  if (v5 && v13 > 0.0)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_4;
    v15[3] = &unk_26447E970;
    v15[4] = self;
    double v17 = v13;
    id v16 = v12;
    dispatch_sync(schedulerQueue, v15);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_schedulerQueue, v12);
  }
}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke(id *a1)
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 5));
  objc_msgSend(a1[4], "_queue_cancelAutoInstallStartInstallTask");
  objc_msgSend(a1[4], "_queue_invalidateRetryAutoInstallaTimer");
  id v2 = (const char *)[@"com.apple.softwareupdate.autoinstall.startInstall" UTF8String];
  uint64_t v3 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_2;
  handler[3] = &unk_26447E920;
  id v4 = a1[5];
  id v5 = a1[4];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[6];
  xpc_activity_register(v2, v3, handler);
}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    SULogInfo(@"DAS fired autoInstallStart activity", v5, v6, v7, v8, v9, v10, v11, v32);
    [*(id *)(a1 + 40) setAutoinstallActivity:v3];
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        uint64_t v23 = +[SUUtility mainWorkQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_3;
        block[3] = &unk_26447C878;
        block[4] = *(void *)(a1 + 40);
        dispatch_async(v23, block);
      }
    }
    else
    {
      if (xpc_activity_set_state(v3, 4)) {
        SULogInfo(@"Successfully set %@ activity state to XPC_ACTIVITY_STATE_CONTINUE", v25, v26, v27, v28, v29, v30, v31, @"com.apple.softwareupdate.autoinstall.startInstall");
      }
      objc_msgSend(*(id *)(a1 + 40), "_queue_handleAutoInstallStart:info:", @"com.apple.softwareupdate.autoinstall.startInstall", 0);
    }
    goto LABEL_14;
  }
  if (state)
  {
    uint64_t v32 = state;
    uint64_t v24 = @"Unknown XPC activity state (%ld) for activity %@";
LABEL_10:
    SULogInfo(v24, v5, v6, v7, v8, v9, v10, v11, v32);
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = xpc_activity_copy_criteria(v3);
  if (!v12)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = +[SUUtility prettyPrintDate:*(void *)(a1 + 32)];
      SULogInfo(@"Scheduled autoInstall start time for: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

      uint64_t v12 = [*(id *)(a1 + 40) _autoInstallActivityCriteriaWithInstallDate:*(void *)(a1 + 32) descriptor:*(void *)(a1 + 48)];

      xpc_activity_set_criteria(v3, v12);
      goto LABEL_15;
    }
    uint64_t v24 = @"Failed to schedule AutoInstall start task";
    goto LABEL_10;
  }
LABEL_15:
}

uint64_t __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"Attempted to defer autoInstallStart activity but failed.", a2, a3, a4, a5, a6, a7, a8, v11);
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v9 trySchedulingAutoInstallAgainLater];
}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_4(double *a1)
{
  id v2 = (void *)MEMORY[0x263EFFA20];
  double v3 = a1[6];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_5;
  v17[3] = &unk_26447E948;
  id v4 = (void *)*((void *)a1 + 5);
  *(double *)&v17[4] = a1[4];
  id v18 = v4;
  uint64_t v5 = [v2 timerWithTimeInterval:0 repeats:v17 block:v3];
  uint64_t v6 = *((void *)a1 + 4);
  uint64_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;

  uint64_t v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v8 addTimer:*(void *)(*((void *)a1 + 4) + 72) forMode:*MEMORY[0x263EFF478]];

  uint64_t v16 = [*(id *)(*((void *)a1 + 4) + 72) fireDate];
  SULogInfo(@"%s: Try to reschedule %@ on %@ due to a previous failure; timer (%p)",
    v9,
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    (uint64_t)"-[SUScheduler scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:]_block_invoke_4");
}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"%s: retryAutoInstallTimer(%@) fired!", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUScheduler scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:]_block_invoke_5");
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  dispatch_sync(v10, v9);
}

- (void)scheduleSimulatedAutoInstallTask
{
  if (+[SUUtility currentReleaseTypeIsInternal])
  {
    SULogInfo(@"%s: Scheduled simulated auto install activity", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]");
    uint64_t v10 = [(SUScheduler *)self _autoInstallActivityCriteriaWithInstallDate:0 descriptor:0];
    uint64_t v11 = (const char *)[@"com.apple.softwareupdate.autoinstall.simulated.startInstall" UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __47__SUScheduler_scheduleSimulatedAutoInstallTask__block_invoke;
    handler[3] = &unk_26447DB98;
    void handler[4] = self;
    xpc_activity_register(v11, v10, handler);
  }
}

void __47__SUScheduler_scheduleSimulatedAutoInstallTask__block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  BOOL v3 = xpc_activity_get_state(activity) == 2;
  uint64_t v4 = activity;
  if (v3)
  {
    if (xpc_activity_should_defer(activity) && xpc_activity_set_state(activity, 3))
    {
      SULogInfo(@"%s: Simulated auto install activity deferred", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]_block_invoke");
    }
    else
    {
      SULogInfo(@"%s: Simulated auto install activity called", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]_block_invoke");
      [*(id *)(*(void *)(a1 + 32) + 48) reportSimulatedOTAAutoTriggeredEvent];
      if (!xpc_activity_set_state(activity, 5)) {
        SULogInfo(@"%s: Failed to set %@ activity state to XPC_ACTIVITY_STATE_DONE", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]_block_invoke");
      }
      xpc_activity_unregister((const char *)[@"com.apple.softwareupdate.autoinstall.simulated.startInstall" UTF8String]);
    }
    uint64_t v4 = activity;
  }
}

- (void)setAutoInstallActivityStateDone
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUScheduler_setAutoInstallActivityStateDone__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

void __46__SUScheduler_setAutoInstallActivityStateDone__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(_xpc_activity_s **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    if (xpc_activity_set_state(v1, 5)) {
      uint64_t v9 = @"Succeeded to set %@ activity state to XPC_ACTIVITY_STATE_DONE";
    }
    else {
      uint64_t v9 = @"Failed to set %@ activity state to XPC_ACTIVITY_STATE_DONE";
    }
    SULogInfo(v9, v2, v3, v4, v5, v6, v7, v8, @"com.apple.softwareupdate.autoinstall.startInstall");
  }
}

- (void)cancelAutoInstallStartInstallTask
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUScheduler_cancelAutoInstallStartInstallTask__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

BOOL __48__SUScheduler_cancelAutoInstallStartInstallTask__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAutoInstallStartInstallTask");
  objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateRetryAutoInstallaTimer");
  return +[SUUtility deleteAUKeepAliveFile];
}

- (void)_queue_cancelAutoInstallStartInstallTask
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  if (self->_autoInstallActivity) {
    [(SUScheduler *)self _queue_setAutoinstallActivity:0];
  }
  xpc_activity_unregister((const char *)[@"com.apple.softwareupdate.autoinstall.startInstall" UTF8String]);
  SULogInfo(@"%s: Tried to cancel the previous auto-install activity %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUScheduler _queue_cancelAutoInstallStartInstallTask]");
}

- (void)_invalidateRetryAutoInstallaTimer
{
  SULogInfo(@"%s: About to invalidate the retryAutoInstallTimer (%@)", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)"-[SUScheduler _invalidateRetryAutoInstallaTimer]");
  retryAutoInstallTimer = self->_retryAutoInstallTimer;
  if (retryAutoInstallTimer)
  {
    BOOL v10 = [(NSTimer *)retryAutoInstallTimer isValid];
    retryAutoInstallTimer = self->_retryAutoInstallTimer;
    if (v10)
    {
      [(NSTimer *)retryAutoInstallTimer invalidate];
      retryAutoInstallTimer = self->_retryAutoInstallTimer;
    }
  }
  self->_retryAutoInstallTimer = 0;
}

- (void)_queue_invalidateRetryAutoInstallaTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  [(SUScheduler *)self _invalidateRetryAutoInstallaTimer];
}

- (void)schedulePresentAutoUpdateBanner
{
  uint64_t v3 = +[SUPreferences sharedInstance];
  id v16 = [v3 bannerDelay];

  uint64_t v4 = 0x409C200000000000;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 doubleValue];
      uint64_t v4 = v5;
    }
  }
  uint64_t v6 = SULogBadging();
  SULogInfoForSubsystem(v6, @"Delaying auto update for %f seconds", v7, v8, v9, v10, v11, v12, v4);

  id v13 = objc_alloc_init(MEMORY[0x263F77B20]);
  [v13 setWaking:2];
  uint64_t v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:*(double *)&v4];
  [v13 setRunDate:v14];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.presentBanner" options:v13];
  [(SUScheduler *)self _scheduleActivity:v15];
}

- (void)cancelPresentAutoUpdateBanner
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUScheduler_cancelPresentAutoUpdateBanner__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __44__SUScheduler_cancelPresentAutoUpdateBanner__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.presentBanner");
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_handleCancelPresentBannerOnUnlock");
}

- (void)scheduleRollbackReboot:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F77B20];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  [v7 setWaking:2];
  [v7 setRunDate:v5];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.rollbackReboot" options:v7];
  [(SUScheduler *)self _scheduleActivity:v6];
}

- (void)cancelRollbackReboot
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SUScheduler_cancelRollbackReboot__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __35__SUScheduler_cancelRollbackReboot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.rollbackReboot");
}

- (void)scheduleInstallAlertRegistration:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F77B20];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  [v7 setBatteryLevelGreaterThan:&unk_26CEBD0C0];
  [v7 setPhoneCallState:1];
  [v7 setCarplayState:1];
  [v7 setMediaPlayingState:1];
  [v7 setNetworkState:2];
  [v7 setWaking:2];
  [v7 setRunDate:v5];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.installAlert" options:v7];
  [(SUScheduler *)self _scheduleActivity:v6];
}

- (void)cancelInstallAlertRegistration
{
  +[SUUtility deleteKeepAliveFile];
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUScheduler_cancelInstallAlertRegistration__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __45__SUScheduler_cancelInstallAlertRegistration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.installAlert");
}

- (void)cancelInstallAlertRegistrationButKeepAlive
{
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUScheduler_cancelInstallAlertRegistrationButKeepAlive__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __57__SUScheduler_cancelInstallAlertRegistrationButKeepAlive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", @"com.apple.softwareupdateservicesd.activity.installAlert");
}

- (void)scheduleAnalyticsSubmissionIfNecessary
{
  BOOL v3 = [(SUScheduler *)self _activityIsScheduled:@"com.apple.softwareupdateservicesd.activity.analyticsSubmission" cancelIfExpired:1];
  if (self->_useSUCoreXPCActivityManager
    && [(SUScheduler *)self activityWasPreviouslyScheduledForFutureDate:@"com.apple.softwareupdateservicesd.activity.analyticsSubmission" copy:0])
  {
    uint64_t v4 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getExpectedRunDateForActivity:@"com.apple.softwareupdateservicesd.activity.analyticsSubmission"];
    id v5 = +[SUUtility prettyPrintDate:v4];
    SULogInfo(@"Found previously tracked but currently unscheduled analytics submission event expecte to run at %@. Will reschedule", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  }
  else if (v3)
  {
    SULogAnalytics();
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v41, @"Analytics event already scheduled", v13, v14, v15, v16, v17, v18, v40);
    goto LABEL_13;
  }
  uint64_t v19 = +[SUUtility currentReleaseType];
  int v20 = [v19 isEqualToString:@"Internal"];

  if (v20
    && (+[SUPreferences sharedInstance],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        [v21 analyticsSubmissionIntervalOverride],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        v21,
        v22))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = SULogAnalytics();
      uint64_t v24 = [v22 unsignedIntValue];
      SULogInfoForSubsystem(v23, @"Setting analytics submission delay to %u", v25, v26, v27, v28, v29, v30, v24);
    }
    int v31 = +[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 30, 60 * [v22 unsignedIntValue]);
  }
  else
  {
    int v31 = +[SUUtility randomIntWithMinVal:60 maxVal:86400];
  }
  id v41 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)v31];
  uint64_t v32 = +[SUUtility prettyPrintDate:v41];
  SULogInfo(@"Expired or no analytics submission scheduled. Rescheduling for %@", v33, v34, v35, v36, v37, v38, v39, (uint64_t)v32);

  [(SUScheduler *)self scheduleAnalyticsSubmission:v41];
LABEL_13:
}

- (void)scheduleAnalyticsSubmission:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F77B20];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  [v7 setNetworkState:2];
  [v7 setWaking:2];
  [v7 setRunDate:v5];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F77B18]) initWithActivityName:@"com.apple.softwareupdateservicesd.activity.analyticsSubmission" options:v7];
  [(SUScheduler *)self _scheduleActivity:v6];
}

- (void)_scheduleActivity:(id)a3
{
  id v4 = a3;
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SUScheduler__scheduleActivity___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(schedulerQueue, v7);
}

void __33__SUScheduler__scheduleActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    int v11 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 16);
    uint64_t v12 = [v10 activityName];
    uint64_t v13 = [*(id *)(a1 + 32) runDate];
    uint64_t v21 = +[SUUtility prettyPrintDate:v13];
    if (!v11)
    {
      SULogInfo(@"Scheduling Activity (%@, runDate = %@) with legacy scheduler", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v12);

      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      uint64_t v26 = *(void **)(v25 + 8);
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __33__SUScheduler__scheduleActivity___block_invoke_4;
      v65[3] = &unk_26447E998;
      v65[4] = v25;
      [v26 scheduleActivity:v24 withHandler:v65];
      return;
    }
    SULogInfo(@"Scheduling Activity (%@, runDate = %@) with XPCActivity scheduler", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v12);

    uint64_t v22 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v23 = [*(id *)(a1 + 32) activityName];
    if ([v22 isActivityScheduled:v23])
    {
    }
    else
    {
      uint64_t v27 = *(void **)(*(void *)(a1 + 40) + 24);
      uint64_t v28 = [*(id *)(a1 + 32) activityName];
      LODWORD(v27) = [v27 isActivityTrackedButUnsheduled:v28];

      if (!v27)
      {
LABEL_11:
        id v39 = objc_alloc_init(MEMORY[0x263F77B20]);
        uint64_t v40 = [*(id *)(a1 + 32) runDate];
        [v39 setRunDate:v40];

        id v41 = [*(id *)(a1 + 32) batteryLevelGreaterThan];
        [v39 setBatteryLevelGreaterThan:v41];

        v42 = [*(id *)(a1 + 32) batteryLevelLessThan];
        [v39 setBatteryLevelLessThan:v42];

        objc_msgSend(v39, "setPlugInState:", objc_msgSend(*(id *)(a1 + 32), "plugInState"));
        objc_msgSend(v39, "setScreenOnState:", objc_msgSend(*(id *)(a1 + 32), "screenOnState"));
        objc_msgSend(v39, "setNetworkState:", objc_msgSend(*(id *)(a1 + 32), "networkState"));
        objc_msgSend(v39, "setWifiState:", objc_msgSend(*(id *)(a1 + 32), "wifiState"));
        objc_msgSend(v39, "setPhoneCallState:", objc_msgSend(*(id *)(a1 + 32), "phoneCallState"));
        objc_msgSend(v39, "setCarplayState:", objc_msgSend(*(id *)(a1 + 32), "carplayState"));
        objc_msgSend(v39, "setMediaPlayingState:", objc_msgSend(*(id *)(a1 + 32), "mediaPlayingState"));
        objc_msgSend(v39, "setWaking:", objc_msgSend(*(id *)(a1 + 32), "waking"));
        uint64_t v43 = [*(id *)(a1 + 32) activityName];
        SULogInfo(@"The options for activity %@ are %@", v44, v45, v46, v47, v48, v49, v50, (uint64_t)v43);

        id v51 = objc_alloc(MEMORY[0x263F77BD0]);
        uint64_t v52 = [*(id *)(a1 + 32) activityName];
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __33__SUScheduler__scheduleActivity___block_invoke_2;
        v66[3] = &unk_26447DB98;
        v66[4] = *(void *)(a1 + 40);
        uint64_t v53 = (void *)[v51 init:v52 options:v39 handler:v66];

        [*(id *)(*(void *)(a1 + 40) + 24) scheduleActivity:v53];
        uint64_t v54 = *(void **)(*(void *)(a1 + 40) + 24);
        uint64_t v55 = [*(id *)(a1 + 32) activityName];
        LODWORD(v54) = [v54 isActivityScheduled:v55];

        uint64_t v63 = [*(id *)(a1 + 32) activityName];
        if (v54) {
          uint64_t v64 = @"Successfully scheduled activity %@";
        }
        else {
          uint64_t v64 = @"Failed to schedule activity %@";
        }
        SULogInfo(v64, v56, v57, v58, v59, v60, v61, v62, (uint64_t)v63);

        return;
      }
    }
    uint64_t v29 = [*(id *)(a1 + 32) activityName];
    SULogInfo(@"Unscheduling existing activity %@ before reshedule", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v29);

    uint64_t v37 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v38 = [*(id *)(a1 + 32) activityName];
    [v37 unscheduleActivity:v38];

    goto LABEL_11;
  }
  SULogInfo(@"Cannot schedule null activity", a2, a3, a4, a5, a6, a7, a8, a9);
}

void __33__SUScheduler__scheduleActivity___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = xpc_activity_copy_identifier();
  if (v10)
  {
    uint64_t v18 = (void *)v10;
    uint64_t v19 = [NSString stringWithUTF8String:v10];
    free(v18);
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(NSObject **)(v20 + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __33__SUScheduler__scheduleActivity___block_invoke_3;
    v23[3] = &unk_26447C8C8;
    v23[4] = v20;
    id v24 = v19;
    id v22 = v19;
    dispatch_async(v21, v23);
  }
  else
  {
    SULogInfo(@"Failed to read activity name from XPC activity. Unable to run scheduled task", v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t __33__SUScheduler__scheduleActivity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivity:info:", *(void *)(a1 + 40), 0);
}

void __33__SUScheduler__scheduleActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUScheduler__scheduleActivity___block_invoke_5;
  block[3] = &unk_26447CD70;
  block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __33__SUScheduler__scheduleActivity___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivity:info:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_unscheduleActivity:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUScheduler__unscheduleActivity___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(schedulerQueue, v7);
}

void __35__SUScheduler__unscheduleActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(a1 + 32))
  {
    SULogInfo(@"Unscheduling activity %@ with %@ scheduler", a2, a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
    uint64_t v10 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v10 + 16))
    {
      uint64_t v11 = *(void **)(v10 + 24);
      id v12 = [*(id *)(a1 + 32) activityName];
      LODWORD(v11) = [v11 unscheduleActivity:v12];

      uint64_t v13 = [*(id *)(a1 + 32) activityName];
      id v22 = (id)v13;
      if (v11) {
        SULogInfo(@"Failed to unshedule activity %@", v14, v15, v16, v17, v18, v19, v20, v13);
      }
      else {
        SULogInfo(@"Successfully unscheduled activity %@", v14, v15, v16, v17, v18, v19, v20, v13);
      }
    }
    else
    {
      uint64_t v21 = *(void *)(a1 + 32);
      objc_msgSend((id)v10, "_queue_unscheduleActivity:", v21);
    }
  }
  else
  {
    SULogInfo(@"Cannot unschedule null activity", a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

- (void)_queue_unscheduleAllActivitiesWithName:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  if (self->_useSUCoreXPCActivityManager)
  {
    if ([(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler unscheduleActivity:v11])SULogInfo(@"Failed to unshedule activity %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v11); {
    else
    }
      SULogInfo(@"Successfully unscheduled activity %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v11);
  }
  else
  {
    [(SUCoreActivityScheduler *)self->_coreScheduler unregisterActivitiesWithName:v11];
  }
}

- (void)_queue_unscheduleActivity:(id)a3
{
  schedulerQueue = self->_schedulerQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(schedulerQueue);
  if (self->_useSUCoreXPCActivityManager)
  {
    uint64_t v5 = [v7 activityName];

    [(SUScheduler *)self _queue_unscheduleAllActivitiesWithName:v5];
    uint64_t v6 = (void *)v5;
  }
  else
  {
    [(SUCoreActivityScheduler *)self->_coreScheduler unregisterActivity:v7];
    uint64_t v6 = v7;
  }
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SUScheduler_handleXPCEvent___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(schedulerQueue, v7);
}

uint64_t __30__SUScheduler_handleXPCEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivity:info:", *(void *)(a1 + 40), 0);
}

- (void)_queue_handleActivity:(id)a3 info:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  SULogInfo(@"Received activity: %@ with info: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v26);
  uint64_t v14 = +[SUTransactionManager sharedInstance];
  [v14 beginTransaction:@"schedulerAction" keepAlive:1];
  if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoScan"]
    || [v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.emergencyAutoScan"]|| objc_msgSend(v26, "isEqualToString:", @"com.apple.softwareupdateservicesd.activity.autoScan")|| objc_msgSend(v26, "isEqualToString:", @"com.apple.softwareupdateservicesd.activity.splatAutoScan"))
  {
    uint64_t v15 = self;
    id v16 = v26;
    id v17 = v6;
    uint64_t v18 = 1;
LABEL_6:
    [(SUScheduler *)v15 _queue_handleAutoScan:v16 info:v17 rescheduler:v18];
    goto LABEL_7;
  }
  if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.delayEndScan"])
  {
    uint64_t v15 = self;
    id v16 = v26;
    id v17 = v6;
    uint64_t v18 = 0;
    goto LABEL_6;
  }
  if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoDownload"])
  {
    [(SUScheduler *)self _queue_handleAutoDownload:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdate.autoinstall.startInstall"])
  {
    [(SUScheduler *)self _queue_handleAutoInstallStart:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoInstallEnd"])
  {
    [(SUScheduler *)self _queue_handleAutoInstallEnd:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoInstallUnlock"])
  {
    [(SUScheduler *)self _queue_handleAutoInstallUnlock:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoInstallGetKeybag"])
  {
    [(SUScheduler *)self _queue_handleAutoInstallGetKeybag:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.installAlert"])
  {
    [(SUScheduler *)self _queue_handleInstallAlert:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.presentBanner"])
  {
    [(SUScheduler *)self _queue_handlePresentBanner:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.SUCoreConfigScheduledScan"])
  {
    [(SUScheduler *)self _queue_handleServerConfigScan:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.analyticsSubmission"])
  {
    [(SUScheduler *)self _queue_handleAnalyticsSubmission:v26 info:v6];
  }
  else if ([v26 isEqualToString:@"com.apple.softwareupdateservicesd.activity.rollbackReboot"])
  {
    [(SUScheduler *)self _queue_handleRollbackReboot:v26 info:v6];
  }
  else
  {
    SULogError(@"Unknown activity: %@", v19, v20, v21, v22, v23, v24, v25, (uint64_t)v26);
  }
LABEL_7:
  [v14 endTransaction:@"schedulerAction"];
}

- (double)_randomizedAutoScanDelayForType:(int)a3
{
  [(SUScheduler *)self _autoScanTimeIntervalForType:*(void *)&a3];
  return (double)+[SUUtility randomIntWithMinVal:60 maxVal:v3];
}

- (double)_autoScanTimeInterval
{
  [(SUScheduler *)self _autoScanTimeIntervalForType:0];
  return result;
}

- (double)_autoScanTimeIntervalForType:(int)a3
{
  double v3 = [(SUServerConfigurationManager *)self->_serverConfigManager softwareUpdateAutoScanInterval];
  id v4 = v3;
  if (v3)
  {
    double v5 = (double)(int)(60 * [v3 intValue]);
    uint64_t v6 = [v4 intValue];
    SULogInfo(@"Using server configured auto scan interval - scan once every %d minutes", v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else
  {
    +[SUUtility autoScanTimeInterval];
    double v5 = v14;
  }

  return v5;
}

- (double)_autoDownloadTimeInterval
{
  double v3 = +[SUPreferences sharedInstance];
  id v4 = [v3 autoDownloadOverrideInterval];

  if (v4)
  {
    double v5 = +[SUPreferences sharedInstance];
    uint64_t v6 = [v5 autoDownloadOverrideInterval];
    SULogInfo(@"[Auto download] Using auto download override value: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);

    double v14 = +[SUPreferences sharedInstance];
    uint64_t v15 = [v14 autoDownloadOverrideInterval];
    double v16 = (double)(int)[v15 intValue];

LABEL_5:
    return v16;
  }
  id v17 = [(SUServerConfigurationManager *)self->_serverConfigManager softwareUpdateAutoScanInterval];
  if (v17)
  {
    double v14 = v17;
    double v16 = (double)(int)(60 * [v17 intValue]);
    uint64_t v18 = [v14 intValue];
    SULogInfo(@"[Auto download] Using server configured auto scan interval - download once every %d minutes", v19, v20, v21, v22, v23, v24, v25, v18);
    goto LABEL_5;
  }
  +[SUUtility autoDownloadTimeInterval];
  return result;
}

- (BOOL)activityWasPreviouslyScheduledForFutureDate:(id)a3 copy:(id *)a4
{
  id v13 = a3;
  if (self->_useSUCoreXPCActivityManager)
  {
    int v21 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler isActivityTrackedButUnsheduled:v13];
    if (a4)
    {
      uint64_t v22 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getActivityForName:v13];
      if (v22)
      {
        id v23 = objc_alloc(MEMORY[0x263F77B18]);
        uint64_t v24 = [v22 activityName];
        uint64_t v25 = [v22 activityOptions];
        *a4 = (id)[v23 initWithActivityName:v24 options:v25];
      }
    }
    if (v21)
    {
      id v26 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getExpectedRunDateForActivity:v13];
      if (v26
        && ([MEMORY[0x263EFF910] date],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            uint64_t v28 = [v26 compare:v27],
            v27,
            v28 == -1))
      {
        uint64_t v29 = [MEMORY[0x263F77D80] stringFromDate:v26];
        SULogInfo(@"Activity %@ is tracked, not currently scheduled and has a run date(%@) in the past", v37, v38, v39, v40, v41, v42, v43, (uint64_t)v13);
        LOBYTE(v21) = 0;
      }
      else
      {
        uint64_t v29 = [MEMORY[0x263F77D80] stringFromDate:v26];
        SULogInfo(@"Activity %@ is tracked, not currently scheduled and has a rundate(%@) in the future", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v13);
        LOBYTE(v21) = 1;
      }
    }
    else
    {
      SULogInfo(@"Activity %@ is not one that was previously tracked but unsheduled", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    }
  }
  else
  {
    SULogInfo(@"%s is not supported in this configuration", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUScheduler activityWasPreviouslyScheduledForFutureDate:copy:]");
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)_activityIsScheduled:(id)a3 cancelIfExpired:(BOOL)a4 scheduledActivity:(id *)a5
{
  BOOL v60 = a4;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!self->_useSUCoreXPCActivityManager)
  {
    uint64_t v58 = a5;
    uint64_t v31 = (void *)[(SUCoreActivityScheduler *)self->_coreScheduler copyScheduledActivities];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v31;
    uint64_t v32 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v59 = self;
      id v21 = 0;
      int v34 = 0;
      uint64_t v35 = *(void *)v65;
      do
      {
        uint64_t v36 = 0;
        uint64_t v62 = v33;
        do
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void **)(*((void *)&v64 + 1) + 8 * v36);
          uint64_t v38 = [v37 activityName];
          int v39 = [v38 isEqualToString:v7];

          if (v39)
          {
            uint64_t v47 = v35;
            id v48 = v7;
            int v49 = v34 + 1;
            SULogInfo(@"Found scheduled activity: %@", v40, v41, v42, v43, v44, v45, v46, (uint64_t)v37);
            uint64_t v50 = [v37 runDate];
            if (v50)
            {
              id v51 = (void *)v50;
              int v61 = v34;
              uint64_t v52 = [v37 runDate];
              uint64_t v53 = [MEMORY[0x263EFF910] date];
              id v54 = v21;
              uint64_t v55 = [v52 compare:v53];

              BOOL v56 = v55 == -1;
              id v21 = v54;
              BOOL v56 = !v56 || !v60;
              if (!v56)
              {
                [(SUScheduler *)v59 _unscheduleActivity:v37];
                int v49 = v61;
              }
            }
            if (v49 < 1)
            {
              int v34 = v49;
              id v7 = v48;
            }
            else
            {
              id v7 = v48;
              if (!v21) {
                id v21 = v37;
              }
              int v34 = v49;
            }
            uint64_t v35 = v47;
            uint64_t v33 = v62;
          }
          ++v36;
        }
        while (v33 != v36);
        uint64_t v33 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v33);
    }
    else
    {
      id v21 = 0;
      int v34 = 0;
    }

    if (v58) {
      id *v58 = (id)[v21 copy];
    }
    LOBYTE(v16) = v34 > 0;

    goto LABEL_38;
  }
  int v8 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler isActivityTrackedButUnsheduled:v7];
  int v16 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler isActivityScheduled:v7];
  if (a5)
  {
    uint64_t v17 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getActivityForName:v7];
    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F77B18]);
      uint64_t v19 = [v17 activityName];
      uint64_t v20 = [v17 activityOptions];
      *a5 = (id)[v18 initWithActivityName:v19 options:v20];
    }
  }
  if ((v16 | v8) != 1)
  {
    SULogInfo(@"Activity %@ is not scheduled", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    goto LABEL_33;
  }
  SULogInfo(@"Activity %@ is %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
  if (v60)
  {
    id v21 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getExpectedRunDateForActivity:v7];
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x263EFF910] date];
      uint64_t v23 = [v21 compare:v22];

      if (v23 == -1)
      {
        SULogInfo(@"Activity %@ is past its run date. Unscheduling", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v7);
        [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler unscheduleActivity:v7];

LABEL_33:
        LOBYTE(v16) = 0;
        goto LABEL_39;
      }
    }
LABEL_38:
  }
LABEL_39:

  return v16;
}

- (BOOL)_activityIsScheduled:(id)a3 cancelIfExpired:(BOOL)a4
{
  return [(SUScheduler *)self _activityIsScheduled:a3 cancelIfExpired:a4 scheduledActivity:0];
}

- (id)nextScheduledAutoScan
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_useSUCoreXPCActivityManager)
  {
    if ([(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler isActivityScheduled:@"com.apple.softwareupdateservicesd.activity.autoScan"])
    {
      double v3 = [(SUCoreXPCActivityManager *)self->_coreXPCActivityScheduler getExpectedRunDateForActivity:@"com.apple.softwareupdateservicesd.activity.autoScan"];
      goto LABEL_15;
    }
  }
  else
  {
    id v4 = (void *)[(SUCoreActivityScheduler *)self->_coreScheduler copyScheduledActivities];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "activityName", (void)v14);
          int v12 = [v11 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoScan"];

          if (!v12)
          {
            double v3 = [v10 runDate];

            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  double v3 = 0;
LABEL_15:
  return v3;
}

- (void)_queue_setAutoinstallActivity:(id)a3
{
  id v4 = (OS_xpc_object *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  autoInstallActivity = self->_autoInstallActivity;
  self->_autoInstallActivity = v4;
}

- (void)setAutoinstallActivity:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SUScheduler_setAutoinstallActivity___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(schedulerQueue, v7);
}

uint64_t __38__SUScheduler_setAutoinstallActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAutoinstallActivity:", *(void *)(a1 + 40));
}

- (void)_queue_handleScanIntervalConfigChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  SULogInfo(@"Scan interval server configuration changed", v4, v5, v6, v7, v8, v9, v10, v14);
  id v15 = [(SUScheduler *)self nextScheduledAutoScan];
  uint64_t v11 = (void *)MEMORY[0x263EFF910];
  [(SUScheduler *)self _autoScanTimeIntervalForType:0];
  int v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceNow:");
  if (!v15 && v12
    || v15
    && v12
    && ([v15 laterDate:v12],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == v15))
  {
    [(SUScheduler *)self cancelAllBackgroundScans];
    [(SUScheduler *)self scheduleBackgroundScan:v12];
  }
}

- (void)_queue_handleAutoScan:(id)a3 info:(id)a4 rescheduler:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  SULogInfo(@"Handling auto scan: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  int v15 = [(SUScheduler *)self scanTypeForActivityName:v7];
  [(SUScheduler *)self _queue_unscheduleAllActivitiesWithName:v7];
  if (v5)
  {
    long long v16 = +[SUUtility mainWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke;
    block[3] = &unk_26447E9E8;
    block[4] = self;
    int v19 = v15;
    id v18 = v7;
    dispatch_async(v16, block);
  }
}

void __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 48);
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke_2;
  v5[3] = &unk_26447E9C0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  int v7 = *(_DWORD *)(a1 + 48);
  [v3 autoScanAndDownloadIfAvailable:v4 downloadNow:0 withResult:v5];
}

void __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = (void *)MEMORY[0x263EFF910];
  [v1 _autoScanTimeIntervalForType:*(unsigned int *)(a1 + 48)];
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v1 scheduleBackgroundScan:v2 scanDate:v4];
}

- (int)scanTypeForActivityName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.softwareupdateservicesd.activity.autoScan"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"com.apple.softwareupdateservicesd.activity.emergencyAutoScan"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"com.apple.softwareupdateservicesd.activity.splatAutoScan"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_queue_handleAutoDownload:(id)a3 info:(id)a4
{
  id v5 = a3;
  SULogInfo(@"Handling auto download: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  [(SUScheduler *)self _queue_unscheduleAllActivitiesWithName:v5];

  uint64_t v13 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUScheduler__queue_handleAutoDownload_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v13, block);
}

uint64_t __46__SUScheduler__queue_handleAutoDownload_info___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) tryAutoDownload];
}

- (void)_queue_handleAutoInstallStart:(id)a3 info:(id)a4
{
  id v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUScheduler__queue_handleAutoInstallStart_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __50__SUScheduler__queue_handleAutoInstallStart_info___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) noteAutoInstallOperationWantsToBegin];
}

- (void)_queue_handleAutoInstallEnd:(id)a3 info:(id)a4
{
  id v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUScheduler__queue_handleAutoInstallEnd_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __48__SUScheduler__queue_handleAutoInstallEnd_info___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) noteAutoInstallOperationDidExpire];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 cancelAutoInstallWindowExpirationTask];
}

- (void)_queue_handleAutoInstallUnlock:(id)a3 info:(id)a4
{
  id v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUScheduler__queue_handleAutoInstallUnlock_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __51__SUScheduler__queue_handleAutoInstallUnlock_info___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) noteAutoInstallOperationUnlockWindowDidBegin];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 cancelAutoInstallUnlockWindowStartTask];
}

- (void)_queue_handleAutoInstallGetKeybag:(id)a3 info:(id)a4
{
  id v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUScheduler__queue_handleAutoInstallGetKeybag_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

void __54__SUScheduler__queue_handleAutoInstallGetKeybag_info___block_invoke(uint64_t a1)
{
  id v12 = (id)objc_opt_new();
  [v12 setPasscodePolicy:2];
  SULogInfo(@"%s: set passcode policy to required", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUScheduler _queue_handleAutoInstallGetKeybag:info:]_block_invoke");
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [MEMORY[0x263EFF910] now];
  uint64_t v11 = [v9 _next7OClockFrom:v10 after:126000.0];
  [v9 _scheduleAutoInstallGetKeybagTaskForDate:v11];
}

- (void)_queue_handleInstallAlert:(id)a3 info:(id)a4
{
  uint64_t v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUScheduler__queue_handleInstallAlert_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __46__SUScheduler__queue_handleInstallAlert_info___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelInstallAlertRegistration];
}

- (void)_queue_handlePresentBanner:(id)a3 info:(id)a4
{
  uint64_t v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUScheduler__queue_handlePresentBanner_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __47__SUScheduler__queue_handlePresentBanner_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SUKeybagInterface sharedInstance];
  int v3 = [v2 isPasscodeLocked];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v3)
  {
    return [v4 addUnlockCallback:sel__presentAutoUpdateBannerOnUnlock forKey:@"unlockCallbackPresentAutoUpdateBanner"];
  }
  else
  {
    return [v4 presentAutoUpdateBanner:0];
  }
}

- (void)_queue_handleServerConfigScan:(id)a3 info:(id)a4
{
  uint64_t v4 = +[SUUtility mainWorkQueue];
  dispatch_async(v4, &__block_literal_global_575);
}

void __50__SUScheduler__queue_handleServerConfigScan_info___block_invoke()
{
  id v0 = [MEMORY[0x263F77B40] sharedServerSettings];
  [v0 installServerSettings];
}

- (void)_queue_handleAnalyticsSubmission:(id)a3 info:(id)a4
{
  uint64_t v5 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUScheduler__queue_handleAnalyticsSubmission_info___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v5, block);
}

void __53__SUScheduler__queue_handleAnalyticsSubmission_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/" stringByAppendingPathComponent:@"updateDate"];
  int v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v2];
  uint64_t v4 = +[SUAnalyticsManager sharedManager];
  uint64_t v5 = SULogAnalytics();
  SULogInfoForSubsystem(v5, @"Determining days since update", v6, v7, v8, v9, v10, v11, v71);

  if (v3)
  {
    uint64_t v74 = 0;
    id v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v74];
    if (v12) {
      BOOL v13 = v74 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (!v13)
    {
      SULogAnalytics();
      uint64_t v14 = (SUAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v14, @"Failed to read valid update date", v15, v16, v17, v18, v19, v20, v72);
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v14 = [[SUAnalyticsEvent alloc] initWithEventName:@"com.apple.SoftwareUpdate.EmbeddedSoftwareUpdateUsage"];
    uint64_t v27 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v28 = [MEMORY[0x263EFF910] date];
    uint64_t v29 = [v27 components:16 fromDate:v12 toDate:v28 options:0];

    unint64_t v30 = [v29 day];
    if ((v30 & 0x8000000000000000) != 0)
    {
      uint64_t v31 = 0;
    }
    else if (v30 >= 0x1C)
    {
      if (v30 > 0x45)
      {
        if (v30 > 0x6F)
        {
          if (v30 > 0xDE)
          {
            uint64_t v31 = 421;
            if (v30 != 223 && v30 <= 0x1A3) {
              uint64_t v31 = v30 - (unsigned __int16)v30 % 0x38u;
            }
            goto LABEL_20;
          }
          char v33 = v30 / 0x1Cu;
          char v34 = 28;
        }
        else
        {
          char v33 = v30 / 0xEu;
          char v34 = 14;
        }
        LOBYTE(v32) = v30 - v33 * v34;
      }
      else
      {
        int v32 = v30
            - 7
            * ((((v30 - ((unsigned __int16)(37 * v30) >> 8)) >> 1)
              + ((37 * v30) >> 8)) >> 2);
      }
      uint64_t v31 = v30 - v32;
    }
    else
    {
      uint64_t v31 = v30;
    }
LABEL_20:
    uint64_t v35 = SULogAnalytics();
    SULogInfoForSubsystem(v35, @"%ld(bucketed) days since last successful ota", v36, v37, v38, v39, v40, v41, v31);

    uint64_t v42 = [NSNumber numberWithInteger:v31];
    [(SUAnalyticsEvent *)v14 setEventPayloadEntry:@"DaysSinceLastUpdate" numberValue:v42];

    uint64_t v43 = +[SUPreferences sharedInstance];
    int v44 = [v43 isAutomaticUpdateV2Enabled];

    uint64_t v45 = +[SUPreferences sharedInstance];
    char v46 = [v45 autoUpdateForceOn];

    if (v46)
    {
      uint64_t v47 = 1;
    }
    else
    {
      id v48 = +[SUPreferences sharedInstance];
      int v49 = [v48 autoUpdateForceOff];

      uint64_t v47 = v44 & ~v49;
    }
    [(SUAnalyticsEvent *)v14 setEventPayloadEntry:@"CurrentAutoUpdateStatus" BOOLValue:v47];
    uint64_t v50 = +[SUPreferences sharedInstance];
    int v51 = [v50 autoInstallSystemAndDataFiles];

    uint64_t v52 = +[SUPreferences sharedInstance];
    char v53 = [v52 autoInstallSystemDataFilesForceOn];

    if (v53)
    {
      uint64_t v54 = 1;
    }
    else
    {
      uint64_t v55 = +[SUPreferences sharedInstance];
      int v56 = [v55 autoInstallSystemDataFilesForceOff];

      uint64_t v54 = v51 & ~v56;
    }
    [(SUAnalyticsEvent *)v14 setEventPayloadEntry:@"CurrentAutoInstallSystemDataFilesStatus" BOOLValue:v54];
    uint64_t v57 = +[SUPreferences sharedInstance];
    int v58 = [v57 autoInstallSecurityResponse];

    uint64_t v59 = +[SUPreferences sharedInstance];
    char v60 = [v59 autoInstallSecurityResponseForceOn];

    if (v60)
    {
      uint64_t v61 = 1;
    }
    else
    {
      uint64_t v62 = +[SUPreferences sharedInstance];
      int v63 = [v62 autoInstallSecurityResponseForceOff];

      uint64_t v61 = v58 & ~v63;
    }
    [(SUAnalyticsEvent *)v14 setEventPayloadEntry:@"kSUCurrentAutoInstallSecurityResponseStatus" BOOLValue:v61];
    [v4 setEvent:v14];

    goto LABEL_30;
  }
  id v12 = SULogAnalytics();
  SULogErrorForSubsystem(v12, @"Unable to read updateDate file..bailing", v21, v22, v23, v24, v25, v26, v72);
LABEL_31:

  long long v64 = SULogAnalytics();
  SULogInfoForSubsystem(v64, @"Submitting SU Coreanalytics events", v65, v66, v67, v68, v69, v70, v73);

  [v4 submitAllEvents];
  [*(id *)(a1 + 32) scheduleAnalyticsSubmissionIfNecessary];
}

- (void)_queue_handleCancelPresentBannerOnUnlock
{
  int v3 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUScheduler__queue_handleCancelPresentBannerOnUnlock__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__SUScheduler__queue_handleCancelPresentBannerOnUnlock__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeUnlockCallback:@"unlockCallbackPresentAutoUpdateBanner"];
}

- (void)_queue_handleRollbackReboot:(id)a3 info:(id)a4
{
}

- (void)serverConfigManager:(id)a3 configValuesChanged:(id)a4
{
  id v5 = a4;
  schedulerQueue = self->_schedulerQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__SUScheduler_serverConfigManager_configValuesChanged___block_invoke;
  v8[3] = &unk_26447C8C8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(schedulerQueue, v8);
}

void __55__SUScheduler_serverConfigManager_configValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v46;
    uint64_t v6 = *MEMORY[0x263F77E90];
    uint64_t v35 = *(void *)v46;
    id v34 = v2;
    do
    {
      uint64_t v7 = 0;
      uint64_t v36 = v4;
      do
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
        if ([v8 isEqualToString:@"Changed"])
        {
          id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            SULogInfo(@"%@ is unexpected type", v9, v10, v11, v12, v13, v14, v15, @"Changed");
            goto LABEL_38;
          }
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v17 = [v16 allKeys];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v42 != v20) {
                  objc_enumerationMutation(v17);
                }
                if ([*(id *)(*((void *)&v41 + 1) + 8 * i) isEqualToString:v6])
                {
                  uint64_t v22 = [v16 objectForKeyedSubscript:v6];
                  if (v22)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      objc_msgSend(*(id *)(a1 + 40), "_queue_handleScanIntervalConfigChange:", v22);
                    }
                  }
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v19);
          }

          id v2 = v34;
        }
        else
        {
          if (![v8 isEqualToString:@"Removed"]) {
            goto LABEL_39;
          }
          id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            SULogInfo(@"%@ is unexpected type", v23, v24, v25, v26, v27, v28, v29, @"Removed");
            goto LABEL_38;
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v16 = v16;
          uint64_t v30 = [v16 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v38 != v32) {
                  objc_enumerationMutation(v16);
                }
                if ([*(id *)(*((void *)&v37 + 1) + 8 * j) isEqualToString:v6]) {
                  objc_msgSend(*(id *)(a1 + 40), "_queue_handleScanIntervalConfigChange:", 0);
                }
              }
              uint64_t v31 = [v16 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }
            while (v31);
          }
        }
        uint64_t v5 = v35;
        uint64_t v4 = v36;
LABEL_38:

LABEL_39:
        ++v7;
      }
      while (v7 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAutoInstallTimer, 0);
  objc_storeStrong((id *)&self->_autoInstallActivity, 0);
  objc_storeStrong((id *)&self->_autoInstallManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_schedulerQueue, 0);
  objc_storeStrong((id *)&self->_serverConfigManager, 0);
  objc_storeStrong((id *)&self->_coreXPCActivityScheduler, 0);
  objc_storeStrong((id *)&self->_coreScheduler, 0);
}

@end