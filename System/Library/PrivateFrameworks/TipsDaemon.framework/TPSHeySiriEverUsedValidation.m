@interface TPSHeySiriEverUsedValidation
- (BOOL)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHeySiriEverUsedValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(TPSHeySiriEverUsedValidation *)self getCurrentState];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getVTPreferencesClass_softClass_0;
  uint64_t v11 = getVTPreferencesClass_softClass_0;
  if (!getVTPreferencesClass_softClass_0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getVTPreferencesClass_block_invoke_0;
    v7[3] = &unk_1E6E6AE20;
    v7[4] = &v8;
    __getVTPreferencesClass_block_invoke_0((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = [v3 sharedPreferences];
  char v5 = [v4 voiceTriggerWasEverUsed];

  return v5;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  char v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSHeySiriEverUsedValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

@end