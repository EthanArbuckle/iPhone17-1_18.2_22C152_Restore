@interface TPSSiriCompactVoiceTriggerAvailableValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSSiriCompactVoiceTriggerAvailableValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v5 = (void *)getAFPreferencesClass_softClass;
  uint64_t v23 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getAFPreferencesClass_block_invoke;
    v18 = &unk_1E6E6AE20;
    v19 = &v20;
    __getAFPreferencesClass_block_invoke((uint64_t)&v15);
    v5 = (void *)v21[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v20, 8);
  v7 = [v6 sharedPreferences];
  v8 = [v7 languageCode];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v9 = (void *)getVTPreferencesClass_softClass;
  uint64_t v23 = getVTPreferencesClass_softClass;
  if (!getVTPreferencesClass_softClass)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getVTPreferencesClass_block_invoke;
    v18 = &unk_1E6E6AE20;
    v19 = &v20;
    __getVTPreferencesClass_block_invoke((uint64_t)&v15);
    v9 = (void *)v21[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v20, 8);
  v11 = [v10 sharedPreferences];
  int v12 = [v11 isCompactVoiceTriggerAvailableForLanguageCode:v8];
  uint64_t v13 = v12 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v14 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    [(TPSSiriCompactVoiceTriggerAvailableValidation *)self validateWithCompletion:v14];
  }

  v4[2](v4, v13, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 name];
  v7 = [a1 targetContext];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end