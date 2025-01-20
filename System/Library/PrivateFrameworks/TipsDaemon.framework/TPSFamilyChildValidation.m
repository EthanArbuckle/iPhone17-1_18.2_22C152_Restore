@interface TPSFamilyChildValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSFamilyChildValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  id v15 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [(id)v11[5] setCachePolicy:0];
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke;
  v7[3] = &unk_1E6E6C758;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  v9 = &v10;
  [v5 startRequestWithCompletionHandler:v7];

  _Block_object_dispose(&v10, 8);
}

void __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    id v8 = [v5 members];
    v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1();
    }

    if ([*(id *)(a1 + 32) BOOLValue]) {
      int v10 = objc_msgSend(v8, "na_any:", &__block_literal_global_8);
    }
    else {
      int v10 = objc_msgSend(v8, "na_all:", &__block_literal_global_4_0);
    }
    int v7 = v10;
  }
  v11 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = [*(id *)(a1 + 32) name];
    id v15 = [*(id *)(a1 + 32) targetContext];
    int v16 = 138413058;
    v17 = v14;
    __int16 v18 = 2112;
    v19 = v15;
    __int16 v20 = 1024;
    int v21 = v7;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_debug_impl(&dword_1E4492000, v11, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v16, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

BOOL __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isMe] & 1) == 0 && objc_msgSend(v2, "memberType") == 2;

  return v3;
}

{
  id v2;
  BOOL v3;

  id v2 = a2;
  BOOL v3 = ([v2 isMe] & 1) != 0 || objc_msgSend(v2, "memberType") != 2;

  return v3;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  id v14 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [(id)v10[5] setCachePolicy:0];
  id v4 = (void *)v10[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__TPSFamilyChildValidation_getCurrentStateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6B078;
  id v5 = v3;
  id v7 = v5;
  id v8 = &v9;
  [v4 startRequestWithCompletionHandler:v6];

  _Block_object_dispose(&v9, 8);
}

void __58__TPSFamilyChildValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = [v5 members];
    uint64_t v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = objc_msgSend(v8, "na_any:", &__block_literal_global_8);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [NSNumber numberWithBool:v7];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

BOOL __58__TPSFamilyChildValidation_getCurrentStateWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isMe] & 1) == 0 && objc_msgSend(v2, "memberType") == 2;

  return v3;
}

void __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6(&dword_1E4492000, v0, v1, "Family members received: %@ in circle: %@");
}

@end