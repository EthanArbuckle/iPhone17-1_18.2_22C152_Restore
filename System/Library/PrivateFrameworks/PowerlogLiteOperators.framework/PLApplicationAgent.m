@interface PLApplicationAgent
+ (BOOL)hasScreenPresence:(id)a3;
+ (BOOL)isVisible:(id)a3;
+ (id)appVersionForBundle:(id)a3;
+ (id)defaults;
+ (id)entryAggregateDefinitionApplicationReason;
+ (id)entryAggregateDefinitions;
+ (id)entryAggregateDefintionWidgetUpdates;
+ (id)entryEventBackwardDefinitionApplicationMemory;
+ (id)entryEventBackwardDefinitionControlCenterStats;
+ (id)entryEventBackwardDefinitionWidgetStats;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionAmbientActiveFace;
+ (id)entryEventForwardDefinitionAmbientMode;
+ (id)entryEventForwardDefinitionAmbientModeLifetimeCounter;
+ (id)entryEventForwardDefinitionApplication;
+ (id)entryEventForwardDefinitionApplicationDidUninstall;
+ (id)entryEventForwardDefinitionHomeScreenConfiguration;
+ (id)entryEventForwardDefinitionHomeScreenPresentation;
+ (id)entryEventForwardDefinitionLiveActivityStats;
+ (id)entryEventForwardDefinitionMotionToWake;
+ (id)entryEventForwardDefinitionSystemAperture;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneAllApps;
+ (id)entryEventNoneAllPlugins;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionAppDocking;
+ (id)entryEventPointDefinitionAppPrewarm;
+ (id)entryEventPointDefinitionApplicationExitReason;
+ (id)entryEventPointDefinitionControlCenterUpdates;
+ (id)entryEventPointDefinitionLiveActivityUpdates;
+ (id)entryEventPointDefinitionPosterUpdates;
+ (id)entryEventPointDefinitionSuggestedWidgetReload;
+ (id)entryEventPointDefinitionWidgetUpdates;
+ (id)entryEventPointDefinitions;
+ (id)getReasons:(id)a3;
+ (id)installedPlugins;
+ (id)pluginEntryFromRecord:(id)a3;
+ (void)addAppVersion:(id)a3 withVersion:(id)a4;
+ (void)load;
+ (void)removeAppVersion:(id)a3 forVersion:(id)a4;
- (BKSApplicationStateMonitor)appStateMonitor;
- (BOOL)checkAppReferenceCleanupNeeded;
- (BOOL)isAppClipWithBundleID:(id)a3;
- (BOOL)isApplication:(int)a3;
- (BOOL)scheduledAppCleanup;
- (NSSet)currentDisplayIdentifiers;
- (PLApplicationAgent)init;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLXPCListenerOperatorComposition)ambientModeActiveFaceListener;
- (PLXPCListenerOperatorComposition)ambientModeLifetimeCounterListener;
- (PLXPCListenerOperatorComposition)ambientModeListener;
- (PLXPCListenerOperatorComposition)appDockingListener;
- (PLXPCListenerOperatorComposition)appPrewarmListener;
- (PLXPCListenerOperatorComposition)controlCenterStatsListener;
- (PLXPCListenerOperatorComposition)controlCenterUpdatesListener;
- (PLXPCListenerOperatorComposition)liveActivityStatsListener;
- (PLXPCListenerOperatorComposition)liveActivityUpdatesListener;
- (PLXPCListenerOperatorComposition)motionToWakeListener;
- (PLXPCListenerOperatorComposition)posterUpdatesListener;
- (PLXPCListenerOperatorComposition)suggestedWidgetReloadListener;
- (PLXPCListenerOperatorComposition)systemApertureListener;
- (PLXPCListenerOperatorComposition)widgetStatsListener;
- (PLXPCListenerOperatorComposition)widgetUpdatesListener;
- (RBSProcessMonitor)RBSAppStateMonitor;
- (RBSProcessMonitor)appStateMonitorRBS;
- (id)getApplicationRecordSet:(id)a3;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (void)appReferenceCleanup;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)buildAppVersionDictionary:(id)a3;
- (void)createWidgetStatsAccountingEvents:(id)a3;
- (void)dealloc;
- (void)displayIdentifiersDidChange;
- (void)initOperatorDependancies;
- (void)logAllApps;
- (void)logAllPlugins;
- (void)logEventBackwardApplicationMemoryWithBundleId:(id)a3 withSuspendedMemory:(id)a4 withPeakMemory:(id)a5;
- (void)logEventBackwardControlCenterStats:(id)a3;
- (void)logEventBackwardWidgetStats:(id)a3;
- (void)logEventForwardAmbientMode:(id)a3;
- (void)logEventForwardAmbientModeActiveFace:(id)a3;
- (void)logEventForwardAmbientModeLifetimeCounter:(id)a3;
- (void)logEventForwardApplicationDidUninstall:(id)a3 withAppName:(id)a4;
- (void)logEventForwardLiveActivityStats:(id)a3;
- (void)logEventForwardMotionToWake:(id)a3;
- (void)logEventForwardSystemAperture:(id)a3;
- (void)logEventPointApplication;
- (void)logEventPointApplicationExitReason:(id)a3;
- (void)logEventPointApplicationForDisplayID:(id)a3;
- (void)logEventPointApplicationForDisplayID:(id)a3 withPid:(int)a4 withState:(id)a5 withReasons:(id)a6;
- (void)logEventPointControlCenterUpdates:(id)a3;
- (void)logEventPointDASAppDocking:(id)a3;
- (void)logEventPointDASAppPrewarm:(id)a3;
- (void)logEventPointLiveActivityUpdates:(id)a3;
- (void)logEventPointPosterUpdates:(id)a3;
- (void)logEventPointSuggestedWidgetReload:(id)a3;
- (void)logEventPointWidgetUpdates:(id)a3;
- (void)logInstalledAppWithRecord:(id)a3 withBundleID:(id)a4 shouldMaskTimestamp:(BOOL)a5;
- (void)logInstalledPlugin:(id)a3;
- (void)logUninstalledApp:(id)a3;
- (void)logUninstalledAppVersion:(id)a3;
- (void)logUpdatedAppVersion:(id)a3;
- (void)refreshAllAppsAndPlugins;
- (void)resetScheduledAppCleanup;
- (void)sendApplicationMetadataToCA;
- (void)setAmbientModeActiveFaceListener:(id)a3;
- (void)setAmbientModeLifetimeCounterListener:(id)a3;
- (void)setAmbientModeListener:(id)a3;
- (void)setAppDockingListener:(id)a3;
- (void)setAppPrewarmListener:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setAppStateMonitorRBS:(id)a3;
- (void)setControlCenterStatsListener:(id)a3;
- (void)setControlCenterUpdatesListener:(id)a3;
- (void)setCurrentDisplayIdentifiers:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setLiveActivityStatsListener:(id)a3;
- (void)setLiveActivityUpdatesListener:(id)a3;
- (void)setMotionToWakeListener:(id)a3;
- (void)setPosterUpdatesListener:(id)a3;
- (void)setRBSAppStateMonitor:(id)a3;
- (void)setScheduledAppCleanup:(BOOL)a3;
- (void)setSuggestedWidgetReloadListener:(id)a3;
- (void)setSystemApertureListener:(id)a3;
- (void)setWidgetStatsListener:(id)a3;
- (void)setWidgetUpdatesListener:(id)a3;
@end

@implementation PLApplicationAgent

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_401(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F4E258];
  id v4 = a2;
  v5 = [v4 objectForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = -1;
  }
  v7 = [v4 objectForKey:*MEMORY[0x1E4F4E230]];
  v8 = [v4 objectForKey:*MEMORY[0x1E4F4E248]];
  v9 = [v4 objectForKey:*MEMORY[0x1E4F4E268]];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = [WeakRetained workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_403;
  block[3] = &unk_1E69317E8;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  int v20 = v6;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_403(uint64_t a1)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained logEventPointApplicationForDisplayID:*(void *)(a1 + 32) withPid:*(unsigned int *)(a1 + 64) withState:*(void *)(a1 + 40) withReasons:*(void *)(a1 + 48)];

  if ([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled]
    && (int)[*(id *)(a1 + 40) intValue] >= 4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppBundleId" withValue:*(void *)(a1 + 32) withComparisonOperation:0];
    v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    id v6 = objc_loadWeakRetained(v2);
    v7 = [v6 storage];
    v48[0] = v4;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    v9 = [v7 lastEntryForKey:v5 withComparisons:v8 isSingleton:1];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v29 = 0u;
    if (proc_pid_rusage(*(_DWORD *)(a1 + 64), 0, buffer))
    {
      v10 = 0;
    }
    else
    {
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)buffer, (char *)out);
      v10 = [NSString stringWithUTF8String:out];
    }
    size_t size = 0;
    *(void *)out = 0xE00000001;
    int v15 = *(_DWORD *)(a1 + 64);
    out[2] = 1;
    out[3] = v15;
    if (sysctl(out, 4u, 0, &size, 0, 0) < 0 || (id v16 = malloc_type_malloc(size, 0x49ABEC14uLL)) == 0)
    {
      id v18 = 0;
      if (!v10) {
        goto LABEL_23;
      }
    }
    else
    {
      v7 = v16;
      if (sysctl(out, 4u, v16, &size, 0, 0) < 0)
      {
        id v18 = 0;
      }
      else
      {
        if ((v7[8] & 4) != 0) {
          id v17 = @"arm-64bit";
        }
        else {
          id v17 = @"arm-32bit";
        }
        id v18 = v17;
      }
      free(v7);
      if (!v10)
      {
LABEL_23:
        if (!v18)
        {
LABEL_29:

          return;
        }
        goto LABEL_24;
      }
    }
    v7 = [v9 objectForKeyedSubscript:@"AppUUID"];
    if (([v10 isEqualToString:v7] & 1) == 0)
    {

LABEL_27:
      id v21 = objc_loadWeakRetained(v2);
      v22 = [v21 storage];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_412;
      v23[3] = &unk_1E692D388;
      v24 = v9;
      id v25 = v10;
      v26 = v18;
      [v22 updateEntry:v24 withBlock:v23];

      v7 = v24;
LABEL_28:

      goto LABEL_29;
    }
    if (!v18) {
      goto LABEL_28;
    }
LABEL_24:
    id v19 = [v9 objectForKeyedSubscript:@"AppArchitecture"];
    char v20 = [(__CFString *)v18 isEqualToString:v19];

    if (v10) {
    if (v20)
    }
      goto LABEL_29;
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) intValue] == 2)
  {
    uint64_t v46 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v29 = 0u;
    if (!proc_pid_rusage(*(_DWORD *)(a1 + 64), 4, buffer))
    {
      id v11 = objc_loadWeakRetained(v2);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [NSNumber numberWithUnsignedLongLong:*((void *)&v32 + 1)];
      id v14 = [NSNumber numberWithUnsignedLongLong:(void)v43];
      [v11 logEventBackwardApplicationMemoryWithBundleId:v12 withSuspendedMemory:v13 withPeakMemory:v14];
    }
  }
}

