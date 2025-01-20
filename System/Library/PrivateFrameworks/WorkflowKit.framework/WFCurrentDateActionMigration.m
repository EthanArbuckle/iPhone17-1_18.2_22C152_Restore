@interface WFCurrentDateActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (NSDateFormatter)dateFormatter;
- (void)migrateWorkflow;
- (void)setDateFormatter:(id)a3;
@end

@implementation WFCurrentDateActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"128") == 3)
  {
    if (WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.currentdate", v5)) {
      char HasActionsWithIdentifier = 1;
    }
    else {
      char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.date", v5);
    }
  }
  else
  {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void).cxx_destruct
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void)migrateWorkflow
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v24 = *(void *)v26;
    id v5 = @"WFDateActionDate";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        v7 = v5;
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKey:v9];

        if ([v10 isEqualToString:@"is.workflow.actions.currentdate"]) {
          goto LABEL_7;
        }
        if (![v10 isEqualToString:@"is.workflow.actions.date"]) {
          goto LABEL_10;
        }
        v14 = [(WFWorkflowMigration *)self actionParametersKey];
        v15 = [v8 objectForKeyedSubscript:v14];
        v16 = [v15 objectForKeyedSubscript:v5];

        if (!v16)
        {
LABEL_7:
          v11 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"is.workflow.actions.date" forKeyedSubscript:v11];

          v12 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKeyedSubscript:v12];

          [v13 setObject:@"Current Date" forKeyedSubscript:@"WFDateActionMode"];
        }
        else
        {
LABEL_10:
          id v5 = v7;
          if (![v10 isEqualToString:@"is.workflow.actions.date"]) {
            goto LABEL_14;
          }
          v17 = [(WFWorkflowMigration *)self actionParametersKey];
          v13 = [v8 objectForKey:v17];

          [v13 setObject:@"Specified Date" forKeyedSubscript:@"WFDateActionMode"];
          v18 = [v13 objectForKeyedSubscript:v7];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v20 = [(WFCurrentDateActionMigration *)self dateFormatter];
            v21 = [v13 objectForKeyedSubscript:v7];
            v22 = [v20 stringFromDate:v21];
            [v13 setObject:v22 forKeyedSubscript:v7];
          }
        }

        id v5 = v7;
LABEL_14:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:1];
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

@end