@interface TIKeyboardApplicationStateMonitor
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (BOOL)flushPendingChangesToDisk;
- (BOOL)ignoreAppExtension:(id)a3;
- (BOOL)threadUnsafeFlushChangesToDiskWithImmediacy:(BOOL)a3;
- (NSCalendar)utcCalendar;
- (NSDate)activeAppStartDate;
- (NSDate)timeOfLastFlushToDisk;
- (NSDictionary)applicationStateDatabase;
- (NSLock)activeStateDataLock;
- (NSLock)databaseInUseLock;
- (NSMutableArray)keyboardUsageTimes;
- (NSMutableSet)foregroundApps;
- (NSMutableSet)imSuppressingBundleIDs;
- (NSString)activeAppBundleID;
- (TIKeyboardApplicationStateMonitor)init;
- (TIKeyboardApplicationStateMonitor)initWithAppActivityTimeDurationThreshold:(double)a3 keyboardUsageFractionThreshold:(double)a4;
- (TIKeyboardApplicationStateResponses)delegate;
- (double)activeAppStartTime;
- (double)activeKeyboardStartTime;
- (id)databaseLocation;
- (void)applicationUninstalled:(id)a3;
- (void)dealloc;
- (void)handleApplicationStateChange:(id)a3;
- (void)keyboardInUse;
- (void)keyboardNoLongerInUse;
- (void)logOutKeyboardActivity:(double)a3;
- (void)setActiveAppBundleID:(id)a3;
- (void)setActiveAppStartDate:(id)a3;
- (void)setActiveAppStartTime:(double)a3;
- (void)setActiveKeyboardStartTime:(double)a3;
- (void)setActiveStateDataLock:(id)a3;
- (void)setApplicationStateDatabase:(id)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setDatabaseInUseLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForegroundApps:(id)a3;
- (void)setImSuppressingBundleIDs:(id)a3;
- (void)setKeyboardUsageTimes:(id)a3;
- (void)setTimeOfLastFlushToDisk:(id)a3;
- (void)setUtcCalendar:(id)a3;
- (void)startANewKeyboardActivity:(id)a3;
@end

@implementation TIKeyboardApplicationStateMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardUsageTimes, 0);
  objc_storeStrong((id *)&self->_utcCalendar, 0);
  objc_storeStrong((id *)&self->_timeOfLastFlushToDisk, 0);
  objc_storeStrong((id *)&self->_databaseInUseLock, 0);
  objc_storeStrong((id *)&self->_activeStateDataLock, 0);
  objc_storeStrong((id *)&self->_imSuppressingBundleIDs, 0);
  objc_storeStrong((id *)&self->_applicationStateDatabase, 0);
  objc_storeStrong((id *)&self->_activeAppStartDate, 0);
  objc_storeStrong((id *)&self->_foregroundApps, 0);
  objc_storeStrong((id *)&self->_activeAppBundleID, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setActiveKeyboardStartTime:(double)a3
{
  self->_activeKeyboardStartTime = a3;
}

- (double)activeKeyboardStartTime
{
  return self->_activeKeyboardStartTime;
}

- (void)setKeyboardUsageTimes:(id)a3
{
}

- (NSMutableArray)keyboardUsageTimes
{
  return self->_keyboardUsageTimes;
}

- (void)setUtcCalendar:(id)a3
{
}

- (NSCalendar)utcCalendar
{
  return self->_utcCalendar;
}

- (void)setTimeOfLastFlushToDisk:(id)a3
{
}

- (NSDate)timeOfLastFlushToDisk
{
  return self->_timeOfLastFlushToDisk;
}

- (void)setDatabaseInUseLock:(id)a3
{
}

- (NSLock)databaseInUseLock
{
  return self->_databaseInUseLock;
}

- (void)setActiveStateDataLock:(id)a3
{
}

- (NSLock)activeStateDataLock
{
  return self->_activeStateDataLock;
}

- (void)setImSuppressingBundleIDs:(id)a3
{
}

- (NSMutableSet)imSuppressingBundleIDs
{
  return self->_imSuppressingBundleIDs;
}

- (void)setApplicationStateDatabase:(id)a3
{
}

- (NSDictionary)applicationStateDatabase
{
  return self->_applicationStateDatabase;
}

- (void)setActiveAppStartDate:(id)a3
{
}

- (NSDate)activeAppStartDate
{
  return self->_activeAppStartDate;
}

- (void)setForegroundApps:(id)a3
{
}

- (NSMutableSet)foregroundApps
{
  return self->_foregroundApps;
}

- (void)setActiveAppStartTime:(double)a3
{
  self->_activeAppStartTime = a3;
}

- (double)activeAppStartTime
{
  return self->_activeAppStartTime;
}

- (void)setActiveAppBundleID:(id)a3
{
}

- (NSString)activeAppBundleID
{
  return self->_activeAppBundleID;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setDelegate:(id)a3
{
}

- (TIKeyboardApplicationStateResponses)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TIKeyboardApplicationStateResponses *)WeakRetained;
}

