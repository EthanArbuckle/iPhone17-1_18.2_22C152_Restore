@interface TUIKTAppIntentsData
- (KTStatus)ktStatus;
- (TUIKTAppIntentsData)init;
- (TUIKTStateManager)stateManager;
- (void)init;
- (void)publicVerificationCodeWithCompletion:(id)a3;
- (void)setKtStatus:(id)a3;
- (void)setStateManager:(id)a3;
- (void)statusWithCompletion:(id)a3;
@end

@implementation TUIKTAppIntentsData

- (TUIKTAppIntentsData)init
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_19);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTAppIntentsData init]();
  }
  v10.receiver = self;
  v10.super_class = (Class)TUIKTAppIntentsData;
  v3 = [(TUIKTAppIntentsData *)&v10 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    stateManager = v3->_stateManager;
    v3->_stateManager = (TUIKTStateManager *)v4;

    id v6 = objc_alloc(MEMORY[0x263F80D38]);
    uint64_t v7 = [v6 initWithApplication:*MEMORY[0x263F80D78]];
    ktStatus = v3->_ktStatus;
    v3->_ktStatus = (KTStatus *)v7;
  }
  return v3;
}

uint64_t __27__TUIKTAppIntentsData_init__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)statusWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_5_1);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTAppIntentsData statusWithCompletion:]();
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_8_0);
  }
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[TUIKTAppIntentsData statusWithCompletion:]";
    __int16 v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEFAULT, "%s getting CKV status on %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v6 = dispatch_get_global_queue(33, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_9;
  v8[3] = &unk_265553528;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

uint64_t __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_6()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained ktStatus];
    id v20 = 0;
    v5 = [v4 status:&v20];
    id v6 = v20;

    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_19);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[TUIKTAppIntentsData statusWithCompletion:]_block_invoke_2";
      __int16 v23 = 2114;
      v24 = v5;
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2114;
      v28 = v3;
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "%s got CKV status = %{public}@, error = %{public}@ on %{public}@", buf, 0x2Au);
    }
    v8 = [v3 stateManager];
    [v8 updateStateWithKTStatusResult:v5];

    id v9 = [v3 stateManager];
    id v10 = [v9 stateLabel];

    if (![v10 length])
    {
      v11 = [v3 stateManager];
      if ([v11 optIn] == 1)
      {
        __int16 v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v13 = [v12 localizedStringForKey:@"CKV_STATUS_ENABLED" value:&stru_270C3F140 table:@"Localizable"];
      }
      else
      {
        __int16 v12 = [v3 stateManager];
        uint64_t v16 = [v12 optIn];
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        if (v16) {
          v19 = @"CKV_STATUS_PENDING";
        }
        else {
          v19 = @"CKV_STATUS_DISABLED";
        }
        uint64_t v13 = [v17 localizedStringForKey:v19 value:&stru_270C3F140 table:@"Localizable"];

        id v10 = v18;
      }

      id v10 = (void *)v13;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_11);
    }
    uint64_t v14 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[TUIKTAppIntentsData statusWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v14, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-120 description:@"object deallocated"];
    (*(void (**)(uint64_t, __CFString *, id))(v15 + 16))(v15, &stru_270C3F140, v6);
  }
}

uint64_t __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_17()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)publicVerificationCodeWithCompletion:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_34_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTAppIntentsData publicVerificationCodeWithCompletion:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_35;
  block[3] = &unk_265553528;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained ktStatus];
    id v19 = 0;
    v5 = [v4 status:&v19];
    id v6 = v19;

    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_40_2);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[TUIKTAppIntentsData publicVerificationCodeWithCompletion:]_block_invoke_2";
      __int16 v22 = 2114;
      __int16 v23 = v5;
      __int16 v24 = 2114;
      id v25 = v6;
      __int16 v26 = 2114;
      __int16 v27 = v3;
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "%s got CKV status = %{public}@, error = %{public}@ on %{public}@", buf, 0x2Au);
    }
    id v8 = [v3 stateManager];
    [v8 updateStateWithKTStatusResult:v5];

    id v9 = [MEMORY[0x263F80D00] accountPublicID:*MEMORY[0x263F80D78]];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"VERIFICATION_CODE_NOT_AVAILABLE" value:&stru_270C3F140 table:@"Localizable"];

    __int16 v12 = [v3 stateManager];
    if ([v12 optIn] == 1)
    {
      uint64_t v13 = [v9 publicAccountIdentity];
      uint64_t v14 = (void *)v13;
      if (v13) {
        uint64_t v15 = (void *)v13;
      }
      else {
        uint64_t v15 = v11;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = v11;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_37_0);
    }
    v17 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[TUIKTAppIntentsData publicVerificationCodeWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v17, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-120 description:@"object deallocated"];
    (*(void (**)(uint64_t, __CFString *, id))(v18 + 16))(v18, &stru_270C3F140, v6);
  }
}

uint64_t __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_38()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (KTStatus)ktStatus
{
  return self->_ktStatus;
}

- (void)setKtStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktStatus, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)statusWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)publicVerificationCodeWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

@end