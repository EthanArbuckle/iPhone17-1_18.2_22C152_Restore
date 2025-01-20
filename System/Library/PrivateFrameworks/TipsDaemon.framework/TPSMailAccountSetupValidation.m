@interface TPSMailAccountSetupValidation
- (BOOL)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSMailAccountSetupValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__TPSMailAccountSetupValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1E6E6ADF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSMailAccountSetupValidation *)self getCurrentStateWithCompletion:v6];
}

void __56__TPSMailAccountSetupValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)getCurrentState
{
  return MEMORY[0x1F412C4C8](self, a2);
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSMailAccountSetupValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

@end