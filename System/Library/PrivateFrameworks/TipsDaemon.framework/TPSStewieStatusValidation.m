@interface TPSStewieStatusValidation
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSStewieStatusValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__TPSStewieStatusValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSStewieStatusValidation *)self getCurrentStateWithCompletion:v6];
}

void __52__TPSStewieStatusValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v4 = (void *)getCoreTelephonyClientClass_softClass_0;
  uint64_t v16 = getCoreTelephonyClientClass_softClass_0;
  if (!getCoreTelephonyClientClass_softClass_0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getCoreTelephonyClientClass_block_invoke_0;
    v12[3] = &unk_1E6E6AE20;
    v12[4] = &v13;
    __getCoreTelephonyClientClass_block_invoke_0((uint64_t)v12);
    id v4 = (void *)v14[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);
  id v6 = [v5 alloc];
  id v7 = (void *)[v6 initWithQueue:MEMORY[0x1E4F14428]];
  id v11 = 0;
  v8 = [v7 getStewieSupport:&v11];
  id v9 = v11;
  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "status"));
  v3[2](v3, v10, v9);
}

@end