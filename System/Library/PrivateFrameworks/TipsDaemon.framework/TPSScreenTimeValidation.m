@interface TPSScreenTimeValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSScreenTimeValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v5 = (void *)getSTManagementStateClass_softClass;
  uint64_t v26 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getSTManagementStateClass_block_invoke;
    v22[3] = &unk_1E6E6AE20;
    v22[4] = &v23;
    __getSTManagementStateClass_block_invoke((uint64_t)v22);
    v5 = (void *)v24[3];
  }
  v6 = v5;
  _Block_object_dispose(&v23, 8);
  id v19 = objc_alloc_init(v6);
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v4[2](v4, 0, v8);

    v7 = (void *)v15[5];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__TPSScreenTimeValidation_validateWithCompletion___block_invoke;
  v10[3] = &unk_1E6E6C288;
  v12 = v20;
  v10[4] = self;
  v9 = v4;
  id v11 = v9;
  v13 = &v14;
  [v7 screenTimeStateWithCompletionHandler:v10];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v20, 8);
}

void __50__TPSScreenTimeValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 == 2;
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v4 = (id *)(a1 + 32);
  int v5 = [*(id *)(a1 + 32) BOOLValue];
  v6 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1(v4, v3 == v5, v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

@end