- (BOOL)ignoreAppExtension:(id)a3
{
  uint64_t v3 = ignoreAppExtension__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&ignoreAppExtension__onceToken, &__block_literal_global_106);
  }
  char v5 = [(id)ignoreAppExtension__ignoreList containsObject:v4];

  return v5;
}

uint64_t __56__TIKeyboardApplicationStateMonitor_ignoreAppExtension___block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.CryptoTokenKit.setoken", @"com.apple.Sharing.AirDropDiagnostic", @"com.apple.CloudDocs.MobileDocumentsFileProvider", @"com.apple.UIKit.ShareUI", @"com.apple.WebKit.WebContent", @"com.apple.WebKit.Networking", @"com.apple.mobileslideshow.PhotosDiagnostics", @"com.apple.CarKit.CarPlayDiagnosticsExtension", @"com.apple.CloudDocsDaemon.diagnostic", @"com.apple.Maps.DEMapsExtension", @"com.apple.Search.framework.SpotlightDiagnostic", @"com.apple.BiometricKit.BioLogDiagnostic", @"com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions", @"com.apple.Symptoms.SFDiagnosticExtension.appex", @"com.apple.news.articlenotificationserviceextension", @"com.apple.DiagnosticsService.SystemReport", @"com.apple.FileProvider.LocalStorage",
    @"com.apple.news.diagnosticextension",
    @"com.apple.mobilesafari.SafariDiagnosticExtension",
    @"com.apple.mobilemail.DiagnosticExtension",
    @"com.apple.mobilecal.diagnosticextension",
    @"com.apple.accessibility.Accessibility.AXTapToRadar",
    @"com.apple.accessibility.Accessibility.GuidedAccessTapToRadar",
    @"com.apple.accessibility.Accessibility.HearingAidsTapToRadar",
    @"com.apple.accessibility.Accessibility.SwitchControlTapToRadar",
    @"com.apple.accessibility.Accessibility.VoiceOverTapToRadar",
    @"com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions",
    @"com.apple.duet.expertcenter.diagnosticextension",
    @"com.apple.keyboard.TypoTracker.DiagnosticExtension",
    @"com.apple.PowerlogCore.diagnosticextension",
    @"com.apple.PassKit.applepay.diagnosticextension",
    @"com.apple.HomeKit.diagnosticextensioncom.apple.MediaPlayer.DiagnosticExtension",
    @"com.apple.MobileAddressBook",
    @"com.apple.MobileBackup.framework.DiagnosticExtension",
    @"com.apple.CoreRoutine.RTDiagnosticExtension",
    @"com.apple.DiagnosticExtensions.sysdiagnose",
    @"com.apple.DiagnosticExtensions.Bluetooth",
    @"com.apple.DiagnosticExtensions.WiFi",
    @"com.apple.DiagnosticExtensions.Syslog",
    @"com.apple.DiagnosticExtensions.StackShot",
    @"com.apple.DiagnosticExtensions.Keyboard",
    @"com.apple.DiagnosticExtensions.CrashLogs",
    @"com.apple.DiagnosticExtensions.Panic",
    @"com.apple.DiagnosticExtensions.LowMemory",
    @"com.apple.DiagnosticExtensions.Siri",
  uint64_t v0 = 0);
  uint64_t v1 = ignoreAppExtension__ignoreList;
  ignoreAppExtension__ignoreList = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)flushPendingChangesToDisk
{
  uint64_t v3 = [(TIKeyboardApplicationStateMonitor *)self databaseInUseLock];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  int v5 = [v3 lockBeforeDate:v4];

  if (!v5) {
    return 1;
  }
  BOOL v6 = [(TIKeyboardApplicationStateMonitor *)self threadUnsafeFlushChangesToDiskWithImmediacy:1];
  v7 = [(TIKeyboardApplicationStateMonitor *)self databaseInUseLock];
  [v7 unlock];

  return v6;
}

