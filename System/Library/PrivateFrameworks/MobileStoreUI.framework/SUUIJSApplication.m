@interface SUUIJSApplication
- (BOOL)isRunningTests;
- (BOOL)pageRenderMetricsEnabled;
- (SUUIApplicationController)applicationController;
- (SUUIJSApplication)initWithAppContext:(id)a3 applicationController:(id)a4;
- (void)launchComplete:(id)a3;
- (void)launchFailed;
- (void)sendDocumentMessage:(id)a3 :(id)a4 :(id)a5;
@end

@implementation SUUIJSApplication

- (SUUIJSApplication)initWithAppContext:(id)a3 applicationController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SUUIJSApplication;
  v7 = [(IKJSObject *)&v10 initWithAppContext:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_applicationController, v6);
  }

  return v8;
}

- (BOOL)pageRenderMetricsEnabled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SUUIJSApplication_pageRenderMetricsEnabled__block_invoke;
  v4[3] = &unk_2654008E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(MEMORY[0x263EF83A0], v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__SUUIJSApplication_pageRenderMetricsEnabled__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) applicationController];
  char v2 = [v3 options];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 pageRenderMetricsEnabled];
}

- (void)launchFailed
{
  id v2 = [(SUUIJSApplication *)self applicationController];
  [v2 performSelectorOnMainThread:sel_showErrorViewForLaunchFailure withObject:0 waitUntilDone:0];
}

- (void)launchComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIJSApplication *)self applicationController];
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SUUIJSApplication_sendDocumentMessage_::__block_invoke;
    block[3] = &unk_265400958;
    id v12 = v10;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__SUUIJSApplication_sendDocumentMessage_::__block_invoke(void *a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  v7[0] = @"SUUIDocumentMessageNameKey";
  v7[1] = @"SUUIDocumentMessagePayloadKey";
  uint64_t v5 = a1[6];
  v8[0] = v3;
  v8[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 postNotificationName:@"SUUIAppDocumentDidSendMessageNotification" object:v4 userInfo:v6];
}

- (BOOL)isRunningTests
{
  id v2 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SUUIJSApplication_isRunningTests__block_invoke;
  block[3] = &unk_265405DA0;
  void block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __35__SUUIJSApplication_isRunningTests__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 launchedToTest];
}

- (SUUIApplicationController)applicationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationController);
  return (SUUIApplicationController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end