- (void)logEventPointApplicationForDisplayID:(id)a3 withPid:(int)a4 withState:(id)a5 withReasons:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1D942A350]();
  id v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Application"];
  int v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
  id v16 = v15;
  if (v8 == -100)
  {
    [v15 setIsErrorEntry:1];
    [v16 setObject:v10 forKeyedSubscript:@"__PLEntryErrorString__"];
    [(PLOperator *)self logEntry:v16];
  }
  else
  {
    v56 = objc_opt_new();
    v53 = v16;
    v54 = v14;
    if (v12)
    {
      id v51 = v11;
      id v52 = v10;
      v49 = v13;
      unsigned int v48 = v8;
      if ([(PLOperator *)self isDebugEnabledForKey:@"Aggregate"])
      {
        v55 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"ApplicationReason"];
      }
      else
      {
        v55 = 0;
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v50 = v12;
      id v17 = v12;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v59;
        uint64_t v21 = *MEMORY[0x1E4FA6D00];
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v59 != v20) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            if ([MEMORY[0x1E4F929C0] BOOLForKey:@"EnableRunningBoardServices" ifNotSet:0])
            {
              id v24 = v23;
            }
            else
            {
              id v24 = [v23 objectForKeyedSubscript:v21];
            }
            id v25 = v24;
            [v56 addObject:v24];
            if ([(PLOperator *)self isDebugEnabledForKey:@"Aggregate"])
            {
              v26 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v55];
              [v26 setObject:v25 forKeyedSubscript:@"Reason"];
              [v26 setObject:&unk_1F29E7BB8 forKeyedSubscript:@"Count"];
              [(PLOperator *)self logEntry:v26];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v19);
      }

      id v13 = v49;
      if ([(PLOperator *)self isDebugEnabledForKey:@"Aggregate"])
      {
        v27 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        [v27 timeIntervalSince1970];
        double v29 = v28 + -86400.0;

        long long v30 = [(PLOperator *)self storage];
        long long v31 = objc_msgSend(v30, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v55, 1800.0, v29, 172800.0);

        long long v32 = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v31];
        long long v33 = [NSString stringWithFormat:@"results=%@\naggregatedResults=%@", v31, v32];
        long long v34 = (void *)MEMORY[0x1E4F929B8];
        long long v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
        long long v36 = [v35 lastPathComponent];
        long long v37 = [NSString stringWithUTF8String:"-[PLApplicationAgent logEventPointApplicationForDisplayID:withPid:withState:withReasons:]"];
        [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:1576];

        long long v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v33;
          _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      id v11 = v51;
      id v10 = v52;
      id v12 = v50;
      id v16 = v53;
      id v14 = v54;
      uint64_t v8 = v48;
    }
    [v16 setObject:v10 forKeyedSubscript:@"Identifier"];
    long long v39 = [NSNumber numberWithInt:v8];
    [v16 setObject:v39 forKeyedSubscript:@"pid"];

    [v16 setObject:v11 forKeyedSubscript:@"State"];
    long long v40 = [v56 allObjects];
    [v16 setObject:v40 forKeyedSubscript:@"Reason"];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v41 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__PLApplicationAgent_logEventPointApplicationForDisplayID_withPid_withState_withReasons___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v41;
      if (qword_1EBD5A9E8 != -1) {
        dispatch_once(&qword_1EBD5A9E8, block);
      }
      if (byte_1EBD5A980)
      {
        long long v42 = [NSString stringWithFormat:@"entry=%@", v16];
        long long v43 = (void *)MEMORY[0x1E4F929B8];
        long long v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
        long long v45 = [v44 lastPathComponent];
        uint64_t v46 = [NSString stringWithUTF8String:"-[PLApplicationAgent logEventPointApplicationForDisplayID:withPid:withState:withReasons:]"];
        [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:1584];

        v47 = PLLogCommon();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v42;
          _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        id v16 = v53;
        id v14 = v54;
      }
    }
    [(PLOperator *)self logEntry:v16];
  }
}

- (void)logEventBackwardApplicationMemoryWithBundleId:(id)a3 withSuspendedMemory:(id)a4 withPeakMemory:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v12 && [v12 length])
  {
    id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ApplicationMemory"];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
    [v11 setObject:v12 forKeyedSubscript:@"AppBundleId"];
    [v11 setObject:v8 forKeyedSubscript:@"SuspendedMemory"];
    [v11 setObject:v9 forKeyedSubscript:@"PeakMemory"];
    [(PLOperator *)self logEntry:v11];
  }
}

+ (id)defaults
{
  return &unk_1F29EB9D0;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLApplicationAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (void)addAppVersion:(id)a3 withVersion:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (qword_1EBD5A998 != -1) {
    dispatch_once(&qword_1EBD5A998, &__block_literal_global_91_0);
  }
  if (v7 && v5)
  {
    id v6 = (id)qword_1EBD5A9A0;
    objc_sync_enter(v6);
    [(id)qword_1EBD5A9A0 setObject:v5 forKey:v7];
    objc_sync_exit(v6);
  }
}

uint64_t __48__PLApplicationAgent_addAppVersion_withVersion___block_invoke()
{
  qword_1EBD5A9A0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)removeAppVersion:(id)a3 forVersion:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (v5 && v9 && qword_1EBD5A9A0)
  {
    id v6 = (id)qword_1EBD5A9A0;
    objc_sync_enter(v6);
    id v7 = [(id)qword_1EBD5A9A0 objectForKeyedSubscript:v9];
    int v8 = [v7 isEqualToString:v5];

    if (v8) {
      [(id)qword_1EBD5A9A0 removeObjectForKey:v9];
    }
    objc_sync_exit(v6);
  }
}

+ (id)appVersionForBundle:(id)a3
{
  id v3 = a3;
  if (qword_1EBD5A9A0)
  {
    id v4 = (id)qword_1EBD5A9A0;
    objc_sync_enter(v4);
    id v5 = [(id)qword_1EBD5A9A0 objectForKeyedSubscript:v3];
    objc_sync_exit(v4);
  }
  else
  {
    id v5 = &stru_1F294E108;
  }

  return v5;
}

+ (id)entryEventPointDefinitions
{
  v14[8] = *MEMORY[0x1E4F143B8];
  v13[0] = @"SuggestedWidgetReload";
  id v3 = [a1 entryEventPointDefinitionSuggestedWidgetReload];
  v14[0] = v3;
  v13[1] = @"WidgetUpdates";
  id v4 = [a1 entryEventPointDefinitionWidgetUpdates];
  v14[1] = v4;
  v13[2] = @"ApplicationExitReason";
  id v5 = [a1 entryEventPointDefinitionApplicationExitReason];
  v14[2] = v5;
  v13[3] = @"AppDocking";
  id v6 = [a1 entryEventPointDefinitionAppDocking];
  v14[3] = v6;
  v13[4] = @"AppPrewarm";
  id v7 = [a1 entryEventPointDefinitionAppPrewarm];
  v14[4] = v7;
  v13[5] = @"PosterUpdates";
  int v8 = [a1 entryEventPointDefinitionPosterUpdates];
  v14[5] = v8;
  v13[6] = @"LiveActivityUpdates";
  id v9 = [a1 entryEventPointDefinitionLiveActivityUpdates];
  v14[6] = v9;
  v13[7] = @"ControlCenterUpdates";
  id v10 = [a1 entryEventPointDefinitionControlCenterUpdates];
  v14[7] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

+ (id)entryEventPointDefinitionSuggestedWidgetReload
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F12D0;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"bundleID";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v16[0] = v4;
  v15[1] = @"kind";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v16[1] = v6;
  v15[2] = @"size";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v16[2] = v8;
  v15[3] = @"suggestionIdentifier";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v16[3] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionWidgetUpdates
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F12E0;
  v28[1] = MEMORY[0x1E4F1CC38];
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"bundleID";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat_withBundleID");
  v26[0] = v22;
  v25[1] = @"cost";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  v25[2] = @"identifier";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v26[2] = v18;
  v25[3] = @"kind";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v26[3] = v16;
  v25[4] = @"reason";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v26[4] = v14;
  v25[5] = @"remainingBudget";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  v25[6] = @"suggestionIdentifier";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v26[6] = v6;
  v25[7] = @"executionTime";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v26[7] = v8;
  v25[8] = @"host";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v26[8] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionPosterUpdates
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F12D0;
  v16[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"BundleID";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v14[0] = v5;
  v13[1] = @"Reason";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"updateType";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionLiveActivityUpdates
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F12F0;
  v24[1] = MEMORY[0x1E4F1CC38];
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"bundleID";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v22[0] = v18;
  v21[1] = @"activityIdentifier";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v22[1] = v16;
  v21[2] = @"source";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[2] = v14;
  v21[3] = @"pushPriority";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v22[3] = v4;
  v21[4] = @"isAlert";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v22[4] = v6;
  v21[5] = @"state";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v22[5] = v8;
  v21[6] = @"reason";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[6] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionApplicationExitReason
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F1300;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"Identifier";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v16[0] = v4;
  v15[1] = @"pid";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  void v15[2] = @"Reason";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  v15[3] = @"Subcode";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v16[3] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionAppDocking
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F12D0;
  v16[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"BundleID";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v14[0] = v5;
  v13[1] = @"PID";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"State";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionAppPrewarm
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F12D0;
  v14[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"BundleID";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v11[1] = @"PID";
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionControlCenterUpdates
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F12D0;
  v20[1] = MEMORY[0x1E4F1CC38];
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"bundleID";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v18[0] = v14;
  v17[1] = @"identifier";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  void v17[2] = @"reason";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v18[2] = v6;
  v17[3] = @"location";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v18[3] = v8;
  v17[4] = @"executionTime";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v18[4] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"Application";
  id v14 = [a1 entryEventForwardDefinitionApplication];
  v16[0] = v14;
  v15[1] = @"ApplicationDidUninstall";
  id v3 = [a1 entryEventForwardDefinitionApplicationDidUninstall];
  v16[1] = v3;
  void v15[2] = @"SystemAperture";
  id v4 = [a1 entryEventForwardDefinitionSystemAperture];
  void v16[2] = v4;
  v15[3] = @"LiveActivityStats";
  id v5 = [a1 entryEventForwardDefinitionLiveActivityStats];
  void v16[3] = v5;
  void v15[4] = @"HomeScreenConfiguration";
  id v6 = [a1 entryEventForwardDefinitionHomeScreenConfiguration];
  void v16[4] = v6;
  v15[5] = @"AmbientMode";
  id v7 = [a1 entryEventForwardDefinitionAmbientMode];
  v16[5] = v7;
  v15[6] = @"HomeScreenPresentation";
  int v8 = [a1 entryEventForwardDefinitionHomeScreenPresentation];
  v16[6] = v8;
  v15[7] = @"AmbientModeActiveFace";
  id v9 = [a1 entryEventForwardDefinitionAmbientActiveFace];
  v16[7] = v9;
  v15[8] = @"AmbientModeLifetimeCounter";
  id v10 = [a1 entryEventForwardDefinitionAmbientModeLifetimeCounter];
  v16[8] = v10;
  v15[9] = @"MotionToWake";
  id v11 = [a1 entryEventForwardDefinitionMotionToWake];
  v16[9] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  return v12;
}

+ (id)entryEventForwardDefinitionApplication
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  v21[0] = &unk_1F29F1310;
  v21[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92CB0];
  void v20[2] = *MEMORY[0x1E4F92CD8];
  void v20[3] = v3;
  void v21[2] = &unk_1F29F0040;
  v21[3] = @"logEventPointApplication";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v4;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"Identifier";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v19[0] = v6;
  v18[1] = @"pid";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v19[1] = v8;
  void v18[2] = @"State";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v19[2] = v10;
  void v18[3] = @"Reason";
  uint64_t v11 = *MEMORY[0x1E4F92D08];
  v16[0] = *MEMORY[0x1E4F92D10];
  v16[1] = v11;
  v17[0] = &unk_1F29E7AC8;
  v17[1] = &unk_1F29E7AE0;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[3] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v22[2] = *MEMORY[0x1E4F92C18];
  v23[1] = v13;
  void v23[2] = &unk_1F29F0058;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  return v14;
}

+ (id)entryEventForwardDefinitionApplicationDidUninstall
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F1310;
  v14[1] = &unk_1F29E7AF8;
  void v13[2] = *MEMORY[0x1E4F92CF0];
  void v14[2] = &unk_1F29F1320;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"AppBundleId";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"AppName";
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionSystemAperture
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F12D0;
  v20[1] = MEMORY[0x1E4F1CC38];
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"PrimaryClient";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v18[0] = v14;
  v17[1] = @"PrimaryElement";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  void v17[2] = @"SecondaryClient";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  void v18[2] = v6;
  v17[3] = @"SecondaryElement";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v18[3] = v8;
  v17[4] = @"Layout";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v18[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionLiveActivityStats
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F1300;
  v20[1] = MEMORY[0x1E4F1CC38];
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"bundleID";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v18[0] = v14;
  v17[1] = @"activityIdentifier";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  void v17[2] = @"source";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v18[2] = v6;
  v17[3] = @"eventType";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v18[3] = v8;
  v17[4] = @"updateBudget";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v18[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionHomeScreenConfiguration
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionAmbientMode
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  id v13 = &unk_1F29F12D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"Mode";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"Enabled";
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionHomeScreenPresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionAmbientActiveFace
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  id v13 = &unk_1F29F12D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"ActiveFaceType";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"ActiveFaceDescriptor";
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionAmbientModeLifetimeCounter
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  uint64_t v11 = &unk_1F29F12D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  int v8 = @"LifetimePresentationCounter";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  id v9 = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionMotionToWake
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  uint64_t v11 = &unk_1F29F12D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  int v8 = @"Enabled";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  id v9 = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ApplicationMemory";
  uint64_t v3 = [a1 entryEventBackwardDefinitionApplicationMemory];
  v9[0] = v3;
  v8[1] = @"WidgetStats";
  id v4 = [a1 entryEventBackwardDefinitionWidgetStats];
  v9[1] = v4;
  v8[2] = @"ControlCenterStats";
  id v5 = [a1 entryEventBackwardDefinitionControlCenterStats];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventBackwardDefinitionApplicationMemory
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v16[0] = *MEMORY[0x1E4F92CD0];
  v16[1] = v2;
  v17[0] = &unk_1F29F12D0;
  v17[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92CF0];
  void v16[2] = *MEMORY[0x1E4F92CF8];
  void v16[3] = v3;
  void v17[2] = &unk_1F29E7AF8;
  v17[3] = &unk_1F29F1330;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v19[0] = v4;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"AppBundleId";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v15[0] = v6;
  v14[1] = @"SuspendedMemory";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v15[1] = v8;
  void v14[2] = @"PeakMemory";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v15[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionWidgetStats
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F29F1300;
  v32[1] = MEMORY[0x1E4F1CC38];
  double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"bundleID";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat_withBundleID");
  v30[0] = v26;
  v29[1] = @"identifier";
  id v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v24 = objc_msgSend(v25, "commonTypeDict_StringFormat");
  v30[1] = v24;
  void v29[2] = @"isInStack";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_BoolFormat");
  v30[2] = v22;
  v29[3] = @"kind";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v30[3] = v20;
  v29[4] = @"location";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v30[4] = v18;
  v29[5] = @"page";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v30[5] = v16;
  v29[6] = @"size";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v30[6] = v14;
  v29[7] = @"suggestionIdentifier";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v30[7] = v4;
  v29[8] = @"totalFramesRendered";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v30[8] = v6;
  v29[9] = @"totalRenderWorkload";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v30[9] = v8;
  v29[10] = @"totalTimeSpentOnScreen";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v30[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionControlCenterStats
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F12D0;
  v22[1] = MEMORY[0x1E4F1CC38];
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"bundleID";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v20[0] = v16;
  v19[1] = @"identifier";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v20[1] = v14;
  void v19[2] = @"kind";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  void v20[2] = v4;
  void v19[3] = @"location";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v20[3] = v6;
  void v19[4] = @"stateBased";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v20[4] = v8;
  v19[5] = @"totalTimeSpentOnScreen";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v20[5] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"AllApps";
  uint64_t v2 = +[PLApplicationAgent entryEventNoneAllApps];
  v6[1] = @"AllPlugins";
  v7[0] = v2;
  uint64_t v3 = +[PLApplicationAgent entryEventNoneAllPlugins];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventNoneAllApps
{
  v49[3] = *MEMORY[0x1E4F143B8];
  v48[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v46[0] = *MEMORY[0x1E4F92CD0];
  v46[1] = v2;
  v47[0] = &unk_1F29F1340;
  v47[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CF8];
  v46[2] = *MEMORY[0x1E4F92C08];
  v46[3] = v3;
  v47[2] = MEMORY[0x1E4F1CC38];
  v47[3] = &unk_1F29E7B10;
  v46[4] = *MEMORY[0x1E4F92CE0];
  v47[4] = @"AppBundleId";
  long long v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:5];
  v49[0] = v43;
  v48[1] = *MEMORY[0x1E4F92CA8];
  v44[0] = @"AppBundleId";
  long long v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v41 = objc_msgSend(v42, "commonTypeDict_StringFormat_withBundleID");
  v45[0] = v41;
  v44[1] = @"AppName";
  long long v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v39 = objc_msgSend(v40, "commonTypeDict_StringFormat_withAppName");
  v45[1] = v39;
  v44[2] = @"AppBuildVersion";
  long long v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v37 = objc_msgSend(v38, "commonTypeDict_StringFormat");
  v45[2] = v37;
  v44[3] = @"AppBundleVersion";
  long long v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v35 = objc_msgSend(v36, "commonTypeDict_StringFormat");
  v45[3] = v35;
  v44[4] = @"AppExecutable";
  long long v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v33 = objc_msgSend(v34, "commonTypeDict_StringFormat_withProcessName");
  v45[4] = v33;
  v44[5] = @"AppVendorID";
  long long v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v31 = objc_msgSend(v32, "commonTypeDict_StringFormat");
  v45[5] = v31;
  v44[6] = @"AppItemID";
  long long v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v45[6] = v29;
  v44[7] = @"AppCohort";
  double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_StringFormat");
  v45[7] = v27;
  v44[8] = @"AppStoreFront";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v45[8] = v25;
  v44[9] = @"AppDistributorID";
  id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_StringFormat");
  v45[9] = v23;
  v44[10] = @"AppIsBeta";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v45[10] = v21;
  v44[11] = @"AppIs3rdParty";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v45[11] = v19;
  v44[12] = @"AppIsClip";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v17 = objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v45[12] = v17;
  v44[13] = @"AppArchitecture";
  id v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v45[13] = v15;
  v44[14] = @"AppUUID";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v45[14] = v5;
  v44[15] = @"AppDeletedDate";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v45[15] = v7;
  v44[16] = @"AppType";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v45[16] = v9;
  v44[17] = @"AppUpdatedDate";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v45[17] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:18];
  void v48[2] = *MEMORY[0x1E4F92C90];
  v49[1] = v12;
  v49[2] = &unk_1F29F0070;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];

  return v13;
}

+ (id)entryEventNoneAllPlugins
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  v21[0] = &unk_1F29F1310;
  v21[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CE0];
  void v20[2] = *MEMORY[0x1E4F92CF8];
  void v20[3] = v3;
  void v21[2] = &unk_1F29E7B10;
  v21[3] = @"PluginId";
  void v20[4] = *MEMORY[0x1E4F92C08];
  void v21[4] = MEMORY[0x1E4F1CC38];
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"PluginId";
  id v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v15 = objc_msgSend(v16, "commonTypeDict_StringFormat_withBundleID");
  v19[0] = v15;
  v18[1] = @"PluginParentApp";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v19[1] = v5;
  void v18[2] = @"PluginType";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v19[2] = v7;
  void v18[3] = @"PluginExecutableName";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat_withProcessName");
  void v19[3] = v9;
  void v18[4] = @"PluginDeletedDate";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  void v19[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  void v22[2] = *MEMORY[0x1E4F92C90];
  v23[1] = v12;
  void v23[2] = &unk_1F29F0088;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  return v13;
}

+ (id)entryAggregateDefinitions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabledForKey:@"Aggregate"])
  {
    uint64_t v11 = @"ApplicationReason";
    uint64_t v3 = [a1 entryAggregateDefinitionApplicationReason];
    v12[0] = v3;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = (void **)v12;
    id v6 = &v11;
  }
  else
  {
    id v9 = @"WidgetUpdates";
    uint64_t v3 = [a1 entryAggregateDefintionWidgetUpdates];
    uint64_t v10 = v3;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = &v10;
    id v6 = &v9;
  }
  id v7 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:1];

  return v7;
}

