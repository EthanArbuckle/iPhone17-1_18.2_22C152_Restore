@interface ATXInfoSuggestionFeedbackClient
+ (id)sharedInstance;
- (id)_init;
- (void)stackDidRotateProactivelyForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4;
- (void)suggestionDismissed:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5;
@end

@implementation ATXInfoSuggestionFeedbackClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __49__ATXInfoSuggestionFeedbackClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1B3E6F520]();
  id v1 = [[ATXInfoSuggestionFeedbackClient alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = (uint64_t)v1;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXInfoSuggestionFeedbackClient;
  v2 = [(ATXInfoSuggestionFeedbackClient *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v4 = ATXInfoSuggestionXPCInterface();
    v5 = __atxlog_handle_gi();
    uint64_t v6 = [v3 initWithServiceName:@"com.apple.proactive.infoSuggestion.xpc" allowlistedServerInterface:v4 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_3 invalidationHandler:&__block_literal_global_6 logHandle:v5];
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v6;
  }
  return v2;
}

void __40__ATXInfoSuggestionFeedbackClient__init__block_invoke()
{
  v0 = __atxlog_handle_gi();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionFeedbackClient: xpc connection interrupted.", v1, 2u);
  }
}

void __40__ATXInfoSuggestionFeedbackClient__init__block_invoke_4()
{
  v0 = __atxlog_handle_gi();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionFeedbackClient: xpc connection invalidated.", v1, 2u);
  }
}

- (void)suggestionDismissed:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  xpcClientHelper = self->_xpcClientHelper;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke;
  v13[3] = &unk_1E5F00980;
  id v14 = v8;
  id v10 = v8;
  id v11 = a3;
  v12 = [(_PASXPCClientHelper *)xpcClientHelper remoteObjectProxyWithErrorHandler:v13];
  [v12 userDidDismissSuggestion:v11 isDismissalLongTerm:v5 completion:v10];
}

void __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stackDidRotateProactivelyForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4
{
  BOOL v4 = a4;
  xpcClientHelper = self->_xpcClientHelper;
  id v6 = a3;
  id v7 = [(_PASXPCClientHelper *)xpcClientHelper remoteObjectProxyWithErrorHandler:&__block_literal_global_9];
  [v7 stackDidRotateProactivelyForInfoSuggestion:v6 isStalenessRotation:v4];
}

void __98__ATXInfoSuggestionFeedbackClient_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __98__ATXInfoSuggestionFeedbackClient_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void).cxx_destruct
{
}

void __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "ATXInfoSuggestionFeedbackClient: Error recording suggestion dismissed - %@", (uint8_t *)&v2, 0xCu);
}

void __98__ATXInfoSuggestionFeedbackClient_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "ATXInfoSuggestionFeedbackClient: Error getting remote object proxy to record stack rotation - %@", (uint8_t *)&v2, 0xCu);
}

@end