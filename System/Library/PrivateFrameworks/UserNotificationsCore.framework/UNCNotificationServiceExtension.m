@interface UNCNotificationServiceExtension
+ (BOOL)isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:(id)a3;
+ (id)_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter;
+ (id)_extensionIdentifiersToPerExtensionQueues;
+ (void)_allowAccessToNotificationCenterForServiceExtensionWithIdentifier:(id)a3;
+ (void)_disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:(id)a3;
- (LSPlugInKitProxy)proxy;
- (OS_dispatch_queue)queue;
- (double)serviceTime;
- (id)_initWithExtension:(id)a3 serviceTime:(double)a4 graceTime:(double)a5;
- (id)mutateContentForNotificationRequest:(id)a3 error:(id *)a4;
- (void)cleanUp;
@end

@implementation UNCNotificationServiceExtension

+ (id)_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter
{
  if (_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_onceToken != -1) {
    dispatch_once(&_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)_extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_instance;

  return v2;
}

uint64_t __98__UNCNotificationServiceExtension__extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter__block_invoke()
{
  _extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter_instance = [MEMORY[0x263F08760] set];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionIdentifiersToPerExtensionQueues
{
  if (_extensionIdentifiersToPerExtensionQueues_onceToken[0] != -1) {
    dispatch_once(_extensionIdentifiersToPerExtensionQueues_onceToken, &__block_literal_global_3_0);
  }
  v2 = (void *)_extensionIdentifiersToPerExtensionQueues_instance;

  return v2;
}

uint64_t __76__UNCNotificationServiceExtension__extensionIdentifiersToPerExtensionQueues__block_invoke()
{
  _extensionIdentifiersToPerExtensionQueues_instance = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter];
  objc_sync_enter(v5);
  BOOL v6 = [v5 countForObject:v4] != 0;
  objc_sync_exit(v5);

  return v6;
}

+ (void)_allowAccessToNotificationCenterForServiceExtensionWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter];
  objc_sync_enter(v5);
  [v5 addObject:v4];
  BOOL v6 = (id)*MEMORY[0x263F1E068];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v5 countForObject:v4];
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Incremented notification center access to service extension: %ld", (uint8_t *)&v7, 0x16u);
  }

  objc_sync_exit(v5);
}

+ (void)_disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _extensionIdentifiersCurrentlyAllowedAccessToNotificationCenter];
  objc_sync_enter(v5);
  [v5 removeObject:v4];
  BOOL v6 = (id)*MEMORY[0x263F1E068];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v5 countForObject:v4];
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decremented notification center access to service extension: %ld", (uint8_t *)&v7, 0x16u);
  }

  objc_sync_exit(v5);
}

- (id)_initWithExtension:(id)a3 serviceTime:(double)a4 graceTime:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCNotificationServiceExtension;
  uint64_t v10 = [(UNCNotificationServiceExtension *)&v13 init];
  uint64_t v11 = (double *)v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_extension, a3);
    v11[4] = a4;
    v11[5] = a5;
  }

  return v11;
}

- (double)serviceTime
{
  return self->_serviceTime;
}

- (LSPlugInKitProxy)proxy
{
  v2 = [(NSExtension *)self->_extension identifier];
  v3 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:v2];

  return (LSPlugInKitProxy *)v3;
}

- (OS_dispatch_queue)queue
{
  v2 = [(NSExtension *)self->_extension identifier];
  id v3 = [(id)objc_opt_class() _extensionIdentifiersToPerExtensionQueues];
  objc_sync_enter(v3);
  id v4 = [v3 objectForKeyedSubscript:v2];
  if (!v4)
  {
    id v5 = [NSString stringWithFormat:@"com.apple.usernotifications.serviceextension.%@", v2];
    BOOL v6 = (const char *)[v5 UTF8String];
    int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_create(v6, v7);

    [v3 setObject:v4 forKeyedSubscript:v2];
  }
  objc_sync_exit(v3);

  return (OS_dispatch_queue *)v4;
}