+ (id)entryAggregateDefinitionApplicationReason
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v2;
  v27[0] = &unk_1F29F12D0;
  v27[1] = MEMORY[0x1E4F1CC28];
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v29[0] = v15;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"Reason";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v24[1] = @"Count";
  v25[0] = v4;
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v25[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v29[1] = v7;
  void v28[2] = *MEMORY[0x1E4F92BE0];
  v22[0] = &unk_1F29F1350;
  uint64_t v20 = *MEMORY[0x1E4F92BD8];
  uint64_t v8 = v20;
  uint64_t v21 = &unk_1F29F1360;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v9;
  v22[1] = &unk_1F29F1360;
  uint64_t v18 = v8;
  uint64_t v19 = &unk_1F29F1370;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v23[1] = v10;
  void v22[2] = &unk_1F29F1370;
  uint64_t v16 = v8;
  id v17 = &unk_1F29F1380;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  void v23[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v28[3] = *MEMORY[0x1E4F92BF0];
  void v29[2] = v12;
  v29[3] = &unk_1F29F00A0;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  return v13;
}

+ (id)entryAggregateDefintionWidgetUpdates
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F12D0;
  v22[1] = MEMORY[0x1E4F1CC28];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v14;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"bundleID";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v20[0] = v4;
  v19[1] = @"host";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v20[1] = v6;
  void v19[2] = @"Count";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  void v20[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v24[1] = v9;
  void v23[2] = *MEMORY[0x1E4F92BE0];
  id v17 = &unk_1F29F1390;
  uint64_t v15 = *MEMORY[0x1E4F92BD8];
  uint64_t v16 = &unk_1F29F1370;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v18 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  void v23[3] = *MEMORY[0x1E4F92BF0];
  void v24[2] = v11;
  v24[3] = &unk_1F29F00B8;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (PLApplicationAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLApplicationAgent;
  return [(PLAgent *)&v3 init];
}

- (void)dealloc
{
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
  {
    objc_super v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F1CA98] null];

      if (v3 != v4)
      {
        [v3 removeObserver:self];
        [v3 _LSClearSchemaCaches];
      }
    }
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"PLAppDeletionActivityComplete" object:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)PLApplicationAgent;
  [(PLAgent *)&v6 dealloc];
}

- (void)sendApplicationMetadataToCA
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Logging all Installed Applications' BundleID/DistributorID to CA", buf, 2u);
  }

  context = (void *)MEMORY[0x1D942A350]();
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  id v4 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v5 = [v4 storage];
  uint64_t v15 = (void *)v3;
  objc_super v6 = [v5 entriesForKey:v3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"AppBundleId"];
        [v11 objectForKeyedSubscript:@"AppDistributorID"];
        v19 = uint64_t v18 = v12;
        id v13 = v19;
        id v14 = v12;
        AnalyticsSendEventLazy();
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
}

