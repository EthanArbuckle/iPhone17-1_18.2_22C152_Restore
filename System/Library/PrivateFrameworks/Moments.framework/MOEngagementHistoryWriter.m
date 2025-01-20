@interface MOEngagementHistoryWriter
+ (id)sharedInstance;
- (BOOL)isOkToMergeSuggestionViewedContext:(id)a3;
- (MOEngagementHistoryWriter)init;
- (void)dealloc;
- (void)init;
- (void)logAppEntryEngagementEvent:(id)a3 clientIdentifier:(id)a4 forBundles:(id)a5 startTime:(id)a6 endTime:(id)a7 totalCharacters:(id)a8 addedCharacters:(id)a9 otherContext:(id)a10;
- (void)logClientEngagementEvent:(id)a3 clientIdentifier:(id)a4 otherContext:(id)a5;
- (void)logEngagementEvent:(id)a3 withContext:(id)a4;
- (void)logPerformanceEvent:(id)a3 withContext:(id)a4;
- (void)logSuggestionEngagementEvent:(id)a3 clientIdentifier:(id)a4 forBundles:(id)a5 uiContainer:(id)a6 containerVisibleTime:(id)a7 otherContext:(id)a8;
- (void)logUsageEvent:(id)a3 withContext:(id)a4;
@end

@implementation MOEngagementHistoryWriter

- (MOEngagementHistoryWriter)init
{
  v16.receiver = self;
  v16.super_class = (Class)MOEngagementHistoryWriter;
  v2 = [(MOEngagementHistoryWriter *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MOEngagementHistoryWriter", v3);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v4;

    cachedViewedContext = v2->cachedViewedContext;
    v2->cachedViewedContext = 0;

    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2940E08];
    v8 = _mo_log_facility_get_os_log(MOLogFacilityEngagement);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MOEngagementHistoryWriter init](v8);
    }

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.momentsd" options:0];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v9;

    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v7];
    [(NSXPCConnection *)v2->connection setInterruptionHandler:&__block_literal_global_1];
    [(NSXPCConnection *)v2->connection setInvalidationHandler:&__block_literal_global_12];
    uint64_t v11 = [(NSXPCConnection *)v2->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_18];
    proxy = v2->proxy;
    v2->proxy = (MOEngagementHistoryXCPProtocol *)v11;

    [(NSXPCConnection *)v2->connection resume];
    v13 = _mo_log_facility_get_os_log(MOLogFacilityEngagement);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[MOEngagementHistoryWriter init](v13);
    }

    v14 = v2;
  }

  return v2;
}

void __33__MOEngagementHistoryWriter_init__block_invoke()
{
}

void __33__MOEngagementHistoryWriter_init__block_invoke_2()
{
}

void __33__MOEngagementHistoryWriter_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __33__MOEngagementHistoryWriter_init__block_invoke_3_cold_1(v2, v3);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MOEngagementHistoryWriter;
  [(MOEngagementHistoryWriter *)&v3 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MOEngagementHistoryWriter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  id v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __43__MOEngagementHistoryWriter_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)logEngagementEvent:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOEngagementHistoryWriter logEngagementEvent:withContext:]();
  }

  proxy = self->proxy;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  [(MOEngagementHistoryXCPProtocol *)proxy logEngagementEvent:v6 timestamp:v10 withContext:v7];
}

- (void)logPerformanceEvent:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOEngagementHistoryWriter logPerformanceEvent:withContext:]();
  }

  proxy = self->proxy;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  [(MOEngagementHistoryXCPProtocol *)proxy logPerformanceEvent:v6 timestamp:v10 withContext:v7];
}

- (void)logUsageEvent:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOEngagementHistoryWriter logUsageEvent:withContext:]();
  }

  proxy = self->proxy;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  [(MOEngagementHistoryXCPProtocol *)proxy logUsageEvent:v6 timestamp:v10 withContext:v7];
}

- (void)logAppEntryEngagementEvent:(id)a3 clientIdentifier:(id)a4 forBundles:(id)a5 startTime:(id)a6 endTime:(id)a7 totalCharacters:(id)a8 addedCharacters:(id)a9 otherContext:(id)a10
{
  objc_super v16 = (void *)MEMORY[0x1E4F1CA60];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v27 = [v16 dictionaryWithDictionary:a10];
  [v27 setObject:v22 forKeyedSubscript:@"clientIdentifier"];

  [v27 setObject:v21 forKeyedSubscript:@"eventBundles"];
  [v27 setObject:v20 forKeyedSubscript:@"entryStartTime"];

  [v27 setObject:v19 forKeyedSubscript:@"entryEndTime"];
  [v27 setObject:v18 forKeyedSubscript:@"entryTotalCharacters"];

  [v27 setObject:v17 forKeyedSubscript:@"entryAddedCharacters"];
  proxy = self->proxy;
  v25 = [MEMORY[0x1E4F1C9C8] now];
  [(MOEngagementHistoryXCPProtocol *)proxy logEngagementEvent:v23 timestamp:v25 withContext:v27];
}

