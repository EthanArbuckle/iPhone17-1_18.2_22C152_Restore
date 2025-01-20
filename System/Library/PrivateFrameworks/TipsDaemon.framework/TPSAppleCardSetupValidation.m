@interface TPSAppleCardSetupValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSAppleCardSetupValidation

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
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v5 = (void *)getPKAccountServiceClass_softClass;
  uint64_t v26 = getPKAccountServiceClass_softClass;
  if (!getPKAccountServiceClass_softClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getPKAccountServiceClass_block_invoke;
    v22[3] = &unk_1E6E6AE20;
    v22[4] = &v23;
    __getPKAccountServiceClass_block_invoke((uint64_t)v22);
    v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  id v19 = [v6 sharedInstance];
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v4[2](v4, 0, v8);

    v7 = (void *)v15[5];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__TPSAppleCardSetupValidation_validateWithCompletion___block_invoke;
  v10[3] = &unk_1E6E6BF88;
  v12 = v20;
  v10[4] = self;
  v9 = v4;
  id v11 = v9;
  v13 = &v14;
  [v7 accountsWithPassLocallyProvisionedWithCompletion:v10];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v20, 8);
}

void __54__TPSAppleCardSetupValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v14) == 1 && objc_msgSend(v8, "feature") == 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  int v10 = [*(id *)(a1 + 32) BOOLValue];
  id v11 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v9 == v10, v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

@end