@interface WFSetFlashlightMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFSetFlashlightMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1050.8") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.flashlight", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v2 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = @"is.workflow.actions.flashlight";
    v7 = @"WFFlashlightSetting";
    uint64_t v8 = *(void *)v31;
    uint64_t v29 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      uint64_t v28 = v5;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        v11 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
        v12 = [v10 objectForKey:v11];

        if ([v12 isEqualToString:v6])
        {
          v13 = [(WFWorkflowMigration *)v2 actionParametersKey];
          v14 = [v10 objectForKeyedSubscript:v13];

          v15 = [v14 objectForKeyedSubscript:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v15;
            if ([v16 isEqualToString:@"Off"])
            {
              [v14 setObject:@"set" forKey:@"operation"];
              v17 = v14;
              v18 = (__CFString *)MEMORY[0x1E4F1CC28];
              goto LABEL_15;
            }
            if ([v16 isEqualToString:@"On"])
            {
              [v14 setObject:@"set" forKey:@"operation"];
              v17 = v14;
              v18 = (__CFString *)MEMORY[0x1E4F1CC38];
LABEL_15:
              v25 = @"state";
LABEL_16:
              [v17 setObject:v18 forKey:v25];
              [v14 removeObjectForKey:v7];
            }
            else if ([v16 isEqualToString:@"Toggle"])
            {
              v17 = v14;
              v18 = @"toggle";
              v25 = @"operation";
              goto LABEL_16;
            }
LABEL_17:

            uint64_t v5 = v28;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v27 = v15;
              [(__CFString *)v27 objectForKeyedSubscript:@"WFSerializationType"];
              v19 = v2;
              v20 = v7;
              v21 = v6;
              v23 = v22 = v3;
              int v24 = [v23 isEqual:@"WFTextTokenAttachment"];

              v3 = v22;
              v6 = v21;
              v7 = v20;
              v2 = v19;
              if (v24)
              {
                v17 = v14;
                v18 = v27;
                goto LABEL_15;
              }
              goto LABEL_17;
            }
          }

          uint64_t v8 = v29;
        }

        ++v9;
      }
      while (v5 != v9);
      uint64_t v26 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v5 = v26;
    }
    while (v26);
  }

  [(WFWorkflowMigration *)v2 finish];
}

@end