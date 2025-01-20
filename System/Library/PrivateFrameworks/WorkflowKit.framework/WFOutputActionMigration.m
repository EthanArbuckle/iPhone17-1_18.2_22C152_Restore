@interface WFOutputActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFOutputActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1123")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.exit", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = @"is.workflow.actions.exit";
    uint64_t v7 = *(void *)v31;
    v24 = v3;
    uint64_t v27 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      uint64_t v28 = v5;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        v10 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
        v11 = [v9 objectForKeyedSubscript:v10];

        if ([v11 isEqualToString:v6])
        {
          v12 = [(WFWorkflowMigration *)v2 actionParametersKey];
          v13 = [v9 objectForKeyedSubscript:v12];

          v14 = [v13 objectForKeyedSubscript:@"WFResult"];
          if (v14)
          {
            v15 = [[WFVariableParameterState alloc] initWithSerializedRepresentation:v14 variableProvider:0 parameter:0];
            if (v15)
            {
              v29 = v15;
              v16 = [WFVariableString alloc];
              v17 = [(WFVariableParameterState *)v29 variable];
              v26 = [(WFVariableString *)v16 initWithVariable:v17];

              v25 = [[WFVariableStringParameterState alloc] initWithVariableString:v26];
              v18 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
              [v9 setObject:@"is.workflow.actions.output" forKeyedSubscript:v18];

              v34 = @"WFOutput";
              v19 = [(WFVariableStringParameterState *)v25 serializedRepresentation];
              v35 = v19;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
              v21 = v20 = v6;
              [(WFWorkflowMigration *)v2 actionParametersKey];
              v23 = v22 = v2;
              [v9 setObject:v21 forKeyedSubscript:v23];

              v2 = v22;
              v6 = v20;

              v3 = v24;
              v15 = v29;
            }
          }
          uint64_t v7 = v27;
          uint64_t v5 = v28;
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)v2 finish];
}

@end