@interface STYSignpostsMonitor
+ (id)sharedMonitor;
- (BOOL)monitorAppLaunchSignposts;
- (BOOL)monitorSignposts:(BOOL)a3;
- (BOOL)monitorWorkflowsWithDailyLogLimit:(int)a3 perPeriodLogLimit:(int)a4 periodLengthSec:(int)a5;
- (BOOL)needsEnablementChange;
- (NSDate)timeOfLastExtractorFailure;
- (OS_dispatch_queue)monitorQueue;
- (STYGeneralSignpostMonitorHelper)generalSignpostHelper;
- (STYSignpostsMonitor)init;
- (STYSpecialAppLaunchSignpostMonitorHelper)specialAppLaunchSignpostHelper;
- (STYWorkflowResponsivenessMonitorHelper)workflowResponsivenessHelper;
- (SignpostSupportObjectExtractor)signpostExtractor;
- (unsigned)eventCount;
- (unsigned)successiveExtractorFailureCount;
- (void)checkMonitoring:(BOOL)a3;
- (void)disable;
- (void)forEachEnabledHelper:(id)a3;
- (void)forEachHelper:(id)a3;
- (void)reportLatencyToReceiveSignposts:(id)a3;
- (void)setEventCount:(unsigned int)a3;
- (void)setGeneralSignpostHelper:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setSignpostExtractor:(id)a3;
- (void)setSpecialAppLaunchSignpostHelper:(id)a3;
- (void)setSuccessiveExtractorFailureCount:(unsigned int)a3;
- (void)setTimeOfLastExtractorFailure:(id)a3;
- (void)setWorkflowResponsivenessHelper:(id)a3;
- (void)setupRetryAfterFailure;
- (void)stopMonitoringAppLaunchSignposts;
- (void)stopMonitoringSignposts;
- (void)stopMonitoringWorkflows;
@end

@implementation STYSignpostsMonitor

- (STYSignpostsMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)STYSignpostsMonitor;
  v2 = [(STYSignpostsMonitor *)&v19 init];
  if (v2)
  {
    v3 = +[STYFrameworkHelper sharedHelper];
    id v4 = [v3 subsystemForSignposts];
    v5 = (const char *)[v4 UTF8String];

    os_log_t v6 = os_log_create(v5, "timeToReceiveASignpostNotification");
    v7 = (void *)handleForNotificationLatency;
    handleForNotificationLatency = (uint64_t)v6;

    os_log_t v8 = os_log_create(v5, "signpostNotificationStreamClosed");
    v9 = (void *)handleForNotificationDisconnects;
    handleForNotificationDisconnects = (uint64_t)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.sentry.signpostsMonitor.monitorQueue", 0);
    monitorQueue = v2->_monitorQueue;
    v2->_monitorQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(STYGeneralSignpostMonitorHelper);
    generalSignpostHelper = v2->_generalSignpostHelper;
    v2->_generalSignpostHelper = v12;

    v14 = objc_alloc_init(STYSpecialAppLaunchSignpostMonitorHelper);
    specialAppLaunchSignpostHelper = v2->_specialAppLaunchSignpostHelper;
    v2->_specialAppLaunchSignpostHelper = v14;

    v16 = objc_alloc_init(STYWorkflowResponsivenessMonitorHelper);
    workflowResponsivenessHelper = v2->_workflowResponsivenessHelper;
    v2->_workflowResponsivenessHelper = v16;
  }
  return v2;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedMonitor_sharedMonitor;
  return v2;
}

