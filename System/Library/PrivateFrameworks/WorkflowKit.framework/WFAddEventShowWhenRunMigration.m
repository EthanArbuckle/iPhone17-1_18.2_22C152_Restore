@interface WFAddEventShowWhenRunMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFAddEventShowWhenRunMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (WFCompareBundleVersions(v6, @"0") == 2 && (WFCompareBundleVersions(v6, @"1084") & 1) != 0) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.addnewevent", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  [(WFWorkflowMigration *)self enumerateActionsWithIdentifier:@"is.workflow.actions.addnewevent" usingBlock:&__block_literal_global_18619];
  [(WFWorkflowMigration *)self finish];
}

void __49__WFAddEventShowWhenRunMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v3 = [v4 objectForKeyedSubscript:@"ShowWhenRun"];
  if (!v3) {
    [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ShowWhenRun"];
  }
}

@end