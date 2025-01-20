@interface WFContactRepresentedValueMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFContactRepresentedValueMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"309") == 3)
  {
    if (WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.phonenumber", v5)) {
      char HasActionsWithIdentifier = 1;
    }
    else {
      char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.email", v5);
    }
  }
  else
  {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v3 = [(WFWorkflowMigration *)self actions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__WFContactRepresentedValueMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E65588C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];

  [(WFWorkflowMigration *)self finish];
}

void __53__WFContactRepresentedValueMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [*(id *)(a1 + 32) actionIdentifierKey];
  v4 = [v11 objectForKey:v3];

  if (([v4 isEqualToString:@"is.workflow.actions.phonenumber"] & 1) != 0
    || [v4 isEqualToString:@"is.workflow.actions.email"])
  {
    id v5 = [*(id *)(a1 + 32) actionParametersKey];
    v6 = [v11 objectForKey:v5];

    v7 = [v6 objectForKey:@"WFPhoneNumber"];
    v8 = v7;
    if (v7) {
      WFMigrateContactFieldValueParameterValue(v7, 3u);
    }
    v9 = [v6 objectForKey:@"WFEmailAddress"];
    v10 = v9;
    if (v9) {
      WFMigrateContactFieldValueParameterValue(v9, 4u);
    }
  }
}

@end