void __36__STYSignpostsMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(STYSignpostsMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

  if (sharedMonitor_sharedMonitor)
  {
    attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.Sentry.Framework.htInteraction", attr);
    v3 = (void *)htInteractionQueue;
    htInteractionQueue = (uint64_t)v2;

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Sentry.Framework.signpostSupport", attr);
    v5 = (void *)signpostSupportQueue;
    signpostSupportQueue = (uint64_t)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Sentry.Framework.stateVariableUpdate", attr);
    v7 = (void *)stateVariableUpdateQueue;
    stateVariableUpdateQueue = (uint64_t)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Sentry.Framework.mkHTInteraction", attr);
    v9 = (void *)mkHangtracerInteractionQueue;
    mkHangtracerInteractionQueue = (uint64_t)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = (void *)outstandingTailspinSaveRequests;
    outstandingTailspinSaveRequests = v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v13 = (void *)perfIssueDetectionTimeLogs;
    perfIssueDetectionTimeLogs = v12;

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)responseRecieved, (CFStringRef)kSTYTailspinSaveOperationCompletedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, 0, (CFNotificationCallback)responseRecieved, (CFStringRef)kSTYTailspinSaveOperationCompletedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    notify_register_dispatch("com.apple.sentry.Signpostmonitor.conifg_changed", (int *)&sentryConfigChangeNotificationToken, (dispatch_queue_t)htInteractionQueue, &__block_literal_global_90);
    notify_register_dispatch("com.apple.da.tasking_changed", &HTConfigChangeNotificationToken, (dispatch_queue_t)htInteractionQueue, &__block_literal_global_93);
    v16 = objc_alloc_init(STYAbcHelper);
    v17 = [(id)sharedMonitor_sharedMonitor generalSignpostHelper];
    [v17 setAbcHelper:v16];

    v18 = STYFrameworkDefaults();
    uint64_t v19 = [v18 BOOLForKey:kSTYDefaultsForceAcceptAppLaunchKey];
    v20 = [(id)sharedMonitor_sharedMonitor specialAppLaunchSignpostHelper];
    [v20 setForceAppLaunchDiagnostics:v19];

    v21 = [(id)sharedMonitor_sharedMonitor workflowResponsivenessHelper];
    v22 = [(id)sharedMonitor_sharedMonitor monitorQueue];
    [v21 notifyWhenSettingsChanged:v22 block:&__block_literal_global_96];
  }
}

uint64_t __36__STYSignpostsMonitor_sharedMonitor__block_invoke_4()
{
  return [(id)sharedMonitor_sharedMonitor checkMonitoring:1];
}

- (void)forEachHelper:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v5 = a3;
  dispatch_queue_t v6 = [(STYSignpostsMonitor *)self generalSignpostHelper];
  v7 = v3[2];
  v3 += 2;
  v7(v5, v6);

  dispatch_queue_t v8 = [(STYSignpostsMonitor *)self specialAppLaunchSignpostHelper];
  (*v3)(v5, v8);

  id v9 = [(STYSignpostsMonitor *)self workflowResponsivenessHelper];
  (*v3)(v5, v9);
}

- (void)forEachEnabledHelper:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__STYSignpostsMonitor_forEachEnabledHelper___block_invoke;
  v6[3] = &unk_1E69718B0;
  id v7 = v4;
  id v5 = v4;
  [(STYSignpostsMonitor *)self forEachHelper:v6];
}

void __44__STYSignpostsMonitor_forEachEnabledHelper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)disable
{
}

void __30__STYSignpostsMonitor_disable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__STYSignpostsMonitor_disable__block_invoke_2;
  block[3] = &unk_1E6971868;
  id v6 = v2;
  id v4 = v2;
  dispatch_sync(v3, block);
}

uint64_t __30__STYSignpostsMonitor_disable__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndMonitoring];
}

- (BOOL)needsEnablementChange
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__STYSignpostsMonitor_needsEnablementChange__block_invoke;
  v4[3] = &unk_1E69718F8;
  v4[4] = &v5;
  [(STYSignpostsMonitor *)self forEachHelper:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__STYSignpostsMonitor_needsEnablementChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 needsEnablementChange];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)setupRetryAfterFailure
{
  [a1 successiveExtractorFailureCount];
  OUTLINED_FUNCTION_15(&dword_1D3037000, v1, v2, "%u successive failures communicating with diagnosticsd . Pre-emptively ceasing signpost monitoring", v3, v4, v5, v6, 0);
}

uint64_t __45__STYSignpostsMonitor_setupRetryAfterFailure__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[STYFrameworkHelper sharedHelper];
  uint64_t v3 = [v2 logHandle];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D3037000, v3, OS_LOG_TYPE_DEFAULT, "Retrying", v5, 2u);
  }

  return [*(id *)(a1 + 32) checkMonitoring:0];
}