id __49__PLApplicationAgent_sendApplicationMetadataToCA__block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v1 = @"nil";
  v5[0] = @"AppBundleId";
  v5[1] = @"AppDistributorID";
  uint64_t v2 = *(__CFString **)(a1 + 32);
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  if (*(void *)(a1 + 40)) {
    v1 = *(__CFString **)(a1 + 40);
  }
  v6[0] = v2;
  v6[1] = v1;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)initOperatorDependancies
{
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    uint64_t v3 = PLLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location) = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Not invoking initOperatorDependancies for powerlogHelperd", (uint8_t *)&location, 2u);
    }
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F92A28]);
    id v5 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
    uint64_t v6 = *MEMORY[0x1E4F1C2E0];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke;
    v102[3] = &unk_1E692A0F0;
    v102[4] = self;
    uint64_t v7 = (void *)[v4 initWithWorkQueue:v5 forNotification:v6 withBlock:v102];

    [(PLApplicationAgent *)self setDailyTaskNotification:v7];
    uint64_t v8 = (NSSet *)SBSCopyDisplayIdentifiers();
    currentDisplayIdentifiers = self->_currentDisplayIdentifiers;
    self->_currentDisplayIdentifiers = v8;

    v101[5] = MEMORY[0x1E4F143A8];
    v101[6] = 3221225472;
    v101[7] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_379;
    v101[8] = &unk_1E69317C0;
    v101[9] = self;
    SBSRegisterDisplayIdentifiersChangedBlock();
    uint64_t v10 = [MEMORY[0x1E4F92998] sharedInstance];
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3;
    v101[3] = &unk_1E692A250;
    v101[4] = self;
    [v10 registerForArchivingNotificationUsingBlock:v101];

    uint64_t v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];

      if (v11 != v12)
      {
        [v11 addObserver:self];
        [v11 _LSClearSchemaCaches];
      }
    }
    [(PLApplicationAgent *)self resetScheduledAppCleanup];
    if (self->_scheduledAppCleanup) {
      [MEMORY[0x1E4F92990] registerFilePermissionActivity];
    }
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel_resetScheduledAppCleanup name:@"PLAppDeletionActivityComplete" object:0];

    if ([MEMORY[0x1E4F929C0] BOOLForKey:@"EnableRunningBoardServices" ifNotSet:0])
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4_414;
      aBlock[3] = &unk_1E6931838;
      id v14 = &v97;
      objc_copyWeak(&v97, &location);
      uint64_t v15 = _Block_copy(aBlock);
      uint64_t v16 = (void *)MEMORY[0x1E4F96418];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_419;
      v94[3] = &unk_1E6931860;
      id v17 = v15;
      id v95 = v17;
      uint64_t v18 = [v16 monitorWithConfiguration:v94];
      RBSAppStateMonitor = self->_RBSAppStateMonitor;
      self->_RBSAppStateMonitor = v18;
    }
    else
    {
      long long v20 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E4F4E278]);
      appStateMonitor = self->_appStateMonitor;
      self->_appStateMonitor = v20;

      objc_initWeak(&location, self);
      long long v22 = self->_appStateMonitor;
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_401;
      v98[3] = &unk_1E6931810;
      id v14 = &v99;
      objc_copyWeak(&v99, &location);
      [(BKSApplicationStateMonitor *)v22 setHandler:v98];
    }
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
    uint64_t v23 = *MEMORY[0x1E4F92D40];
    id v24 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
    id v25 = [(PLOperator *)self storage];
    uint64_t v26 = [v25 countOfEntriesForKey:v24];

    if (!v26) {
      [(PLApplicationAgent *)self logAllPlugins];
    }
    v27 = +[PLOperator entryKeyForType:v23 andName:@"AllApps"];
    double v28 = [(PLOperator *)self storage];
    uint64_t v29 = [v28 countOfEntriesForKey:v27];

    if (v29) {
      [(PLApplicationAgent *)self buildAppVersionDictionary:v27];
    }
    else {
      [(PLApplicationAgent *)self logAllApps];
    }
    if ([(PLOperator *)self isDebugEnabled])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)TestRefreshAllAppsAndPlugins, @"com.apple.powerlogd.refreshAllAppsAndPlugins", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    id v31 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_445;
    v93[3] = &unk_1E692A6F8;
    v93[4] = self;
    long long v32 = (PLXPCListenerOperatorComposition *)[v31 initWithOperator:self withRegistration:&unk_1F29EB9F8 withBlock:v93];
    widgetStatsListener = self->_widgetStatsListener;
    self->_widgetStatsListener = v32;

    id v34 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_451;
    v92[3] = &unk_1E692A6F8;
    v92[4] = self;
    long long v35 = (PLXPCListenerOperatorComposition *)[v34 initWithOperator:self withRegistration:&unk_1F29EBA20 withBlock:v92];
    widgetUpdatesListener = self->_widgetUpdatesListener;
    self->_widgetUpdatesListener = v35;

    id v37 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_456;
    v91[3] = &unk_1E692A6F8;
    v91[4] = self;
    long long v38 = (PLXPCListenerOperatorComposition *)[v37 initWithOperator:self withRegistration:&unk_1F29EBA48 withBlock:v91];
    suggestedWidgetReloadListener = self->_suggestedWidgetReloadListener;
    self->_suggestedWidgetReloadListener = v38;

    id v40 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_463;
    v90[3] = &unk_1E692A6F8;
    v90[4] = self;
    uint64_t v41 = (PLXPCListenerOperatorComposition *)[v40 initWithOperator:self withRegistration:&unk_1F29EBA70 withBlock:v90];
    posterUpdatesListener = self->_posterUpdatesListener;
    self->_posterUpdatesListener = v41;

    id v43 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_473;
    v89[3] = &unk_1E692A6F8;
    v89[4] = self;
    long long v44 = (PLXPCListenerOperatorComposition *)[v43 initWithOperator:self withRegistration:&unk_1F29EBA98 withBlock:v89];
    systemApertureListener = self->_systemApertureListener;
    self->_systemApertureListener = v44;

    id v46 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_480;
    v88[3] = &unk_1E692A6F8;
    v88[4] = self;
    v47 = (PLXPCListenerOperatorComposition *)[v46 initWithOperator:self withRegistration:&unk_1F29EBAC0 withBlock:v88];
    ambientModeListener = self->_ambientModeListener;
    self->_ambientModeListener = v47;

    id v49 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_487;
    v87[3] = &unk_1E692A6F8;
    v87[4] = self;
    id v50 = (PLXPCListenerOperatorComposition *)[v49 initWithOperator:self withRegistration:&unk_1F29EBAE8 withBlock:v87];
    liveActivityUpdatesListener = self->_liveActivityUpdatesListener;
    self->_liveActivityUpdatesListener = v50;

    id v52 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_492;
    v86[3] = &unk_1E692A6F8;
    v86[4] = self;
    v53 = (PLXPCListenerOperatorComposition *)[v52 initWithOperator:self withRegistration:&unk_1F29EBB10 withBlock:v86];
    liveActivityStatsListener = self->_liveActivityStatsListener;
    self->_liveActivityStatsListener = v53;

    id v55 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_497;
    v85[3] = &unk_1E692A6F8;
    v85[4] = self;
    v56 = (PLXPCListenerOperatorComposition *)[v55 initWithOperator:self withRegistration:&unk_1F29EBB38 withBlock:v85];
    ambientModeActiveFaceListener = self->_ambientModeActiveFaceListener;
    self->_ambientModeActiveFaceListener = v56;

    id v58 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_505;
    v84[3] = &unk_1E692A6F8;
    v84[4] = self;
    long long v59 = (PLXPCListenerOperatorComposition *)[v58 initWithOperator:self withRegistration:&unk_1F29EBB60 withBlock:v84];
    ambientModeLifetimeCounterListener = self->_ambientModeLifetimeCounterListener;
    self->_ambientModeLifetimeCounterListener = v59;

    id v61 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_513;
    v83[3] = &unk_1E692A6F8;
    v83[4] = self;
    v62 = (PLXPCListenerOperatorComposition *)[v61 initWithOperator:self withRegistration:&unk_1F29EBB88 withBlock:v83];
    motionToWakeListener = self->_motionToWakeListener;
    self->_motionToWakeListener = v62;

    id v64 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_518;
    v82[3] = &unk_1E692A6F8;
    v82[4] = self;
    uint64_t v65 = (PLXPCListenerOperatorComposition *)[v64 initWithOperator:self withRegistration:&unk_1F29EBBB0 withBlock:v82];
    controlCenterUpdatesListener = self->_controlCenterUpdatesListener;
    self->_controlCenterUpdatesListener = v65;

    id v67 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_523;
    v81[3] = &unk_1E692A6F8;
    v81[4] = self;
    v68 = (PLXPCListenerOperatorComposition *)[v67 initWithOperator:self withRegistration:&unk_1F29EBBD8 withBlock:v81];
    controlCenterStatsListener = self->_controlCenterStatsListener;
    self->_controlCenterStatsListener = v68;

    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_524;
    v80[3] = &unk_1E69318B0;
    v80[4] = self;
    v70 = [MEMORY[0x1E4F96418] monitorWithConfiguration:v80];
    appStateMonitorRBS = self->_appStateMonitorRBS;
    self->_appStateMonitorRBS = v70;

    id v72 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_548;
    v79[3] = &unk_1E692A6F8;
    v79[4] = self;
    v73 = (PLXPCListenerOperatorComposition *)[v72 initWithOperator:self withRegistration:&unk_1F29EBC00 withBlock:v79];
    appDockingListener = self->_appDockingListener;
    self->_appDockingListener = v73;

    id v75 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_560;
    v78[3] = &unk_1E692A6F8;
    v78[4] = self;
    v76 = (PLXPCListenerOperatorComposition *)[v75 initWithOperator:self withRegistration:&unk_1F29EBC28 withBlock:v78];
    appPrewarmListener = self->_appPrewarmListener;
    self->_appPrewarmListener = v76;
  }
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Application metadata being sent to CA", v4, 2u);
  }

  return [*(id *)(a1 + 32) sendApplicationMetadataToCA];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_379(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2;
  block[3] = &unk_1E692A250;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayIdentifiersDidChange];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (qword_1EBD5A9A8 != -1) {
      dispatch_once(&qword_1EBD5A9A8, block);
    }
    if (_MergedGlobals_1_60)
    {
      uint64_t v3 = [NSString stringWithFormat:@"PLApplicationAgent_RefreshAllsAppsAndPlugins callback initiated"];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      uint64_t v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLApplicationAgent initOperatorDependancies]_block_invoke_3"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:859];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_389;
  v10[3] = &unk_1E692A250;
  v10[4] = *(void *)(a1 + 32);
  dispatch_async_and_wait(v9, v10);
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_60 = result;
  return result;
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_389(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_390;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (qword_1EBD5A9B0 != -1) {
      dispatch_once(&qword_1EBD5A9B0, block);
    }
    if (byte_1EBD5A979)
    {
      uint64_t v3 = [NSString stringWithFormat:@"PLApplicationAgent_RefreshAllsAppsAndPlugins callback running"];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      uint64_t v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLApplicationAgent initOperatorDependancies]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:863];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return [*(id *)(a1 + 32) refreshAllAppsAndPlugins];
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_390(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A979 = result;
  return result;
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_412(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AppUUID"];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setObject:v2 forKeyedSubscript:@"AppArchitecture"];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4_414(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 previousState];
  int v9 = [v8 taskState];

  uint64_t v10 = [v7 state];
  uint64_t v11 = [v10 taskState];

  uint64_t v12 = [v7 previousState];
  int v13 = +[PLApplicationAgent isVisible:v12];

  uint64_t v14 = [v7 state];
  int v15 = +[PLApplicationAgent isVisible:v14];

  if (v9 != v11 || v13 != v15)
  {
    int v16 = [v6 pid];
    id v17 = [v6 bundle];
    uint64_t v18 = [v17 identifier];

    uint64_t v19 = [v7 state];
    long long v20 = [v19 assertions];
    long long v21 = +[PLApplicationAgent getReasons:v20];

    long long v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v36 = v16;
      __int16 v37 = 2112;
      long long v38 = v18;
      __int16 v39 = 1024;
      int v40 = v11;
      __int16 v41 = 2112;
      long long v42 = v21;
      _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "pid: %d, name: %@, state: %d, reasons: %@", buf, 0x22u);
    }

    uint64_t v23 = [NSNumber numberWithUnsignedInt:v11];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v25 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_415;
    block[3] = &unk_1E69317E8;
    objc_copyWeak(&v33, (id *)(a1 + 32));
    int v34 = v16;
    id v30 = v18;
    id v31 = v23;
    id v32 = v21;
    id v26 = v21;
    id v27 = v23;
    id v28 = v18;
    dispatch_async(v25, block);

    objc_destroyWeak(&v33);
  }
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_415(uint64_t a1)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained logEventPointApplicationForDisplayID:*(void *)(a1 + 32) withPid:*(unsigned int *)(a1 + 64) withState:*(void *)(a1 + 40) withReasons:*(void *)(a1 + 48)];

  if ([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled]
    && (int)[*(id *)(a1 + 40) intValue] >= 4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppBundleId" withValue:*(void *)(a1 + 32) withComparisonOperation:0];
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    id v6 = objc_loadWeakRetained(v2);
    id v7 = [v6 storage];
    v48[0] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    int v9 = [v7 lastEntryForKey:v5 withComparisons:v8 isSingleton:1];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v29 = 0u;
    if (proc_pid_rusage(*(_DWORD *)(a1 + 64), 0, buffer))
    {
      uint64_t v10 = 0;
    }
    else
    {
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)buffer, (char *)out);
      uint64_t v10 = [NSString stringWithUTF8String:out];
    }
    size_t size = 0;
    *(void *)out = 0xE00000001;
    int v15 = *(_DWORD *)(a1 + 64);
    out[2] = 1;
    out[3] = v15;
    if (sysctl(out, 4u, 0, &size, 0, 0) < 0 || (int v16 = malloc_type_malloc(size, 0x527A8535uLL)) == 0)
    {
      uint64_t v18 = 0;
      if (!v10) {
        goto LABEL_23;
      }
    }
    else
    {
      id v7 = v16;
      if (sysctl(out, 4u, v16, &size, 0, 0) < 0)
      {
        uint64_t v18 = 0;
      }
      else
      {
        if ((v7[8] & 4) != 0) {
          id v17 = @"arm-64bit";
        }
        else {
          id v17 = @"arm-32bit";
        }
        uint64_t v18 = v17;
      }
      free(v7);
      if (!v10)
      {
LABEL_23:
        if (!v18)
        {
LABEL_29:

          return;
        }
        goto LABEL_24;
      }
    }
    id v7 = [v9 objectForKeyedSubscript:@"AppUUID"];
    if (([v10 isEqualToString:v7] & 1) == 0)
    {

LABEL_27:
      id v21 = objc_loadWeakRetained(v2);
      long long v22 = [v21 storage];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_416;
      void v23[3] = &unk_1E692D388;
      id v24 = v9;
      id v25 = v10;
      id v26 = v18;
      [v22 updateEntry:v24 withBlock:v23];

      id v7 = v24;
LABEL_28:

      goto LABEL_29;
    }
    if (!v18) {
      goto LABEL_28;
    }
