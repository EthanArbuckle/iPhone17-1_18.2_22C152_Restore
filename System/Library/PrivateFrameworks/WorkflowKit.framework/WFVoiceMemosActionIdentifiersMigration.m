@interface WFVoiceMemosActionIdentifiersMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFVoiceMemosActionIdentifiersMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1200"))
  {
    if (WFWorkflowHasActionsWithIdentifier(@"com.apple.VoiceMemos.PlayRecording", v5)) {
      char HasActionsWithIdentifier = 1;
    }
    else {
      char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"com.apple.VoiceMemos.CreateRecording", v5);
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKeyedSubscript:v9];

        if ([v10 isEqualToString:@"com.apple.VoiceMemos.PlayRecording"])
        {
          v11 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"com.apple.VoiceMemos.PlaybackVoiceMemoIntent" forKeyedSubscript:v11];

          v12 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKeyedSubscript:v12];
          v14 = [v13 objectForKeyedSubscript:@"AppIntentDescriptor"];
          v15 = v14;
          v16 = @"PlaybackVoiceMemoIntent";
        }
        else
        {
          if (![v10 isEqualToString:@"com.apple.VoiceMemos.CreateRecording"]) {
            goto LABEL_11;
          }
          v17 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"com.apple.VoiceMemos.RecordVoiceMemoIntent" forKeyedSubscript:v17];

          v12 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKeyedSubscript:v12];
          v14 = [v13 objectForKeyedSubscript:@"AppIntentDescriptor"];
          v15 = v14;
          v16 = @"RecordVoiceMemoIntent";
        }
        [v14 setObject:v16 forKeyedSubscript:@"AppIntentIdentifier"];

LABEL_11:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end