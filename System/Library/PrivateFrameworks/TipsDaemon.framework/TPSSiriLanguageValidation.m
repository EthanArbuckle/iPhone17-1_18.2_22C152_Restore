@interface TPSSiriLanguageValidation
- (TPSSiriLanguageValidation)initWithTargetLanguages:(id)a3 excludeLanguages:(id)a4;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSSiriLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(TPSSiriLanguageValidation *)self targetLanguages];
  if ([v5 count])
  {

    goto LABEL_4;
  }
  v6 = [(TPSSiriLanguageValidation *)self excludeLanguages];
  uint64_t v7 = [v6 count];

  if (v7)
  {
LABEL_4:
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v8 = (uint64_t (*)(uint64_t))getAFAssistantRestrictedSymbolLoc_ptr_1;
    v33 = getAFAssistantRestrictedSymbolLoc_ptr_1;
    if (!getAFAssistantRestrictedSymbolLoc_ptr_1)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAFAssistantRestrictedSymbolLoc_block_invoke_1;
      v35 = &unk_1E6E6AE20;
      *(void *)v36 = &v30;
      v9 = (void *)AssistantServicesLibrary_0();
      v10 = dlsym(v9, "AFAssistantRestricted");
      *(void *)(*(void *)(*(void *)v36 + 8) + 24) = v10;
      getAFAssistantRestrictedSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)v36 + 8) + 24);
      v8 = (uint64_t (*)(uint64_t))v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v8)
    {
      -[TPSHeySiriEnabledValidation getCurrentState]();
      __break(1u);
    }
    if (v8(v11))
    {
      v12 = 0;
    }
    else
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2050000000;
      v13 = (void *)getAFPreferencesClass_softClass_1;
      v33 = (void *)getAFPreferencesClass_softClass_1;
      if (!getAFPreferencesClass_softClass_1)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAFPreferencesClass_block_invoke_1;
        v35 = &unk_1E6E6AE20;
        *(void *)v36 = &v30;
        __getAFPreferencesClass_block_invoke_1((uint64_t)buf);
        v13 = (void *)v31[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v30, 8);
      v15 = objc_msgSend(v14, "sharedPreferences", v30);
      v16 = [v15 languageCode];
      v12 = [v16 lowercaseString];

      if ([v12 length])
      {
        v17 = [(TPSSiriLanguageValidation *)self targetLanguages];
        if ([v17 count])
        {
          v18 = [(TPSSiriLanguageValidation *)self targetLanguages];
          int v19 = [v18 containsObject:v12];
        }
        else
        {
          int v19 = 1;
        }

        v21 = [(TPSSiriLanguageValidation *)self excludeLanguages];
        int v22 = [v21 containsObject:v12];

        uint64_t v20 = v19 & (v22 ^ 1u);
LABEL_20:
        v23 = objc_msgSend(MEMORY[0x1E4FAF480], "targeting", v30);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v24 = objc_opt_class();
          id v25 = v24;
          v26 = [(TPSSiriLanguageValidation *)self targetLanguages];
          v27 = [v26 componentsJoinedByString:@","];
          v28 = [(TPSSiriLanguageValidation *)self excludeLanguages];
          v29 = [v28 componentsJoinedByString:@","];
          *(_DWORD *)buf = 138413314;
          *(void *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          *(_WORD *)&buf[22] = 2112;
          v35 = v27;
          *(_WORD *)v36 = 2112;
          *(void *)&v36[2] = v29;
          __int16 v37 = 1024;
          int v38 = v20;
          _os_log_debug_impl(&dword_1E4492000, v23, OS_LOG_TYPE_DEBUG, "%@ - checking Siri Language: %@, target languages: %@, exclude languages: %@. Valid: %d", buf, 0x30u);
        }
        goto LABEL_23;
      }
    }
    uint64_t v20 = 0;
    goto LABEL_20;
  }
  v12 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TPSSiriLanguageValidation validateWithCompletion:]((uint64_t)self, v12);
  }
  uint64_t v20 = 1;
LABEL_23:

  v4[2](v4, v20, 0);
}

- (TPSSiriLanguageValidation)initWithTargetLanguages:(id)a3 excludeLanguages:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 valueForKeyPath:@"lowercaseString"];
  v8 = [v6 valueForKeyPath:@"lowercaseString"];

  v11.receiver = self;
  v11.super_class = (Class)TPSSiriLanguageValidation;
  v9 = [(TPSInclusivityValidation *)&v11 initWithTargetValues:v7 excludeValues:v8];

  return v9;
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude region(s) is specified.", (uint8_t *)&v4, 0xCu);
}

@end