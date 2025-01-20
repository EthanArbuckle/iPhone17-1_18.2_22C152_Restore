@interface TPSTravelESimEligibilityValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSTravelESimEligibilityValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTravelESimEligibilityValidation *)self getCurrentStateWithCompletion:v6];
}

void __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  LODWORD(a2) = [a2 BOOLValue];
  int v6 = a2 ^ [*(id *)(a1 + 32) BOOLValue] ^ 1;
  id v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v6, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, id))a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v4 = (void *)getCoreTelephonyClientClass_softClass;
  uint64_t v15 = getCoreTelephonyClientClass_softClass;
  if (!getCoreTelephonyClientClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getCoreTelephonyClientClass_block_invoke;
    v11[3] = &unk_1E6E6AE20;
    v11[4] = &v12;
    __getCoreTelephonyClientClass_block_invoke((uint64_t)v11);
    id v4 = (void *)v13[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);
  id v6 = [v5 alloc];
  id v7 = (void *)[v6 initWithQueue:MEMORY[0x1E4F14428]];
  id v10 = 0;
  v8 = [v7 shouldShoweSIMTravelTip:&v10];
  id v9 = v10;
  v3[2](v3, v8, v9);
}

void __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1(id *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [*a1 name];
  id v7 = [*a1 targetContext];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end