- (id)mutateContentForNotificationRequest:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v43 = a3;
  uint64_t v66 = 0;
  v67[0] = &v66;
  v67[1] = 0x3032000000;
  v67[2] = __Block_byref_object_copy__11;
  v67[3] = __Block_byref_object_dispose__11;
  id v68 = 0;
  id v5 = [(NSExtension *)self->_extension identifier];
  uint64_t v6 = dispatch_get_global_queue(21, 0);
  int v7 = (void *)[objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"com.apple.usernotifications.serviceextension.startuptimer"];
  double serviceTime = self->_serviceTime;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke;
  v63[3] = &unk_2655683A0;
  id v9 = v5;
  id v64 = v9;
  v65 = self;
  [v7 scheduleWithFireInterval:v6 leewayInterval:v63 queue:serviceTime handler:0.0];
  v44 = (void *)v6;
  BSAbsoluteMachTimeNow();
  double v11 = v10;
  extension = self->_extension;
  uint64_t v13 = v67[0];
  id obj = *(id *)(v67[0] + 40);
  v14 = [(NSExtension *)extension beginExtensionRequestWithOptions:1 inputItems:0 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  [v7 invalidate];

  uint64_t v15 = objc_opt_class();
  id v16 = v14;
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;

  v19 = [(NSExtension *)self->_extension _extensionContextForUUID:v18];
  hostContext = self->_hostContext;
  self->_hostContext = v19;

  if (self->_hostContext)
  {
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3810000000;
    v60[3] = &unk_260AD0D7A;
    char v61 = 0;
    v21 = (void *)[objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"com.apple.usernotifications.serviceextension.errorwatchdogtimer"];
    v41 = (void *)[objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"com.apple.usernotifications.serviceextension.gracewatchdogtimer"];
    if ([(NSExtension *)self->_extension uns_isExtensionSessionBeingDebugged:v18])
    {
      v22 = *MEMORY[0x263F1E068];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v70 = v9;
        __int16 v71 = 2114;
        id v72 = v18;
        _os_log_impl(&dword_2608DB000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension is being debugged, will skip scheduling timers: sessionUUID=%{public}@", buf, 0x16u);
      }
      v23 = v21;
    }
    else
    {
      BSAbsoluteMachTimeNow();
      double v26 = v25;
      double v27 = self->_serviceTime;
      [v21 invalidate];
      v23 = (void *)[objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"com.apple.usernotifications.serviceextension.startuperrortimer"];

      double v28 = fmax(v27 - (v26 - v11), 0.0);
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_25;
      v56[3] = &unk_2655683C8;
      v59 = v60;
      v56[4] = self;
      id v29 = v9;
      id v57 = v29;
      id v30 = v18;
      id v58 = v30;
      [v23 scheduleWithFireInterval:v44 leewayInterval:v56 queue:v28 handler:0.0];
      double v31 = fmax(v28 - self->_graceTime, 0.0);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_26;
      v54[3] = &unk_2655683A0;
      v54[4] = self;
      id v32 = v30;
      id v55 = v32;
      [v41 scheduleWithFireInterval:v44 leewayInterval:v54 queue:v31 handler:0.0];
      v33 = *MEMORY[0x263F1E068];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        id v70 = v29;
        __int16 v71 = 2114;
        id v72 = v32;
        __int16 v73 = 2048;
        double v74 = v28;
        __int16 v75 = 2048;
        double v76 = v31;
        _os_log_impl(&dword_2608DB000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension started, scheduled timers: sessionUUID=%{public}@, serviceTime=%lf, graceTime=%lf", buf, 0x2Au);
      }
    }
    [(id)objc_opt_class() _allowAccessToNotificationCenterForServiceExtensionWithIdentifier:v9];
    v34 = [(NSExtensionContext *)self->_hostContext _auxiliaryConnection];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_27;
    v49[3] = &unk_2655683F0;
    v49[4] = self;
    id v35 = v9;
    id v50 = v35;
    v52 = v60;
    v53 = &v66;
    id v36 = v18;
    id v51 = v36;
    v37 = [v34 synchronousRemoteObjectProxyWithErrorHandler:v49];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_29;
    v45[3] = &unk_265568418;
    v45[4] = self;
    id v46 = v35;
    v48 = v60;
    id v47 = v36;
    [v37 didReceiveNotificationRequest:v43 withCompletionHandler:v45];

    [v23 invalidate];
    [v41 invalidate];

    _Block_object_dispose(v60, 8);
  }
  else
  {
    v24 = *MEMORY[0x263F1E068];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationServiceExtension mutateContentForNotificationRequest:error:]((uint64_t)v9, (uint64_t)v67, v24);
    }
  }
  if (a4)
  {
    v38 = *(void **)(v67[0] + 40);
    if (v38) {
      *a4 = v38;
    }
  }
  v39 = self->_mutatedContent;

  _Block_object_dispose(&v66, 8);

  return v39;
}

