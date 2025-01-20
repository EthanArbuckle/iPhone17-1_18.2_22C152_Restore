@interface UNSApplicationLauncher
- (UNSApplicationLauncher)initWithLocationMonitor:(id)a3;
- (id)_queue_actionForNotificationResponse:(id)a3 bundleIdentifier:(id)a4 withHandler:(id)a5;
- (id)_queue_actionForNotificationResponse:(id)a3 bundleIdentifier:(id)a4 withHandler:(id)a5 error:(id *)a6;
- (id)_queue_foregroundLaunchOptionsForApplication:(id)a3 withResponse:(id)a4 actionIdentifier:(id)a5 launchImageName:(id)a6 origin:(id)a7 error:(id *)a8;
- (id)_queue_newProcessAssertionForBundleID:(id)a3 PID:(int)a4 flags:(unsigned int)a5 reason:(unsigned int)a6 name:(id)a7 watchdogInterval:(double)a8 acquisitionHandler:(id)a9 invalidationHandler:(id)a10;
- (void)_queue_acquireActivityKitAssertionIfNeededForBundleIdentifier:(id)a3 withResponse:(id)a4;
- (void)_queue_addProcessAssertion:(id)a3 forBundleID:(id)a4;
- (void)_queue_backgroundLaunchApplication:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)_queue_foregroundLaunchApplication:(id)a3 withOptions:(id)a4 responseActionIdentifier:(id)a5 endpoint:(id)a6 completionHandler:(id)a7;
- (void)_queue_removeAllProcessAssertionsAndInvalidate:(BOOL)a3;
- (void)_queue_removeProcessAssertion:(id)a3 forBundleID:(id)a4 invalidate:(BOOL)a5;
- (void)_queue_removeProcessAssertionsHavingReason:(unsigned int)a3 forBundleID:(id)a4 invalidate:(BOOL)a5;
- (void)_queue_willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_removeAllProcessAssertionsAndInvalidate:(BOOL)a3;
- (void)backgroundLaunchApplication:(id)a3 withResponse:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)foregroundLaunchApplication:(id)a3 withResponse:(id)a4 launchImageName:(id)a5 origin:(id)a6 endpoint:(id)a7 completionHandler:(id)a8;
- (void)foregroundLaunchOptionsForApplication:(id)a3 withResponse:(id)a4 launchImageName:(id)a5 origin:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNSApplicationLauncher

- (UNSApplicationLauncher)initWithLocationMonitor:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UNSApplicationLauncher;
  v6 = [(UNSApplicationLauncher *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationMonitor, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifierToAssertions = v7->_bundleIdentifierToAssertions;
    v7->_bundleIdentifierToAssertions = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.usernotificationsserver.UNSApplicationLauncher", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)dealloc
{
  [(UNSApplicationLauncher *)self _removeAllProcessAssertionsAndInvalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)UNSApplicationLauncher;
  [(UNSApplicationLauncher *)&v3 dealloc];
}

- (void)foregroundLaunchApplication:(id)a3 withResponse:(id)a4 launchImageName:(id)a5 origin:(id)a6 endpoint:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__UNSApplicationLauncher_foregroundLaunchApplication_withResponse_launchImageName_origin_endpoint_completionHandler___block_invoke;
  block[3] = &unk_26462FD88;
  id v28 = v15;
  v29 = self;
  id v30 = v14;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v14;
  id v26 = v15;
  dispatch_async(queue, block);
}

void __117__UNSApplicationLauncher_foregroundLaunchApplication_withResponse_launchImageName_origin_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) actionIdentifier];
  v2 = objc_msgSend(*(id *)(a1 + 40), "_queue_foregroundLaunchOptionsForApplication:withResponse:actionIdentifier:launchImageName:origin:error:", *(void *)(a1 + 48), *(void *)(a1 + 32), v3, *(void *)(a1 + 56), *(void *)(a1 + 64), 0);
  objc_msgSend(*(id *)(a1 + 40), "_queue_foregroundLaunchApplication:withOptions:responseActionIdentifier:endpoint:completionHandler:", *(void *)(a1 + 48), v2, v3, *(void *)(a1 + 72), *(void *)(a1 + 80));
}

