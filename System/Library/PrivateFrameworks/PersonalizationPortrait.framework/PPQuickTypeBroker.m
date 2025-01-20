@interface PPQuickTypeBroker
+ (id)sharedInstance;
- (PPQuickTypeBroker)init;
- (id)_remoteObjectProxy;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)hibernateWithCompletion:(id)a3;
- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8;
- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)warmUpWithCompletion:(id)a3;
@end

@implementation PPQuickTypeBroker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    v4 = self->_clientFeedbackHelper;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 isMapped])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPQuickTypeBroker.m" lineNumber:117 description:@"You cannot send mapped feedback on named entities. Please use PPFeedback to create the feedback for named entities."];
  }
  v9 = [(PPQuickTypeBroker *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PPQuickTypeBroker.m", 118, @"The clientIdentifier property must be set on the %@ in order to send feedback.", v17 object file lineNumber description];
  }
  v11 = [(PPQuickTypeBroker *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  v12 = [(PPQuickTypeBroker *)self _remoteObjectProxy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__PPQuickTypeBroker_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E550F8A8;
  v18[4] = self;
  id v19 = v7;
  id v13 = v7;
  [v12 registerFeedback:v8 completion:v18];
}

void __49__PPQuickTypeBroker_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if (v5)
  {
    id v7 = pp_xpc_client_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "Error from _remoteObjectProxy %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)hibernateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PPQuickTypeBroker *)self _remoteObjectProxy];
  [v5 hibernateWithCompletion:v4];
}

- (void)warmUpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PPQuickTypeBroker *)self _remoteObjectProxy];
  [v5 warmUpWithCompletion:v4];
}

- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PPQuickTypeBroker *)self _remoteObjectProxy];
  [v8 recentQuickTypeItemsForRecipients:v7 completion:v6];
}

- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void (**)(id, void, void *))a8;
  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v19 = [v14 objectForKeyedSubscript:@"type"];
  if (!v19) {
    goto LABEL_7;
  }
  v20 = (void *)v19;
  v21 = [v14 objectForKeyedSubscript:@"type"];
  int v22 = [v21 isEqualToString:@"photosharing"];

  if (v22)
  {
    v23 = pp_xpc_client_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_INFO, "ignoring quickTypeItemsWithLanguageModelingTokens call for photosharing", v26, 2u);
    }

    v24 = objc_opt_new();
    v18[2](v18, MEMORY[0x1E4F1CBF0], v24);
  }
  else
  {
LABEL_7:
    v25 = [(PPQuickTypeBroker *)self _remoteObjectProxy];
    [v25 quickTypeItemsWithLanguageModelingTokens:v14 localeIdentifier:v15 recipients:v16 bundleIdentifier:v17 limit:a7 completion:v18];
  }
}

- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PPQuickTypeBroker *)self _remoteObjectProxy];
  [v10 quickTypeItemsWithQuery:v9 limit:a4 completion:v8];
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (PPQuickTypeBroker)init
{
  v21.receiver = self;
  v21.super_class = (Class)PPQuickTypeBroker;
  v2 = [(PPQuickTypeBroker *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7A828];
    id v4 = (void *)MEMORY[0x192F97350]();
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    [v3 setClasses:v7 forSelector:sel_quickTypeItemsWithQuery_limit_completion_ argumentIndex:0 ofReply:1];

    id v8 = (void *)MEMORY[0x192F97350]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_quickTypeItemsWithLanguageModelingTokens_localeIdentifier_recipients_bundleIdentifier_limit_completion_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x192F97350]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    [v3 setClasses:v15 forSelector:sel_recentQuickTypeItemsForRecipients_completion_ argumentIndex:0 ofReply:1];

    id v16 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.QuickType" allowedServerInterface:v3 allowedClientInterface:0 clientExportedObject:0 interruptionHandler:&__block_literal_global_196 invalidationHandler:&__block_literal_global_79];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v16;

    v18 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v18;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PPQuickTypeBroker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken8 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken8, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __35__PPQuickTypeBroker_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end