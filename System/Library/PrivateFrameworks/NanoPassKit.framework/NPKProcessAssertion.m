@interface NPKProcessAssertion
+ (id)acquireBackgroundTaskAssertionWithExplanation:(id)a3 acquiredHandler:(id)a4 invalidationHandler:(id)a5;
+ (void)invalidateAssertion:(id)a3;
@end

@implementation NPKProcessAssertion

+ (id)acquireBackgroundTaskAssertionWithExplanation:(id)a3 acquiredHandler:(id)a4 invalidationHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = NPKMyPid();
  id v11 = objc_alloc(MEMORY[0x263F28180]);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke;
  v21[3] = &unk_2644D2E30;
  id v12 = v7;
  int v24 = v10;
  id v22 = v12;
  id v23 = v8;
  id v13 = v8;
  v14 = (void *)[v11 initWithPID:v10 flags:1 reason:4 name:v12 withHandler:v21];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke_11;
  v18[3] = &unk_2644D2E58;
  id v19 = v12;
  id v20 = v9;
  id v15 = v9;
  id v16 = v12;
  [v14 setInvalidationHandler:v18];

  return v14;
}

uint64_t __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = pk_Payment_log();
  v5 = v4;
  if (a2)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (!v6) {
      goto LABEL_10;
    }
    id v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(_DWORD *)(a1 + 48);
    int v17 = 138412546;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v9;
    uint64_t v10 = "Notice: Acquired process assertion for %@ event with %d.";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (!v13) {
    goto LABEL_10;
  }
  id v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(_DWORD *)(a1 + 48);
    int v17 = 138412546;
    uint64_t v18 = v14;
    __int16 v19 = 1024;
    int v20 = v15;
    uint64_t v10 = "Error: Failed to acquire process assertion for %@ event: %d.";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v11, v12, v10, (uint8_t *)&v17, 0x12u);
  }
LABEL_9:

LABEL_10:
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Invalidated process assertion for %@ event.", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)invalidateAssertion:(id)a3
{
}

@end