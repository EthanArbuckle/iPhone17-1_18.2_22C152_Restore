@interface ATXInfoTimelineDonationClient
+ (id)sharedInstance;
- (id)_init;
- (void)timelineDidReloadForWidget:(id)a3 parentApp:(id)a4 withEntries:(id)a5 completion:(id)a6;
@end

@implementation ATXInfoTimelineDonationClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  return v2;
}

void __47__ATXInfoTimelineDonationClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1B3E6F520]();
  id v1 = [[ATXInfoTimelineDonationClient alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = (uint64_t)v1;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXInfoTimelineDonationClient;
  v2 = [(ATXInfoTimelineDonationClient *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v4 = ATXInfoSuggestionXPCInterface();
    v5 = __atxlog_handle_timeline();
    uint64_t v6 = [v3 initWithServiceName:@"com.apple.proactive.infoSuggestion.xpc" allowlistedServerInterface:v4 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_3_0 invalidationHandler:&__block_literal_global_6_0 logHandle:v5];
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v6;
  }
  return v2;
}

void __38__ATXInfoTimelineDonationClient__init__block_invoke()
{
  v0 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineDonationClient: xpc connection interrupted.", v1, 2u);
  }
}

void __38__ATXInfoTimelineDonationClient__init__block_invoke_4()
{
  v0 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineDonationClient: xpc connection invalidated.", v1, 2u);
  }
}

- (void)timelineDidReloadForWidget:(id)a3 parentApp:(id)a4 withEntries:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  xpcClientHelper = self->_xpcClientHelper;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke;
  v21 = &unk_1E5F00F18;
  id v22 = v10;
  id v23 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = a5;
  id v16 = a4;
  v17 = [(_PASXPCClientHelper *)xpcClientHelper remoteObjectProxyWithErrorHandler:&v18];
  objc_msgSend(v17, "timelineDidReloadForWidget:parentApp:withEntries:completion:", v14, v16, v15, v13, v18, v19, v20, v21);
}

void __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

void __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "ATXInfoTimelineDonationClient: Error reloading timeline for widget %@ - %@", (uint8_t *)&v4, 0x16u);
}

@end