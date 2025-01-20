@interface WFBooksSydneyEActionIdentifiersMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFBooksSydneyEActionIdentifiersMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1400"))
  {
    if ((WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooks.OpenRecentBookIntent", v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooks.PlayRecentAudiobookIntent", v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooksX.OpenRecentBookIntent", v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooksX.PlayRecentAudiobookIntent", v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooks.OpenBookIntent", v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooks.PlayAudiobookIntent", v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooksX.OpenBookIntent", v5) & 1) != 0)
    {
      char HasActionsWithIdentifier = 1;
    }
    else
    {
      char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"com.apple.iBooksX.PlayAudiobookIntent", v5);
    }
  }
  else
  {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
        v8 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v9 = [v7 objectForKeyedSubscript:v8];

        if (([v9 isEqualToString:@"com.apple.iBooks.OpenBookIntent"] & 1) != 0
          || ([v9 isEqualToString:@"com.apple.iBooks.PlayAudiobookIntent"] & 1) != 0
          || ([v9 isEqualToString:@"com.apple.iBooksX.OpenBookIntent"] & 1) != 0
          || [v9 isEqualToString:@"com.apple.iBooksX.PlayAudiobookIntent"])
        {
          v10 = [(WFWorkflowMigration *)self actionParametersKey];
          v11 = [v7 objectForKeyedSubscript:v10];
          v12 = [v11 objectForKeyedSubscript:@"target"];

          if (v12)
          {
            v13 = [(WFWorkflowMigration *)self actionParametersKey];
            v14 = [v7 objectForKeyedSubscript:v13];
            [v14 setObject:@"specific" forKeyedSubscript:@"mode"];
          }
        }
        if (([v9 isEqualToString:@"com.apple.iBooks.OpenRecentBookIntent"] & 1) != 0
          || [v9 isEqualToString:@"com.apple.iBooksX.OpenRecentBookIntent"])
        {
          v15 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v7 setObject:@"com.apple.iBooks.OpenBookIntent" forKeyedSubscript:v15];

          v16 = [(WFWorkflowMigration *)self actionParametersKey];
          v17 = [v7 objectForKeyedSubscript:v16];
          v18 = [v17 objectForKeyedSubscript:@"AppIntentDescriptor"];
          v19 = v18;
          v20 = @"OpenBookIntent";
LABEL_15:
          [v18 setObject:v20 forKeyedSubscript:@"AppIntentIdentifier"];

          v21 = [(WFWorkflowMigration *)self actionParametersKey];
          v22 = [v7 objectForKeyedSubscript:v21];
          v23 = [v22 objectForKeyedSubscript:@"AppIntentDescriptor"];
          [v23 setObject:@"com.apple.iBooks" forKeyedSubscript:@"BundleIdentifier"];

          goto LABEL_16;
        }
        if (([v9 isEqualToString:@"com.apple.iBooks.PlayRecentAudiobookIntent"] & 1) != 0
          || [v9 isEqualToString:@"com.apple.iBooksX.PlayRecentAudiobookIntent"])
        {
          v24 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v7 setObject:@"com.apple.iBooks.PlayAudiobookIntent" forKeyedSubscript:v24];

          v16 = [(WFWorkflowMigration *)self actionParametersKey];
          v17 = [v7 objectForKeyedSubscript:v16];
          v18 = [v17 objectForKeyedSubscript:@"AppIntentDescriptor"];
          v19 = v18;
          v20 = @"PlayAudiobookIntent";
          goto LABEL_15;
        }
LABEL_16:

        ++v6;
      }
      while (v4 != v6);
      uint64_t v25 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v4 = v25;
    }
    while (v25);
  }

  [(WFWorkflowMigration *)self finish];
}

@end