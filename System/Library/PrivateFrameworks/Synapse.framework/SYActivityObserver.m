@interface SYActivityObserver
+ (id)sharedInstance;
+ (void)loadSynapseObserver;
- (BOOL)_lastReportedActivityWasLinkable;
- (NSDate)_lastReportedActivityTime;
- (OS_dispatch_queue)_observerQueue;
- (SYActivityObserver)init;
- (SYBacklinkMonitorClient)_client;
- (SYDefaultsClient)_defaultsClient;
- (SYUserActivityIdentifierInfo)_pendingActivityInfo;
- (id)_defaultActivityObserverContext;
- (id)_delayedEvaluationBlock;
- (void)_discoverAndProcessActiveUserActivityWithContext:(id)a3;
- (void)_handleAppBecomeActive:(id)a3;
- (void)_handleAppResignActive:(id)a3;
- (void)_q_reportActiveUserActivityChangeIfNeeded:(id)a3 context:(id)a4;
- (void)_reportActiveUserActivityChangeIfNeeded:(id)a3 context:(id)a4;
- (void)indexedContentItemsDidChange;
- (void)q_processActiveUserActivity:(id)a3 identifier:(id)a4 linkable:(BOOL)a5 context:(id)a6;
- (void)registerForAppStateNotifications;
- (void)set_client:(id)a3;
- (void)set_defaultsClient:(id)a3;
- (void)set_delayedEvaluationBlock:(id)a3;
- (void)set_lastReportedActivityTime:(id)a3;
- (void)set_lastReportedActivityWasLinkable:(BOOL)a3;
- (void)set_observerQueue:(id)a3;
- (void)set_pendingActivityInfo:(id)a3;
- (void)userActivityCanonicalURLWasChanged:(id)a3;
- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4;
- (void)userActivityPersistentIdentifierWasChanged:(id)a3 persistentIdentifier:(id)a4 previousValue:(id)a5;
- (void)userActivityTargetContentIdentifierWasChanged:(id)a3 targetContentIdentifier:(id)a4 previousValue:(id)a5;
- (void)userActivityWebpageURLWasChanged:(id)a3 webpageURL:(id)a4 previousValue:(id)a5;
@end

@implementation SYActivityObserver

uint64_t __70__SYActivityObserver__reportActiveUserActivityChangeIfNeeded_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_reportActiveUserActivityChangeIfNeeded:context:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "set_delayedEvaluationBlock:", 0);
  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v2 = 1;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "set_lastReportedActivityWasLinkable:", v2);
    v3 = [MEMORY[0x1E4F1C9C8] date];
    objc_msgSend(*(id *)(a1 + 32), "set_lastReportedActivityTime:", v3);

    v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(__CFString **)(a1 + 40);
      if (!v5) {
        v5 = @"None";
      }
      v6 = @"Y";
      if (!*(unsigned char *)(a1 + 64)) {
        v6 = @"N";
      }
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "ActivityObserver: Starting request for activity: %@, linkable: %@.", buf, 0x16u);
    }

    v7 = [*(id *)(a1 + 32) _client];

    if (!v7)
    {
      v8 = objc_alloc_init(SYBacklinkMonitorClient);
      objc_msgSend(*(id *)(a1 + 32), "set_client:", v8);
    }
    if (*(unsigned char *)(a1 + 64)) {
      v9 = *(void **)(a1 + 48);
    }
    else {
      v9 = 0;
    }
    v10 = *(void **)(a1 + 32);
    os_log_t v11 = v9;
    v12 = [v10 _client];
    uint64_t v13 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke_24;
    v15[3] = &unk_1E64647F0;
    id v16 = *(id *)(a1 + 40);
    [v12 notifyActiveUserActivityDidChange:v11 context:v13 completion:v15];

LABEL_17:
    return;
  }
  if ([*(id *)(a1 + 32) _lastReportedActivityWasLinkable])
  {
    BOOL v2 = *(unsigned char *)(a1 + 64) != 0;
    goto LABEL_5;
  }
  if (*(void *)(a1 + 48) && !*(unsigned char *)(a1 + 64))
  {
    os_log_t v11 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "ActivityObserver: Current activity %@ is not linkable, ignoring.", buf, 0xCu);
    }
    goto LABEL_17;
  }
}

