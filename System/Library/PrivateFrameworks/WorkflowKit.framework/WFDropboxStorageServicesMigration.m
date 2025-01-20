@interface WFDropboxStorageServicesMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
+ (id)migrationClassDependencies;
- (void)migrateWorkflow;
@end

@implementation WFDropboxStorageServicesMigration

+ (id)migrationClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"is.workflow.actions.dropbox.append", @"is.workflow.actions.dropbox.createfolder", @"is.workflow.actions.dropbox.delete2", @"is.workflow.actions.dropbox.getlink", @"is.workflow.actions.dropbox.pick", @"is.workflow.actions.dropbox.save", 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [v4 objectForKey:@"WFWorkflowActions"];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:@"WFWorkflowActionIdentifier"];
        char v12 = [v5 containsObject:v11];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)migrateWorkflow
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 objectForKey:@"WFWorkflowActionIdentifier"];
        if ([v8 isEqualToString:@"is.workflow.actions.dropbox.append"])
        {
          uint64_t v9 = v7;
          v10 = @"is.workflow.actions.file.append";
          v11 = &unk_1F2317E18;
        }
        else if ([v8 isEqualToString:@"is.workflow.actions.dropbox.createfolder"])
        {
          uint64_t v9 = v7;
          v10 = @"is.workflow.actions.file.createfolder";
          v11 = &unk_1F2317E40;
        }
        else if ([v8 isEqualToString:@"is.workflow.actions.dropbox.delete2"])
        {
          uint64_t v9 = v7;
          v10 = @"is.workflow.actions.file.delete";
          v11 = &unk_1F2317E68;
        }
        else if ([v8 isEqualToString:@"is.workflow.actions.dropbox.getlink"])
        {
          uint64_t v9 = v7;
          v10 = @"is.workflow.actions.file.getlink";
          v11 = (void *)MEMORY[0x1E4F1CC08];
        }
        else if ([v8 isEqualToString:@"is.workflow.actions.dropbox.pick"])
        {
          uint64_t v9 = v7;
          v10 = @"is.workflow.actions.documentpicker.open";
          v11 = &unk_1F2317E90;
        }
        else
        {
          if (![v8 isEqualToString:@"is.workflow.actions.dropbox.save"]) {
            goto LABEL_19;
          }
          uint64_t v9 = v7;
          v10 = @"is.workflow.actions.documentpicker.save";
          v11 = &unk_1F2317EB8;
        }
        WFMigrateDropboxAction(v9, (uint64_t)v10, v11);
LABEL_19:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

@end