- (void)checkMonitoring:(BOOL)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a3 || [(STYSignpostsMonitor *)self needsEnablementChange])
  {
    uint64_t v4 = [(STYSignpostsMonitor *)self signpostExtractor];
    [v4 stopProcessing];

    [(STYSignpostsMonitor *)self setSignpostExtractor:0];
    id v5 = objc_alloc_init(MEMORY[0x1E4F9F7C0]);
    uint64_t v6 = (void *)os_transaction_create();
    *(void *)v41 = 0;
    v42 = v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke;
    v33[3] = &unk_1E6971948;
    uint64_t v7 = v5;
    v34 = v7;
    v35 = v41;
    v36 = &v37;
    [(STYSignpostsMonitor *)self forEachHelper:v33];

    if (v42[24])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F9F7B8]);
      [(STYSignpostsMonitor *)self setSignpostExtractor:v8];

      id v9 = [(STYSignpostsMonitor *)self signpostExtractor];
      LODWORD(v8) = v9 == 0;

      if (v8)
      {
        v24 = +[STYFrameworkHelper sharedHelper];
        v25 = [v24 logHandle];

        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[STYSignpostsMonitor checkMonitoring:]();
        }

        [(STYSignpostsMonitor *)self setupRetryAfterFailure];
      }
      else
      {
        uint64_t v10 = [(STYSignpostsMonitor *)self signpostExtractor];
        [v10 setSubsystemCategoryFilter:v7];

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_104;
        v32[3] = &unk_1E6971998;
        v32[4] = self;
        v11 = [(STYSignpostsMonitor *)self signpostExtractor];
        [v11 setIntervalCompletionProcessingBlock:v32];

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_4;
        v31[3] = &unk_1E69719C0;
        v31[4] = self;
        uint64_t v12 = [(STYSignpostsMonitor *)self signpostExtractor];
        [v12 setEmitEventProcessingBlock:v31];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_7;
        v30[3] = &unk_1E69719C0;
        v30[4] = self;
        v13 = [(STYSignpostsMonitor *)self signpostExtractor];
        [v13 setBeginEventProcessingBlock:v30];

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10;
        v29[3] = &unk_1E69719E8;
        v29[4] = self;
        v14 = [(STYSignpostsMonitor *)self signpostExtractor];
        [v14 setProcessingCompletionBlock:v29];

        v15 = [(STYSignpostsMonitor *)self signpostExtractor];
        int v16 = *((unsigned __int8 *)v38 + 24);
        v17 = [(STYSignpostsMonitor *)self monitorQueue];
        id v28 = 0;
        LOBYTE(v16) = [v15 processNotificationsWithIntervalTimeoutInSeconds:30 shouldCalculateAnimationFramerate:v16 != 0 targetQueue:v17 errorOut:&v28];
        id v18 = v28;

        if (v16)
        {
          uint64_t v19 = +[STYFrameworkHelper sharedHelper];
          v20 = [v19 logHandle];

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3037000, v20, OS_LOG_TYPE_DEFAULT, "Signpost extractor created succesfully", buf, 2u);
          }
        }
        else
        {
          v26 = +[STYFrameworkHelper sharedHelper];
          v20 = [v26 logHandle];

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v27 = [v18 localizedDescription];
            [v18 code];
            -[STYSignpostsMonitor checkMonitoring:]();
          }
        }
      }
    }
    else
    {
      v21 = +[STYFrameworkHelper sharedHelper];
      v22 = [v21 logHandle];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3037000, v22, OS_LOG_TYPE_DEFAULT, "No monitoring enabled", buf, 2u);
      }
    }
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v41, 8);
  }
  else
  {
    v23 = +[STYFrameworkHelper sharedHelper];
    uint64_t v7 = [v23 logHandle];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_1D3037000, v7, OS_LOG_TYPE_INFO, "No change in monitoring", v41, 2u);
    }
  }
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2;
  v6[3] = &unk_1E6971920;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  dispatch_sync(v4, v6);
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) shouldBeEnabled];
  int v4 = [*v2 isEnabled];
  id v5 = +[STYFrameworkHelper sharedHelper];
  uint64_t v6 = [v5 logHandle];

  if (v3)
  {
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_1(v2);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [*v2 name];
        int v14 = 138543362;
        v15 = v8;
        _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ starting monitoring", (uint8_t *)&v14, 0xCu);
      }
      [*v2 willStartMonitoring];
    }
    uint64_t v6 = [*v2 allowList];
    if (v6)
    {
      long long v9 = *(void **)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 32) allowList];
      [v9 addAllowlist:v10];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      if ([*(id *)(a1 + 32) wantsAnimationFrameRate]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
    }
    else
    {
      v11 = +[STYFrameworkHelper sharedHelper];
      uint64_t v12 = [v11 logHandle];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [*v2 name];
        int v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_1D3037000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ has nothing to monitor", (uint8_t *)&v14, 0xCu);
      }
    }
