@interface WFStartEndDateMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFStartEndDateMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"128") == 3)
  {
    if (WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.getstartdate", v5)) {
      char HasActionsWithIdentifier = 1;
    }
    else {
      char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.getenddate", v5);
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
        v10 = [v8 objectForKey:v9];

        if ([v10 isEqualToString:@"is.workflow.actions.getstartdate"])
        {
          v11 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"is.workflow.actions.properties.calendarevents" forKeyedSubscript:v11];

          v12 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKey:v12];

          v14 = v13;
          v15 = @"Start Date";
        }
        else
        {
          if (![v10 isEqualToString:@"is.workflow.actions.getenddate"]) {
            goto LABEL_11;
          }
          v16 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"is.workflow.actions.properties.calendarevents" forKeyedSubscript:v16];

          v17 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKey:v17];

          v14 = v13;
          v15 = @"End Date";
        }
        [v14 setObject:v15 forKey:@"WFContentItemPropertyName"];

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