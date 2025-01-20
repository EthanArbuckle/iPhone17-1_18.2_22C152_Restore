@interface WFSpeakTextLanguagePickerParameterMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (id)availableLanguageCodes;
- (void)migrateSpeakTextLanguageParameterInParametersDictionary:(id)a3;
- (void)migrateWorkflow;
@end

@implementation WFSpeakTextLanguagePickerParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1030")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.speaktext", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (id)availableLanguageCodes
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getAVSpeechSynthesisVoiceClass_softClass;
  uint64_t v11 = getAVSpeechSynthesisVoiceClass_softClass;
  if (!getAVSpeechSynthesisVoiceClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getAVSpeechSynthesisVoiceClass_block_invoke;
    v7[3] = &unk_1E6558B78;
    v7[4] = &v8;
    __getAVSpeechSynthesisVoiceClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = [v3 _speechVoicesIncludingSiri];
  id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_72342);

  return v5;
}

uint64_t __69__WFSpeakTextLanguagePickerParameterMigration_availableLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 language];
}

- (void)migrateSpeakTextLanguageParameterInParametersDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"WFSpeakTextLanguage"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(WFSpeakTextLanguagePickerParameterMigration *)self availableLanguageCodes];
      if (([v6 containsObject:v5] & 1) == 0)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id obj = v6;
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v11];
              v13 = [v12 localizedStringForLocaleIdentifier:v11];
              v14 = [v13 capitalizedStringWithLocale:v12];

              if (![v14 length])
              {
                v15 = getWFWorkflowMigrationLogObject();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v24 = "-[WFSpeakTextLanguagePickerParameterMigration migrateSpeakTextLanguageParameterInParametersDictionary:]";
                  __int16 v25 = 2114;
                  uint64_t v26 = v11;
                  __int16 v27 = 2114;
                  v28 = v12;
                  _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s [Speak Text] Failed to get localized language name from languageCode: %{public}@, languageLocale: %{public}@", buf, 0x20u);
                }
              }
              if ([v14 isEqualToString:v5])
              {
                v16 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v11];
                v17 = [(WFVariableSubstitutableParameterState *)v16 serializedRepresentation];
                [v4 setObject:v17 forKey:@"WFSpeakTextLanguage"];

                goto LABEL_18;
              }
            }
            uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
        v6 = obj;

        [v4 removeObjectForKey:@"WFSpeakTextLanguage"];
      }
LABEL_18:
    }
  }
}

- (void)migrateWorkflow
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        uint64_t v10 = [v8 objectForKeyedSubscript:v9];

        if ([v10 isEqualToString:@"is.workflow.actions.speaktext"])
        {
          uint64_t v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v8 objectForKeyedSubscript:v11];

          [(WFSpeakTextLanguagePickerParameterMigration *)self migrateSpeakTextLanguageParameterInParametersDictionary:v12];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end