- (BOOL)isOkToMergeSuggestionViewedContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->cachedViewedContext) {
    goto LABEL_6;
  }
  id v6 = [v4 objectForKeyedSubscript:@"clientIdentifier"];
  id v7 = [(NSMutableDictionary *)self->cachedViewedContext objectForKeyedSubscript:@"clientIdentifier"];
  if (v6 == v7)
  {
    v8 = [v5 objectForKeyedSubscript:@"viewContainerName"];
    uint64_t v9 = [(NSMutableDictionary *)self->cachedViewedContext objectForKeyedSubscript:@"viewContainerName"];

    if (v8 != v9) {
      goto LABEL_5;
    }
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_7;
  }

LABEL_5:
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (void)logClientEngagementEvent:(id)a3 clientIdentifier:(id)a4 otherContext:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = a3;
  id v13 = [v8 dictionaryWithDictionary:a5];
  [v13 setObject:v9 forKeyedSubscript:@"clientIdentifier"];

  proxy = self->proxy;
  v12 = [MEMORY[0x1E4F1C9C8] now];
  [(MOEngagementHistoryXCPProtocol *)proxy logEngagementEvent:v10 timestamp:v12 withContext:v13];
}

- (void)logSuggestionEngagementEvent:(id)a3 clientIdentifier:(id)a4 forBundles:(id)a5 uiContainer:(id)a6 containerVisibleTime:(id)a7 otherContext:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = (void *)MEMORY[0x1E4F1CA60];
  id v18 = a6;
  id v19 = a4;
  id v20 = [v17 dictionaryWithDictionary:a8];
  [v20 setObject:v19 forKeyedSubscript:@"clientIdentifier"];

  [v20 setObject:v18 forKeyedSubscript:@"viewContainerName"];
  if ([v14 isEqual:@"suggestionsViewed"])
  {
    objc_initWeak(&location, self);
    queue = self->queue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke;
    v24[3] = &unk_1E691EBC0;
    objc_copyWeak(&v29, &location);
    id v25 = v20;
    id v26 = v15;
    id v27 = v14;
    id v28 = v16;
    dispatch_async(queue, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    [v20 setObject:v15 forKeyedSubscript:@"eventBundles"];
    [v20 setObject:v16 forKeyedSubscript:@"viewVisibleTime"];
    proxy = self->proxy;
    id v23 = [MEMORY[0x1E4F1C9C8] now];
    [(MOEngagementHistoryXCPProtocol *)proxy logEngagementEvent:v14 timestamp:v23 withContext:v20];
  }
}

void __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained + 4;
    if (!WeakRetained[4]) {
      goto LABEL_7;
    }
    if ([WeakRetained isOkToMergeSuggestionViewedContext:*(void *)(a1 + 32)])
    {
      id v6 = [*v5 objectForKeyedSubscript:@"eventBundles"];
      [v6 addObjectsFromArray:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = v4[2];
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [MEMORY[0x1E4F1C9C8] now];
      [v7 logEngagementEvent:v8 timestamp:v9 withContext:v4[4]];

      id v6 = v4[4];
      v4[4] = 0;
    }

    if (!*v5)
    {
LABEL_7:
      objc_storeStrong(v4 + 4, *(id *)(a1 + 32));
      id v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"eventBundles"];

      [*(id *)(a1 + 32) setObject:*(void *)(a1 + 56) forKeyedSubscript:@"viewVisibleTime"];
      dispatch_time_t v11 = dispatch_time(0, 3000000000);
      v12 = v4[3];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke_2;
      v13[3] = &unk_1E691EB98;
      objc_copyWeak(&v15, v2);
      id v14 = *(id *)(a1 + 48);
      dispatch_after(v11, v12, v13);

      objc_destroyWeak(&v15);
    }
  }
}

void __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[4])
  {
    objc_super v3 = (void *)WeakRetained[2];
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = WeakRetained;
    v5 = [MEMORY[0x1E4F1C9C8] now];
    [v3 logEngagementEvent:v4 timestamp:v5 withContext:v7[4]];

    id v6 = (void *)v7[4];
    v7[4] = 0;

    WeakRetained = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedViewedContext, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D24AE000, log, OS_LOG_TYPE_DEBUG, "connecting", v1, 2u);
}

void __33__MOEngagementHistoryWriter_init__block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 localizedDescription];
  v5 = [a1 localizedFailureReason];
  int v6 = 138412802;
  id v7 = @"Error on remote object proxy";
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2112;
  dispatch_time_t v11 = v5;
  _os_log_debug_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_DEBUG, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);
}

- (void)logEngagementEvent:withContext:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1(&dword_1D24AE000, v0, v1, "Engagement event: %@, context: %{private}@");
}

- (void)logPerformanceEvent:withContext:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1(&dword_1D24AE000, v0, v1, "Performace event: %@, context: %{private}@");
}

- (void)logUsageEvent:withContext:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1(&dword_1D24AE000, v0, v1, "Usage event: %@, context: %{private}@");
}

@end