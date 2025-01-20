@interface SKUIJSApplication
- (BOOL)isRunningTests;
- (BOOL)pageRenderMetricsEnabled;
- (SKUIApplicationController)applicationController;
- (SKUIJSApplication)initWithAppContext:(id)a3 applicationController:(id)a4;
- (void)launchComplete:(id)a3;
- (void)launchFailed;
- (void)sendDocumentMessage:(id)a3 :(id)a4 :(id)a5;
@end

@implementation SKUIJSApplication

- (SKUIJSApplication)initWithAppContext:(id)a3 applicationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSApplication initWithAppContext:applicationController:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIJSApplication;
  v8 = [(IKJSObject *)&v11 initWithAppContext:v6];
  v9 = v8;
  if (v8) {
    objc_storeWeak((id *)&v8->_applicationController, v7);
  }

  return v9;
}

- (BOOL)pageRenderMetricsEnabled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SKUIJSApplication_pageRenderMetricsEnabled__block_invoke;
  v4[3] = &unk_1E6422538;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(MEMORY[0x1E4F14428], v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__SKUIJSApplication_pageRenderMetricsEnabled__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) applicationController];
  char v2 = [v3 options];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 pageRenderMetricsEnabled];
}

- (void)launchFailed
{
  id v2 = [(SKUIJSApplication *)self applicationController];
  [v2 performSelectorOnMainThread:sel_showErrorViewForLaunchFailure withObject:0 waitUntilDone:0];
}

- (void)launchComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIJSApplication *)self applicationController];
  [v5 performSelectorOnMainThread:sel__jsLaunchFinishedWithLaunchMetrics_ withObject:v4 waitUntilDone:0];
}

- (void)sendDocumentMessage:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 appBridge];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SKUIJSApplication_sendDocumentMessage_::__block_invoke;
    block[3] = &unk_1E64225B0;
    id v12 = v10;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __43__SKUIJSApplication_sendDocumentMessage_::__block_invoke(void *a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  v7[0] = @"SKUIDocumentMessageNameKey";
  v7[1] = @"SKUIDocumentMessagePayloadKey";
  uint64_t v5 = a1[6];
  v8[0] = v3;
  v8[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 postNotificationName:@"SKUIAppDocumentDidSendMessageNotification" object:v4 userInfo:v6];
}

- (BOOL)isRunningTests
{
  id v2 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SKUIJSApplication_isRunningTests__block_invoke;
  block[3] = &unk_1E6424310;
  void block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __35__SKUIJSApplication_isRunningTests__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 launchedToTest];
}

- (SKUIApplicationController)applicationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationController);

  return (SKUIApplicationController *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)initWithAppContext:applicationController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSApplication initWithAppContext:applicationController:]";
}

@end