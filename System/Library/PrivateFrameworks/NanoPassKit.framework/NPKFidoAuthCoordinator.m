@interface NPKFidoAuthCoordinator
- (BOOL)_isDeviceLocked;
- (BOOL)_isWristDetectDisabled;
- (LAContext)context;
- (void)clearContext;
- (void)requestAuthorizationWithCompletion:(id)a3;
@end

@implementation NPKFidoAuthCoordinator

- (void)requestAuthorizationWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x223C37380](v4);
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: request authorization with completion: %@", buf, 0xCu);
    }
  }
  if ([(NPKFidoAuthCoordinator *)self _isDeviceLocked])
  {
    v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: noting that device is locked; requesting unlock",
          buf,
          2u);
      }
    }
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1004 userInfo:0];
    (*((void (**)(id, void, uint64_t, void, id))v4 + 2))(v4, 0, 1, 0, v12);
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263F10468]);
    v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = pk_General_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v13;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: About to evaluate device owner authentication policy for context: %@", buf, 0xCu);
      }
    }
    if ([(NPKFidoAuthCoordinator *)self _isWristDetectDisabled]) {
      +[NPKAudioPlayer playWarsawHaptic];
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke;
    v17[3] = &unk_2644D6780;
    id v18 = v13;
    v19 = self;
    id v20 = v4;
    id v12 = v13;
    [v12 evaluatePolicy:1023 options:0 reply:v17];
  }
}

void __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke_2;
  v9[3] = &unk_2644D3540;
  id v10 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: Context evaluated; error: %@",
        (uint8_t *)&v12,
        0xCu);
    }
  }
  if (*(void *)(a1 + 32)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void **)(a1 + 40);
  }
  id v7 = v6;
  if ([*(id *)(a1 + 32) code] == -2)
  {
    id v8 = [*(id *)(a1 + 32) domain];
    [v8 isEqualToString:*MEMORY[0x263F10440]];
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = v7;
  id v11 = v7;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)clearContext
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      context = self->_context;
      int v8 = 138412290;
      uint64_t v9 = context;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: clearing context: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(LAContext *)self->_context invalidate];
  id v7 = self->_context;
  self->_context = 0;
}

- (BOOL)_isDeviceLocked
{
  return PKDevicePasscodeLocked() != 0;
}

- (BOOL)_isWristDetectDisabled
{
  return CFPreferencesGetAppBooleanValue(@"DisableWristDetection", @"com.apple.Carousel", 0) != 0;
}

- (LAContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end