- (BOOL)threadUnsafeFlushChangesToDiskWithImmediacy:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v4 = [(TIKeyboardApplicationStateMonitor *)self timeOfLastFlushToDisk];
    [v4 timeIntervalSinceNow];
    double v6 = fabs(v5);

    if (v6 < 120.0) {
      return 1;
    }
  }
  v8 = [(TIKeyboardApplicationStateMonitor *)self applicationStateDatabase];
  v9 = [(TIKeyboardApplicationStateMonitor *)self databaseLocation];
  char v10 = [v8 writeToURL:v9 atomically:1];

  v11 = [(TIKeyboardApplicationStateMonitor *)self databaseLocation];
  char v12 = [v11 setResourceValue:*MEMORY[0x1E4F1C580] forKey:*MEMORY[0x1E4F1C590] error:0];

  v13 = [MEMORY[0x1E4F1C9C8] date];
  [(TIKeyboardApplicationStateMonitor *)self setTimeOfLastFlushToDisk:v13];

  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    v14 = TIOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s Flushed changes to disk", "-[TIKeyboardApplicationStateMonitor threadUnsafeFlushChangesToDiskWithImmediacy:]");
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  return v10 & v12;
}

- (id)databaseLocation
{
  if (databaseLocation_onceToken != -1) {
    dispatch_once(&databaseLocation_onceToken, &__block_literal_global_15616);
  }
  v2 = (void *)databaseLocation_url;

  return v2;
}

void __53__TIKeyboardApplicationStateMonitor_databaseLocation__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:TI_KB_USER_DIRECTORY() isDirectory:1];
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"app_usage_database.plist"];
  uint64_t v1 = (void *)databaseLocation_url;
  databaseLocation_url = v0;
}

- (void)keyboardNoLongerInUse
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = TIGetCurrentTime();
  id v4 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
  double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  int v6 = [v4 lockBeforeDate:v5];

  if (v6)
  {
    [(TIKeyboardApplicationStateMonitor *)self activeKeyboardStartTime];
    if (v7 != 0.0)
    {
      v8 = NSNumber;
      [(TIKeyboardApplicationStateMonitor *)self activeKeyboardStartTime];
      char v10 = [v8 numberWithDouble:v3 - v9];
      [(TIKeyboardApplicationStateMonitor *)self setActiveKeyboardStartTime:0.0];
      v11 = [(TIKeyboardApplicationStateMonitor *)self keyboardUsageTimes];
      [v11 addObject:v10];

      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        char v12 = TIOSLogFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Recorded keyboard usage time data", "-[TIKeyboardApplicationStateMonitor keyboardNoLongerInUse]");
          *(_DWORD *)buf = 138412290;
          v16 = v14;
          _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v13 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
    [v13 unlock];
  }
}

