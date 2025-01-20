@interface TPSFamilyOrganizerValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSFamilyOrganizerValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__TPSFamilyOrganizerValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSFamilyOrganizerValidation *)self getCurrentStateWithCompletion:v6];
}

void __55__TPSFamilyOrganizerValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  LODWORD(a2) = [a2 BOOLValue];
  int v6 = a2 ^ [*(id *)(a1 + 32) BOOLValue] ^ 1;
  id v7 = [MEMORY[0x1E4FAF480] targeting];
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
  __int16 v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  id v14 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [(id)v10[5] setCachePolicy:0];
  id v4 = (void *)v10[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6B078;
  id v5 = v3;
  id v7 = v5;
  v8 = &v9;
  [v4 startRequestWithCompletionHandler:v6];

  _Block_object_dispose(&v9, 8);
}

void __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = 0;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (!v6)
  {
    v8 = objc_msgSend(v5, "members", 0);
    uint64_t v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_cold_2((uint64_t)v8, (uint64_t)v5, v9);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke_2;
    v14[3] = &unk_1E6E6CAE0;
    v14[4] = &v15;
    [v8 enumerateObjectsUsingBlock:v14];

    BOOL v7 = *((unsigned char *)v16 + 24) != 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [NSNumber numberWithBool:v7];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  _Block_object_dispose(&v15, 8);
}

void __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  int v6 = [v7 isMe];
  if (v6) {
    LOBYTE(v6) = [v7 isOrganizer];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

@end