LABEL_21:

    return;
  }
  if (!v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_2(v2);
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*v2 name];
    int v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ending monitoring", (uint8_t *)&v14, 0xCu);
  }
  [*v2 didEndMonitoring];
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_105;
  v7[3] = &unk_1E6971970;
  id v8 = v3;
  id v5 = v3;
  [v4 forEachEnabledHelper:v7];
  [*(id *)(a1 + 32) reportLatencyToReceiveSignposts:v5];

  return 1;
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 allowList];
  id v5 = [*(id *)(a1 + 32) subsystem];
  uint64_t v6 = [*(id *)(a1 + 32) category];
  int v7 = [v4 passesSubsystem:v5 category:v6];

  if (v7)
  {
    id v8 = [v3 processingQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_3;
    v9[3] = &unk_1E69717D8;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInterval:*(void *)(a1 + 40)];
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_5;
  v7[3] = &unk_1E6971970;
  id v8 = v3;
  id v5 = v3;
  [v4 forEachEnabledHelper:v7];
  [*(id *)(a1 + 32) reportLatencyToReceiveSignposts:v5];

  return 1;
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 allowList];
  id v5 = [*(id *)(a1 + 32) subsystem];
  uint64_t v6 = [*(id *)(a1 + 32) category];
  int v7 = [v4 passesSubsystem:v5 category:v6];

  if (v7)
  {
    id v8 = [v3 processingQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_6;
    v9[3] = &unk_1E69717D8;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleEmit:*(void *)(a1 + 40)];
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_8;
  v7[3] = &unk_1E6971970;
  id v8 = v3;
  id v5 = v3;
  [v4 forEachEnabledHelper:v7];
  [*(id *)(a1 + 32) reportLatencyToReceiveSignposts:v5];

  return 1;
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 allowList];
  id v5 = [*(id *)(a1 + 32) subsystem];
  uint64_t v6 = [*(id *)(a1 + 32) category];
  int v7 = [v4 passesSubsystem:v5 category:v6];

  if (v7)
  {
    id v8 = [v3 processingQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_9;
    v9[3] = &unk_1E69717D8;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleIntervalBegin:*(void *)(a1 + 40)];
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[STYFrameworkHelper sharedHelper];
  id v5 = [v4 logHandle];

  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10_cold_1(v3);
    }

    uint64_t v6 = handleForNotificationLatency;
    if (os_signpost_enabled((os_log_t)handleForNotificationLatency))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3037000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "signpostNotificationStreamClosed", (const char *)&unk_1D304B407, buf, 2u);
    }
    [*(id *)(a1 + 32) setupRetryAfterFailure];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1D3037000, v5, OS_LOG_TYPE_INFO, "Stopped monitoring signposts", v7, 2u);
    }
  }
}

- (void)reportLatencyToReceiveSignposts:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 endEvent];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_13;
    }
    id v5 = v4;
  }
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = self->_eventCount + 1;
    self->_eventCount = v7;
    if (v7 == 100)
    {
      id v8 = (void *)handleForNotificationLatency;
      if (os_signpost_enabled((os_log_t)handleForNotificationLatency))
      {
        long long v9 = v8;
        int v11 = 134217984;
        uint64_t v12 = [v6 timeRecordedMachContinuousTime];
        _os_signpost_emit_with_name_impl(&dword_1D3037000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "timeToReceiveASignpostNotification", "%{signpost.description:begin_time}llu", (uint8_t *)&v11, 0xCu);
      }
      id v10 = handleForNotificationLatency;
      if (os_signpost_enabled((os_log_t)handleForNotificationLatency))
      {
        LOWORD(v11) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3037000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToReceiveASignpostNotification", " enableTelemetry=YES ", (uint8_t *)&v11, 2u);
      }
      self->_eventCount = 0;
    }
  }
