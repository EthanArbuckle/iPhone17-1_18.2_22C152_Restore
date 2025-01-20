@interface TPSAnalyticsEventController
+ (id)sharedInstance;
- (OS_dispatch_queue)analyticsQueue;
- (TPSAnalyticsDataProvider)dataProvider;
- (_TPSXPCConnection)xpcConnection;
- (id)exportedInterface;
- (void)_destroyXPCConnection;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)logAnalyticsEvent:(id)a3;
- (void)logAnalyticsEventFromTipsd:(id)a3;
- (void)logAnalyticsEvents:(id)a3;
- (void)logAnalyticsEventsFromTipsd:(id)a3;
- (void)sendToCoreAnalytics:(id)a3 eventName:(id)a4;
- (void)setDataProvider:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation TPSAnalyticsEventController

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) mutableAnalyticsEventRepresentation];
  [*v2 persistKeys];
  if (v3)
  {
    v4 = +[TPSLogger analytics];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_2(v2, v4);
    }

    v5 = [*v2 deliveryInfoVersion];
    [v3 setObject:v5 forKeyedSubscript:@"rules_version"];

    v6 = +[TPSLogger analytics];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_1(v2, (uint64_t)v3, v6);
    }

    v7 = *(void **)(a1 + 40);
    v8 = [*(id *)(a1 + 32) eventName];
    [v7 sendToCoreAnalytics:v3 eventName:v8];
  }
}

- (void)sendToCoreAnalytics:(id)a3 eventName:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)logAnalyticsEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (+[TPSCommonDefines callerIsTipsdWithSource:@"Analytics"])
    {
      [(TPSAnalyticsEventController *)self logAnalyticsEventFromTipsd:v4];
    }
    else
    {
      id v5 = self;
      objc_sync_enter(v5);
      v6 = [(TPSAnalyticsEventController *)v5 xpcConnection];
      v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_10];

      if (v7) {
        [v7 logAnalyticsEvent:v4];
      }

      objc_sync_exit(v5);
    }
  }
}

- (void)logAnalyticsEventFromTipsd:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[TPSAnalyticsEventController logAnalyticsEventsFromTipsd:](self, "logAnalyticsEventsFromTipsd:", v6, v7, v8);
}

- (void)logAnalyticsEventsFromTipsd:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAnalyticsEventController *)self analyticsQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke;
  v7[3] = &unk_1E5906790;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 40) dataProvider];
        [v7 setDataProvider:v8];

        v9 = [*(id *)(a1 + 40) analyticsQueue];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2;
        v11[3] = &unk_1E5906790;
        uint64_t v10 = *(void *)(a1 + 40);
        v11[4] = v7;
        v11[5] = v10;
        dispatch_async(v9, v11);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)analyticsQueue
{
  if (analyticsQueue_onceToken != -1) {
    dispatch_once(&analyticsQueue_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)analyticsQueue_gAnalyticsQueue;
  return (OS_dispatch_queue *)v2;
}

- (TPSAnalyticsDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (TPSAnalyticsDataProvider *)WeakRetained;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_7 != -1) {
    dispatch_once(&sharedInstance_predicate_7, &__block_literal_global_25);
  }
  id v2 = (void *)sharedInstance_gTPSAnalyticsController;
  return v2;
}

uint64_t __45__TPSAnalyticsEventController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TPSAnalyticsEventController);
  uint64_t v1 = sharedInstance_gTPSAnalyticsController;
  sharedInstance_gTPSAnalyticsController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __45__TPSAnalyticsEventController_analyticsQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.tipsd.analyticsQueue", v2);
  uint64_t v1 = (void *)analyticsQueue_gAnalyticsQueue;
  analyticsQueue_gAnalyticsQueue = (uint64_t)v0;
}

void __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[TPSLogger analytics];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke_cold_1();
  }
}

- (void)logAnalyticsEvents:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = +[TPSLogger analytics];
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG)) {
      -[TPSAnalyticsEventController logAnalyticsEvents:]();
    }
    goto LABEL_9;
  }
  if (!+[TPSCommonDefines callerIsTipsdWithSource:@"Analytics"])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(TPSAnalyticsEventController *)v5 xpcConnection];
    id v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_12];

    if (v7) {
      [v7 logAnalyticsEvents:v4];
    }

    objc_sync_exit(v5);
LABEL_9:

    goto LABEL_10;
  }
  [(TPSAnalyticsEventController *)self logAnalyticsEventsFromTipsd:v4];
LABEL_10:
}

void __50__TPSAnalyticsEventController_logAnalyticsEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[TPSLogger analytics];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke_cold_1();
  }
}

id __61__TPSAnalyticsEventController_sendToCoreAnalytics_eventName___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (_TPSXPCConnection)xpcConnection
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_xpcConnection)
  {
    uint64_t v3 = [[_TPSXPCConnection alloc] initWithMachServiceName:@"com.apple.tipsd" options:4096];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = v3;

    [(_TPSXPCConnection *)v2->_xpcConnection setExportedObject:v2];
    [(_TPSXPCConnection *)v2->_xpcConnection resume];
  }
  objc_sync_exit(v2);

  uint64_t v5 = v2->_xpcConnection;
  return v5;
}

- (void)_destroyXPCConnection
{
  obj = self;
  objc_sync_enter(obj);
  [(_TPSXPCConnection *)obj->_xpcConnection invalidate];
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = 0;

  objc_sync_exit(obj);
}

- (void)connectionInvalidated
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "XPCConnection invalidated calling logEvent to proxy", v2, v3, v4, v5, v6);
}

- (void)connectionInterrupted
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "XPCConnection interrupted calling logEvent to proxy", v2, v3, v4, v5, v6);
}

- (id)exportedInterface
{
  return 0;
}

- (void)setDataProvider:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 eventName];
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_19C8DC000, a3, OS_LOG_TYPE_DEBUG, "event: %@ \n dictionary: %@", v6, 0x16u);
}

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 eventName];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C8DC000, a2, v4, "logging analytics event: %@", v5);
}

- (void)logAnalyticsEvent:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_19C8DC000, a3, (uint64_t)a3, "XPCConnection exception calling logEvent to proxy: %@", (uint8_t *)a2);
}

void __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_19C8DC000, v0, v1, "xpc connection failed: %@", v2);
}

- (void)logAnalyticsEvents:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "logging analytics event that is nil", v2, v3, v4, v5, v6);
}

- (void)logAnalyticsEvents:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19C8DC000, v0, v1, "XPCConnection exception calling logEvents to proxy", v2, v3, v4, v5, v6);
}

@end