- (BOOL)_lastReportedActivityWasLinkable
{
  return self->__lastReportedActivityWasLinkable;
}

void __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = +[SYDefaults shouldDisableQuickNoteTemporarily];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_2;
  v8[3] = &unk_1E6464778;
  uint64_t v13 = a2;
  BOOL v14 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  char v15 = *(unsigned char *)(a1 + 64);
  id v12 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __36__SYActivityObserver_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(SYActivityObserver);

  return MEMORY[0x1F41817F8]();
}

- (SYActivityObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYActivityObserver;
  BOOL v2 = [(SYActivityObserver *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.ActivityObserver", v3);
    observerQueue = v2->__observerQueue;
    v2->__observerQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

void __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 64)
    && !*(unsigned char *)(a1 + 72)
    && (!*(void *)(a1 + 32) || [*(id *)(*(void *)(a1 + 40) + 8) appIsActive]))
  {
    BOOL v2 = [*(id *)(a1 + 40) _observerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_3;
    block[3] = &unk_1E6464750;
    int8x16_t v4 = *(int8x16_t *)(a1 + 32);
    id v3 = (id)v4.i64[0];
    int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
    id v7 = *(id *)(a1 + 48);
    char v9 = *(unsigned char *)(a1 + 73);
    id v8 = *(id *)(a1 + 56);
    dispatch_async(v2, block);
  }
}

- (void)_reportActiveUserActivityChangeIfNeeded:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYActivityObserver *)self _observerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SYActivityObserver__reportActiveUserActivityChangeIfNeeded_context___block_invoke;
  block[3] = &unk_1E64637A8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_q_reportActiveUserActivityChangeIfNeeded:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYActivityObserver *)self _observerQueue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    BOOL v9 = SYIsLinkableUserActivity(v6);
    id v10 = [v6 _uniqueIdentifier];
    id v11 = [[SYUserActivityIdentifierInfo alloc] initWithUserActivity:v6];
  }
  else
  {
    BOOL v9 = 0;
    id v10 = 0;
    id v11 = 0;
  }
  id v12 = [(SYActivityObserver *)self _defaultsClient];

  if (!v12)
  {
    id v13 = objc_alloc_init(SYDefaultsClient);
    [(SYActivityObserver *)self set_defaultsClient:v13];
  }
  BOOL v14 = [(SYActivityObserver *)self _defaultsClient];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke;
  v18[3] = &unk_1E64647A0;
  __int16 v19 = v11;
  v20 = self;
  BOOL v23 = v9;
  id v21 = v10;
  id v22 = v7;
  id v15 = v7;
  id v16 = v10;
  v17 = v11;
  [v14 indicatorCoverageWithCompletion:v18];
}

- (OS_dispatch_queue)_observerQueue
{
  return self->__observerQueue;
}

- (SYDefaultsClient)_defaultsClient
{
  return self->__defaultsClient;
}

- (void)set_defaultsClient:(id)a3
{
}

- (void)q_processActiveUserActivity:(id)a3 identifier:(id)a4 linkable:(BOOL)a5 context:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(SYActivityObserver *)self _delayedEvaluationBlock];

  if (v13)
  {
    BOOL v14 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_INFO, "ActivityObserver: Cancelled previous scheduled request.", buf, 2u);
    }

    id v15 = [(SYActivityObserver *)self _delayedEvaluationBlock];
    dispatch_block_cancel(v15);

    [(SYActivityObserver *)self set_delayedEvaluationBlock:0];
  }
  id v16 = [(SYActivityObserver *)self _lastReportedActivityTime];

  if (v16)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v18 = v17;
    __int16 v19 = [(SYActivityObserver *)self _lastReportedActivityTime];
    [v19 timeIntervalSinceReferenceDate];
    double v21 = v20;

    if (v21 - v18 + 2.0 >= 0.1) {
      double v22 = v21 - v18 + 2.0;
    }
    else {
      double v22 = 0.1;
    }
  }
  else
  {
    double v22 = 0.1;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke;
  block[3] = &unk_1E6464750;
  void block[4] = self;
  BOOL v36 = a5;
  BOOL v23 = (__CFString *)v11;
  v33 = v23;
  id v34 = v10;
  id v35 = v12;
  id v24 = v12;
  id v25 = v10;
  dispatch_block_t v26 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(SYActivityObserver *)self set_delayedEvaluationBlock:v26];

  v27 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = @"None";
    if (v23) {
      v28 = v23;
    }
    *(_DWORD *)buf = 134218242;
    double v38 = v22;
    __int16 v39 = 2112;
    v40 = v28;
    _os_log_impl(&dword_1C2C5F000, v27, OS_LOG_TYPE_INFO, "ActivityObserver: Scheduling request after %0.2fs for activity: %@.", buf, 0x16u);
  }

  dispatch_time_t v29 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
  v30 = [(SYActivityObserver *)self _observerQueue];
  v31 = [(SYActivityObserver *)self _delayedEvaluationBlock];
  dispatch_after(v29, v30, v31);
}

