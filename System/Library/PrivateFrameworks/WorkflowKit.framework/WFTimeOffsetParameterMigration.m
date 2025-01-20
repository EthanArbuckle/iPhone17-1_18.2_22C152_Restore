@interface WFTimeOffsetParameterMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFTimeOffsetParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return WFCompareBundleVersions(a4, @"900") & 1;
}

- (void)migrateWorkflow
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v6 = 0;
      uint64_t v32 = v4;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
        v8 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v9 = [v7 objectForKeyedSubscript:v8];
        int v10 = [v9 isEqualToString:@"is.workflow.actions.adjustdate"];

        if (v10)
        {
          v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v7 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKeyedSubscript:@"WFAdjustOffsetPicker"];
          v14 = [v13 objectForKey:@"Value"];
          v15 = [v14 objectForKeyedSubscript:@"Operation"];
          id v16 = [v14 objectForKeyedSubscript:@"Unit"];
          char v17 = [v16 isEqualToString:@"Second"];
          v18 = WFDurationQuantityFieldUnitSeconds;
          if ((v17 & 1) == 0)
          {
            char v19 = [v16 isEqualToString:@"Minute"];
            v18 = WFDurationQuantityFieldUnitMinutes;
            if ((v19 & 1) == 0)
            {
              char v20 = [v16 isEqualToString:@"Hour"];
              v18 = WFDurationQuantityFieldUnitHours;
              if ((v20 & 1) == 0)
              {
                char v21 = [v16 isEqualToString:@"Day"];
                v18 = (__CFString **)&WFDurationQuantityFieldUnitDays;
                if ((v21 & 1) == 0)
                {
                  char v22 = [v16 isEqualToString:@"Week"];
                  v18 = (__CFString **)&WFDurationQuantityFieldUnitWeeks;
                  if ((v22 & 1) == 0)
                  {
                    char v23 = [v16 isEqualToString:@"Month"];
                    v18 = (__CFString **)&WFDurationQuantityFieldUnitMonths;
                    if ((v23 & 1) == 0)
                    {
                      int v24 = [v16 isEqualToString:@"Year"];
                      v18 = (__CFString **)&WFDurationQuantityFieldUnitDays;
                      if (v24) {
                        v18 = (__CFString **)&WFDurationQuantityFieldUnitYears;
                      }
                    }
                  }
                }
              }
            }
          }
          v25 = *v18;

          v26 = [v14 objectForKeyedSubscript:@"Value"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = [[WFVariable alloc] initWithDictionary:v26 variableProvider:0];
            if (v27) {
              v28 = [(WFVariableSubstitutableParameterState *)[WFNumberStringSubstitutableState alloc] initWithVariable:v27];
            }
            else {
              v28 = 0;
            }
          }
          else
          {
            v28 = [(WFVariableSubstitutableParameterState *)[WFNumberStringSubstitutableState alloc] initWithSerializedRepresentation:v26 variableProvider:0 parameter:0];
          }
          v29 = [[WFQuantityParameterState alloc] initWithMagnitudeState:v28 unitString:v25];

          [v12 setObject:v15 forKeyedSubscript:@"WFAdjustOperation"];
          v30 = [(WFQuantityParameterState *)v29 serializedRepresentation];
          [v12 setObject:v30 forKeyedSubscript:@"WFDuration"];

          uint64_t v5 = v31;
          uint64_t v4 = v32;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

@end