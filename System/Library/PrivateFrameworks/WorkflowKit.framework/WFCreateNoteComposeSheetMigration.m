@interface WFCreateNoteComposeSheetMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFCreateNoteComposeSheetMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1167")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"com.apple.mobilenotes.SharingExtension", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v3 = [(WFWorkflowMigration *)self actions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__WFCreateNoteComposeSheetMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E65588C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];

  [(WFWorkflowMigration *)self finish];
}

void __52__WFCreateNoteComposeSheetMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [*(id *)(a1 + 32) actionIdentifierKey];
  v4 = [v19 objectForKeyedSubscript:v3];
  int v5 = [v4 isEqualToString:@"com.apple.mobilenotes.SharingExtension"];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) actionParametersKey];
    v7 = [v19 objectForKeyedSubscript:v6];
    v8 = [v7 objectForKeyedSubscript:@"ShowWhenRun"];

    v9 = [(WFVariableSubstitutableParameterState *)[WFBooleanSubstitutableState alloc] initWithSerializedRepresentation:v8 variableProvider:0 parameter:0];
    v10 = [(WFNumberSubstitutableState *)v9 number];
    int v11 = [v10 BOOLValue];

    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      v13 = [v12 actionIdentifierKey];
      [v19 setObject:@"is.workflow.actions.runextension" forKeyedSubscript:v13];

      v14 = [*(id *)(a1 + 32) actionParametersKey];
      v15 = [v19 objectForKeyedSubscript:v14];
      v16 = v15;
      v17 = @"com.apple.mobilenotes";
      v18 = @"WFAppIdentifier";
    }
    else
    {
      v14 = [v12 actionParametersKey];
      v15 = [v19 objectForKeyedSubscript:v14];
      v16 = v15;
      v17 = (__CFString *)MEMORY[0x1E4F1CC28];
      v18 = @"OpenWhenRun";
    }
    [v15 setObject:v17 forKeyedSubscript:v18];
  }
}

@end