- (void)foregroundLaunchOptionsForApplication:(id)a3 withResponse:(id)a4 launchImageName:(id)a5 origin:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke;
  block[3] = &unk_26462FD88;
  id v28 = v15;
  v29 = self;
  id v30 = v14;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v14;
  id v26 = v15;
  dispatch_async(queue, block);
}

void __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionIdentifier];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v18 = 0;
  v8 = objc_msgSend(v3, "_queue_foregroundLaunchOptionsForApplication:withResponse:actionIdentifier:launchImageName:origin:error:", v5, v4, v2, v6, v7, &v18);
  id v9 = v18;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke_2;
  v14[3] = &unk_26462FDB0;
  v10 = *(NSObject **)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  id v16 = v9;
  id v17 = v11;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, v14);
}

uint64_t __124__UNSApplicationLauncher_foregroundLaunchOptionsForApplication_withResponse_launchImageName_origin_queue_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_queue_foregroundLaunchOptionsForApplication:(id)a3 withResponse:(id)a4 actionIdentifier:(id)a5 launchImageName:(id)a6 origin:(id)a7 error:(id *)a8
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v32 = a6;
  id v17 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v18 = [v15 notification];
  id v19 = [v18 request];
  v20 = [v19 content];
  id v21 = [v20 targetContentIdentifier];

  id v22 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v38 = v14;
    __int16 v39 = 2114;
    id v40 = v16;
    _os_log_impl(&dword_22289A000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launch application in foreground for notification response action %{public}@", buf, 0x16u);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __130__UNSApplicationLauncher__queue_foregroundLaunchOptionsForApplication_withResponse_actionIdentifier_launchImageName_origin_error___block_invoke;
  v33[3] = &unk_26462FDD8;
  id v23 = v14;
  id v34 = v23;
  id v24 = v16;
  id v35 = v24;
  id v25 = [(UNSApplicationLauncher *)self _queue_actionForNotificationResponse:v15 bundleIdentifier:v23 withHandler:v33 error:a8];
  if (v25)
  {
    id v26 = [MEMORY[0x263EFF9A0] dictionary];
    v36 = v25;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v27, *MEMORY[0x263F3F580]);

    id v28 = v32;
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v32, *MEMORY[0x263F3F5A8]);
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v17, *MEMORY[0x263F3F5C0]);
    uint64_t v29 = MEMORY[0x263EFFA88];
    objc_msgSend(v26, "bs_setSafeObject:forKey:", MEMORY[0x263EFFA88], *MEMORY[0x263F3F5E8]);
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v29, *MEMORY[0x263F3F608]);
    objc_msgSend(v26, "bs_setSafeObject:forKey:", v21, *MEMORY[0x263F83EA0]);
    id v30 = [MEMORY[0x263F3F778] optionsWithDictionary:v26];
  }
  else
  {
    id v30 = 0;
    id v28 = v32;
  }

  return v30;
}

void __130__UNSApplicationLauncher__queue_foregroundLaunchOptionsForApplication_withResponse_actionIdentifier_launchImageName_origin_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application foreground launch action for notification response action %{public}@ recieved action response %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_queue_foregroundLaunchApplication:(id)a3 withOptions:(id)a4 responseActionIdentifier:(id)a5 endpoint:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (v12)
  {
    if (v14) {
      [MEMORY[0x263F3F790] serviceWithEndpoint:v14];
    }
    else {
    id v17 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke;
    v18[3] = &unk_26462FE00;
    id v19 = v11;
    id v20 = v13;
    id v21 = v16;
    [v17 openApplication:v19 withOptions:v12 completion:v18];
  }
  else if (v15)
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

void __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = *MEMORY[0x263F1DFE8];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
      __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = 0;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foreground application launch succeeed for action response %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v6 == 0);
  }
}

- (void)backgroundLaunchApplication:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] backgroundLaunchApplication: response: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__UNSApplicationLauncher_backgroundLaunchApplication_withResponse_completionHandler___block_invoke;
  v16[3] = &unk_26462FD38;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

uint64_t __85__UNSApplicationLauncher_backgroundLaunchApplication_withResponse_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_acquireActivityKitAssertionIfNeededForBundleIdentifier:withResponse:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return objc_msgSend(v2, "_queue_backgroundLaunchApplication:withResponse:completionHandler:", v3, v4, v5);
}