LABEL_24:
    uint64_t v19 = [v9 objectForKeyedSubscript:@"AppArchitecture"];
    char v20 = [(__CFString *)v18 isEqualToString:v19];

    if (v10) {
    if (v20)
    }
      goto LABEL_29;
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) intValue] == 3)
  {
    uint64_t v46 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v29 = 0u;
    if (!proc_pid_rusage(*(_DWORD *)(a1 + 64), 4, buffer))
    {
      id v11 = objc_loadWeakRetained(v2);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = [NSNumber numberWithUnsignedLongLong:*((void *)&v32 + 1)];
      uint64_t v14 = [NSNumber numberWithUnsignedLongLong:(void)v43];
      [v11 logEventBackwardApplicationMemoryWithBundleId:v12 withSuspendedMemory:v13 withPeakMemory:v14];
    }
  }
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_416(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AppUUID"];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setObject:v2 forKeyedSubscript:@"AppArchitecture"];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_419(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F96430];
  id v4 = a2;
  id v5 = [v3 predicateMatchingProcessTypeApplication];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v4 setPredicates:v6];

  id v7 = [MEMORY[0x1E4F96448] descriptor];
  [v7 setValues:25];
  [v7 setEndowmentNamespaces:&unk_1F29F00D0];
  [v4 setStateDescriptor:v7];
  uint64_t v8 = (void *)[*(id *)(a1 + 32) copy];
  [v4 setUpdateHandler:v8];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_445(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "WidgetStats payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardWidgetStats:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_451(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "WidgetUpdates payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointWidgetUpdates:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_456(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "SuggestedWidgetReload payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointSuggestedWidgetReload:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_463(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PosterUpdates payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointPosterUpdates:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_473(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "System Aperture payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSystemAperture:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AmbientMode payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardAmbientMode:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_487(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "LiveActivityUpdates payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointLiveActivityUpdates:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_492(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "LiveActivityStats payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardLiveActivityStats:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_497(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AmbientModeActiveFace payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardAmbientModeActiveFace:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_505(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AmbientModeLifetimePresentationCounter payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardAmbientModeLifetimeCounter:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_513(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AmbientModeMotionToWake payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardMotionToWake:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "ControlCenterUpdates payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointControlCenterUpdates:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_523(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "ControlCenterStats payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardControlCenterStats:v6];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_524(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F96430];
  id v4 = a2;
  id v5 = [v3 predicateMatchingLaunchServicesProcesses];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setPredicates:v6];

  [v4 setEvents:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_525;
  void v7[3] = &unk_1E6931888;
  v7[4] = *(void *)(a1 + 32);
  [v4 setUpdateHandler:v7];
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_525(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 exitEvent];
  int v8 = [v7 context];
  id v9 = [v8 status];
  uint64_t v10 = [v7 process];
  uint64_t v11 = [v10 pid];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_526;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v12;
    if (qword_1EBD5A9B8 != -1) {
      dispatch_once(&qword_1EBD5A9B8, block);
    }
    if (byte_1EBD5A97A)
    {
      id v33 = v6;
      int v13 = objc_msgSend(NSString, "stringWithFormat:", @"Received exit event for %d", v11);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      int v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      int v16 = [v15 lastPathComponent];
      id v17 = [NSString stringWithUTF8String:"-[PLApplicationAgent initOperatorDependancies]_block_invoke_2"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1185];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v38 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v6 = v33;
    }
  }
  if ([*(id *)(a1 + 32) isApplication:v11])
  {
    uint64_t v19 = objc_opt_new();
    char v20 = [NSNumber numberWithInt:v11];
    [v19 setObject:v20 forKeyedSubscript:@"pid"];

    id v21 = [v6 bundle];
    long long v22 = [v21 identifier];
    [v19 setObject:v22 forKeyedSubscript:@"Identifier"];

    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "domain"));
    [v19 setObject:v23 forKeyedSubscript:@"Reason"];

    id v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "code"));
    [v19 setObject:v24 forKeyedSubscript:@"Subcode"];

    id v25 = [v8 timestamp];
    [v19 setObject:v25 forKeyedSubscript:@"timestamp"];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_535;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v26;
      if (qword_1EBD5A9C0 != -1) {
        dispatch_once(&qword_1EBD5A9C0, v35);
      }
      if (byte_1EBD5A97B)
      {
        id v34 = v6;
        id v27 = [NSString stringWithFormat:@"Payload for app exit is %@", v19];
        id v28 = (void *)MEMORY[0x1E4F929B8];
        long long v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
        long long v30 = [v29 lastPathComponent];
        long long v31 = [NSString stringWithUTF8String:"-[PLApplicationAgent initOperatorDependancies]_block_invoke_2"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1194];

        long long v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v38 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        id v6 = v34;
      }
    }
    [*(id *)(a1 + 32) logEventPointApplicationExitReason:v19];
  }
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_526(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A97A = result;
  return result;
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_535(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A97B = result;
  return result;
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_549;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD5A9C8 != -1) {
      dispatch_once(&qword_1EBD5A9C8, &block);
    }
    if (byte_1EBD5A97C)
    {
      int v8 = [NSString stringWithFormat:@"PLApplicationAgent:: appDockingListener with payload=%@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLApplicationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1203];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        char v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointDASAppDocking:v6];
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_549(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A97C = result;
  return result;
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_561;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD5A9D0 != -1) {
      dispatch_once(&qword_1EBD5A9D0, &block);
    }
    if (byte_1EBD5A97D)
    {
      int v8 = [NSString stringWithFormat:@"PLApplicationAgent:: appPrewarmListener with payload=%@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLApplicationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1210];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        char v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointDASAppPrewarm:v6];
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_561(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A97D = result;
  return result;
}

- (void)logEventPointDASAppDocking:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AppDocking"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDASAppPrewarm:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AppPrewarm"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (BOOL)isApplication:(int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F963E8];
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  id v10 = 0;
  id v5 = [v3 handleForIdentifier:v4 error:&v10];
  id v6 = v10;
  id v7 = [v5 identity];
  char v8 = [v7 isApplication];

  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_error_impl(&dword_1D2690000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error to identify isApplication %@", buf, 0xCu);
  }

  return v8;
}

- (BOOL)checkAppReferenceCleanupNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F92A88] AppDeletionEnabled]) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v3 = [v2 storage];
  uint64_t v4 = [v3 entriesForKey:@"PLApplicationAgent_EventForward_ApplicationDidUninstall"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"AppBundleId"];
        if (([v11 containsString:@"Unspecified"] & 1) == 0)
        {

LABEL_15:
          uint64_t v15 = PLLogAppDeletion();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v17 = 0;
            _os_log_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEFAULT, "AppDeletion : Cleanup pending", v17, 2u);
          }

          BOOL v14 = 1;
          goto LABEL_18;
        }
        id v12 = [v10 objectForKeyedSubscript:@"AppName"];
        char v13 = [v12 containsString:@"Unspecified"];

        if ((v13 & 1) == 0) {
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_18:

  return v14;
}

- (void)resetScheduledAppCleanup
{
  self->_scheduledAppCleanup = [(PLApplicationAgent *)self checkAppReferenceCleanupNeeded];
}

+ (BOOL)hasScreenPresence:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 appTags];
    if ([v5 containsObject:@"Hidden"])
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v7 = [v4 appTags];
      if ([v7 containsObject:@"hidden"])
      {
        char v6 = 1;
      }
      else
      {
        uint64_t v8 = [v4 applicationState];
        if ([v8 isRestricted])
        {
          char v6 = 1;
        }
        else
        {
          id v9 = [v4 applicationState];
          if ([v9 isRemovedSystemApp]) {
            char v6 = 1;
          }
          else {
            char v6 = [v4 isLaunchProhibited];
          }
        }
      }
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6 ^ 1;
}

- (BOOL)isAppClipWithBundleID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  uint64_t v9 = 0;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];

  if (v9)
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v5 appClipMetadata];

    BOOL v6 = v7 != 0;
  }

  return v6;
}

- (void)refreshAllAppsAndPlugins
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v3;
    if (qword_1EBD5A9D8 != -1) {
      dispatch_once(&qword_1EBD5A9D8, v38);
    }
    if (byte_1EBD5A97E)
    {
      id v4 = [NSString stringWithFormat:@"begin"];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      BOOL v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLApplicationAgent refreshAllAppsAndPlugins]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1305];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v43 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v34 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1D942A350]();
  uint64_t v10 = *MEMORY[0x1E4F92D40];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  id v12 = +[PLOperator entryKeyForType:v10 andName:@"AllPlugins"];
  char v13 = [(PLOperator *)self storage];
  BOOL v14 = [NSString stringWithFormat:@"%@ = 0", @"AppDeletedDate"];
  v41[0] = v14;
  uint64_t v15 = [NSString stringWithFormat:@"%@ = 0", @"AppUpdatedDate"];
  v41[1] = v15;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v13 deleteAllEntriesForKey:v11 withFilters:v16];

  id v17 = [(PLOperator *)self storage];
  long long v18 = [NSString stringWithFormat:@"%@ IS NULL", @"AppUpdatedDate"];
  long long v40 = v18;
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [v17 deleteAllEntriesForKey:v11 withFilters:v19];

  long long v20 = [(PLOperator *)self storage];
  long long v21 = [NSString stringWithFormat:@"%@ = 0", @"PluginDeletedDate"];
  uint64_t v39 = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  [v20 deleteAllEntriesForKey:v12 withFilters:v22];

  [(PLApplicationAgent *)self logAllApps];
  [(PLApplicationAgent *)self logAllPlugins];

  dispatch_time_t v23 = dispatch_time(0, 60000000000);
  id v24 = [MEMORY[0x1E4F92A88] transactionWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke_590;
  block[3] = &unk_1E692A250;
  id v25 = v34;
  id v37 = v25;
  dispatch_after(v23, v24, block);

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke_2;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v26;
    if (qword_1EBD5A9E0 != -1) {
      dispatch_once(&qword_1EBD5A9E0, v35);
    }
    if (byte_1EBD5A97F)
    {
      id v27 = [NSString stringWithFormat:@"end"];
      id v28 = (void *)MEMORY[0x1E4F929B8];
      long long v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      long long v30 = [v29 lastPathComponent];
      long long v31 = [NSString stringWithUTF8String:"-[PLApplicationAgent refreshAllAppsAndPlugins]"];
      [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1332];

      long long v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v43 = v27;
        _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A97E = result;
  return result;
}

uint64_t __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A97F = result;
  return result;
}

- (void)logEventBackwardWidgetStats:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"stats"];

  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"WidgetStats"];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __50__PLApplicationAgent_logEventBackwardWidgetStats___block_invoke;
  long long v20 = &unk_1E69318D8;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  [v10 enumerateObjectsUsingBlock:&v17];
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    id v24 = v13;
    v25[0] = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [(PLOperator *)self logEntries:v16 withGroupID:v13];

    [(PLApplicationAgent *)self createWidgetStatsAccountingEvents:v15];
  }
}

void __50__PLApplicationAgent_logEventBackwardWidgetStats___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];

  [v5 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v5];
}

- (void)createWidgetStatsAccountingEvents:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v4 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke;
  void v15[3] = &unk_1E6931900;
  void v15[4] = &v16;
  [v3 enumerateObjectsUsingBlock:v15];
  if (v17[3] > 0.0)
  {
    id v5 = PLLogApplication();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "WidgetStats Accounting: entries=%@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke_603;
    v12[3] = &unk_1E6931928;
    id v14 = &v16;
    id v6 = v4;
    id v13 = v6;
    [v3 enumerateObjectsUsingBlock:v12];
    double v7 = PLLogApplication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = (void *)*((void *)v17 + 3);
      *(_DWORD *)buf = 134218242;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "WidgetStats Accounting: totalFramesRendered=%f, identifierToWeight=%@", buf, 0x16u);
    }

    uint64_t v8 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v9 = [v3 lastObject];
    uint64_t v10 = [v9 entryDate];
    [v8 createDistributionEventBackwardWithDistributionID:50 withChildNodeNameToWeight:v6 withEndDate:v10];
  }
  _Block_object_dispose(&v16, 8);
}

void __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKeyedSubscript:@"totalFramesRendered"];
  [v4 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

void __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke_603(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = [v3 objectForKeyedSubscript:@"bundleID"];
  id v4 = NSNumber;
  id v5 = [v3 objectForKeyedSubscript:@"totalFramesRendered"];

  [v5 doubleValue];
  double v7 = [v4 numberWithDouble:v6 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];

    if (v8)
    {
      uint64_t v9 = NSNumber;
      uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
      [v10 doubleValue];
      double v12 = v11;
      [v7 doubleValue];
      id v14 = [v9 numberWithDouble:v12 + v13];
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v15];
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v15];
    }
  }
}

- (void)logEventBackwardControlCenterStats:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"stats"];

  double v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ControlCenterStats"];
  double v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __57__PLApplicationAgent_logEventBackwardControlCenterStats___block_invoke;
  long long v20 = &unk_1E69318D8;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  [v10 enumerateObjectsUsingBlock:&v17];
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    id v24 = v13;
    v25[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [(PLOperator *)self logEntries:v16 withGroupID:v13];
  }
}

void __57__PLApplicationAgent_logEventBackwardControlCenterStats___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];

  [v5 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v5];
}

- (void)logEventForwardApplicationDidUninstall:(id)a3 withAppName:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F92D30];
  id v7 = a4;
  id v8 = a3;
  id v10 = +[PLOperator entryKeyForType:v6 andName:@"ApplicationDidUninstall"];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [v9 setObject:v8 forKeyedSubscript:@"AppBundleId"];

  [v9 setObject:v7 forKeyedSubscript:@"AppName"];
  [(PLOperator *)self logEntry:v9];
}

