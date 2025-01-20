@interface ICTelemetryManager
+ (id)sharedManager;
+ (id)telemetryQueue;
+ (id)telemetryTuples;
+ (void)postBasicEvent:(unint64_t)a3;
+ (void)postFetchDatabaseChangesTelemetryWithReason:(id)a3;
+ (void)postFetchZoneChangesTelemetryWithReason:(id)a3;
+ (void)postFullSyncTelemetryWithReason:(id)a3;
+ (void)postOneTimeBasicEvent:(unint64_t)a3;
+ (void)waitUntilAllPendingTelemetryHasBeenSent;
- (void)postOneTimeTelemetryEvent:(unint64_t)a3 serviceName:(id)a4 payload:(id)a5 token:(id)a6;
- (void)postTelemetryEvent:(unint64_t)a3 serviceName:(id)a4 payload:(id)a5;
@end

@implementation ICTelemetryManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __35__ICTelemetryManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(ICTelemetryManager);
  return MEMORY[0x270F9A758]();
}

+ (id)telemetryTuples
{
  if (telemetryTuples_onceToken != -1) {
    dispatch_once(&telemetryTuples_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)telemetryTuples_tuples;
  return v2;
}

void __37__ICTelemetryManager_telemetryTuples__block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C144CD0;
  v2[1] = &unk_26C144D18;
  v3[0] = &unk_26C144DC0;
  v3[1] = &unk_26C144DD8;
  v2[2] = &unk_26C144D30;
  v2[3] = &unk_26C144D60;
  v3[2] = &unk_26C144DF0;
  v3[3] = &unk_26C144E08;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)telemetryTuples_tuples;
  telemetryTuples_tuples = v0;
}

- (void)postOneTimeTelemetryEvent:(unint64_t)a3 serviceName:(id)a4 payload:(id)a5 token:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v14 = [v13 stringArrayForKey:@"ICRTCTelemetryServiceOneTimeEventTokens"];

  if ([v14 containsObject:v12])
  {
    v15 = [(id)objc_opt_class() telemetryTuples];
    v16 = [NSNumber numberWithUnsignedInteger:a3];
    v17 = [v15 objectForKeyedSubscript:v16];

    v18 = os_log_create("com.apple.notes", "Telemetry");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = [v17 objectAtIndexedSubscript:0];
      v22 = [v17 objectAtIndexedSubscript:1];
      int v23 = 138413314;
      id v24 = v10;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2112;
      v28 = v21;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_debug_impl(&dword_20C263000, v18, OS_LOG_TYPE_DEBUG, "Not posting repeat telemetry for event (S: %@, E:%lu, C:%@, T:%@) with payload: %@", (uint8_t *)&v23, 0x34u);
    }
  }
  else
  {
    [(ICTelemetryManager *)self postTelemetryEvent:a3 serviceName:v10 payload:v11];
    uint64_t v19 = [v14 arrayByAddingObject:v12];

    v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v20 setObject:v19 forKey:@"ICRTCTelemetryServiceOneTimeEventTokens"];

    v14 = (void *)v19;
  }
}

- (void)postTelemetryEvent:(unint64_t)a3 serviceName:(id)a4 payload:(id)a5
{
  v45[6] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x263F086E0] mainBundle];
  id v10 = [v9 bundleIdentifier];

  if ([v10 length])
  {
    uint64_t v11 = *MEMORY[0x263F62A68];
    v44[0] = *MEMORY[0x263F62A60];
    v44[1] = v11;
    v45[0] = &unk_26C144D78;
    v45[1] = &unk_26C144CE8;
    v44[2] = *MEMORY[0x263F62AA8];
    id v12 = [NSNumber numberWithUnsignedInt:arc4random()];
    uint64_t v13 = *MEMORY[0x263F62A40];
    v45[2] = v12;
    v45[3] = MEMORY[0x263EFFA88];
    uint64_t v14 = *MEMORY[0x263F62A78];
    v44[3] = v13;
    v44[4] = v14;
    v44[5] = *MEMORY[0x263F62A50];
    v45[4] = MEMORY[0x263EFFA80];
    v45[5] = v10;
    v15 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:6];

    uint64_t v16 = *MEMORY[0x263F62AC8];
    v42[0] = *MEMORY[0x263F62AB8];
    v42[1] = v16;
    v43[0] = @"notes";
    v43[1] = v7;
    v17 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    v18 = [(id)objc_opt_class() telemetryTuples];
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
    v20 = [v18 objectForKeyedSubscript:v19];

    if (v20)
    {
      if ([v20 count] == 2)
      {
        v21 = os_log_create("com.apple.notes", "Telemetry");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v28 = [v20 objectAtIndexedSubscript:0];
          __int16 v29 = [v20 objectAtIndexedSubscript:1];
          *(_DWORD *)buf = 138413314;
          id v33 = v7;
          __int16 v34 = 2048;
          unint64_t v35 = a3;
          __int16 v36 = 2112;
          v37 = v28;
          __int16 v38 = 2112;
          v39 = v29;
          __int16 v40 = 2112;
          id v41 = v8;
          _os_log_debug_impl(&dword_20C263000, v21, OS_LOG_TYPE_DEBUG, "Posting telemetry for event (S: %@, E:%lu, C:%@, T:%@) with payload: %@", buf, 0x34u);
        }
        v22 = (void *)MEMORY[0x263F62A08];
        int v23 = [v20 objectAtIndexedSubscript:0];
        unsigned __int16 v24 = [v23 unsignedIntValue];
        __int16 v25 = [v20 objectAtIndexedSubscript:1];
        id v31 = 0;
        objc_msgSend(v22, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v15, v17, v24, (unsigned __int16)objc_msgSend(v25, "unsignedIntValue"), v8, &v31);
        id v26 = v31;

        if (v26)
        {
          __int16 v27 = os_log_create("com.apple.notes", "Telemetry");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[ICTelemetryManager postTelemetryEvent:serviceName:payload:]((uint64_t)v26, v27);
          }
        }
      }
      else
      {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTelemetryManager postTelemetryEvent:serviceName:payload:]", 1, 0, @"Invalid tuple argument count (%lu) for event: %lu", [v20 count], a3);
      }
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTelemetryManager postTelemetryEvent:serviceName:payload:]", 1, 0, @"No event tuple defined for event: %lu", a3, v30);
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTelemetryManager postTelemetryEvent:serviceName:payload:]", 1, 0, @"Unable to find valid bundle ID for telemetry");
  }
}

