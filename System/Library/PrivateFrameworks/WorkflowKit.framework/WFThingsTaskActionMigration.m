@interface WFThingsTaskActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (NSDateFormatter)dateFormatter;
- (void)migrateWorkflow;
- (void)setDateFormatter:(id)a3;
@end

@implementation WFThingsTaskActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"128") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"com.culturedcode.ThingsTouch.addtask", v5);
  }
  else {
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
        v8 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v9 = [v7 objectForKey:v8];
        int v10 = [v9 isEqualToString:@"com.culturedcode.ThingsTouch.addtask"];

        if (v10)
        {
          v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v7 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKeyedSubscript:@"thingsDueDate"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v15 = [(WFThingsTaskActionMigration *)self dateFormatter];
            v16 = [v12 objectForKeyedSubscript:@"thingsDueDate"];
            v17 = [v15 stringFromDate:v16];
            [v12 setObject:v17 forKeyedSubscript:@"thingsDueDate"];
            goto LABEL_9;
          }
          v18 = [v12 objectForKeyedSubscript:@"thingsDueDate"];
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            v15 = [v12 objectForKeyedSubscript:@"thingsDueDate"];
            v16 = WFDeserializedVariableObject(v15, 0, 0);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[WFVariableString alloc] initWithVariable:v16];
              WFSerializedVariableObject(v17);
              v21 = v20 = v3;
              [v12 setObject:v21 forKeyedSubscript:@"thingsDueDate"];

              v3 = v20;
LABEL_9:
            }
          }
        }
        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

@end