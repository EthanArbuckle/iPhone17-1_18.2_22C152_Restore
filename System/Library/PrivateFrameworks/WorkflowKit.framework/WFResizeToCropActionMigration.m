@interface WFResizeToCropActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFResizeToCropActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"128") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.image.resize", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [(WFWorkflowMigration *)self actions];
  v4 = [(WFWorkflowMigration *)self actionIdentifierKey];
  id v5 = [v3 filteredArrayForKey:v4 value:@"is.workflow.actions.image.resize"];

  v6 = self;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = v5;
  uint64_t v40 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v40)
  {
    id v38 = v7;
    uint64_t v39 = *(void *)v45;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v7);
        }
        v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        v10 = [(WFWorkflowMigration *)v6 actionParametersKey];
        v41 = v9;
        v11 = [v9 objectForKey:v10];

        v12 = [v11 objectForKeyedSubscript:@"WFImageResizeCropEnabled"];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"WFImageResizeWidth"];
        v14 = (void *)v13;
        v15 = &unk_1F2316CE0;
        if (v13) {
          v15 = (void *)v13;
        }
        id v43 = v15;

        uint64_t v16 = [v11 objectForKeyedSubscript:@"WFImageResizeHeight"];
        v17 = (void *)v16;
        v18 = &unk_1F2316CF8;
        if (v16) {
          v18 = (void *)v16;
        }
        id v42 = v18;

        uint64_t v19 = [v11 objectForKeyedSubscript:@"WFImageResizeCropX"];
        v20 = (void *)v19;
        if (v19) {
          v21 = (void *)v19;
        }
        else {
          v21 = &unk_1F2316D10;
        }
        id v22 = v21;

        uint64_t v23 = [v11 objectForKeyedSubscript:@"WFImageResizeCropY"];
        v24 = (void *)v23;
        if (v23) {
          v25 = (void *)v23;
        }
        else {
          v25 = &unk_1F2316D10;
        }
        id v26 = v25;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 BOOLValue])
        {
          v27 = objc_opt_new();
          [v27 setObject:v43 forKeyedSubscript:@"WFImageCropWidth"];
          [v27 setObject:v42 forKeyedSubscript:@"WFImageCropHeight"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && ![v22 integerValue]
            && ![v26 integerValue])
          {
            v28 = @"Top Left";
            v30 = &unk_1F2316D10;
            v29 = &unk_1F2316D10;
          }
          else
          {
            v28 = @"Custom";
            v29 = v22;
            v30 = v26;
          }
          [v27 setObject:v28 forKeyedSubscript:@"WFImageCropPosition"];
          [v27 setObject:v29 forKeyedSubscript:@"WFImageCropX"];
          [v27 setObject:v30 forKeyedSubscript:@"WFImageCropY"];
          v31 = objc_opt_new();
          v32 = [(WFWorkflowMigration *)v6 actionIdentifierKey];
          [v31 setObject:@"is.workflow.actions.image.crop" forKeyedSubscript:v32];

          v33 = [(WFWorkflowMigration *)v6 actionParametersKey];
          [v31 setObject:v27 forKeyedSubscript:v33];

          v34 = [(WFWorkflowMigration *)v6 actions];
          [(WFWorkflowMigration *)v6 actions];
          v36 = v35 = v6;
          objc_msgSend(v34, "insertObject:atIndex:", v31, objc_msgSend(v36, "indexOfObject:", v41) + 1);

          v6 = v35;
          id v7 = v38;
        }
        [v11 removeObjectForKey:@"WFImageResizeCropEnabled"];
        [v11 removeObjectForKey:@"WFImageResizeCropX"];
        [v11 removeObjectForKey:@"WFImageResizeCropY"];

        ++v8;
      }
      while (v40 != v8);
      uint64_t v37 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v40 = v37;
    }
    while (v37);
  }

  [(WFWorkflowMigration *)v6 finish];
}

@end