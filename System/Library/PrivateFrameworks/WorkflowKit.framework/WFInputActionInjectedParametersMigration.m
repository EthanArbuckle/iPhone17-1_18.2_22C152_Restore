@interface WFInputActionInjectedParametersMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFInputActionInjectedParametersMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return WFCompareBundleVersions(a4, @"1158") == 3;
}

- (void)migrateWorkflow
{
  v3 = [(WFWorkflowMigration *)self workflow];
  v4 = [v3 objectForKeyedSubscript:@"WFWorkflowNoInputBehavior"];
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);
  id v27 = (id)[v6 mutableCopy];

  if (!v27)
  {
    [(WFWorkflowMigration *)self finish];
    goto LABEL_17;
  }
  v7 = [v27 objectForKeyedSubscript:@"Name"];
  uint64_t v8 = objc_opt_class();
  v9 = WFEnforceClass(v7, v8);

  if ([v9 isEqualToString:@"WFWorkflowNoInputBehaviorAskForInput"])
  {
    v10 = [v27 objectForKeyedSubscript:@"Parameters"];
    uint64_t v11 = objc_opt_class();
    v12 = WFEnforceClass(v10, v11);
    v13 = (void *)[v12 mutableCopy];
    v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_opt_new();
    }
    v16 = v15;

    v17 = [v16 objectForKeyedSubscript:@"ItemClass"];
    uint64_t v18 = objc_opt_class();
    v19 = WFEnforceClass(v17, v18);

    v20 = objc_opt_new();
    if ([v19 isEqualToString:@"WFFolderContentItem"])
    {
      [v16 setObject:@"WFGenericFileContentItem" forKeyedSubscript:@"ItemClass"];
      [v20 setObject:@"Folders" forKeyedSubscript:@"WFPickingMode"];
    }
    v21 = [v16 objectForKeyedSubscript:@"AllowMultipleSelection"];
    uint64_t v22 = objc_opt_class();
    v23 = WFEnforceClass(v21, v22);
    int v24 = [v23 BOOLValue];

    if (!v24) {
      goto LABEL_15;
    }
    if (([v19 isEqualToString:@"WFGenericFileContentItem"] & 1) != 0
      || ([v19 isEqualToString:@"WFFolderContentItem"] & 1) != 0)
    {
      v25 = @"SelectMultiple";
    }
    else if ([v19 isEqualToString:@"WFPhotoMediaContentItem"])
    {
      v25 = @"WFSelectMultiplePhotos";
    }
    else if ([v19 isEqualToString:@"WFContactContentItem"])
    {
      v25 = @"WFSelectMultiple";
    }
    else
    {
      if (![v19 isEqualToString:@"WFMPMediaContentItem"]) {
        goto LABEL_15;
      }
      v25 = @"WFExportSongActionSelectMultiple";
    }
    [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v25];
LABEL_15:
    [v16 setObject:v20 forKeyedSubscript:@"SerializedParameters"];
    [v27 setObject:v16 forKeyedSubscript:@"Parameters"];
    v26 = [(WFWorkflowMigration *)self workflow];
    [v26 setObject:v27 forKeyedSubscript:@"WFWorkflowNoInputBehavior"];

    [(WFWorkflowMigration *)self finish];
    goto LABEL_16;
  }
  [(WFWorkflowMigration *)self finish];
LABEL_16:

LABEL_17:
}

@end