- (void)_queue_acquireActivityKitAssertionIfNeededForBundleIdentifier:(id)a3 withResponse:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 actionIdentifier];
  char v8 = [v7 isEqualToString:*MEMORY[0x263F1E0D0]];

  if ((v8 & 1) == 0)
  {
    id v9 = (NSObject **)MEMORY[0x263F1DFE8];
    id v10 = (void *)*MEMORY[0x263F1DFE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      uint64_t v12 = [v6 actionIdentifier];
      int v25 = 138543618;
      id v26 = v5;
      __int16 v27 = 2114;
      id v28 = v12;
      _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to acquire live activity assertion for notification response with action identifier %{public}@.", (uint8_t *)&v25, 0x16u);
    }
    id v13 = (void *)[objc_alloc(MEMORY[0x263F67E08]) initWithBundleIdentifier:v5];
    id v14 = (void *)[objc_alloc(MEMORY[0x263F67E00]) initWithExplanation:@"Background Launch App To Launch Live Activity from Notification" target:v13 invalidationHandler:0];
    uint64_t v15 = [v14 state];
    uint64_t v16 = *v9;
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15 == 1)
    {
      if (v17)
      {
        id v18 = v16;
        id v19 = [v6 actionIdentifier];
        uint64_t v20 = [v14 state];
        uint64_t v21 = [v14 invalidationReason];
        int v25 = 138544130;
        id v26 = v5;
        __int16 v27 = 2114;
        id v28 = v19;
        __int16 v29 = 2050;
        uint64_t v30 = v20;
        __int16 v31 = 2050;
        uint64_t v32 = v21;
        __int16 v22 = "[%{public}@] Successfully to acquired live activity assertion for notification response with action identi"
              "fier %{public}@. SNAAssertionState=%{public}lu SNAInvalidationReason=%{public}lu";
        id v23 = v18;
        uint32_t v24 = 42;
LABEL_9:
        _os_log_impl(&dword_22289A000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, v24);
      }
    }
    else if (v17)
    {
      id v18 = v16;
      id v19 = [v6 actionIdentifier];
      int v25 = 138543618;
      id v26 = v5;
      __int16 v27 = 2114;
      id v28 = v19;
      __int16 v22 = "[%{public}@] Failed to acquire live activity assertion for notification response with action identifier %{public}@.";
      id v23 = v18;
      uint32_t v24 = 22;
      goto LABEL_9;
    }
  }
}

- (void)_queue_backgroundLaunchApplication:(id)a3 withResponse:(id)a4 completionHandler:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v26 = a5;
  id v10 = [v9 actionIdentifier];
  int v11 = (os_log_t *)MEMORY[0x263F1DFE8];
  uint64_t v12 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launch application in background for notification response %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  objc_initWeak(&location, self);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke;
  v32[3] = &unk_26462FE50;
  v32[4] = self;
  id v13 = v8;
  id v33 = v13;
  id v14 = v10;
  id v34 = v14;
  int v25 = &v36;
  objc_copyWeak(&v36, &location);
  id v35 = buf;
  uint64_t v15 = [(UNSApplicationLauncher *)self _queue_actionForNotificationResponse:v9 bundleIdentifier:v13 withHandler:v32];
  uint64_t v16 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v39 = 138543618;
    id v40 = v13;
    __int16 v41 = 2112;
    v42 = v15;
    _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launch application in background for notification response: %@", v39, 0x16u);
  }
  if (v15)
  {
    BOOL v17 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", &v36);
    id v38 = v15;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v18, *MEMORY[0x263F3F580]);

    objc_msgSend(v17, "bs_setSafeObject:forKey:", MEMORY[0x263EFFA88], *MEMORY[0x263F3F598]);
    id v19 = [v9 notification];
    uint64_t v20 = [v19 request];
    uint64_t v21 = [v20 content];
    __int16 v22 = [v21 targetContentIdentifier];

    objc_msgSend(v17, "bs_setSafeObject:forKey:", v22, *MEMORY[0x263F83EA0]);
    id v23 = [MEMORY[0x263F3F778] optionsWithDictionary:v17];
    uint32_t v24 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_12;
    v27[3] = &unk_26462FEA0;
    v27[4] = self;
    id v28 = v13;
    id v29 = v14;
    __int16 v31 = buf;
    id v30 = v26;
    [v24 openApplication:v28 withOptions:v23 completion:v27];
  }
  else if (v26)
  {
    (*((void (**)(id, void))v26 + 2))(v26, 0);
  }

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2;
  block[3] = &unk_26462FE28;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  uint64_t v10 = *(void *)(a1 + 56);
  dispatch_async(v4, block);
  objc_destroyWeak(&v11);
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application background launch action for notification response action %{public}@ recieved action response %{public}@", (uint8_t *)&v7, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_queue_removeProcessAssertion:forBundleID:invalidate:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(a1 + 32), 1);
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13;
  block[3] = &unk_26462FE78;
  id v15 = v6;
  id v16 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v9;
  id v19 = v5;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v10 = (id)v13;
  long long v20 = v13;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, block);
}

