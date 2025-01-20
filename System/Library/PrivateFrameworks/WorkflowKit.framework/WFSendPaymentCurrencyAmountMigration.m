@interface WFSendPaymentCurrencyAmountMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFSendPaymentCurrencyAmountMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1075")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.venmo.pay", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  [(WFWorkflowMigration *)self enumerateActionsWithIdentifier:@"is.workflow.actions.venmo.pay" usingBlock:&__block_literal_global_25800];
  [(WFWorkflowMigration *)self finish];
}

void __55__WFSendPaymentCurrencyAmountMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
}

@end