- (void)logEventForwardSystemAperture:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SystemAperture"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardAmbientMode:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AmbientMode"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardAmbientModeActiveFace:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AmbientModeActiveFace"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardAmbientModeLifetimeCounter:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  uint64_t v6 = +[PLOperator entryKeyForType:v4 andName:@"AmbientModeLifetimeCounter"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  id v8 = [v5 objectForKeyedSubscript:@"LifetimePresentationCounter"];

  uint64_t v9 = [v8 intValue];
  id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F92A88], "roundToSigFig:withSigFig:", v9, 2));
  [v7 setObject:v10 forKeyedSubscript:@"LifetimePresentationCounter"];

  double v11 = PLLogApplication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v12 = [v7 objectForKeyedSubscript:@"LifetimePresentationCounter"];
    v13[0] = 67109378;
    v13[1] = v9;
    __int16 v14 = 2112;
    id v15 = v12;
    _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "AmbientModeLifetimePresentationCounter value from payload: %d, value after rounding: %@", (uint8_t *)v13, 0x12u);
  }
  [(PLOperator *)self logEntry:v7];
}

- (void)logEventForwardMotionToWake:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MotionToWake"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointApplicationExitReason:(id)a3
{
  id v9 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ApplicationExitReason"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v9];
  uint64_t v6 = [v9 objectForKey:@"timestamp"];

  if (v6)
  {
    id v7 = [v9 objectForKeyedSubscript:@"timestamp"];
    id v8 = [v7 convertFromSystemToMonotonic];

    [v5 setEntryDate:v8];
  }
  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointApplication
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)SBSCopyApplicationDisplayIdentifiers();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[PLApplicationAgent logEventPointApplicationForDisplayID:](self, "logEventPointApplicationForDisplayID:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [(PLApplicationAgent *)self logEventPointApplicationForDisplayID:@"noApplications" withPid:4294967196 withState:0 withReasons:0];
  }
}

- (void)logEventPointApplicationForDisplayID:(id)a3
{
  id v4 = a3;
  SBSProcessIDForDisplayIdentifier();
  uint64_t v5 = [NSNumber numberWithInt:SBSGetApplicationState()];
  [(PLApplicationAgent *)self logEventPointApplicationForDisplayID:v4 withPid:0 withState:v5 withReasons:0];
}

uint64_t __89__PLApplicationAgent_logEventPointApplicationForDisplayID_withPid_withState_withReasons___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A980 = result;
  return result;
}

- (void)logEventPointSuggestedWidgetReload:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  long long v9 = [v8 convertFromSystemToMonotonic];

  long long v10 = [v4 objectForKeyedSubscript:@"stats"];

  long long v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SuggestedWidgetReload"];
  long long v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __57__PLApplicationAgent_logEventPointSuggestedWidgetReload___block_invoke;
  long long v20 = &unk_1E69318D8;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  [v10 enumerateObjectsUsingBlock:&v17];
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    id v24 = v13;
    v25[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [(PLOperator *)self logEntries:v16 withGroupID:v13];
  }
}

void __57__PLApplicationAgent_logEventPointSuggestedWidgetReload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];

  [v5 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v5];
}

- (void)logEventPointWidgetUpdates:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  long long v9 = [v8 convertFromSystemToMonotonic];

  long long v10 = [v4 objectForKeyedSubscript:@"stats"];

  long long v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"WidgetUpdates"];
  long long v12 = [MEMORY[0x1E4F1CA48] array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __49__PLApplicationAgent_logEventPointWidgetUpdates___block_invoke;
  v17[3] = &unk_1E69307B0;
  id v13 = v11;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  id v21 = self;
  [v10 enumerateObjectsUsingBlock:v17];
  if ([v15 count])
  {
    id v22 = v13;
    v23[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(PLOperator *)self logEntries:v16 withGroupID:v13];
  }
}

void __49__PLApplicationAgent_logEventPointWidgetUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v10 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];
  id v5 = [v4 objectForKeyedSubscript:@"host"];

  LODWORD(v4) = [v5 isEqualToString:@"com.apple.chronod.timeline-host"];
  if (v4) {
    [v10 setObject:@"Local" forKeyedSubscript:@"host"];
  }
  [v10 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v10];
  double v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"WidgetUpdates"];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  uint64_t v8 = [v10 objectForKeyedSubscript:@"bundleID"];
  [v7 setObject:v8 forKeyedSubscript:@"bundleID"];

  long long v9 = [v10 objectForKeyedSubscript:@"host"];
  [v7 setObject:v9 forKeyedSubscript:@"host"];

  [v7 setObject:&unk_1F29E7BB8 forKeyedSubscript:@"Count"];
  [*(id *)(a1 + 56) logEntry:v7];
}

- (void)logEventPointPosterUpdates:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PosterUpdates"];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardLiveActivityStats:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v9 = +[PLOperator entryKeyForType:v4 andName:@"LiveActivityStats"];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"timestamp"];

  uint64_t v8 = [v7 convertFromSystemToMonotonic];
  [v6 setEntryDate:v8];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointLiveActivityUpdates:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v9 = +[PLOperator entryKeyForType:v4 andName:@"LiveActivityUpdates"];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"timestamp"];

  uint64_t v8 = [v7 convertFromSystemToMonotonic];
  [v6 setEntryDate:v8];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointControlCenterUpdates:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  id v9 = [v8 convertFromSystemToMonotonic];

  id v10 = [v4 objectForKeyedSubscript:@"stats"];

  long long v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ControlCenterUpdates"];
  long long v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __56__PLApplicationAgent_logEventPointControlCenterUpdates___block_invoke;
  id v20 = &unk_1E69318D8;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  [v10 enumerateObjectsUsingBlock:&v17];
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    id v24 = v13;
    v25[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [(PLOperator *)self logEntries:v16 withGroupID:v13];
  }
}

void __56__PLApplicationAgent_logEventPointControlCenterUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];

  [v5 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v5];
}

- (void)displayIdentifiersDidChange
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  context = (void *)MEMORY[0x1D942A350]();
  id v4 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = [v9 bundleIdentifier];
        [v3 addObject:v10];
        long long v11 = [(PLApplicationAgent *)self currentDisplayIdentifiers];
        char v12 = [v11 containsObject:v10];

        if ((v12 & 1) == 0) {
          [(PLApplicationAgent *)self logInstalledAppWithRecord:v9 withBundleID:v10 shouldMaskTimestamp:1];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  id v13 = (void *)MEMORY[0x1E4F1CA80];
  id v14 = [(PLApplicationAgent *)self currentDisplayIdentifiers];
  id v15 = [v13 setWithSet:v14];

  uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithSet:v3];
  [v15 minusSet:v3];
  uint64_t v17 = [(PLApplicationAgent *)self currentDisplayIdentifiers];
  [v16 minusSet:v17];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        [(PLApplicationAgent *)self logUninstalledApp:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  if ([v16 count] || objc_msgSend(v18, "count"))
  {
    id v23 = [MEMORY[0x1E4F92AD0] sharedCore];
    id v24 = [v23 storage];
    [v24 flushCachesWithReason:@"AppAddedOrRemoved"];
  }
  [(PLApplicationAgent *)self setCurrentDisplayIdentifiers:v3];
}

+ (id)pluginEntryFromRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
  uint64_t v6 = [v4 bundleIdentifier];
  if (v6)
  {
    uint64_t v7 = [v4 executableURL];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [v4 containingBundleRecord];
      if (v9)
      {
        id v3 = [v4 containingBundleRecord];
        id v10 = [v3 bundleIdentifier];
        if (v10)
        {

LABEL_10:
          uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
          id v14 = [v4 bundleIdentifier];
          [v6 setObject:v14 forKeyedSubscript:@"PluginId"];

          id v15 = [v4 containingBundleRecord];
          uint64_t v16 = [v15 bundleIdentifier];
          [v6 setObject:v16 forKeyedSubscript:@"PluginParentApp"];

          uint64_t v17 = [v4 extensionPointRecord];
          id v18 = [v17 identifier];
          [v6 setObject:v18 forKeyedSubscript:@"PluginType"];

          uint64_t v19 = [v4 executableURL];
          uint64_t v20 = [v19 path];
          [v6 setObject:v20 forKeyedSubscript:@"PluginExecutableName"];

          [v6 setObject:&unk_1F29E7BD0 forKeyedSubscript:@"PluginDeletedDate"];
          goto LABEL_12;
        }
      }
      long long v11 = [v4 extensionPointRecord];
      char v12 = [v11 identifier];
      char v13 = [v12 isEqualToString:@"com.apple.posterkit.provider"];

      if (v9)
      {
      }
      if (v13) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v6 = 0;
  }
LABEL_12:

  return v6;
}

