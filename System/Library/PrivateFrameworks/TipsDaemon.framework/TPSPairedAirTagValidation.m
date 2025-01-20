@interface TPSPairedAirTagValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSPairedAirTagValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v5 = (void *)getSPBeaconManagerClass_softClass;
  uint64_t v24 = getSPBeaconManagerClass_softClass;
  if (!getSPBeaconManagerClass_softClass)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getSPBeaconManagerClass_block_invoke;
    v20[3] = &unk_1E6E6AE20;
    v20[4] = &v21;
    __getSPBeaconManagerClass_block_invoke((uint64_t)v20);
    v5 = (void *)v22[3];
  }
  v6 = v5;
  _Block_object_dispose(&v21, 8);
  id v19 = objc_alloc_init(v6);
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v4[2](v4, 0, v8);

    v7 = (void *)v15[5];
  }
  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F97DA0]];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1E6E6C048;
  v11[4] = self;
  v10 = v4;
  id v12 = v10;
  v13 = &v14;
  [v7 allBeaconsOfTypes:v9 completion:v11];

  _Block_object_dispose(&v14, 8);
}

void __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 count];
  v4 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(a1, v3 != 0, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [*(id *)(a1 + 32) name];
  v7 = [*(id *)(a1 + 32) targetContext];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end