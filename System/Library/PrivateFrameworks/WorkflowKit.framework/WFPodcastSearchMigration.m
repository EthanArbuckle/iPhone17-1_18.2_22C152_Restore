@interface WFPodcastSearchMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFPodcastSearchMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.searchitunes", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v2 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    v6 = @"is.workflow.actions.searchitunes";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v9 = [(WFWorkflowMigration *)v2 actionParametersKey];
        v10 = [v8 objectForKey:v9];

        v11 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
        v12 = [v8 objectForKeyedSubscript:v11];
        if ([v12 isEqualToString:v6])
        {
          [v10 objectForKeyedSubscript:@"WFMediaType"];
          v13 = v10;
          v14 = v2;
          uint64_t v15 = v4;
          uint64_t v16 = v5;
          v18 = v17 = v6;
          int v21 = [v18 isEqualToString:@"Podcasts"];

          v6 = v17;
          uint64_t v5 = v16;
          uint64_t v4 = v15;
          v2 = v14;
          v10 = v13;

          if (v21)
          {
            v19 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
            [v8 setObject:@"is.workflow.actions.searchpodcasts" forKeyedSubscript:v19];

            [v10 removeObjectForKey:@"WFMediaType"];
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)v2 finish];
}

@end