- (void)logInstalledAppWithRecord:(id)a3 withBundleID:(id)a4 shouldMaskTimestamp:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F92AD0] sharedCore];
  long long v11 = [v10 storage];
  char v12 = [v11 storageLocked];

  if ((v12 & 1) == 0)
  {
    v91 = v9;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    char v13 = [v8 applicationExtensionRecords];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v107 objects:v115 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v108 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v107 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x1D942A350]();
          uint64_t v20 = +[PLApplicationAgent pluginEntryFromRecord:v18];
          [(PLApplicationAgent *)self logInstalledPlugin:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v107 objects:v115 count:16];
      }
      while (v15);
    }

    uint64_t v21 = *MEMORY[0x1E4F92D40];
    id v22 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    id v23 = [(PLOperator *)self storage];
    id v24 = v91;
    id v25 = [v23 lastEntryForKey:v22 withSubEntryKey:v91];

    if (v25)
    {
      long long v26 = [v8 shortVersionString];
      if (v26) {
        [v8 shortVersionString];
      }
      else {
      long long v28 = [v8 bundleVersion];
      }

      id v37 = [v25 objectForKeyedSubscript:@"AppBundleVersion"];
      char v38 = [v37 isEqualToString:v28];

      uint64_t v39 = [v25 objectForKeyedSubscript:@"AppDeletedDate"];
      [v39 doubleValue];
      double v41 = v40;

      if (v41 == 0.0)
      {
        v47 = [v25 objectForKeyedSubscript:@"AppUpdatedDate"];
        [v47 doubleValue];
        double v49 = v48;

        if (v49 == 0.0)
        {
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_2;
          v92[3] = &unk_1E692A6A0;
          long long v43 = &v93;
          id v54 = v25;
          id v93 = v54;
          long long v45 = &v94;
          id v94 = v28;
          uint64_t v46 = &v95;
          id v95 = v8;
          id v96 = v91;
          [(PLOperator *)self updateEntry:v54 withBlock:v92];
        }
        else
        {
          id v50 = PLLogApplication();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v112 = v91;
            _os_log_debug_impl(&dword_1D2690000, v50, OS_LOG_TYPE_DEBUG, "%@ was updated, modify version", buf, 0xCu);
          }

          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_641;
          v97[3] = &unk_1E692A6A0;
          long long v43 = &v98;
          id v51 = v25;
          id v98 = v51;
          long long v45 = &v99;
          id v99 = v28;
          uint64_t v46 = &v100;
          id v100 = v8;
          id v101 = v91;
          [(PLOperator *)self updateEntry:v51 withBlock:v97];
        }
      }
      else
      {
        long long v42 = PLLogApplication();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v112 = v91;
          _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "AllApps entry %@ was deleted and reinstalled", buf, 0xCu);
        }

        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke;
        v102[3] = &unk_1E6930FD8;
        long long v43 = &v103;
        id v44 = v25;
        id v103 = v44;
        char v106 = v38;
        long long v45 = &v104;
        id v104 = v28;
        uint64_t v46 = &v105;
        id v105 = v8;
        [(PLOperator *)self updateEntry:v44 withBlock:v102];
      }

      id v55 = *v43;
      id v9 = v91;
    }
    else
    {
      long long v27 = PLLogApplication();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v112 = v91;
        _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "AllApps logInstalledAppWithRecord bundleID doesnt exist for %@", buf, 0xCu);
      }

      long long v28 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
      {
        long long v29 = PLLogApplication();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v112) = v5;
          _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "AllApps shouldMaskTimestamp: %d", buf, 8u);
        }

        if (v5)
        {
          long long v30 = PLLogApplication();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "AllApps masking Timestamp", buf, 2u);
          }

          uint64_t v31 = +[PLOperator entryKeyForType:v21 andName:@"AllApps"];
          long long v32 = [(PLOperator *)self storage];
          long long v33 = [v32 lastEntryForKey:v31];

          if (v33)
          {
            id v34 = (void *)MEMORY[0x1E4F1C9C8];
            long long v35 = [v33 objectForKeyedSubscript:@"timestamp"];
            [v35 doubleValue];
            uint64_t v36 = objc_msgSend(v34, "dateWithTimeIntervalSince1970:");
          }
          else
          {
            v56 = PLLogApplication();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D2690000, v56, OS_LOG_TYPE_DEBUG, "AllApps table is empty, using fuzzed timestamp", buf, 2u);
            }

            v57 = (void *)MEMORY[0x1E4F1C9C8];
            [v28 timeIntervalSince1970];
            uint64_t v36 = [v57 dateWithTimeIntervalSince1970:round(v58 / 1800.0) * 1800.0];
          }

          long long v28 = (void *)v31;
        }
        else
        {
          id v52 = (void *)MEMORY[0x1E4F1C9C8];
          [v28 timeIntervalSince1970];
          uint64_t v36 = [v52 dateWithTimeIntervalSince1970:round(v53 / 1800.0) * 1800.0];
        }

        long long v28 = (void *)v36;
        id v24 = v91;
      }
      long long v59 = PLLogApplication();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v112 = v28;
        _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "AllApps lastRow Timestamp: %@", buf, 0xCu);
      }

      id v55 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v22 withDate:v28];
      [v55 setObject:v24 forKeyedSubscript:@"AppBundleId"];
      long long v60 = [v8 iTunesMetadata];
      id v61 = [v60 distributorInfo];
      v62 = [v61 distributorID];
      [v55 setObject:v62 forKeyedSubscript:@"AppDistributorID"];

      v63 = PLLogApplication();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        v90 = [v8 iTunesMetadata];
        v88 = [v90 distributorInfo];
        v89 = [v88 distributorID];
        *(_DWORD *)buf = 138412546;
        v112 = v89;
        __int16 v113 = 2112;
        v114 = v91;
        _os_log_debug_impl(&dword_1D2690000, v63, OS_LOG_TYPE_DEBUG, "AllApps logging DistributorID: %@ for BundleID: %@", buf, 0x16u);
      }
      id v64 = [v8 localizedName];
      [v55 setObject:v64 forKeyedSubscript:@"AppName"];

      uint64_t v65 = [v8 bundleVersion];
      [v55 setObject:v65 forKeyedSubscript:@"AppBuildVersion"];

      v66 = [v8 shortVersionString];
      if (v66) {
        [v8 shortVersionString];
      }
      else {
      id v67 = [v8 bundleVersion];
      }
      [v55 setObject:v67 forKeyedSubscript:@"AppBundleVersion"];

      v68 = [v8 executableURL];
      v69 = [v68 lastPathComponent];
      [v55 setObject:v69 forKeyedSubscript:@"AppExecutable"];

      v70 = objc_msgSend(NSNumber, "numberWithBool:", -[PLApplicationAgent isAppClipWithBundleID:](self, "isAppClipWithBundleID:", v91));
      [v55 setObject:v70 forKeyedSubscript:@"AppIsClip"];

      [v55 setObject:&unk_1F29E7BD0 forKeyedSubscript:@"AppDeletedDate"];
      v71 = &unk_1F29E7C00;
      if ([v8 mayBeBUIVisible]
        && +[PLApplicationAgent hasScreenPresence:v8])
      {
        v71 = &unk_1F29E7BE8;
      }
      [v55 setObject:v71 forKeyedSubscript:@"AppType"];
      id v72 = [v55 objectForKeyedSubscript:@"AppBundleId"];
      int v73 = [v72 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"];

      if (v73) {
        [v55 setObject:&unk_1F29E7BE8 forKeyedSubscript:@"AppType"];
      }
      [v55 setObject:&unk_1F29E7BD0 forKeyedSubscript:@"AppUpdatedDate"];
      if ([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled])
      {
        v74 = [v8 deviceIdentifierForVendor];
        id v75 = [v74 UUIDString];
        [v55 setObject:v75 forKeyedSubscript:@"AppVendorID"];

        v76 = NSNumber;
        v77 = [v8 iTunesMetadata];
        v78 = objc_msgSend(v76, "numberWithUnsignedLongLong:", objc_msgSend(v77, "storeItemIdentifier"));
        [v55 setObject:v78 forKeyedSubscript:@"AppItemID"];

        v79 = [v8 iTunesMetadata];
        v80 = [v79 storeCohort];
        [v55 setObject:v80 forKeyedSubscript:@"AppCohort"];

        v81 = NSNumber;
        v82 = [v8 iTunesMetadata];
        v83 = objc_msgSend(v81, "numberWithUnsignedLongLong:", objc_msgSend(v82, "storeFront"));
        [v55 setObject:v83 forKeyedSubscript:@"AppStoreFront"];

        v84 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isBeta"));
        [v55 setObject:v84 forKeyedSubscript:@"AppIsBeta"];

        v85 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "developerType") == 3);
        [v55 setObject:v85 forKeyedSubscript:@"AppIs3rdParty"];
      }
      [(PLOperator *)self logEntry:v55];
      v86 = PLLogApplication();
      id v9 = v91;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v112 = v91;
        _os_log_debug_impl(&dword_1D2690000, v86, OS_LOG_TYPE_DEBUG, "log new AppVersions entry %@\n", buf, 0xCu);
      }

      v87 = [v55 objectForKeyedSubscript:@"AppBundleVersion"];
      +[PLApplicationAgent addAppVersion:v91 withVersion:v87];
    }
  }
}

void __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke(uint64_t a1)
{
  id v10 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:2700.0];
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    id v2 = v10;
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1C9C8];
    [v10 timeIntervalSince1970];
    uint64_t v5 = [v3 dateWithTimeIntervalSince1970:round(v4 / 1800.0) * 1800.0];

    id v2 = (id)v5;
  }
  id v11 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setEntryDate:");
  [*(id *)(a1 + 32) setObject:&unk_1F29E7BD0 forKeyedSubscript:@"AppDeletedDate"];
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AppBundleVersion"];
    uint64_t v6 = [*(id *)(a1 + 48) bundleVersion];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"AppBuildVersion"];
  }
  uint64_t v7 = [*(id *)(a1 + 48) iTunesMetadata];
  id v8 = [v7 distributorInfo];
  id v9 = [v8 distributorID];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"AppDistributorID"];
}

uint64_t __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_641(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AppBundleVersion"];
  id v2 = [*(id *)(a1 + 48) bundleVersion];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"AppBuildVersion"];

  id v3 = [*(id *)(a1 + 48) iTunesMetadata];
  double v4 = [v3 distributorInfo];
  uint64_t v5 = [v4 distributorID];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"AppDistributorID"];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  return +[PLApplicationAgent addAppVersion:v6 withVersion:v7];
}

uint64_t __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AppBundleVersion"];
  id v2 = [*(id *)(a1 + 48) bundleVersion];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"AppBuildVersion"];

  id v3 = [*(id *)(a1 + 48) iTunesMetadata];
  double v4 = [v3 distributorInfo];
  uint64_t v5 = [v4 distributorID];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"AppDistributorID"];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  return +[PLApplicationAgent addAppVersion:v6 withVersion:v7];
}

- (void)buildAppVersionDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1D942A350]();
  double v4 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v5 = [v4 storage];
  uint64_t v17 = v3;
  uint64_t v6 = [v5 entriesForKey:v3];

  uint64_t v7 = PLLogApplication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AllApps Building app verion dictionary from the db", buf, 2u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v13 objectForKeyedSubscript:@"AppBundleId"];
        uint64_t v15 = [v13 objectForKeyedSubscript:@"AppBundleVersion"];
        +[PLApplicationAgent addAppVersion:v14 withVersion:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }
}

- (void)logInstalledPlugin:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v6 = [v5 storage];
  char v7 = [v6 storageLocked];

  if (v4 && (v7 & 1) == 0)
  {
    id v8 = [v4 objectForKeyedSubscript:@"PluginId"];
    uint64_t v9 = [v8 description];

    if (v9 && [v9 length])
    {
      uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
      uint64_t v42 = 0;
      long long v43 = &v42;
      uint64_t v44 = 0x3032000000;
      long long v45 = __Block_byref_object_copy__17;
      uint64_t v46 = __Block_byref_object_dispose__17;
      uint64_t v11 = [(PLOperator *)self storage];
      id v47 = [v11 lastEntryForKey:v10 withSubEntryKey:v9];

      char v12 = (void *)v43[5];
      if (v12)
      {
        char v13 = [v12 objectForKeyedSubscript:@"PluginDeletedDate"];
        [v13 doubleValue];
        BOOL v15 = v14 != 0.0;

        if (v15)
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v16 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke_647;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            void block[4] = v16;
            if (qword_1EBD5A9F8 != -1) {
              dispatch_once(&qword_1EBD5A9F8, block);
            }
            if (byte_1EBD5A982)
            {
              uint64_t v17 = [NSString stringWithFormat:@"Update: pluginID=%@", v9];
              long long v18 = (void *)MEMORY[0x1E4F929B8];
              long long v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
              long long v20 = [v19 lastPathComponent];
              long long v21 = [NSString stringWithUTF8String:"-[PLApplicationAgent logInstalledPlugin:]"];
              [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1913];

              id v22 = PLLogCommon();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v49 = v17;
                _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          uint64_t v23 = v43[5];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke_651;
          v39[3] = &unk_1E692ACB0;
          v39[4] = &v42;
          [(PLOperator *)self updateEntry:v23 withBlock:v39];
        }
        else if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v31 = objc_opt_class();
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke_2;
          v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v38[4] = v31;
          if (qword_1EBD5AA00 != -1) {
            dispatch_once(&qword_1EBD5AA00, v38);
          }
          if (byte_1EBD5A983)
          {
            long long v32 = [NSString stringWithFormat:@"Duplicate: pluginID=%@", v9];
            long long v33 = (void *)MEMORY[0x1E4F929B8];
            id v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
            long long v35 = [v34 lastPathComponent];
            uint64_t v36 = [NSString stringWithUTF8String:"-[PLApplicationAgent logInstalledPlugin:]"];
            [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:1922];

            id v37 = PLLogCommon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v49 = v32;
              _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
      }
      else
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v24 = objc_opt_class();
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          void v41[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke;
          v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v41[4] = v24;
          if (qword_1EBD5A9F0 != -1) {
            dispatch_once(&qword_1EBD5A9F0, v41);
          }
          if (byte_1EBD5A981)
          {
            id v25 = [NSString stringWithFormat:@"New: pluginID=%@", v9];
            long long v26 = (void *)MEMORY[0x1E4F929B8];
            long long v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
            long long v28 = [v27 lastPathComponent];
            long long v29 = [NSString stringWithUTF8String:"-[PLApplicationAgent logInstalledPlugin:]"];
            [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1908];

            long long v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v49 = v25;
              _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        [(PLOperator *)self logEntry:v4];
      }
      _Block_object_dispose(&v42, 8);
    }
  }
}

uint64_t __41__PLApplicationAgent_logInstalledPlugin___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A981 = result;
  return result;
}

uint64_t __41__PLApplicationAgent_logInstalledPlugin___block_invoke_647(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A982 = result;
  return result;
}

void __41__PLApplicationAgent_logInstalledPlugin___block_invoke_651(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setEntryDate:v2];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:&unk_1F29E7BD0 forKeyedSubscript:@"PluginDeletedDate"];
}

uint64_t __41__PLApplicationAgent_logInstalledPlugin___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A983 = result;
  return result;
}