uint64_t __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *MEMORY[0x263F1DFE8];
  uint64_t v4 = *MEMORY[0x263F1DFE8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Background application launch succeeded for action response %{public}@", buf, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 56);
    uint64_t v9 = [*(id *)(a1 + 64) pid];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_17;
    v14[3] = &unk_26462F430;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    uint64_t v10 = objc_msgSend(v8, "_queue_newProcessAssertionForBundleID:PID:flags:reason:name:watchdogInterval:acquisitionHandler:invalidationHandler:", v7, v9, 33, 10007, @"background notification action", 0, 0.0, v14);
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(a1 + 56), "_queue_removeProcessAssertionsHavingReason:forBundleID:invalidate:", 10007, *(void *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 56), "_queue_addProcessAssertion:forBundleID:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void *)(a1 + 40));
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 0);
  }
  return result;
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Assertion acquired for application background launch action for notification response action %{public}@ was invalidated", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_queue_actionForNotificationResponse:(id)a3 bundleIdentifier:(id)a4 withHandler:(id)a5
{
  return [(UNSApplicationLauncher *)self _queue_actionForNotificationResponse:a3 bundleIdentifier:a4 withHandler:a5 error:0];
}

- (id)_queue_actionForNotificationResponse:(id)a3 bundleIdentifier:(id)a4 withHandler:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [v10 notification];
  id v14 = [v13 request];
  id v15 = [v14 trigger];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0
    && ([(UNCLocationMonitor *)self->_locationMonitor isBundleIdentifierAuthorizedForRegionMonitoring:v11] & 1) == 0)
  {
    uint64_t v20 = (void *)*MEMORY[0x263F1DFE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v20;
      __int16 v22 = [v10 actionIdentifier];
      *(_DWORD *)buf = 138543618;
      id v30 = v11;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      _os_log_impl(&dword_22289A000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppressing response action %{public}@ because app does not have location authorization.", buf, 0x16u);
    }
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:0];
      uint64_t v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x263F1C818]);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __98__UNSApplicationLauncher__queue_actionForNotificationResponse_bundleIdentifier_withHandler_error___block_invoke;
    v23[3] = &unk_26462FEC8;
    id v24 = v11;
    char v28 = isKindOfClass & 1;
    id v25 = v10;
    id v26 = self;
    id v27 = v12;
    uint64_t v18 = (void *)[v17 initWithResponse:v25 withHandler:v23];
  }
  return v18;
}

void __98__UNSApplicationLauncher__queue_actionForNotificationResponse_bundleIdentifier_withHandler_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)*MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v5 = *(void **)(a1 + 40);
    __int16 v7 = v4;
    uint64_t v8 = [v5 actionIdentifier];
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    long long v13 = v8;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] UINotificationResponseAction %{public}@ withHandler called", (uint8_t *)&v10, 0x16u);
  }
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(*(void *)(a1 + 48) + 8) markAsHavingReceivedLocation];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __92__UNSApplicationLauncher_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_26462FD38;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __92__UNSApplicationLauncher_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_willPresentNotification:forBundleIdentifier:withCompletionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_queue_willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v29 = v8;
  uint64_t v11 = [v8 request];
  id v12 = [v11 trigger];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UNCLocationMonitor *)self->_locationMonitor markAsHavingReceivedLocation];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 isContentAvailable] ^ 1;
      goto LABEL_6;
    }
  }
  uint64_t v13 = 1;