- (void)keyboardInUse
{
  double v3 = TIGetCurrentTime();
  id v4 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
  double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  int v6 = [v4 lockBeforeDate:v5];

  if (v6)
  {
    [(TIKeyboardApplicationStateMonitor *)self setActiveKeyboardStartTime:v3];
    id v7 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
    [v7 unlock];
  }
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_applicationStateMonitor invalidate];
  [(TIKeyboardApplicationStateMonitor *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardApplicationStateMonitor;
  [(TIKeyboardApplicationStateMonitor *)&v3 dealloc];
}

- (void)logOutKeyboardActivity:(double)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  double v5 = TIGetCurrentTime();
  int v6 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  int v8 = [v6 lockBeforeDate:v7];

  if (v8)
  {
    [(TIKeyboardApplicationStateMonitor *)self activeKeyboardStartTime];
    if (v9 != 0.0)
    {
      char v10 = NSNumber;
      [(TIKeyboardApplicationStateMonitor *)self activeKeyboardStartTime];
      char v12 = [v10 numberWithDouble:v5 - v11];
      [(TIKeyboardApplicationStateMonitor *)self setActiveKeyboardStartTime:0.0];
      v13 = [(TIKeyboardApplicationStateMonitor *)self keyboardUsageTimes];
      [v13 addObject:v12];

      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        v14 = TIOSLogFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v72 = objc_msgSend(NSString, "stringWithFormat:", @"%s App went background without dismissing keyboard", "-[TIKeyboardApplicationStateMonitor logOutKeyboardActivity:]");
          *(_DWORD *)buf = 138412290;
          v104 = v72;
          _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v15 = NSNumber;
    [(TIKeyboardApplicationStateMonitor *)self activeAppStartTime];
    uint64_t v17 = [v15 numberWithDouble:a3 - v16];
    v102[0] = v17;
    v101[0] = @"appTime";
    v101[1] = @"keyboardTimes";
    uint64_t v18 = [(TIKeyboardApplicationStateMonitor *)self keyboardUsageTimes];
    v102[1] = v18;
    v101[2] = @"startDate";
    v19 = [(TIKeyboardApplicationStateMonitor *)self activeAppStartDate];
    if (v19)
    {
      v20 = [(TIKeyboardApplicationStateMonitor *)self activeAppStartDate];
    }
    else
    {
      v20 = @"unknown";
    }
    v102[2] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];
    if (v19) {

    }
    v23 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
    [v23 unlock];

    v24 = [(TIKeyboardApplicationStateMonitor *)self databaseInUseLock];
    [v24 lock];

    v25 = [(TIKeyboardApplicationStateMonitor *)self applicationStateDatabase];
    v73 = (void *)v22;
    if (v25
      || (v26 = (void *)MEMORY[0x1E4F1C9E8],
          [(TIKeyboardApplicationStateMonitor *)self databaseLocation],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v26 dictionaryWithContentsOfURL:v27],
          v25 = objc_claimAutoreleasedReturnValue(),
          v27,
          v25))
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-345600.0];
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __60__TIKeyboardApplicationStateMonitor_logOutKeyboardActivity___block_invoke;
      v93[3] = &unk_1E6E2CD38;
      id v30 = v29;
      id v94 = v30;
      id v31 = v28;
      id v95 = v31;
      [v25 enumerateKeysAndObjectsUsingBlock:v93];
      v32 = [(TIKeyboardApplicationStateMonitor *)self activeAppBundleID];
      v33 = [v31 objectForKey:v32];

      if (v33)
      {
        [v33 arrayByAddingObject:v22];
      }
      else
      {
        uint64_t v100 = v22;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
      v34 = };
      v35 = [(TIKeyboardApplicationStateMonitor *)self activeAppBundleID];
      [v31 setValue:v34 forKey:v35];

      v36 = (void *)[v31 copy];
      [(TIKeyboardApplicationStateMonitor *)self setApplicationStateDatabase:v36];
    }
    else
    {
      v70 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v99 = v22;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
      id v31 = [(TIKeyboardApplicationStateMonitor *)self activeAppBundleID];
      id v30 = [v70 dictionaryWithObject:v25 forKey:v31];
      [(TIKeyboardApplicationStateMonitor *)self setApplicationStateDatabase:v30];
    }

    [(TIKeyboardApplicationStateMonitor *)self threadUnsafeFlushChangesToDiskWithImmediacy:0];
    v37 = [(TIKeyboardApplicationStateMonitor *)self databaseInUseLock];
    [v37 unlock];

    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(TIKeyboardApplicationStateMonitor *)self setImSuppressingBundleIDs:v38];

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v39 = [(TIKeyboardApplicationStateMonitor *)self applicationStateDatabase];
    v40 = [v39 allKeys];

    obuint64_t j = v40;
    uint64_t v77 = [v40 countByEnumeratingWithState:&v89 objects:v98 count:16];
    if (v77)
    {
      uint64_t v75 = *(void *)v90;
      v76 = self;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v90 != v75) {
            objc_enumerationMutation(obj);
          }
          uint64_t v79 = v41;
          uint64_t v42 = *(void *)(*((void *)&v89 + 1) + 8 * v41);
          v43 = [(TIKeyboardApplicationStateMonitor *)self applicationStateDatabase];
          uint64_t v78 = v42;
          v44 = [v43 objectForKeyedSubscript:v42];

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v45 = v44;
          uint64_t v46 = [v45 countByEnumeratingWithState:&v85 objects:v97 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            int v48 = 0;
            uint64_t v49 = *(void *)v86;
            double v50 = 0.0;
            double v51 = 0.0;
            do
            {
              int v80 = v48;
              for (uint64_t i = 0; i != v47; ++i)
              {
                if (*(void *)v86 != v49) {
                  objc_enumerationMutation(v45);
                }
                v53 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                v54 = [v53 objectForKeyedSubscript:@"appTime"];
                [v54 doubleValue];
                double v56 = v55;

                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                v57 = [v53 objectForKeyedSubscript:@"keyboardTimes"];
                uint64_t v58 = [v57 countByEnumeratingWithState:&v81 objects:v96 count:16];
                if (v58)
                {
                  uint64_t v59 = v58;
                  uint64_t v60 = *(void *)v82;
                  do
                  {
                    for (uint64_t j = 0; j != v59; ++j)
                    {
                      if (*(void *)v82 != v60) {
                        objc_enumerationMutation(v57);
                      }
                      [*(id *)(*((void *)&v81 + 1) + 8 * j) doubleValue];
                      double v51 = v51 + v62;
                    }
                    uint64_t v59 = [v57 countByEnumeratingWithState:&v81 objects:v96 count:16];
                  }
                  while (v59);
                }
                double v50 = v50 + v56;
              }
              int v48 = v80 + v47;
              uint64_t v47 = [v45 countByEnumeratingWithState:&v85 objects:v97 count:16];
            }
            while (v47);
          }
          else
          {
            int v48 = 0;
            double v50 = 0.0;
            double v51 = 0.0;
          }

          self = v76;
          if (v51 / v50 < v76->_appActivityKeyboardUsageFractionThreshold
            && v50 / (double)v48 > v76->_appActivityTimeDurationThreshold)
          {
            v63 = [(TIKeyboardApplicationStateMonitor *)v76 imSuppressingBundleIDs];
            [v63 addObject:v78];
          }
          uint64_t v41 = v79 + 1;
        }
        while (v79 + 1 != v77);
        uint64_t v77 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
      }
      while (v77);
    }

    [(TIKeyboardApplicationStateMonitor *)self setActiveAppBundleID:0];
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v21 = v73;
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v64 = TIOSLogFacility();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v71 = objc_msgSend(NSString, "stringWithFormat:", @"%s Wrote out app usage data", "-[TIKeyboardApplicationStateMonitor logOutKeyboardActivity:]");
        *(_DWORD *)buf = 138412290;
        v104 = v71;
        _os_log_debug_impl(&dword_1E3F0E000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v65 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
    v66 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
    int v67 = [v65 lockBeforeDate:v66];

    if (v67)
    {
      [(TIKeyboardApplicationStateMonitor *)self setActiveKeyboardStartTime:0.0];
      id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(TIKeyboardApplicationStateMonitor *)self setKeyboardUsageTimes:v68];

      v69 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
      [v69 unlock];
    }
  }
  else
  {
    v21 = 0;
  }
}

