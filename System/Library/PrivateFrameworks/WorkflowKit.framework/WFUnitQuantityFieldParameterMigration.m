@interface WFUnitQuantityFieldParameterMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFUnitQuantityFieldParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"996")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.searchlocalbusinesses", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = @"is.workflow.actions.searchlocalbusinesses";
    uint64_t v7 = *(void *)v25;
    v22 = v2;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        v10 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
        v11 = [v9 objectForKeyedSubscript:v10];

        if ([v11 isEqualToString:v6])
        {
          v12 = [(WFWorkflowMigration *)v2 actionParametersKey];
          v13 = [v9 objectForKeyedSubscript:v12];

          v14 = [v13 objectForKey:@"WFSearchRadius"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (v14 && (isKindOfClass & 1) != 0)
          {
            v23 = [v13 objectForKeyedSubscript:@"WFSearchRadius"];
            v28[0] = @"Magnitude";
            v28[1] = @"Unit";
            v29[0] = v23;
            v29[1] = @"km";
            v30[0] = @"Value";
            v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
            v30[1] = @"WFSerializationType";
            v31[0] = v16;
            v31[1] = @"WFQuantityFieldValue";
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
            uint64_t v17 = v7;
            uint64_t v18 = v5;
            v19 = v6;
            v21 = v20 = v3;

            v2 = v22;
            [v13 setObject:v21 forKey:@"WFSearchRadius"];

            v3 = v20;
            v6 = v19;
            uint64_t v5 = v18;
            uint64_t v7 = v17;
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)v2 finish];
}

@end