LABEL_6:
  id v14 = (void *)*MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    id v16 = [v11 identifier];
    id v17 = objc_msgSend(v16, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Send willPresentNotification for notification %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  id v49 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  objc_initWeak(&location, self);
  id v18 = objc_alloc(MEMORY[0x263F1CBB8]);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
  v35[3] = &unk_26462FF18;
  v35[4] = self;
  id v19 = v9;
  id v36 = v19;
  id v20 = v11;
  id v37 = v20;
  __int16 v39 = v43;
  id v40 = buf;
  objc_copyWeak(&v41, &location);
  id v21 = v10;
  id v38 = v21;
  __int16 v22 = (void *)[v18 initWithNotification:v29 deliverable:v13 timeout:v35 withHandler:30.0];
  id v23 = [MEMORY[0x263EFF9A0] dictionary];
  v45 = v22;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  objc_msgSend(v23, "bs_setSafeObject:forKey:", v24, *MEMORY[0x263F3F580]);

  objc_msgSend(v23, "bs_setSafeObject:forKey:", MEMORY[0x263EFFA88], *MEMORY[0x263F3F598]);
  id v25 = [MEMORY[0x263F3F778] optionsWithDictionary:v23];
  id v26 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_24;
  v30[3] = &unk_26462FF68;
  v30[4] = self;
  id v27 = v19;
  id v31 = v27;
  id v28 = v20;
  id v32 = v28;
  uint64_t v33 = v43;
  id v34 = buf;
  [v26 openApplication:v27 withOptions:v25 completion:v30];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  block[3] = &unk_26462FEF0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 64);
  id v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 80));
  id v10 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

  objc_destroyWeak(&v12);
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_opt_class();
  uint64_t v2 = UNSafeCast();
  uint64_t v3 = [v2 options];
  uint64_t v4 = (void *)*MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v7 = v4;
    id v8 = [v5 identifier];
    id v9 = objc_msgSend(v8, "un_logDigest");
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received response %ld for willPresentNotification for notification %{public}@", (uint8_t *)&v12, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "_queue_removeProcessAssertion:forBundleID:invalidate:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(a1 + 40), 1);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, v3, 0);
  }
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_25;
  block[3] = &unk_26462FF40;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_25(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = (uint64_t *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = (os_log_t *)MEMORY[0x263F1DFE8];
  id v5 = (void *)*MEMORY[0x263F1DFE8];
  id v6 = *MEMORY[0x263F1DFE8];
  if (v2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_25_cold_1(a1, v5, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v7 = *(void **)(a1 + 48);
      uint64_t v9 = v5;
      id v10 = [v7 identifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] willPresentNotification delivery succeeded for notification %{public}@", buf, 0x16u);
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      os_log_t v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        id v13 = *(void **)(a1 + 48);
        id v15 = v12;
        uint64_t v16 = [v13 identifier];
        id v17 = objc_msgSend(v16, "un_logDigest");
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v14;
        __int16 v29 = 2114;
        id v30 = v17;
        _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already received response; not acquiring assertion for willPresentNotification for notification %{public}@",
          buf,
          0x16u);
      }
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 40);
      id v19 = *(void **)(a1 + 56);
      uint64_t v20 = [*(id *)(a1 + 64) pid];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_29;
      v24[3] = &unk_26462F430;
      id v25 = *(id *)(a1 + 40);
      id v26 = *(id *)(a1 + 48);
      uint64_t v21 = objc_msgSend(v19, "_queue_newProcessAssertionForBundleID:PID:flags:reason:name:watchdogInterval:acquisitionHandler:invalidationHandler:", v18, v20, 33, 10007, @"will present notification", 0, 0.0, v24);
      uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      objc_msgSend(*(id *)(a1 + 56), "_queue_removeProcessAssertionsHavingReason:forBundleID:invalidate:", 10007, *(void *)(a1 + 40), 1);
      objc_msgSend(*(id *)(a1 + 56), "_queue_addProcessAssertion:forBundleID:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void *)(a1 + 40));
    }
  }
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)*MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    id v5 = v2;
    id v6 = [v3 identifier];
    id v7 = objc_msgSend(v6, "un_logDigest");
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Assertion acquired for willPresentNotification for notification %{public}@ was invalidated", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_queue_newProcessAssertionForBundleID:(id)a3 PID:(int)a4 flags:(unsigned int)a5 reason:(unsigned int)a6 name:(id)a7 watchdogInterval:(double)a8 acquisitionHandler:(id)a9 invalidationHandler:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_queue);
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__3;
  v73 = __Block_byref_object_dispose__3;
  id v74 = 0;
  uint64_t v63 = 0;
  v64 = (id *)&v63;
  uint64_t v65 = 0x3042000000;
  v66 = __Block_byref_object_copy__30;
  v67 = __Block_byref_object_dispose__31;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__3;
  v61 = __Block_byref_object_dispose__3;
  id v62 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3810000000;
  v55[3] = "";
  char v56 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke;
  aBlock[3] = &unk_26462FFB8;
  uint64_t v50 = v55;
  objc_copyWeak(&v53, &from);
  id v37 = v16;
  id v47 = v37;
  id v20 = v17;
  id v48 = v20;
  v51 = &v63;
  objc_copyWeak(&v54, &location);
  v52 = &v57;
  id v35 = v19;
  id v49 = v35;
  uint64_t v21 = _Block_copy(aBlock);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_32;
  v42[3] = &unk_26462FFE0;
  id v22 = v18;
  id v43 = v22;
  id v23 = v21;
  id v44 = v23;
  v45 = &v57;
  id v24 = _Block_copy(v42);
  uint64_t v25 = [objc_alloc(MEMORY[0x263F298A0]) initWithPID:v14 flags:v13 reason:a6 name:v20 withHandler:v24];
  id v26 = (void *)v70[5];
  v70[5] = v25;

  [(id)v70[5] setInvalidationHandler:v23];
  objc_storeWeak(v64 + 5, (id)v70[5]);
  if (a8 > 0.0)
  {
    dispatch_source_t v27 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    uint64_t v28 = (void *)v58[5];
    v58[5] = (uint64_t)v27;

    __int16 v29 = v58[5];
    dispatch_time_t v30 = dispatch_time(0, (uint64_t)(a8 * 1000000000.0));
    dispatch_source_set_timer(v29, v30, 0, 0);
    uint64_t v31 = v58[5];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2_35;
    handler[3] = &unk_264630008;
    id v40 = &v57;
    id v41 = &v69;
    id v39 = v23;
    dispatch_source_set_event_handler(v31, handler);
  }
  id v32 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v78 = v37;
    __int16 v79 = 2114;
    id v80 = v20;
    _os_log_impl(&dword_22289A000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Created process assertion for %{public}@ ", buf, 0x16u);
  }
  id v33 = (id)v70[5];

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v53);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  objc_destroyWeak(&v68);
  _Block_object_dispose(&v69, 8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v33;
}