+ (void)postFullSyncTelemetryWithReason:(id)a3
{
  id v4 = a3;
  v5 = [a1 telemetryQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__ICTelemetryManager_postFullSyncTelemetryWithReason___block_invoke;
  v7[3] = &unk_2640CDEA8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__ICTelemetryManager_postFullSyncTelemetryWithReason___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = @"reason";
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postTelemetryEvent:0 serviceName:@"general" payload:v4];
}

+ (void)postFetchDatabaseChangesTelemetryWithReason:(id)a3
{
  id v4 = a3;
  v5 = [a1 telemetryQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__ICTelemetryManager_postFetchDatabaseChangesTelemetryWithReason___block_invoke;
  v7[3] = &unk_2640CDEA8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__ICTelemetryManager_postFetchDatabaseChangesTelemetryWithReason___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = @"reason";
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postTelemetryEvent:1 serviceName:@"general" payload:v4];
}

+ (void)postFetchZoneChangesTelemetryWithReason:(id)a3
{
  id v4 = a3;
  v5 = [a1 telemetryQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__ICTelemetryManager_postFetchZoneChangesTelemetryWithReason___block_invoke;
  v7[3] = &unk_2640CDEA8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__ICTelemetryManager_postFetchZoneChangesTelemetryWithReason___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = @"reason";
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postTelemetryEvent:2 serviceName:@"general" payload:v4];
}

+ (void)postBasicEvent:(unint64_t)a3
{
  v5 = [a1 telemetryQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __37__ICTelemetryManager_postBasicEvent___block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __37__ICTelemetryManager_postBasicEvent___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) sharedManager];
  v5 = @"code";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  [v2 postTelemetryEvent:3 serviceName:@"basic" payload:v4];
}

+ (void)postOneTimeBasicEvent:(unint64_t)a3
{
  v5 = [a1 telemetryQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __44__ICTelemetryManager_postOneTimeBasicEvent___block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __44__ICTelemetryManager_postOneTimeBasicEvent___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) sharedManager];
  id v8 = @"code";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v9[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v5 = NSString;
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v7 = [v5 stringWithFormat:@"%@-%@", @"basic", v6];

  [v2 postOneTimeTelemetryEvent:3 serviceName:@"basic" payload:v4 token:v7];
}

+ (id)telemetryQueue
{
  if (telemetryQueue_onceToken != -1) {
    dispatch_once(&telemetryQueue_onceToken, &__block_literal_global_67_0);
  }
  v2 = (void *)telemetryQueue_queue;
  return v2;
}

void __36__ICTelemetryManager_telemetryQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.telemetry", v2);
  v1 = (void *)telemetryQueue_queue;
  telemetryQueue_queue = (uint64_t)v0;
}

+ (void)waitUntilAllPendingTelemetryHasBeenSent
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Blocking thread until all pending telemetry has been sent", v1, 2u);
}

void __61__ICTelemetryManager_waitUntilAllPendingTelemetryHasBeenSent__block_invoke()
{
  dispatch_queue_t v0 = os_log_create("com.apple.notes", "Telemetry");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __61__ICTelemetryManager_waitUntilAllPendingTelemetryHasBeenSent__block_invoke_cold_1(v0);
  }
}

- (void)postTelemetryEvent:(uint64_t)a1 serviceName:(NSObject *)a2 payload:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "Error reporting telemetry: %@", (uint8_t *)&v2, 0xCu);
}

void __61__ICTelemetryManager_waitUntilAllPendingTelemetryHasBeenSent__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Finished waiting for all pending telemetry to be sent", v1, 2u);
}

@end