@interface PBBridgeAssetsReachabilityMonitor
+ (void)checkServerReachabilityWithCompletion:(id)a3;
@end

@implementation PBBridgeAssetsReachabilityMonitor

uint64_t __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke()
{
  _responseQueue = (uint64_t)dispatch_queue_create("com.apple.ReachabilityResponse", 0);
  return MEMORY[0x270F9A758]();
}

void __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  v2 = ASServerURLForAssetType();
  id v3 = 0;
  if (v3)
  {
    v4 = pbb_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      v5 = "Asset Server Lookup Failed with Error (%@): Returning Vacuously True";
      v6 = v4;
      uint32_t v7 = 12;
LABEL_14:
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    id v9 = [v2 host];
    SCNetworkReachabilityRef v10 = SCNetworkReachabilityCreateWithName(v8, (const char *)[v9 UTF8String]);

    if (v10)
    {
      SCNetworkReachabilityFlags flags = 0;
      if (SCNetworkReachabilityGetFlags(v10, &flags))
      {
        SCNetworkReachabilityFlags v11 = flags & 2;
        v12 = pbb_mobileasset_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v2 host];
          *(_DWORD *)buf = 138412546;
          id v25 = v13;
          __int16 v26 = 1024;
          SCNetworkReachabilityFlags v27 = v11 >> 1;
          _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "Network Reachable (%@): %d", buf, 0x12u);
        }
        CFRelease(v10);
        if (v11)
        {
          v14 = (void *)[objc_alloc(MEMORY[0x263F08BD8]) initWithURL:v2 cachePolicy:1 timeoutInterval:1.0];
          v15 = (void *)MEMORY[0x263F08BF8];
          v16 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
          v17 = [v15 sessionWithConfiguration:v16];
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_269;
          v20[3] = &unk_2644011F0;
          id v21 = *(id *)(a1 + 32);
          v18 = [v17 dataTaskWithRequest:v14 completionHandler:v20];

          [v18 resume];
          goto LABEL_17;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    v4 = pbb_mobileasset_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Network Unreachable: Returning Vacuously True";
      v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_14;
    }
  }

  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 1);
  }
LABEL_17:
}

+ (void)checkServerReachabilityWithCompletion:(id)a3
{
  id v3 = a3;
  if (checkServerReachabilityWithCompletion__onceToken != -1) {
    dispatch_once(&checkServerReachabilityWithCompletion__onceToken, &__block_literal_global_1);
  }
  v4 = _responseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_2;
  block[3] = &unk_264400C10;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __75__PBBridgeAssetsReachabilityMonitor_checkServerReachabilityWithCompletion___block_invoke_269(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a4 == 0);
  }
  return result;
}

@end