void __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 48), 1u) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2;
    v5[3] = &unk_26462FF90;
    id v6 = *(id *)(a1 + 32);
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 64);
    id v7 = v3;
    uint64_t v9 = v4;
    objc_copyWeak(&v11, (id *)(a1 + 88));
    uint64_t v10 = *(void *)(a1 + 72);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(WeakRetained, v5);

    objc_destroyWeak(&v11);
  }
}

void __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated process assertion for %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v6, "_queue_removeProcessAssertion:forBundleID:invalidate:", WeakRetained, *(void *)(a1 + 32), 0);
  }
  id v7 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v7)
  {
    dispatch_source_cancel(v7);
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

void __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_32(void *a1, uint64_t a2)
{
  char v2 = a2;
  uint64_t v4 = a1[4];
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  if (v2)
  {
    id v5 = *(NSObject **)(*(void *)(a1[6] + 8) + 40);
    if (v5)
    {
      dispatch_resume(v5);
    }
  }
  else
  {
    id v6 = *(void (**)(void))(a1[5] + 16);
    v6();
  }
}

uint64_t __142__UNSApplicationLauncher__queue_newProcessAssertionForBundleID_PID_flags_reason_name_watchdogInterval_acquisitionHandler_invalidationHandler___block_invoke_2_35(void *a1)
{
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
  uint64_t v4 = *(uint64_t (**)(void))(a1[4] + 16);
  return v4();
}

- (void)_queue_addProcessAssertion:(id)a3 forBundleID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    id v7 = [(NSMutableDictionary *)self->_bundleIdentifierToAssertions objectForKey:v6];
    if (!v7)
    {
      id v7 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_bundleIdentifierToAssertions setObject:v7 forKey:v6];
    }
    [v7 addObject:v8];
  }
}