LABEL_13:
}

- (BOOL)monitorSignposts:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STYFrameworkHelper sharedHelper];
  uint64_t v6 = [v5 logHandle];

  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      id v8 = "Monitoring general signposts (seed mode)";
LABEL_6:
      _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    id v8 = "Monitoring general signposts";
    goto LABEL_6;
  }

  long long v9 = [(STYSignpostsMonitor *)self monitorQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__STYSignpostsMonitor_monitorSignposts___block_invoke;
  v11[3] = &unk_1E6971A10;
  v11[4] = self;
  BOOL v12 = v3;
  dispatch_async(v9, v11);

  return 1;
}

uint64_t __40__STYSignpostsMonitor_monitorSignposts___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generalSignpostHelper];
  [v2 setShouldBeEnabled:1];

  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) generalSignpostHelper];
  [v4 setSeedUserMode:v3];

  id v5 = *(void **)(a1 + 32);
  return [v5 checkMonitoring:0];
}

- (void)stopMonitoringSignposts
{
  uint64_t v3 = +[STYFrameworkHelper sharedHelper];
  id v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3037000, v4, OS_LOG_TYPE_DEFAULT, "Stopping monitoring general signposts", buf, 2u);
  }

  id v5 = [(STYSignpostsMonitor *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__STYSignpostsMonitor_stopMonitoringSignposts__block_invoke;
  block[3] = &unk_1E6971868;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __46__STYSignpostsMonitor_stopMonitoringSignposts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generalSignpostHelper];
  [v2 setShouldBeEnabled:0];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 checkMonitoring:0];
}

- (BOOL)monitorAppLaunchSignposts
{
  uint64_t v3 = +[STYFrameworkHelper sharedHelper];
  id v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3037000, v4, OS_LOG_TYPE_DEFAULT, "Monitoring app launch signposts", buf, 2u);
  }

  id v5 = [(STYSignpostsMonitor *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__STYSignpostsMonitor_monitorAppLaunchSignposts__block_invoke;
  block[3] = &unk_1E6971868;
  void block[4] = self;
  dispatch_async(v5, block);

  return 1;
}

uint64_t __48__STYSignpostsMonitor_monitorAppLaunchSignposts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) specialAppLaunchSignpostHelper];
  [v2 setShouldBeEnabled:1];

  uint64_t v3 = [*(id *)(a1 + 32) generalSignpostHelper];
  [v3 setAvoidGeneratingTailspinsForAppLaunches:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 checkMonitoring:0];
}

- (void)stopMonitoringAppLaunchSignposts
{
  uint64_t v3 = +[STYFrameworkHelper sharedHelper];
  id v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3037000, v4, OS_LOG_TYPE_DEFAULT, "Stopping monitoring app launch signposts", buf, 2u);
  }

  id v5 = [(STYSignpostsMonitor *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__STYSignpostsMonitor_stopMonitoringAppLaunchSignposts__block_invoke;
  block[3] = &unk_1E6971868;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __55__STYSignpostsMonitor_stopMonitoringAppLaunchSignposts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) specialAppLaunchSignpostHelper];
  [v2 setShouldBeEnabled:0];

  uint64_t v3 = [*(id *)(a1 + 32) generalSignpostHelper];
  [v3 setAvoidGeneratingTailspinsForAppLaunches:0];

  id v4 = *(void **)(a1 + 32);
  return [v4 checkMonitoring:0];
}