void __60__TIKeyboardApplicationStateMonitor_logOutKeyboardActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v12 objectForKey:@"startDate"];
        uint64_t v14 = [v13 compare:*(void *)(a1 + 32)];

        if (v14 == 1) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v15];
  }
}

- (void)startANewKeyboardActivity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  int v7 = [v5 lockBeforeDate:v6];

  if (v7)
  {
    [(TIKeyboardApplicationStateMonitor *)self setActiveKeyboardStartTime:0.0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TIKeyboardApplicationStateMonitor *)self setKeyboardUsageTimes:v8];

    uint64_t v9 = [(TIKeyboardApplicationStateMonitor *)self activeStateDataLock];
    [v9 unlock];

    if (v4)
    {
      [(TIKeyboardApplicationStateMonitor *)self setActiveAppBundleID:v4];
      uint64_t v10 = [(TIKeyboardApplicationStateMonitor *)self utcCalendar];
      double v11 = [MEMORY[0x1E4F1C9C8] date];
      char v12 = [v10 startOfDayForDate:v11];
      [(TIKeyboardApplicationStateMonitor *)self setActiveAppStartDate:v12];

      uint64_t v13 = [(TIKeyboardApplicationStateMonitor *)self imSuppressingBundleIDs];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        id v15 = [(TIKeyboardApplicationStateMonitor *)self imSuppressingBundleIDs];
        int v16 = [v15 containsObject:v4];

        if (v16)
        {
          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          if (TICanLogMessageAtLevel_logLevel)
          {
            long long v17 = TIOSLogFacility();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s Notify delegate of keyboard unlikely app launch", "-[TIKeyboardApplicationStateMonitor startANewKeyboardActivity:]");
              *(_DWORD *)buf = 138412290;
              v20 = v18;
              _os_log_debug_impl(&dword_1E3F0E000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
          TIDispatchAsync();
        }
      }
    }
  }
}