- (void)_queue_removeProcessAssertion:(id)a3 forBundleID:(id)a4 invalidate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    int v11 = [(NSMutableDictionary *)self->_bundleIdentifierToAssertions objectForKey:v9];
    if ([v11 containsObject:v8])
    {
      uint64_t v12 = (void *)*MEMORY[0x263F1DFE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = v12;
        uint64_t v14 = [v8 name];
        int v15 = 138543618;
        id v16 = v10;
        __int16 v17 = 2114;
        id v18 = v14;
        _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing process assertion for %{public}@", (uint8_t *)&v15, 0x16u);
      }
      [v11 removeObject:v8];
      if (![v11 count]) {
        [(NSMutableDictionary *)self->_bundleIdentifierToAssertions removeObjectForKey:v10];
      }
      if (v5) {
        [v8 invalidate];
      }
    }
  }
}

- (void)_queue_removeProcessAssertionsHavingReason:(unsigned int)a3 forBundleID:(id)a4 invalidate:(BOOL)a5
{
  id v8 = a4;
  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_bundleIdentifierToAssertions objectForKey:v8];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__UNSApplicationLauncher__queue_removeProcessAssertionsHavingReason_forBundleID_invalidate___block_invoke;
    v14[3] = &__block_descriptor_37_e29__16__0__BKSProcessAssertion_8l;
    unsigned int v15 = a3;
    BOOL v16 = a5;
    uint64_t v10 = objc_msgSend(v9, "bs_mapNoNulls:", v14);
    uint64_t v11 = [v10 count];
    bundleIdentifierToAssertions = self->_bundleIdentifierToAssertions;
    if (v11)
    {
      __int16 v13 = (void *)[v10 mutableCopy];
      [(NSMutableDictionary *)bundleIdentifierToAssertions setObject:v13 forKey:v8];
    }
    else
    {
      [(NSMutableDictionary *)bundleIdentifierToAssertions removeObjectForKey:v8];
    }
  }
}

id __92__UNSApplicationLauncher__queue_removeProcessAssertionsHavingReason_forBundleID_invalidate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 reason] == *(_DWORD *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 36)) {
      [v3 invalidate];
    }
    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (void)_removeAllProcessAssertionsAndInvalidate:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__UNSApplicationLauncher__removeAllProcessAssertionsAndInvalidate___block_invoke;
  v4[3] = &unk_264630050;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __67__UNSApplicationLauncher__removeAllProcessAssertionsAndInvalidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllProcessAssertionsAndInvalidate:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_removeAllProcessAssertionsAndInvalidate:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [(NSMutableDictionary *)self->_bundleIdentifierToAssertions allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * v14++) invalidate];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
  [(NSMutableDictionary *)self->_bundleIdentifierToAssertions removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToAssertions, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
}

void __125__UNSApplicationLauncher__queue_foregroundLaunchApplication_withOptions_responseActionIdentifier_endpoint_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_22289A000, v0, v1, "[%{public}@] Foreground application launch failed for action response %{public}@: %{public}@");
}

void __92__UNSApplicationLauncher__queue_backgroundLaunchApplication_withResponse_completionHandler___block_invoke_2_13_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_22289A000, v0, v1, "[%{public}@] Background application launch failed for action response %{public}@: %{public}@");
}

void __99__UNSApplicationLauncher__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke_2_25_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  uint64_t v6 = a2;
  uint64_t v7 = [v4 identifier];
  uint64_t v8 = objc_msgSend(v7, "un_logDigest");
  uint64_t v9 = *a3;
  int v10 = 138543874;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  uint64_t v13 = v8;
  __int16 v14 = 2114;
  uint64_t v15 = v9;
  _os_log_error_impl(&dword_22289A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] willPresentNotification delivery failed for notification %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
}

@end