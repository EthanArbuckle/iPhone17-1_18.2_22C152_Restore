@interface WFDropboxDeleteMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFDropboxDeleteMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"142") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.dropbox.delete", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  v4 = (void *)[v3 copy];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v8 = 0;
      uint64_t v30 = v6;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        v10 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v11 = [v9 objectForKeyedSubscript:v10];
        int v12 = [v11 isEqualToString:@"is.workflow.actions.dropbox.delete"];

        if (v12)
        {
          v13 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v9 setObject:@"is.workflow.actions.dropbox.delete2" forKeyedSubscript:v13];

          v14 = [(WFWorkflowMigration *)self actionParametersKey];
          v15 = [v9 objectForKeyedSubscript:v14];

          v16 = objc_opt_new();
          v17 = [(WFWorkflowMigration *)self actionParametersKey];
          v18 = [v9 objectForKeyedSubscript:v17];
          v19 = [v18 objectForKey:@"WFDropboxFilePath"];
          [v16 setValue:v19 forKey:@"WFDropboxFilePath"];

          v20 = [(WFWorkflowMigration *)self actionParametersKey];
          v21 = [v9 objectForKeyedSubscript:v20];
          v22 = [v21 objectForKey:@"WFDropboxShowPicker"];
          [v16 setValue:v22 forKey:@"WFDropboxShowPicker"];

          [v15 removeObjectForKey:@"WFDropboxFilePath"];
          [v15 removeObjectForKey:@"WFDropboxShowPicker"];
          v23 = objc_opt_new();
          v24 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v23 setObject:@"is.workflow.actions.dropbox.pick" forKeyedSubscript:v24];

          v25 = [(WFWorkflowMigration *)self actionParametersKey];
          [v23 setObject:v16 forKeyedSubscript:v25];

          v26 = [MEMORY[0x1E4F29128] UUID];
          [v9 setObject:v26 forKeyedSubscript:@"WFActionUUID"];

          v27 = [(WFWorkflowMigration *)self actions];
          v28 = [(WFWorkflowMigration *)self actions];
          objc_msgSend(v27, "insertObject:atIndex:", v23, objc_msgSend(v28, "indexOfObject:", v9));

          uint64_t v7 = v29;
          uint64_t v6 = v30;
          [v9 removeObjectForKey:@"WFActionUUID"];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }

  [(WFWorkflowMigration *)self finish];
}

@end