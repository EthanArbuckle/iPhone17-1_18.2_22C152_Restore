@interface WFDraftsActionMergeMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFDraftsActionMergeMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"128") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"com.agiletortoise.Drafts4.create", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKey:v9];
        int v11 = [v10 isEqualToString:@"com.agiletortoise.Drafts4.create"];

        if (v11)
        {
          v12 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"com.agiletortoise.Drafts4.addto" forKeyedSubscript:v12];

          v13 = [(WFWorkflowMigration *)self actionParametersKey];
          v14 = [v8 objectForKeyedSubscript:v13];
          v15 = v14;
          if (v14) {
            id v16 = v14;
          }
          else {
            id v16 = (id)objc_opt_new();
          }
          v17 = v16;

          [v17 setObject:@"Create" forKeyedSubscript:@"DraftsAddMode"];
          v18 = [(WFWorkflowMigration *)self actionParametersKey];
          [v8 setObject:v17 forKeyedSubscript:v18];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end