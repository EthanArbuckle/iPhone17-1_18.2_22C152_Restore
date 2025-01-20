@interface TPSSiriEnabledValidation
- (BOOL)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSSiriEnabledValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(TPSSiriEnabledValidation *)self getCurrentState];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFAssistantRestrictedSymbolLoc_ptr_2;
  v18 = getAFAssistantRestrictedSymbolLoc_ptr_2;
  if (!getAFAssistantRestrictedSymbolLoc_ptr_2)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __getAFAssistantRestrictedSymbolLoc_block_invoke_2;
    v13 = &unk_1E6E6AE20;
    v14 = &v15;
    v3 = (void *)AssistantServicesLibrary_1();
    v16[3] = (uint64_t)dlsym(v3, "AFAssistantRestricted");
    getAFAssistantRestrictedSymbolLoc_ptr_2 = *(_UNKNOWN **)(v14[1] + 24);
    v2 = (uint64_t (*)(void))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v2)
  {
    v9 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState]();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v9);
  }
  if (v2()) {
    return 0;
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  BOOL v5 = (void *)getAFPreferencesClass_softClass_2;
  v18 = (void *)getAFPreferencesClass_softClass_2;
  if (!getAFPreferencesClass_softClass_2)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __getAFPreferencesClass_block_invoke_2;
    v13 = &unk_1E6E6AE20;
    v14 = &v15;
    __getAFPreferencesClass_block_invoke_2((uint64_t)&v10);
    BOOL v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  v7 = [v6 sharedPreferences];
  char v4 = [v7 assistantIsEnabled];

  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  BOOL v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSSiriEnabledValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

@end