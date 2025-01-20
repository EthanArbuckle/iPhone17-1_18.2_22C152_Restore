@interface TPSSiriSystemLanguageMatchValidation
- (BOOL)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSSiriSystemLanguageMatchValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(TPSSiriSystemLanguageMatchValidation *)self getCurrentState];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFAssistantRestrictedSymbolLoc_ptr_0;
  v27 = getAFAssistantRestrictedSymbolLoc_ptr_0;
  if (!getAFAssistantRestrictedSymbolLoc_ptr_0)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __getAFAssistantRestrictedSymbolLoc_block_invoke_0;
    v22 = &unk_1E6E6AE20;
    v23 = &v24;
    v3 = (void *)AssistantServicesLibrary();
    v25[3] = (uint64_t)dlsym(v3, "AFAssistantRestricted");
    getAFAssistantRestrictedSymbolLoc_ptr_0 = *(_UNKNOWN **)(v23[1] + 24);
    v2 = (uint64_t (*)(void))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v2)
  {
    -[TPSHeySiriEnabledValidation getCurrentState]();
    __break(1u);
  }
  if (v2()) {
    return 0;
  }
  BOOL v5 = [MEMORY[0x1E4F1CA20] systemLanguages];
  if ([v5 count])
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    uint64_t v6 = (void *)getAFPreferencesClass_softClass_0;
    v27 = (void *)getAFPreferencesClass_softClass_0;
    if (!getAFPreferencesClass_softClass_0)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getAFPreferencesClass_block_invoke_0;
      v22 = &unk_1E6E6AE20;
      v23 = &v24;
      __getAFPreferencesClass_block_invoke_0((uint64_t)&v19);
      uint64_t v6 = (void *)v25[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v24, 8);
    v8 = [v7 sharedPreferences];
    v9 = [v8 languageCode];

    if ([v9 length])
    {
      v10 = (void *)MEMORY[0x1E4F28B50];
      v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      v12 = [v10 preferredLocalizationsFromArray:v5 forPreferences:v11];
      v13 = [v12 firstObject];

      v14 = (void *)MEMORY[0x1E4F28B50];
      v28[0] = v9;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      v16 = [v14 preferredLocalizationsFromArray:v5 forPreferences:v15];
      v17 = [v16 firstObject];

      char v4 = [v13 isEqualToString:v17];
    }
    else
    {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  BOOL v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSSiriSystemLanguageMatchValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

@end