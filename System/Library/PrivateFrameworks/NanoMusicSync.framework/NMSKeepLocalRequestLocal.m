@interface NMSKeepLocalRequestLocal
+ (id)sharedKeepLocalOperationQueue;
- (void)_performRequestWithConstraints:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)performWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NMSKeepLocalRequestLocal

+ (id)sharedKeepLocalOperationQueue
{
  if (sharedKeepLocalOperationQueue_onceToken != -1) {
    dispatch_once(&sharedKeepLocalOperationQueue_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedKeepLocalOperationQueue_sharedQueue;

  return v2;
}

uint64_t __57__NMSKeepLocalRequestLocal_sharedKeepLocalOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)sharedKeepLocalOperationQueue_sharedQueue;
  sharedKeepLocalOperationQueue_sharedQueue = (uint64_t)v0;

  [(id)sharedKeepLocalOperationQueue_sharedQueue setMaxConcurrentOperationCount:1];
  v2 = (void *)sharedKeepLocalOperationQueue_sharedQueue;

  return [v2 setName:@"com.apple.NanoMusicSync.NMSKeepLocalRequestLocal"];
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NMSKeepLocalRequest *)self enableState] + 1;
  if (v8 > 4)
  {
    v19 = (void *)MEMORY[0x263EFF940];
    uint64_t v20 = *MEMORY[0x263EFF498];
    v21 = @"Unsupported KeepLocal enable state specified.";
    goto LABEL_14;
  }
  if (v8 == 2)
  {
    if (![v6 requiresValidation])
    {
      uint64_t v18 = objc_msgSend(v6, "resolvedConstraints:", objc_msgSend(MEMORY[0x263F11F38], "nms_defaultKeepLocalConstraints"));
      uint64_t v9 = [v6 qualityOfService];
      v10 = self;
      uint64_t v11 = v18;
      goto LABEL_4;
    }
    v12 = NMLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(NMSKeepLocalRequest *)self modelObject];
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Running KeepLocal validation for modelObject: %@", buf, 0xCu);
    }
    v14 = [v6 cellularBundleIdentifier];

    if (v14)
    {
      v15 = [NMSKeepLocalRequestValidator alloc];
      v16 = [(NMSKeepLocalRequest *)self modelObject];
      v17 = [(NMSKeepLocalRequestValidator *)v15 initWithModelObject:v16];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __58__NMSKeepLocalRequestLocal_performWithOptions_completion___block_invoke;
      v23[3] = &unk_264634710;
      id v25 = v7;
      v23[4] = self;
      id v24 = v6;
      [(NMSKeepLocalRequestValidator *)v17 performWithOptions:v24 completion:v23];

      goto LABEL_5;
    }
    v19 = (void *)MEMORY[0x263EFF940];
    uint64_t v20 = *MEMORY[0x263EFF4A0];
    v21 = @"Required cellular bundle identifier missing during KeepLocalRequest validation.";
LABEL_14:
    id v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v9 = [v6 qualityOfService];
  v10 = self;
  uint64_t v11 = 0;
LABEL_4:
  [(NMSKeepLocalRequestLocal *)v10 _performRequestWithConstraints:v11 qualityOfService:v9 completion:v7];
LABEL_5:
}

uint64_t __58__NMSKeepLocalRequestLocal_performWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) qualityOfService];
    uint64_t v9 = *(void *)(a1 + 48);
    return [v7 _performRequestWithConstraints:a2 qualityOfService:v8 completion:v9];
  }
}

- (void)_performRequestWithConstraints:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = NMLogForCategory(5);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = [(NMSKeepLocalRequest *)self enableState];
    uint64_t v11 = [(NMSKeepLocalRequest *)self modelObject];
    *(_DWORD *)buf = 134218498;
    int64_t v25 = v10;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    __int16 v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Proceeding with KeepLocal request with state: %ld, constraints: %ld, modelObject: %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F11F38]);
  v13 = [(NMSKeepLocalRequest *)self modelObject];
  [v12 setModelObject:v13];

  objc_msgSend(v12, "setEnableState:", -[NMSKeepLocalRequest enableState](self, "enableState"));
  [v12 setConstraints:a3];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke;
  v21[3] = &unk_264633E68;
  id v14 = v12;
  id v22 = v14;
  id v23 = v8;
  id v15 = v8;
  v16 = (void *)[v14 newOperationWithResponseHandler:v21];
  [v16 setQualityOfService:a4];
  v17 = NMLogForCategory(5);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(NMSKeepLocalRequest *)self modelObject];
    *(_DWORD *)buf = 138412546;
    int64_t v25 = (int64_t)v16;
    __int16 v26 = 2112;
    unint64_t v27 = (unint64_t)v18;
    _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Adding KeepLocal operation(%@) for modelObject=%@", buf, 0x16u);
  }
  v19 = [(id)objc_opt_class() sharedKeepLocalOperationQueue];
  [v19 addOperation:v16];
  id v20 = v14;
  AnalyticsSendEventLazy();
}

void __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = NMLogForCategory(5);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke_cold_1(a1, v5);
    }

    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08608];
    v18[0] = v3;
    v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v7 = [v6 errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:0 userInfo:v5];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) enableState];
      uint64_t v9 = [*(id *)(a1 + 32) constraints];
      int64_t v10 = [*(id *)(a1 + 32) modelObject];
      int v11 = 134218498;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Successfully set KeepLocal state: %ld with constraints: %ld for modelObject: %@", (uint8_t *)&v11, 0x20u);
    }
    id v7 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke_18(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"constraints";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "constraints"));
  v6[1] = @"enableState";
  v7[0] = v2;
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "enableState"));
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) enableState];
  uint64_t v5 = [*(id *)(a1 + 32) constraints];
  id v6 = [*(id *)(a1 + 32) modelObject];
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[NMSKeepLocalRequestLocal] Error setting KeepLocal state: %ld with constraints: %ld for modelObject: %@", (uint8_t *)&v7, 0x20u);
}

@end