- (id)_delayedEvaluationBlock
{
  return self->__delayedEvaluationBlock;
}

- (void)set_delayedEvaluationBlock:(id)a3
{
}

- (NSDate)_lastReportedActivityTime
{
  return self->__lastReportedActivityTime;
}

- (void)registerForAppStateNotifications
{
  if (!self->_appStateObserver)
  {
    objc_initWeak(&location, self);
    id v3 = [SYApplicationStateObserver alloc];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SYActivityObserver_registerForAppStateNotifications__block_invoke;
    v8[3] = &unk_1E6463E30;
    objc_copyWeak(&v9, &location);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__SYActivityObserver_registerForAppStateNotifications__block_invoke_2;
    v6[3] = &unk_1E6463E30;
    objc_copyWeak(&v7, &location);
    int8x16_t v4 = [(SYApplicationStateObserver *)v3 initWithBecomeActiveHandler:v8 resignActiveHandler:v6];
    appStateObserver = self->_appStateObserver;
    self->_appStateObserver = v4;

    [(SYApplicationStateObserver *)self->_appStateObserver registerForAppStateNotifications];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __41__SYActivityObserver_loadSynapseObserver__block_invoke()
{
  int v0 = SYIsBacklinkingSupportedForDevice();
  v1 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);
  if (v0)
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2C5F000, v1, OS_LOG_TYPE_INFO, "ActivityObserver: Loading observer.", buf, 2u);
    }

    v1 = +[SYActivityObserver sharedInstance];
    [getUAUserActivityClass() addUserActivityObserver:v1];
    [v1 registerForAppStateNotifications];
  }
  else if (v2)
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C2C5F000, v1, OS_LOG_TYPE_INFO, "ActivityObserver: Backlinking is disabled for current device.", v6, 2u);
  }

  if (SYIsReturnToSenderEnabled())
  {
    id v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "Loading document workflows observer.", v5, 2u);
    }

    int8x16_t v4 = objc_alloc_init(SYDocumentWorkflowsActivityObserver);
    [(SYDocumentWorkflowsActivityObserver *)v4 registerForAppStateNotifications];
    [getUAUserActivityClass() addUserActivityObserver:v4];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  }
  BOOL v2 = (void *)sharedInstance___instance;

  return v2;
}

void __54__SYActivityObserver_registerForAppStateNotifications__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAppBecomeActive:v3];
}

- (void)_handleAppBecomeActive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "ActivityObserver: app is active %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SYActivityObserver *)self _defaultActivityObserverContext];
  [(SYActivityObserver *)self _discoverAndProcessActiveUserActivityWithContext:v6];
}

- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityDidBecomeCurrent", v11, 2u);
  }

  if (v4) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [(SYActivityObserver *)self _defaultActivityObserverContext];
  [v10 setNeedsCacheUpdate:1];
  [(SYActivityObserver *)self _reportActiveUserActivityChangeIfNeeded:v9 context:v10];
}

- (id)_defaultActivityObserverContext
{
  BOOL v2 = objc_alloc_init(SYActivityObserverContext);
  [(SYActivityObserverContext *)v2 setNeedsCacheUpdate:0];

  return v2;
}

- (void)_discoverAndProcessActiveUserActivityWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F22488];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SYActivityObserver__discoverAndProcessActiveUserActivityWithContext___block_invoke;
  v7[3] = &unk_1E64647C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 _syFetchCurrentUserActivityWithCompletion:v7];
}

uint64_t __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_processActiveUserActivity:identifier:linkable:context:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
}

