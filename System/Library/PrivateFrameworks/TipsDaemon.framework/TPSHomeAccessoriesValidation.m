@interface TPSHomeAccessoriesValidation
- (BOOL)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHomeAccessoriesValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(TPSHomeAccessoriesValidation *)self getCurrentState];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getHMClientConnectionClass_softClass_2;
  uint64_t v9 = getHMClientConnectionClass_softClass_2;
  if (!getHMClientConnectionClass_softClass_2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getHMClientConnectionClass_block_invoke_2;
    v5[3] = &unk_1E6E6AE20;
    v5[4] = &v6;
    __getHMClientConnectionClass_block_invoke_2((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 areAnyAccessoriesConfigured];
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  BOOL v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSHomeAccessoriesValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

@end