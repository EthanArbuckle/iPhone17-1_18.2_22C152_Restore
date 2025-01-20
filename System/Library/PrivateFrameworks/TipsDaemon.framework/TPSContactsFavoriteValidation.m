@interface TPSContactsFavoriteValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSContactsFavoriteValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__TPSContactsFavoriteValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSContactsFavoriteValidation *)self getCurrentStateWithCompletion:v6];
}

void __56__TPSContactsFavoriteValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v4 = (void *)MEMORY[0x1E4FAF3F8];
  id v5 = (void (**)(id, void, void *))a3;
  if ([v4 isGreenTeaDevice])
  {
    int v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TPSContactsMeCardValidation validateWithCompletion:](self, v6);
    }

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:13 userInfo:0];
    v5[2](v5, 0, v7);
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1B9E8]) initWithContactStore:v12];
    v9 = [v8 entries];
    BOOL v10 = [v9 count] != 0;

    v11 = [NSNumber numberWithBool:v10];
    ((void (**)(id, void *, void *))v5)[2](v5, v11, 0);
  }
}

@end