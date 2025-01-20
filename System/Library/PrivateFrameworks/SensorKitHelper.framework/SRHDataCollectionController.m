@interface SRHDataCollectionController
+ (BOOL)isMessagingApp:(id)a3;
+ (BOOL)isSocialMediaApp;
+ (void)initialize;
+ (void)isMediaEventsCollectionEnabledFor:(id)a3 completionHandler:(id)a4;
+ (void)isMediaEventsStreamAuthorizedWithCompletionHandler:(id)a3;
@end

@implementation SRHDataCollectionController

uint64_t __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = qword_26B34E3E8;
    if (os_log_type_enabled((os_log_t)qword_26B34E3E8, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138477827;
      uint64_t v8 = a3;
      _os_log_error_impl(&dword_25C113000, v5, OS_LOG_TYPE_ERROR, "Failed to get media events stream authorization status because of %{private}@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) invalidate];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  byte_26B34E3E1 = 1;
  _MergedGlobals_0 = a2;
  v4 = qword_26B34E3E8;
  if (os_log_type_enabled((os_log_t)qword_26B34E3E8, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v7[0] = 67240451;
    v7[1] = a2;
    __int16 v8 = 2113;
    uint64_t v9 = v5;
    _os_log_impl(&dword_25C113000, v4, OS_LOG_TYPE_INFO, "Media events collection is %{public, BOOL}i for %{private}@", (uint8_t *)v7, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, _MergedGlobals_0);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_26B34E3E8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRHDataCollectionController");
  }
}

uint64_t __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (+[SRHDataCollectionController isMessagingApp:](SRHDataCollectionController, "isMessagingApp:", *(void *)(a1 + 32))&& +[SRHDataCollectionController isSocialMediaApp])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_3;
    v5[3] = &unk_2654ACAE0;
    long long v6 = *(_OWORD *)(a1 + 32);
    return +[SRHDataCollectionController isMediaEventsStreamAuthorizedWithCompletionHandler:v5];
  }
  else
  {
    byte_26B34E3E1 = 1;
    v3 = qword_26B34E3E8;
    if (os_log_type_enabled((os_log_t)qword_26B34E3E8, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67240451;
      int v8 = _MergedGlobals_0;
      __int16 v9 = 2113;
      uint64_t v10 = v4;
      _os_log_impl(&dword_25C113000, v3, OS_LOG_TYPE_INFO, "Media events collection is %{public, BOOL}i for %{private}@", buf, 0x12u);
    }
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  return result;
}

+ (BOOL)isSocialMediaApp
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary"), "objectForKeyedSubscript:", @"SBMatchingApplicationGenres");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v2 containsObject:@"Social Networking"]) {
    return 1;
  }
  uint64_t v4 = (void *)[MEMORY[0x263F01890] bundleRecordForCurrentProcess];
  return objc_msgSend(v4, "sr_isSocialNetworking");
}

+ (void)isMediaEventsStreamAuthorizedWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKit.SKMediaEventsHelper"];
  objc_msgSend(v4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_270987F40));
  [v4 resume];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke;
  v7[3] = &unk_2654ACA70;
  v7[4] = v4;
  v7[5] = a3;
  uint64_t v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke_36;
  v6[3] = &unk_2654ACA98;
  v6[4] = v4;
  v6[5] = a3;
  [v5 authorizationRequestStatusForMediaEventsStreamWithReply:v6];
}

dispatch_queue_t __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.SensorKit.workQueue", v0);
  qword_26B34E3F8 = (uint64_t)result;
  return result;
}

+ (void)isMediaEventsCollectionEnabledFor:(id)a3 completionHandler:(id)a4
{
  if (byte_26B34E3E1)
  {
    if (a4)
    {
      uint64_t v5 = _MergedGlobals_0;
      long long v6 = (void (*)(id, uint64_t))*((void *)a4 + 2);
      v6(a4, v5);
    }
  }
  else
  {
    if (qword_26B34E3F0 != -1) {
      dispatch_once(&qword_26B34E3F0, &__block_literal_global);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __83__SRHDataCollectionController_isMediaEventsCollectionEnabledFor_completionHandler___block_invoke_2;
    v8[3] = &unk_2654ACB08;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async((dispatch_queue_t)qword_26B34E3F8, v8);
  }
}

+ (BOOL)isMessagingApp:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", a3);
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "infoDictionary"), "objectForKeyedSubscript:", @"NSUserActivityTypes");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 containsObject:@"INSendMessageIntent"] & 1) == 0)
  {
    long long v6 = (void *)[MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = [v3 builtInPlugInsURL];
    int v8 = (void *)[v6 enumeratorAtURL:v7 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:1 errorHandler:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v5) {
      return v5;
    }
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v17;
LABEL_6:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithURL:", *(void *)(*((void *)&v16 + 1) + 8 * v11)), "infoDictionary"), "objectForKeyedSubscript:", @"NSExtension");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 objectForKeyedSubscript:@"NSExtensionAttributes"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = (void *)[v13 objectForKeyedSubscript:@"IntentsSupported"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v14 containsObject:@"INSendMessageIntent"] & 1) != 0)
          {
            break;
          }
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v5 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = v5;
        if (v5) {
          goto LABEL_6;
        }
        return v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return v5;
}

uint64_t __82__SRHDataCollectionController_isMediaEventsStreamAuthorizedWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = qword_26B34E3E8;
  if (os_log_type_enabled((os_log_t)qword_26B34E3E8, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138477827;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_25C113000, v4, OS_LOG_TYPE_ERROR, "Failed to set up connection with mediaEventsHelper sevice because of %{private}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) invalidate];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end