@interface WFCreateFolderMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFCreateFolderMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1106")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.file.createfolder", v5);
  }
  else {
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
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v8 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v9 = [v7 objectForKey:v8];

        if ([v9 isEqualToString:@"is.workflow.actions.file.createfolder"])
        {
          v10 = [(WFWorkflowMigration *)self actionParametersKey];
          v11 = [v7 objectForKeyedSubscript:v10];

          v12 = [v11 objectForKeyedSubscript:@"WFFileStorageService"];
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
          id v14 = v13;

          int v15 = [v14 isEqualToString:@"Dropbox"];
          if (v15)
          {
            v16 = [(WFWorkflowMigration *)self actionIdentifierKey];
            [v7 setObject:@"is.workflow.actions.dropbox.createfolder" forKey:v16];
          }
          [v11 removeObjectForKey:@"WFFileStorageService"];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

@end