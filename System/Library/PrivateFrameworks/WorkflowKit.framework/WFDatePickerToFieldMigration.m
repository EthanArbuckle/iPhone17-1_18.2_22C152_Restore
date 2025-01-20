@interface WFDatePickerToFieldMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFDatePickerToFieldMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"332") == 3) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.getupcomingevents", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:2];
  [v3 setTimeStyle:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__WFDatePickerToFieldMigration_migrateWorkflow__block_invoke;
  v5[3] = &unk_1E6552758;
  id v6 = v3;
  id v4 = v3;
  [(WFWorkflowMigration *)self enumerateActionsWithIdentifier:@"is.workflow.actions.getupcomingevents" usingBlock:v5];
  [(WFWorkflowMigration *)self finish];
}

void __47__WFDatePickerToFieldMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 objectForKey:@"WFSpecifiedDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [*(id *)(a1 + 32) stringFromDate:v4];
    [v6 setObject:v5 forKey:@"WFSpecifiedDate"];
  }
}

@end