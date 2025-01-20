@interface UIKeyboardMediaServiceWarmUpConnection
@end

@implementation UIKeyboardMediaServiceWarmUpConnection

void __59___UIKeyboardMediaServiceWarmUpConnection_sharedConnection__block_invoke()
{
  v0 = objc_alloc_init(_UIKeyboardMediaServiceWarmUpConnection);
  v1 = (void *)_MergedGlobals_1252;
  _MergedGlobals_1252 = (uint64_t)v0;
}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    v6[0] = *MEMORY[0x1E4F625E8];
    v2 = objc_msgSend(NSNumber, "numberWithInteger:", +[UIApplication _classicMode](UIApplication, "_classicMode"));
    v6[1] = *MEMORY[0x1E4F625F8];
    v7[0] = v2;
    v7[1] = MEMORY[0x1E4F1CC38];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

    id v4 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_2;
    v5[3] = &unk_1E52E3C18;
    v5[4] = *(void *)(a1 + 32);
    [v4 openApplication:UIKeyboardMediaServiceBundleIdentifier options:v3 withResult:v5];
  }
}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_3;
  void v7[3] = &unk_1E52D9F98;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.iMessageAppsViewService.warmup-connection" options:0];
    [v2 _setQueue:*(void *)(*(void *)(a1 + 40) + 16)];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), v2);
    objc_initWeak(&location, *(id *)(a1 + 40));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_4;
    v8[3] = &unk_1E52D9F70;
    id v3 = v2;
    id v9 = v3;
    [*(id *)(*(void *)(a1 + 40) + 8) setInterruptionHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_5;
    v6[3] = &unk_1E52DC308;
    objc_copyWeak(&v7, &location);
    [*(id *)(*(void *)(a1 + 40) + 8) setInvalidationHandler:v6];
    uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7016C0];
    [*(id *)(*(void *)(a1 + 40) + 8) setRemoteObjectInterface:v4];

    [*(id *)(*(void *)(a1 + 40) + 8) resume];
    v5 = [*(id *)(*(void *)(a1 + 40) + 8) remoteObjectProxy];
    [v5 warmUp];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

uint64_t __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_5(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

@end