uint64_t __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke(uint64_t a1)
{
  v2 = *MEMORY[0x263F1E068];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR)) {
    __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_cold_1(a1, v2);
  }
  return [*(id *)(*(void *)(a1 + 40) + 8) _kill:9];
}

uint64_t __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_25(uint64_t result)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(result + 56) + 8) + 48), 1u) & 1) == 0)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 32);
    id v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;

    id v4 = *MEMORY[0x263F1E068];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR)) {
      __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_25_cold_1(v1, v4);
    }
    return [*(id *)(*(void *)(v1 + 32) + 8) cancelExtensionRequestWithIdentifier:*(void *)(v1 + 48)];
  }
  return result;
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_26(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)*MEMORY[0x263F1E068];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
    id v4 = v2;
    id v5 = [v3 identifier];
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    double v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entering grace time: sessionUUID=%{public}@", (uint8_t *)&v9, 0x16u);
  }
  int v7 = [*(id *)(*(void *)(a1 + 32) + 16) _auxiliaryConnection];
  id v8 = [v7 remoteObjectProxy];
  [v8 serviceExtensionTimeWillExpire];
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_27(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  [(id)objc_opt_class() _disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:a1[5]];
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(a1[7] + 8) + 48), 1u) & 1) == 0)
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
    int v7 = *MEMORY[0x263F1E068];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      int v10 = 138543874;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_error_impl(&dword_2608DB000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Service extension connection encountered an error: sessionUUID=%{public}@, error=%{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_29(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [(id)objc_opt_class() _disallowAccessToNotificationCenterForServiceExtensionWithIdentifier:a1[5]];
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(a1[7] + 8) + 48), 1u) & 1) == 0)
  {
    uint64_t v4 = [v3 copy];
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    int v7 = *MEMORY[0x263F1E068];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension delivered mutated content: sessionUUID=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)cleanUp
{
  if (self->_mutatedContent)
  {
    id v3 = [(NSExtensionContext *)self->_hostContext _auxiliaryConnection];
    uint64_t v4 = [v3 remoteObjectProxy];
    [v4 deleteAttachmentFilesInContentIfNecessary:self->_mutatedContent];

    mutatedContent = self->_mutatedContent;
    self->_mutatedContent = 0;
  }
  uint64_t v6 = [(NSExtensionContext *)self->_hostContext _auxiliaryConnection];
  int v7 = [v6 remoteObjectProxy];
  [v7 serviceExtensionPerformCleanup];

  hostContext = self->_hostContext;
  self->_hostContext = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutatedContent, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)mutateContentForNotificationRequest:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Could not start an extension session: error=%{public}@", (uint8_t *)&v4, 0x16u);
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Extension will be killed because it used its runtime in starting up", (uint8_t *)&v3, 0xCu);
}

void __77__UNCNotificationServiceExtension_mutateContentForNotificationRequest_error___block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Service extension exceeded allowed time: sessionUUID=%{public}@", (uint8_t *)&v4, 0x16u);
}

@end