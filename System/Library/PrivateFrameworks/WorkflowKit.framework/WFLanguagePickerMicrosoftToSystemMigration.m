@interface WFLanguagePickerMicrosoftToSystemMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (id)languagesSupportedByTranslation;
- (id)localeIdentifierFromLegacySerializedParameterValue:(id)a3;
- (id)localeIdentifierFromSerializedLocaleDisplayName:(id)a3;
- (id)localeIdentifierFromUnmigratedValue:(id)a3;
- (id)localizedLanguageDisplayNamesToLocaleIdentifiers;
- (void)migrateWorkflow;
@end

@implementation WFLanguagePickerMicrosoftToSystemMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1146.10")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.text.translate", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (id)languagesSupportedByTranslation
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2317988];
}

- (id)localizedLanguageDisplayNamesToLocaleIdentifiers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(WFLanguagePickerMicrosoftToSystemMigration *)self languagesSupportedByTranslation];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
        v11 = objc_msgSend(v10, "wf_displayName");
        [v3 setObject:v9 forKey:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return v12;
}

- (id)localeIdentifierFromSerializedLocaleDisplayName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFLanguagePickerMicrosoftToSystemMigration *)self localizedLanguageDisplayNamesToLocaleIdentifiers];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"en_US";
  }
  v8 = v7;

  return v8;
}

- (id)localeIdentifierFromLegacySerializedParameterValue:(id)a3
{
  id v3 = [&unk_1F2317EE0 objectForKey:a3];
  id v4 = v3;
  if (!v3) {
    id v3 = @"en_US";
  }
  uint64_t v5 = v3;

  return v5;
}

- (id)localeIdentifierFromUnmigratedValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFLanguagePickerMicrosoftToSystemMigration *)self languagesSupportedByTranslation];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    v8 = [(WFLanguagePickerMicrosoftToSystemMigration *)self localizedLanguageDisplayNamesToLocaleIdentifiers];
    uint64_t v9 = [v8 allKeys];
    int v10 = [v9 containsObject:v4];

    if (v10) {
      [(WFLanguagePickerMicrosoftToSystemMigration *)self localeIdentifierFromSerializedLocaleDisplayName:v4];
    }
    else {
    id v7 = [(WFLanguagePickerMicrosoftToSystemMigration *)self localeIdentifierFromLegacySerializedParameterValue:v4];
    }
  }
  v11 = v7;

  return v11;
}

- (void)migrateWorkflow
{
  id v3 = [(WFWorkflowMigration *)self actions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__WFLanguagePickerMicrosoftToSystemMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E65588C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];

  [(WFWorkflowMigration *)self finish];
}

void __61__WFLanguagePickerMicrosoftToSystemMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) actionIdentifierKey];
  id v4 = [v12 objectForKeyedSubscript:v3];
  int v5 = [v4 isEqualToString:@"is.workflow.actions.text.translate"];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) actionParametersKey];
    id v7 = [v12 objectForKeyedSubscript:v6];

    v8 = [v7 objectForKeyedSubscript:@"WFSelectedFromLanguage"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v8 isEqualToString:@"Detect Language"] & 1) == 0)
        {
          uint64_t v9 = [*(id *)(a1 + 32) localeIdentifierFromUnmigratedValue:v8];

          v8 = (void *)v9;
        }
        [v7 setObject:v8 forKey:@"WFSelectedFromLanguage"];
      }
    }

    int v10 = [v7 objectForKeyedSubscript:@"WFSelectedLanguage"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [*(id *)(a1 + 32) localeIdentifierFromUnmigratedValue:v10];

        [v7 setObject:v11 forKey:@"WFSelectedLanguage"];
        int v10 = (void *)v11;
      }
    }
  }
}

@end