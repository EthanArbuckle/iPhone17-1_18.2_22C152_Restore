@interface TPSHRAccountInfoStatusValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHRAccountInfoStatusValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = +[TPSHealthKitDefines sharedHealthStore];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v6 = (void *)getHKHealthRecordsAccountInfoStoreClass_softClass;
  uint64_t v24 = getHKHealthRecordsAccountInfoStoreClass_softClass;
  if (!getHKHealthRecordsAccountInfoStoreClass_softClass)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getHKHealthRecordsAccountInfoStoreClass_block_invoke;
    v20[3] = &unk_1E6E6AE20;
    v20[4] = &v21;
    __getHKHealthRecordsAccountInfoStoreClass_block_invoke((uint64_t)v20);
    v6 = (void *)v22[3];
  }
  v7 = v6;
  _Block_object_dispose(&v21, 8);
  id v19 = (id)[[v7 alloc] initWithHealthStore:v5];
  v8 = (void *)v15[5];
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v4[2](v4, 0, v9);

    v8 = (void *)v15[5];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1E6E6C700;
  v11[4] = self;
  v10 = v4;
  id v12 = v10;
  v13 = &v14;
  [v8 determineMedicalRecordsAccountInfoStatusWithCompletion:v11];

  _Block_object_dispose(&v14, 8);
}

void __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_2(a1, (uint64_t)v5, v6);
    }

    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) integerValue];
    v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v8 == a2, v9);
    }

    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = [*(id *)(a1 + 32) name];
  v7 = [*(id *)(a1 + 32) targetContext];
  int v8 = 138413058;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = 0;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v8, 0x26u);
}

@end