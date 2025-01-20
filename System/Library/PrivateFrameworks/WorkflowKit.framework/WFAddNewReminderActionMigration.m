@interface WFAddNewReminderActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFAddNewReminderActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.addnewreminder", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v33;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v8 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v9 = [v7 objectForKey:v8];

        if ([v9 isEqualToString:@"is.workflow.actions.addnewreminder"])
        {
          uint64_t v10 = v4;
          v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v7 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKeyedSubscript:@"WFCalendarItemAlert"];

          if (v13) {
            [v12 removeObjectForKey:@"WFCalendarItemAlert"];
          }
          v14 = [v12 objectForKey:@"WFAlertTrigger"];
          if (!v14) {
            goto LABEL_27;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v12 setObject:@"Alert" forKey:@"WFAlertEnabled"];
            v15 = v14;
            if ([(__CFString *)v15 isEqualToString:@"At Location"])
            {
              v16 = [v12 objectForKey:@"WFAlertLocationProximity"];
              if (v16)
              {
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                v18 = v16;
                if (isKindOfClass)
                {
                  char v19 = [(__CFString *)v16 isEqualToString:@"Enter"];
                  v18 = @"When I Arrive";
                  if ((v19 & 1) == 0)
                  {
                    int v20 = [(__CFString *)v16 isEqualToString:@"Leave"];
                    v18 = @"When I Leave";
                    if (!v20)
                    {
LABEL_23:
                      v24 = [v12 objectForKey:@"WFAlertLocationRadius"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v39[0] = @"Value";
                        v37[0] = @"Magnitude";
                        v28 = [v24 stringValue];
                        v37[1] = @"Unit";
                        v38[0] = v28;
                        v38[1] = @"m";
                        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
                        v25 = v29 = v16;
                        v39[1] = @"WFSerializationType";
                        v40[0] = v25;
                        v40[1] = @"WFQuantityFieldValue";
                        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

                        v16 = v29;
                        [v12 setObject:v26 forKey:@"WFAlertLocationRadius"];
                      }
LABEL_26:

                      v36[0] = @"WFAlertLocationRadius";
                      v36[1] = @"WFAlertLocationProximity";
                      v36[2] = @"WFAlertTrigger";
                      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
                      [v12 removeObjectsForKeys:v27];

LABEL_27:
                      uint64_t v4 = v10;
                      uint64_t v5 = v30;
                      goto LABEL_28;
                    }
                  }
                }
              }
              else
              {
                v18 = @"When I Arrive";
              }
              [v12 setObject:v18 forKey:@"WFAlertCondition"];
              goto LABEL_23;
            }
            if (![(__CFString *)v15 isEqualToString:@"At Time"]) {
              goto LABEL_26;
            }
            v21 = v12;
            v22 = @"At Time";
            v23 = @"WFAlertCondition";
          }
          else
          {
            v15 = [v12 objectForKey:@"WFAlertTrigger"];
            v21 = v12;
            v22 = v15;
            v23 = @"WFAlertEnabled";
          }
          [v21 setObject:v22 forKey:v23];
          goto LABEL_26;
        }
LABEL_28:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

@end