uint64_t __71__SYActivityObserver__discoverAndProcessActiveUserActivityWithContext___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reportActiveUserActivityChangeIfNeeded:a2 context:*(void *)(result + 40)];
  }
  return result;
}

+ (void)loadSynapseObserver
{
  if (loadSynapseObserver_onceToken != -1) {
    dispatch_once(&loadSynapseObserver_onceToken, &__block_literal_global_3);
  }
}

- (void)indexedContentItemsDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SYActivityObserver_indexedContentItemsDidChange__block_invoke;
  block[3] = &unk_1E6463AB0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__SYActivityObserver_indexedContentItemsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) appIsActive];
  id v3 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "ActivityObserver: Indexed content items did change. App is active: %d", (uint8_t *)v6, 8u);
  }

  if (v2)
  {
    id v4 = objc_alloc_init(SYActivityObserverContext);
    [(SYActivityObserverContext *)v4 setNeedsCacheUpdate:1];
    [*(id *)(a1 + 32) _discoverAndProcessActiveUserActivityWithContext:v4];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v4 = [v5 _defaultActivityObserverContext];
    [v5 _reportActiveUserActivityChangeIfNeeded:0 context:v4];
  }
}

void __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke_24(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(__CFString **)(a1 + 32);
    if (!v5) {
      id v5 = @"None";
    }
    id v6 = @"Y";
    if (!a2) {
      id v6 = @"N";
    }
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "ActivityObserver: Finished request for activity: %@. Success: %@", (uint8_t *)&v8, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SYRemoteCurrentActivityDidChange", 0, 0, 1u);
}

- (void)userActivityPersistentIdentifierWasChanged:(id)a3 persistentIdentifier:(id)a4 previousValue:(id)a5
{
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityPersistentIdentifierWasChanged", v9, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v6))
  {
    int v8 = [(SYActivityObserver *)self _defaultActivityObserverContext];
    [(SYActivityObserver *)self _reportActiveUserActivityChangeIfNeeded:v6 context:v8];
  }
}

- (void)userActivityTargetContentIdentifierWasChanged:(id)a3 targetContentIdentifier:(id)a4 previousValue:(id)a5
{
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityTargetContentIdentifierWasChanged", v9, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v6))
  {
    int v8 = [(SYActivityObserver *)self _defaultActivityObserverContext];
    [(SYActivityObserver *)self _reportActiveUserActivityChangeIfNeeded:v6 context:v8];
  }
}

- (void)userActivityWebpageURLWasChanged:(id)a3 webpageURL:(id)a4 previousValue:(id)a5
{
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityWebpageURLWasChanged", v9, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v6))
  {
    int v8 = [(SYActivityObserver *)self _defaultActivityObserverContext];
    [v8 setNeedsCacheUpdate:1];
    [(SYActivityObserver *)self _reportActiveUserActivityChangeIfNeeded:v6 context:v8];
  }
}

- (void)userActivityCanonicalURLWasChanged:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityCanonicalURLWasChanged", v7, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v4))
  {
    id v6 = [(SYActivityObserver *)self _defaultActivityObserverContext];
    [(SYActivityObserver *)self _reportActiveUserActivityChangeIfNeeded:v4 context:v6];
  }
}

void __54__SYActivityObserver_registerForAppStateNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAppResignActive:v3];
}

- (void)_handleAppResignActive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "ActivityObserver: app is inactive %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SYActivityObserver *)self _defaultActivityObserverContext];
  [(SYActivityObserver *)self _reportActiveUserActivityChangeIfNeeded:0 context:v6];
}

- (void)set_observerQueue:(id)a3
{
}

- (SYBacklinkMonitorClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
}

- (void)set_lastReportedActivityTime:(id)a3
{
}

- (void)set_lastReportedActivityWasLinkable:(BOOL)a3
{
  self->__lastReportedActivityWasLinkable = a3;
}

- (SYUserActivityIdentifierInfo)_pendingActivityInfo
{
  return self->__pendingActivityInfo;
}

- (void)set_pendingActivityInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__delayedEvaluationBlock, 0);
  objc_storeStrong((id *)&self->__pendingActivityInfo, 0);
  objc_storeStrong((id *)&self->__lastReportedActivityTime, 0);
  objc_storeStrong((id *)&self->__defaultsClient, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->__observerQueue, 0);

  objc_storeStrong((id *)&self->_appStateObserver, 0);
}

@end