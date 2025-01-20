@interface WFTimeUntilActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFTimeUntilActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.gettimebetweendates", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    v20 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKey:v9];

        if ([v10 isEqualToString:@"is.workflow.actions.gettimebetweendates"])
        {
          v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v8 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKey:@"WFTimeUntilFromDate"];

          if (!v13)
          {
            v14 = [v12 objectForKeyedSubscript:@"WFTimeUntilReferenceDate"];
            objc_opt_class();
            int isKindOfClass = objc_opt_isKindOfClass();
            if (!v14 || (isKindOfClass & 1) != 0)
            {
              if (v14
                && ((isKindOfClass ^ 1) & 1) == 0
                && [v14 isEqualToString:@"Other"])
              {
                v16 = [v12 objectForKey:@"WFTimeUntilCustomDate"];
                if (v16) {
                  [v12 setObject:v16 forKey:@"WFTimeUntilFromDate"];
                }
              }
              else
              {
                v16 = objc_alloc_init(WFCurrentDateVariable);
                v17 = [[WFVariableStringParameterState alloc] initWithVariable:v16];
                v18 = [(WFVariableStringParameterState *)v17 serializedRepresentation];
                [v12 setObject:v18 forKey:@"WFTimeUntilFromDate"];

                v3 = v20;
              }
            }
            else
            {
              [v12 setObject:v14 forKey:@"WFTimeUntilFromDate"];
            }
            v25[0] = @"WFTimeUntilReferenceDate";
            v25[1] = @"WFTimeUntilCustomDate";
            v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
            [v12 removeObjectsForKeys:v19];
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end