- (BOOL)monitorWorkflowsWithDailyLogLimit:(int)a3 perPeriodLogLimit:(int)a4 periodLengthSec:(int)a5
{
  long long v9 = +[STYFrameworkHelper sharedHelper];
  id v10 = [v9 logHandle];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3037000, v10, OS_LOG_TYPE_DEFAULT, "Monitoring workflow responsiveness", buf, 2u);
  }

  int v11 = [(STYSignpostsMonitor *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__STYSignpostsMonitor_monitorWorkflowsWithDailyLogLimit_perPeriodLogLimit_periodLengthSec___block_invoke;
  block[3] = &unk_1E6971A38;
  void block[4] = self;
  int v14 = a3;
  int v15 = a4;
  int v16 = a5;
  dispatch_async(v11, block);

  return 1;
}

uint64_t __91__STYSignpostsMonitor_monitorWorkflowsWithDailyLogLimit_perPeriodLogLimit_periodLengthSec___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workflowResponsivenessHelper];
  [v2 setShouldBeEnabled:1];

  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) workflowResponsivenessHelper];
  [v4 setPerDayLogLimit:v3];

  uint64_t v5 = *(unsigned int *)(a1 + 44);
  uint64_t v6 = [*(id *)(a1 + 32) workflowResponsivenessHelper];
  [v6 setPerPeriodLogLimit:v5];

  uint64_t v7 = *(unsigned int *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) workflowResponsivenessHelper];
  [v8 setPeriodLengthSec:v7];

  long long v9 = *(void **)(a1 + 32);
  return [v9 checkMonitoring:0];
}

- (void)stopMonitoringWorkflows
{
  uint64_t v3 = +[STYFrameworkHelper sharedHelper];
  id v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3037000, v4, OS_LOG_TYPE_DEFAULT, "Stopping monitoring workflow responsiveness", buf, 2u);
  }

  uint64_t v5 = [(STYSignpostsMonitor *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__STYSignpostsMonitor_stopMonitoringWorkflows__block_invoke;
  block[3] = &unk_1E6971868;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __46__STYSignpostsMonitor_stopMonitoringWorkflows__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workflowResponsivenessHelper];
  [v2 setShouldBeEnabled:0];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 checkMonitoring:0];
}

- (OS_dispatch_queue)monitorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonitorQueue:(id)a3
{
}

- (SignpostSupportObjectExtractor)signpostExtractor
{
  return (SignpostSupportObjectExtractor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignpostExtractor:(id)a3
{
}

- (NSDate)timeOfLastExtractorFailure
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimeOfLastExtractorFailure:(id)a3
{
}

- (unsigned)successiveExtractorFailureCount
{
  return self->_successiveExtractorFailureCount;
}

- (void)setSuccessiveExtractorFailureCount:(unsigned int)a3
{
  self->_successiveExtractorFailureCount = a3;
}

- (unsigned)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unsigned int)a3
{
  self->_eventCount = a3;
}

- (STYGeneralSignpostMonitorHelper)generalSignpostHelper
{
  return (STYGeneralSignpostMonitorHelper *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGeneralSignpostHelper:(id)a3
{
}

- (STYSpecialAppLaunchSignpostMonitorHelper)specialAppLaunchSignpostHelper
{
  return (STYSpecialAppLaunchSignpostMonitorHelper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSpecialAppLaunchSignpostHelper:(id)a3
{
}

- (STYWorkflowResponsivenessMonitorHelper)workflowResponsivenessHelper
{
  return (STYWorkflowResponsivenessMonitorHelper *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkflowResponsivenessHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowResponsivenessHelper, 0);
  objc_storeStrong((id *)&self->_specialAppLaunchSignpostHelper, 0);
  objc_storeStrong((id *)&self->_generalSignpostHelper, 0);
  objc_storeStrong((id *)&self->_timeOfLastExtractorFailure, 0);
  objc_storeStrong((id *)&self->_signpostExtractor, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
}

- (void)checkMonitoring:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1D3037000, v0, OS_LOG_TYPE_FAULT, "Unable to create signpost extractor", v1, 2u);
}

- (void)checkMonitoring:.cold.2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = v4;
  _os_log_error_impl(&dword_1D3037000, v6, OS_LOG_TYPE_ERROR, "Failed to register for signpost notifications. \n Error Description: %@ \n Error Code: %ld", v5, 0x16u);
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_1(id *a1)
{
  uint64_t v1 = [*a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v2, v3, "%{public}@ already monitoring", v4, v5, v6, v7, v8);
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_2(id *a1)
{
  uint64_t v1 = [*a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v2, v3, "%{public}@ already not monitoring", v4, v5, v6, v7, v8);
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D3037000, v2, v3, "Signpost extractor completed with error: %@", v4, v5, v6, v7, v8);
}

@end