void __63__TIKeyboardApplicationStateMonitor_startANewKeyboardActivity___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 releaseInputManagers];
}

- (void)handleApplicationStateChange:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = TIGetCurrentTime();
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  int v7 = (void *)getSBApplicationStateDisplayIDKeySymbolLoc_ptr;
  uint64_t v56 = getSBApplicationStateDisplayIDKeySymbolLoc_ptr;
  if (!getSBApplicationStateDisplayIDKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v58 = __getSBApplicationStateDisplayIDKeySymbolLoc_block_invoke;
    uint64_t v59 = &unk_1E6E2E248;
    uint64_t v60 = &v53;
    __getSBApplicationStateDisplayIDKeySymbolLoc_block_invoke((uint64_t)&buf);
    int v7 = (void *)v54[3];
  }
  _Block_object_dispose(&v53, 8);
  if (v7)
  {
    int v7 = [v5 objectForKey:*v7];
    objc_super v3 = &kTIACMessageHasNoCorrectionSymbol;
    if ([(TIKeyboardApplicationStateMonitor *)self ignoreAppExtension:v7])
    {
      if (TICanLogMessageAtLevel_onceToken == -1) {
        goto LABEL_6;
      }
      goto LABEL_111;
    }
    uint64_t v10 = [v5 objectForKey:*MEMORY[0x1E4F4F198]];
    double v11 = [v5 objectForKey:*MEMORY[0x1E4F4F1A0]];
    if ([v10 BOOLValue]) {
      BOOL v12 = [v11 longLongValue] == 8 || objc_msgSend(v11, "longLongValue") == 32;
    }
    else {
      BOOL v12 = 0;
    }
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v13 = TIOSLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v39 = [NSString stringWithFormat:@"%s New app state for (%@), isFront: %@, state: %@, isFrontmost: %d", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v7, v10, v11, v12];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }

    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v14 = TIOSLogFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v40 = NSString;
        uint64_t v41 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
        uint64_t v42 = [v40 stringWithFormat:@"%s Initial foreground apps: %@", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v41];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v42;
        _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v15 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
LABEL_48:
      v23 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
      unint64_t v24 = [v23 count];

      if (v24 >= 2)
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel < 2)
        {
          id v8 = 0;
LABEL_104:

          goto LABEL_105;
        }
        v25 = TIOSLogFacility();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v43 = [NSString stringWithFormat:@"%s Multiple apps foreground, no activity tracking will take place", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]"];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v43;
          _os_log_debug_impl(&dword_1E3F0E000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }
        id v8 = 0;