- (void)logUninstalledApp:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__17;
  void v34[4] = __Block_byref_object_dispose__17;
  id v35 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v3 = *MEMORY[0x1E4F92D40];
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__17;
  long long v32 = __Block_byref_object_dispose__17;
  uint64_t v5 = [(PLOperator *)self storage];
  [v5 lastEntryForKey:v4 withSubEntryKey:v18];
  uint64_t v17 = (void *)v4;
  id v33 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = v29[5];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __40__PLApplicationAgent_logUninstalledApp___block_invoke;
  v27[3] = &unk_1E6931950;
  v27[4] = &v28;
  v27[5] = v34;
  [(PLOperator *)self updateEntry:v6 withBlock:v27];
  char v7 = +[PLOperator entryKeyForType:v3 andName:@"AllPlugins"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginParentApp" withValue:v18 withComparisonOperation:0];
  uint64_t v9 = [(PLOperator *)self storage];
  v37[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  uint64_t v11 = [v9 entriesForKey:v7 withComparisons:v10];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v21[0] = 0;
        v21[1] = v21;
        void v21[2] = 0x3032000000;
        v21[3] = __Block_byref_object_copy__17;
        void v21[4] = __Block_byref_object_dispose__17;
        id v22 = v16;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        void v20[2] = __40__PLApplicationAgent_logUninstalledApp___block_invoke_2;
        void v20[3] = &unk_1E6931950;
        void v20[4] = v21;
        void v20[5] = v34;
        [(PLOperator *)self updateEntry:v22 withBlock:v20];
        _Block_object_dispose(v21, 8);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
}

void __40__PLApplicationAgent_logUninstalledApp___block_invoke(uint64_t a1)
{
  id v2 = NSNumber;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSince1970];
  objc_msgSend(v2, "numberWithDouble:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v3 forKeyedSubscript:@"AppDeletedDate"];
}

void __40__PLApplicationAgent_logUninstalledApp___block_invoke_2(uint64_t a1)
{
  id v2 = NSNumber;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSince1970];
  objc_msgSend(v2, "numberWithDouble:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v3 forKeyedSubscript:@"PluginDeletedDate"];
}

- (void)logUninstalledAppVersion:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  void v20[2] = 0x3032000000;
  void v20[3] = __Block_byref_object_copy__17;
  void v20[4] = __Block_byref_object_dispose__17;
  id v21 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  uint64_t v6 = [NSString stringWithFormat:@"%@=\"%@\", @"AppBundleId"", v4];
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__17;
  id v18 = __Block_byref_object_dispose__17;
  char v7 = [(PLOperator *)self storage];
  v22[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v19 = [v7 lastEntryForKey:v5 withFilters:v8];

  uint64_t v9 = v15[5];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __47__PLApplicationAgent_logUninstalledAppVersion___block_invoke;
    v10[3] = &unk_1E692BD30;
    id v12 = v20;
    uint64_t v13 = &v14;
    id v11 = v4;
    [(PLOperator *)self updateEntry:v9 withBlock:v10];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
}

void __47__PLApplicationAgent_logUninstalledAppVersion___block_invoke(void *a1)
{
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    id v2 = (void *)MEMORY[0x1E4F1C9C8];
    [*(id *)(*(void *)(a1[5] + 8) + 40) timeIntervalSince1970];
    uint64_t v4 = [v2 dateWithTimeIntervalSince1970:round(v3 / 1800.0) * 1800.0];
    uint64_t v5 = *(void *)(a1[5] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  char v7 = NSNumber;
  [*(id *)(*(void *)(a1[5] + 8) + 40) timeIntervalSince1970];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v8 forKeyedSubscript:@"AppDeletedDate"];

  uint64_t v9 = a1[4];
  id v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"AppBundleVersion"];
  +[PLApplicationAgent removeAppVersion:v9 forVersion:v10];
}

- (void)logUpdatedAppVersion:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  void v20[2] = 0x3032000000;
  void v20[3] = __Block_byref_object_copy__17;
  void v20[4] = __Block_byref_object_dispose__17;
  id v21 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  uint64_t v6 = [NSString stringWithFormat:@"%@=\"%@\", @"AppBundleId"", v4];
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__17;
  id v18 = __Block_byref_object_dispose__17;
  char v7 = [(PLOperator *)self storage];
  v22[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v19 = [v7 lastEntryForKey:v5 withFilters:v8];

  uint64_t v9 = v15[5];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke;
    v10[3] = &unk_1E6931978;
    id v12 = v20;
    uint64_t v13 = &v14;
    void v10[4] = self;
    id v11 = v4;
    [(PLOperator *)self updateEntry:v9 withBlock:v10];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
}

void __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    id v2 = (void *)MEMORY[0x1E4F1C9C8];
    [*(id *)(*(void *)(a1[6] + 8) + 40) timeIntervalSince1970];
    uint64_t v4 = [v2 dateWithTimeIntervalSince1970:round(v3 / 1800.0) * 1800.0];
    uint64_t v5 = *(void *)(a1[6] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  char v7 = NSNumber;
  [*(id *)(*(void *)(a1[6] + 8) + 40) timeIntervalSince1970];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v8 forKeyedSubscript:@"AppUpdatedDate"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke_2;
    id v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v9;
    if (qword_1EBD5AA08 != -1) {
      dispatch_once(&qword_1EBD5AA08, &block);
    }
    if (byte_1EBD5A984)
    {
      id v10 = [NSString stringWithFormat:@"Update: mark %@ entry as updated\n", a1[5], block, v19, v20, v21, v22];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLApplicationAgent logUpdatedAppVersion:]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1990];

      BOOL v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v24 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v16 = a1[5];
  uint64_t v17 = [*(id *)(*(void *)(a1[7] + 8) + 40) objectForKeyedSubscript:@"AppBundleVersion"];
  +[PLApplicationAgent removeAppVersion:v16 forVersion:v17];
}

uint64_t __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A984 = result;
  return result;
}

- (void)logAllApps
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = PLLogApplication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "logAllApps was called", buf, 2u);
  }

  [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1D942A350](v5);
        id v11 = objc_msgSend(v9, "bundleIdentifier", (void)v13);
        [(PLApplicationAgent *)self logInstalledAppWithRecord:v9 withBundleID:v11 shouldMaskTimestamp:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  id v12 = PLLogApplication();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "AllApps logAllApps end", buf, 2u);
  }
}

- (void)logAllPlugins
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = +[PLApplicationAgent installedPlugins];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(PLApplicationAgent *)self logInstalledPlugin:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (id)installedPlugins
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D942A350](a1, a2);
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F223A0], "enumeratorWithOptions:", 0, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = +[PLApplicationAgent pluginEntryFromRecord:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v5 = a3;
  [a4 timeIntervalSince1970];
  double v7 = v6;
  long long v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v8 timeIntervalSince1970];
  double v10 = v9 + -604800.0;

  if (v7 >= v10) {
    double v7 = v10;
  }
  long long v11 = objc_opt_class();
  uint64_t v12 = *MEMORY[0x1E4F92D40];
  long long v13 = [v11 entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  int v14 = [v5 isEqualToString:v13];

  if (v14)
  {
    [NSString stringWithFormat:@"(timestamp is NULL OR timestamp<%f) AND ((%@!=0 AND %@<%f) OR (%@!=0 AND %@<%f))", *(void *)&v7, @"AppDeletedDate", @"AppDeletedDate", *(void *)&v7, @"AppUpdatedDate", @"AppUpdatedDate", *(void *)&v7];
    uint64_t v17 = LABEL_7:;
    goto LABEL_9;
  }
  long long v15 = [(id)objc_opt_class() entryKeyForType:v12 andName:@"AllPlugins"];
  int v16 = [v5 isEqualToString:v15];

  if (v16)
  {
    [NSString stringWithFormat:@"(timestamp is NULL OR timestamp<%f) AND %@!=0 AND %@<%f", *(void *)&v7, @"PluginDeletedDate", @"PluginDeletedDate", *(void *)&v7, v19, v20, v21];
    goto LABEL_7;
  }
  uint64_t v17 = 0;
LABEL_9:

  return v17;
}

- (void)appReferenceCleanup
{
  if (self->_scheduledAppCleanup)
  {
    id v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "AppDeletion : Activity is scheduled.", buf, 2u);
    }
  }
  else
  {
    self->_scheduledAppCleanup = 1;
    int v3 = [MEMORY[0x1E4F92990] changeClassProtection:1];
    uint64_t v4 = PLLogCommon();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)double v7 = 0;
        _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "AppDeletion : Changed class protection successfully", v7, 2u);
      }

      [MEMORY[0x1E4F92990] registerAppDeletionActivity];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)double v6 = 0;
        _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "AppDeletion : Could not change class protection", v6, 2u);
      }

      [MEMORY[0x1E4F92990] registerFilePermissionActivity];
    }
  }
}

+ (BOOL)isVisible:(id)a3
{
  int v3 = [a3 endowmentNamespaces];
  char v4 = [v3 containsObject:@"com.apple.frontboard.visibility"];

  return v4;
}

+ (id)getReasons:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "reason", (void)v16));
        uint64_t v12 = [v10 explanation];
        long long v13 = (void *)v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)getApplicationRecordSet:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  context = (void *)MEMORY[0x1D942A350]();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        id v11 = objc_alloc(MEMORY[0x1E4F223C8]);
        uint64_t v12 = [v10 bundleURL];
        id v18 = 0;
        long long v13 = (void *)[v11 initWithURL:v12 allowPlaceholder:1 error:&v18];
        id v14 = v18;

        if (v13)
        {
          [v4 addObject:v13];
        }
        else
        {
          long long v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v24 = v10;
            __int16 v25 = 2112;
            id v26 = v14;
            _os_log_error_impl(&dword_1D2690000, v15, OS_LOG_TYPE_ERROR, "could not refresh application record for %@: %@", buf, 0x16u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [(PLApplicationAgent *)self getApplicationRecordSet:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPlaceholder", v15))
        {
          id v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "app Record is placeHolder", buf, 2u);
          }
        }
        else
        {
          id v11 = [v10 bundleIdentifier];
          int v12 = [v10 isUpdate];
          long long v13 = PLLogApplication();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
          if (v12)
          {
            if (v14)
            {
              *(_DWORD *)buf = v15;
              long long v21 = v11;
              _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "applicationsDidInstall: Update %@\n", buf, 0xCu);
            }

            [(PLApplicationAgent *)self logUpdatedAppVersion:v11];
          }
          else
          {
            if (v14)
            {
              *(_DWORD *)buf = v15;
              long long v21 = v11;
              _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "applicationsDidInstall: Install %@", buf, 0xCu);
            }
          }
          [(PLApplicationAgent *)self logInstalledAppWithRecord:v10 withBundleID:v11 shouldMaskTimestamp:1];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPlaceholder", v16))
        {
          id v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "app Proxy is placeHolder", buf, 2u);
          }
        }
        else
        {
          id v11 = [v10 bundleIdentifier];
          int v12 = [v10 localizedName];
          [(PLApplicationAgent *)self logUninstalledAppVersion:v11];
          long long v13 = PLLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            long long v22 = v12;
            __int16 v23 = 2112;
            long long v24 = v11;
            _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "AppDeletion : Application Name %@ and bundle ID %@", buf, 0x16u);
          }

          [(PLApplicationAgent *)self logEventForwardApplicationDidUninstall:v11 withAppName:v12];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }
  if ([v4 count])
  {
    if ([MEMORY[0x1E4F92A88] AppDeletionEnabled]) {
      [(PLApplicationAgent *)self appReferenceCleanup];
    }
    BOOL v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "AppResume : Updating salt value", buf, 2u);
    }

    id v15 = (id)[MEMORY[0x1E4F92A88] generateAndUpdateSaltValue:@"PLSaltBundleID"];
  }
}

- (NSSet)currentDisplayIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentDisplayIdentifiers:(id)a3
{
}

- (BKSApplicationStateMonitor)appStateMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppStateMonitor:(id)a3
{
}

- (RBSProcessMonitor)RBSAppStateMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRBSAppStateMonitor:(id)a3
{
}

- (PLXPCListenerOperatorComposition)widgetStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWidgetStatsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)widgetUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWidgetUpdatesListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)suggestedWidgetReloadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSuggestedWidgetReloadListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)posterUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPosterUpdatesListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ambientModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAmbientModeListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)liveActivityStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLiveActivityStatsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)liveActivityUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLiveActivityUpdatesListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)systemApertureListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSystemApertureListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ambientModeActiveFaceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAmbientModeActiveFaceListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ambientModeLifetimeCounterListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAmbientModeLifetimeCounterListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)motionToWakeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMotionToWakeListener:(id)a3
{
}

- (RBSProcessMonitor)appStateMonitorRBS
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAppStateMonitorRBS:(id)a3
{
}

- (PLXPCListenerOperatorComposition)appDockingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppDockingListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)appPrewarmListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppPrewarmListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)controlCenterStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setControlCenterStatsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)controlCenterUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setControlCenterUpdatesListener:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (BOOL)scheduledAppCleanup
{
  return self->_scheduledAppCleanup;
}

- (void)setScheduledAppCleanup:(BOOL)a3
{
  self->_scheduledAppCleanup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_controlCenterUpdatesListener, 0);
  objc_storeStrong((id *)&self->_controlCenterStatsListener, 0);
  objc_storeStrong((id *)&self->_appPrewarmListener, 0);
  objc_storeStrong((id *)&self->_appDockingListener, 0);
  objc_storeStrong((id *)&self->_appStateMonitorRBS, 0);
  objc_storeStrong((id *)&self->_motionToWakeListener, 0);
  objc_storeStrong((id *)&self->_ambientModeLifetimeCounterListener, 0);
  objc_storeStrong((id *)&self->_ambientModeActiveFaceListener, 0);
  objc_storeStrong((id *)&self->_systemApertureListener, 0);
  objc_storeStrong((id *)&self->_liveActivityUpdatesListener, 0);
  objc_storeStrong((id *)&self->_liveActivityStatsListener, 0);
  objc_storeStrong((id *)&self->_ambientModeListener, 0);
  objc_storeStrong((id *)&self->_posterUpdatesListener, 0);
  objc_storeStrong((id *)&self->_suggestedWidgetReloadListener, 0);
  objc_storeStrong((id *)&self->_widgetUpdatesListener, 0);
  objc_storeStrong((id *)&self->_widgetStatsListener, 0);
  objc_storeStrong((id *)&self->_RBSAppStateMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_currentDisplayIdentifiers, 0);
}

@end