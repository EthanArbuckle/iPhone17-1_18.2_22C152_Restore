@interface WFChangeCaseMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFChangeCaseMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"142") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.text.changecase", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKeyedSubscript:v9];
        int v11 = [v10 isEqualToString:@"is.workflow.actions.text.changecase"];

        if (v11)
        {
          v12 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKey:v12];

          v14 = [v13 objectForKeyedSubscript:@"WFCaseType"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v13 objectForKeyedSubscript:@"WFCaseType"];
            int v16 = [v15 isEqualToString:@"Capitalize"];

            if (v16) {
              [v13 setObject:@"Capitalize Every Word" forKeyedSubscript:@"WFCaseType"];
            }
          }
          else
          {
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end