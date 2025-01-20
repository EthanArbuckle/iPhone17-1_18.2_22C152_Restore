@interface TPSCloudFindMyValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudFindMyValidation

void __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 == 1;
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v4 = (id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3 == [*(id *)(a1 + 32) BOOLValue];
  v5 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke_cold_1(v4, a1 + 56, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v5 = (void *)getFMDFMIPManagerClass_softClass;
  uint64_t v29 = getFMDFMIPManagerClass_softClass;
  if (!getFMDFMIPManagerClass_softClass)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __getFMDFMIPManagerClass_block_invoke;
    v25[3] = &unk_1E6E6AE20;
    v25[4] = &v26;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)v25);
    v5 = (void *)v27[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v26, 8);
  id v20 = [v6 sharedInstance];
  v7 = (void *)v16[5];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v4[2](v4, 0, v8);

    v7 = (void *)v16[5];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke;
  v10[3] = &unk_1E6E6C618;
  v12 = v23;
  v13 = v21;
  v10[4] = self;
  v9 = v4;
  id v11 = v9;
  v14 = &v15;
  [v7 fmipStateWithCompletion:v10];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = [*a1 name];
  v7 = [*a1 targetContext];
  int v8 = *(unsigned __int8 *)(*(void *)(*(void *)a2 + 8) + 24);
  int v9 = 138412802;
  v10 = v6;
  __int16 v11 = 2112;
  v12 = v7;
  __int16 v13 = 1024;
  int v14 = v8;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v9, 0x1Cu);
}

@end