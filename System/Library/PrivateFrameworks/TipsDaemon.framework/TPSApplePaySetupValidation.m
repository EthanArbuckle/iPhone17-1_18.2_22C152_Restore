@interface TPSApplePaySetupValidation
- (BOOL)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSApplePaySetupValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(TPSApplePaySetupValidation *)self getCurrentState];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v12 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getPKPassLibraryClass_block_invoke;
    v8[3] = &unk_1E6E6AE20;
    v8[4] = &v9;
    __getPKPassLibraryClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = objc_alloc_init(v3);
  BOOL v5 = [v4 passesOfType:1];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  BOOL v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSApplePaySetupValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

@end