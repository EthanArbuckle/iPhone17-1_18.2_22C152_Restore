@interface WFGetFileMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFGetFileMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1106.1")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.documentpicker.open", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(WFWorkflowMigration *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKey:v9];

        if ([v10 isEqualToString:@"is.workflow.actions.documentpicker.open"])
        {
          v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v8 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKeyedSubscript:@"WFFileStorageService"];
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v14 = v13;
            }
            else {
              v14 = 0;
            }
          }
          else
          {
            v14 = 0;
          }
          id v15 = v14;

          int v16 = [v15 isEqualToString:@"Dropbox"];
          if (v16)
          {
            v17 = [(WFWorkflowMigration *)self actionIdentifierKey];
            [v8 setObject:@"is.workflow.actions.dropbox.open" forKey:v17];
LABEL_21:

            [v12 removeObjectForKey:@"WFFileStorageService"];
            goto LABEL_22;
          }
          v17 = [v12 objectForKeyedSubscript:@"WFShowFilePicker"];
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (![v17 BOOLValue])
            {
              [v12 removeObjectForKey:@"SelectMultiple"];
LABEL_20:
              [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"WFGetFolderContents"];
              goto LABEL_21;
            }
          }
          else
          {

            v17 = 0;
          }
          v18 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"is.workflow.actions.file.select" forKey:v18];

          goto LABEL_20;
        }
LABEL_22:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end