LABEL_103:

        goto LABEL_104;
      }
      v26 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
      uint64_t v27 = [v26 count];

      if (v27 == 1)
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          id v28 = TIOSLogFacility();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v47 = objc_msgSend(NSString, "stringWithFormat:", @"%s Foreground app set now empty", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v47;
            _os_log_debug_impl(&dword_1E3F0E000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
          }
        }
        v29 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
        [v29 removeAllObjects];
      }
      id v30 = [(TIKeyboardApplicationStateMonitor *)self activeAppBundleID];
      id v8 = v30;
      if (v30)
      {
        int v31 = [v30 isEqualToString:v7];
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (v31)
        {
          if (v12)
          {
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              v32 = TIOSLogFacility();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s Foreground app remained foreground", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v33;
LABEL_109:
                _os_log_debug_impl(&dword_1E3F0E000, v32, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

                goto LABEL_97;
              }
              goto LABEL_97;
            }
            goto LABEL_98;
          }
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            id v38 = TIOSLogFacility();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              v52 = objc_msgSend(NSString, "stringWithFormat:", @"%s Record activity for foreground app that is now background", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v52;
              _os_log_debug_impl(&dword_1E3F0E000, v38, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }
          }
          [(TIKeyboardApplicationStateMonitor *)self logOutKeyboardActivity:v6];
        }
        else
        {
          if (!v12)
          {
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              v32 = TIOSLogFacility();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s Discarding activity for background app", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v33;
                goto LABEL_109;
              }
              goto LABEL_97;
            }
            goto LABEL_98;
          }
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            v35 = TIOSLogFacility();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              double v51 = objc_msgSend(NSString, "stringWithFormat:", @"%s Record activity of app that went background directly", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v51;
              _os_log_debug_impl(&dword_1E3F0E000, v35, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }
          }
          [(TIKeyboardApplicationStateMonitor *)self logOutKeyboardActivity:v6];
          v36 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
          [v36 addObject:v8];

          v37 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
          [v37 addObject:v7];
        }
        [(TIKeyboardApplicationStateMonitor *)self startANewKeyboardActivity:0];
        goto LABEL_98;
      }
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (v12)
      {
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          v34 = TIOSLogFacility();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            double v50 = objc_msgSend(NSString, "stringWithFormat:", @"%s Start recording activity for new foreground app", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v50;
            _os_log_debug_impl(&dword_1E3F0E000, v34, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
          }
        }
        [(TIKeyboardApplicationStateMonitor *)self startANewKeyboardActivity:v7];
        [(TIKeyboardApplicationStateMonitor *)self setActiveAppStartTime:v6];
        goto LABEL_98;
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        v32 = TIOSLogFacility();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s Discarding fresh activity for background app", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          goto LABEL_109;
        }
LABEL_97:
      }
LABEL_98:
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel < 2) {
        goto LABEL_104;
      }
      v25 = TIOSLogFacility();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v44 = NSString;
        id v45 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
        uint64_t v46 = [v44 stringWithFormat:@"%s Current foreground apps: %@", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v45];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v46;
        _os_log_debug_impl(&dword_1E3F0E000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_103;
    }
    long long v17 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
    int v18 = [v17 containsObject:v7];

    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (v18)
    {
      if (!v12)
      {
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          uint64_t v22 = TIOSLogFacility();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"%s Multiple apps - Foreground app went away", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v49;
            _os_log_debug_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
          }
        }
        long long v19 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
        [v19 removeObject:v7];
        goto LABEL_47;
      }
      if (TICanLogMessageAtLevel_logLevel < 2) {
        goto LABEL_48;
      }
      long long v19 = TIOSLogFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_47;
      }
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Multiple apps - Foreground app still foreground", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
    }
    else
    {
      if (v12)
      {
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          uint64_t v21 = TIOSLogFacility();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            int v48 = objc_msgSend(NSString, "stringWithFormat:", @"%s Multiple apps - Background app is now foreground", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v48;
            _os_log_debug_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
          }
        }
        long long v19 = [(TIKeyboardApplicationStateMonitor *)self foregroundApps];
        [v19 addObject:v7];
        goto LABEL_47;
      }
      if (TICanLogMessageAtLevel_logLevel < 2) {
        goto LABEL_48;
      }
      long long v19 = TIOSLogFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_47;
      }
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Multiple apps - Background app still background", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
    }
    _os_log_debug_impl(&dword_1E3F0E000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

LABEL_47:
    goto LABEL_48;
  }
  dlerror();
  abort_report_np();
LABEL_111:
  dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
LABEL_6:
  if (*((_DWORD *)v3 + 838) >= 2u)
  {
    id v8 = TIOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [NSString stringWithFormat:@"%s Ignoring activity for bundle ID (%@)", "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v7];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_104;
  }
LABEL_105:
}

