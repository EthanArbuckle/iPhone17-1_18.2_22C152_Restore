@interface TPSFamilyCircleValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSFamilyCircleValidation

void __59__TPSFamilyCircleValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 members];
  BOOL v7 = [v6 count] != 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [NSNumber numberWithBool:v7];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __52__TPSFamilyCircleValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  LODWORD(a2) = [a2 BOOLValue];
  int v6 = a2 ^ [*(id *)(a1 + 32) BOOLValue] ^ 1;
  BOOL v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(a1 + 32) name];
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

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__TPSFamilyCircleValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSFamilyCircleValidation *)self getCurrentStateWithCompletion:v6];
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__0;
  int v15 = __Block_byref_object_dispose__0;
  id v16 = objc_alloc_init(MEMORY[0x1E4F61858]);
  id v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v3[2](v3, MEMORY[0x1E4F1CC28], v5);

    id v4 = (void *)v12[5];
  }
  [v4 setCachePolicy:0];
  int v6 = (void *)v12[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__TPSFamilyCircleValidation_getCurrentStateWithCompletion___block_invoke;
  v8[3] = &unk_1E6E6B078;
  id v7 = v3;
  id v9 = v7;
  int v10 = &v11;
  [v6 startRequestWithCompletionHandler:v8];

  _Block_object_dispose(&v11, 8);
}

@end