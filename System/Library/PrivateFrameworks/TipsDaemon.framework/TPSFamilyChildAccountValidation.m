@interface TPSFamilyChildAccountValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSFamilyChildAccountValidation

void __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v8 = [v5 members];
    v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_cold_2((uint64_t)v8, (uint64_t)v5, v9);
    }

    v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_4);
    if (!v10)
    {
      v11 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_cold_1(v11);
      }
    }
    uint64_t v7 = [v10 isChildAccount];
  }
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = [NSNumber numberWithBool:v7];
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

void __58__TPSFamilyChildAccountValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  LODWORD(a2) = [a2 BOOLValue];
  int v6 = a2 ^ [*(id *)(a1 + 32) BOOLValue] ^ 1;
  uint64_t v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [*(id *)(a1 + 32) name];
    v9 = [*(id *)(a1 + 32) targetContext];
    int v10 = 138413058;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_debug_impl(&dword_1E4492000, v7, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v10, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  id v14 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [(id)v10[5] setCachePolicy:0];
  v4 = (void *)v10[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6B078;
  id v5 = v3;
  id v7 = v5;
  v8 = &v9;
  [v4 startRequestWithCompletionHandler:v6];

  _Block_object_dispose(&v9, 8);
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__TPSFamilyChildAccountValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSFamilyChildAccountValidation *)self getCurrentStateWithCompletion:v6];
}

uint64_t __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isMe];
}

void __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4492000, log, OS_LOG_TYPE_ERROR, "FamilyCircle failed to return locate own record.", v1, 2u);
}

void __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1E4492000, log, OS_LOG_TYPE_DEBUG, "Family members received: %@ in circle: %@", (uint8_t *)&v3, 0x16u);
}

@end