- (void)applicationUninstalled:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  id v5 = [(TIKeyboardApplicationStateMonitor *)self databaseInUseLock];
  [v5 lock];

  double v6 = [(TIKeyboardApplicationStateMonitor *)self applicationStateDatabase];
  if (v6
    || (int v7 = (void *)MEMORY[0x1E4F1C9E8],
        [(TIKeyboardApplicationStateMonitor *)self databaseLocation],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v7 dictionaryWithContentsOfURL:v8],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    v20 = v6;
    uint64_t v9 = (void *)[v6 mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = v4;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            uint64_t v16 = TIOSLogFacility();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v22 = [NSString stringWithFormat:@"%s Deleting data for bundle ID (%@)", "-[TIKeyboardApplicationStateMonitor applicationUninstalled:]", v15];
              *(_DWORD *)long long buf = 138412290;
              id v28 = v22;
              _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
          [v9 removeObjectForKey:v15];
          long long v17 = [(TIKeyboardApplicationStateMonitor *)self imSuppressingBundleIDs];
          [v17 removeObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v12);
    }

    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v9];
    [(TIKeyboardApplicationStateMonitor *)self setApplicationStateDatabase:v18];

    [(TIKeyboardApplicationStateMonitor *)self threadUnsafeFlushChangesToDiskWithImmediacy:1];
    id v4 = v21;
  }
  long long v19 = [(TIKeyboardApplicationStateMonitor *)self databaseInUseLock];
  [v19 unlock];
}

- (TIKeyboardApplicationStateMonitor)initWithAppActivityTimeDurationThreshold:(double)a3 keyboardUsageFractionThreshold:(double)a4
{
  v35.receiver = self;
  v35.super_class = (Class)TIKeyboardApplicationStateMonitor;
  double v6 = [(TIKeyboardApplicationStateMonitor *)&v35 init];
  if (v6)
  {
    int v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keyboardUsageTimes = v6->_keyboardUsageTimes;
    v6->_keyboardUsageTimes = v7;

    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundApps = v6->_foregroundApps;
    v6->_foregroundApps = v9;

    v6->_appActivityTimeDurationThreshold = a3;
    v6->_appActivityKeyboardUsageFractionThreshold = a4;
    activeAppBundleID = v6->_activeAppBundleID;
    v6->_activeAppBundleID = 0;

    activeAppStartDate = v6->_activeAppStartDate;
    v6->_activeAppStartDate = 0;

    v6->_activeAppStartTime = 0.0;
    applicationStateDatabase = v6->_applicationStateDatabase;
    v6->_applicationStateDatabase = 0;

    imSuppressingBundleIDs = v6->_imSuppressingBundleIDs;
    v6->_imSuppressingBundleIDs = 0;

    uint64_t v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    activeStateDataLock = v6->_activeStateDataLock;
    v6->_activeStateDataLock = v15;

    long long v17 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    databaseInUseLock = v6->_databaseInUseLock;
    v6->_databaseInUseLock = v17;

    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    timeOfLastFlushToDisk = v6->_timeOfLastFlushToDisk;
    v6->_timeOfLastFlushToDisk = (NSDate *)v19;

    id v21 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v22 = [v21 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    utcCalendar = v6->_utcCalendar;
    v6->_utcCalendar = (NSCalendar *)v22;

    long long v24 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [(NSCalendar *)v6->_utcCalendar setTimeZone:v24];

    long long v25 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E4F4F228]);
    applicationStateMonitor = v6->_applicationStateMonitor;
    v6->_applicationStateMonitor = v25;

    objc_initWeak(&location, v6);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    int v31 = __109__TIKeyboardApplicationStateMonitor_initWithAppActivityTimeDurationThreshold_keyboardUsageFractionThreshold___block_invoke;
    v32 = &unk_1E6E2CD10;
    objc_copyWeak(&v33, &location);
    [(BKSApplicationStateMonitor *)v6->_applicationStateMonitor setHandler:&v29];
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v29, v30, v31, v32);
    [v27 addObserver:v6 selector:sel_applicationUninstalled_ name:@"TIApplicationUnregisteredNotification_Private" object:0];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __109__TIKeyboardApplicationStateMonitor_initWithAppActivityTimeDurationThreshold_keyboardUsageFractionThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleApplicationStateChange:v3];
}

- (TIKeyboardApplicationStateMonitor)init
{
  return [(TIKeyboardApplicationStateMonitor *)self initWithAppActivityTimeDurationThreshold:180.0 keyboardUsageFractionThreshold:0.1];
}

@end