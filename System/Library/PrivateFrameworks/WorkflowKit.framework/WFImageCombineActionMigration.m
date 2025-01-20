@interface WFImageCombineActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFImageCombineActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.image.combine", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
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
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v8 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v9 = [v7 objectForKey:v8];

        if ([v9 isEqualToString:@"is.workflow.actions.image.combine"])
        {
          v10 = [(WFWorkflowMigration *)self actionParametersKey];
          v11 = [v7 objectForKeyedSubscript:v10];

          v12 = [v11 objectForKeyedSubscript:@"WFImageCombineMode"];
          if (v12)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v13 = v12;
            }
            else {
              v13 = 0;
            }
          }
          else
          {
            v13 = 0;
          }
          v14 = v13;

          v15 = [v11 objectForKeyedSubscript:@"WFImageCombineDirection"];
          if (v15)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v16 = v15;
            }
            else {
              v16 = 0;
            }
          }
          else
          {
            v16 = 0;
          }
          v17 = v16;

          if (v14) {
            v18 = v14;
          }
          else {
            v18 = @"Side-by-Side";
          }
          if (v17) {
            v19 = v17;
          }
          else {
            v19 = @"Horizontal";
          }
          if ([(__CFString *)v18 isEqualToString:@"Side-by-Side"]
            && (char v20 = [(__CFString *)v19 isEqualToString:@"Horizontal"],
                v21 = @"Horizontally",
                (v20 & 1) != 0)
            || [(__CFString *)v18 isEqualToString:@"Side-by-Side"]
            && (char v22 = [(__CFString *)v19 isEqualToString:@"Vertical"],
                v21 = @"Vertically",
                (v22 & 1) != 0))
          {
            [v11 setObject:v21 forKey:@"WFImageCombineMode"];
            goto LABEL_30;
          }
          if ([(__CFString *)v18 isEqualToString:@"Grid"])
          {
            [v11 setObject:@"In a Grid" forKey:@"WFImageCombineMode"];
            v23 = [v11 objectForKey:@"WFImageCombineDirection"];

            if (v23) {
LABEL_30:
            }
              [v11 removeObjectForKey:@"WFImageCombineDirection"];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

@end