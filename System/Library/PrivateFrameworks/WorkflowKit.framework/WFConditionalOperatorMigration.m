@interface WFConditionalOperatorMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFConditionalOperatorMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.conditional", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  [(WFWorkflowMigration *)self enumerateActionsWithIdentifier:@"is.workflow.actions.conditional" usingBlock:&__block_literal_global_65220];
  [(WFWorkflowMigration *)self finish];
}

void __49__WFConditionalOperatorMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  v3 = [v12 objectForKeyedSubscript:@"WFControlFlowMode"];
  uint64_t v4 = [v3 integerValue];

  id v5 = v12;
  if (!v4)
  {
    v6 = [v12 objectForKeyedSubscript:@"WFCondition"];
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v6 isEqualToString:@"Equals"])
      {
        uint64_t v7 = 4;
      }
      else if ([v6 isEqualToString:@"Is Greater Than"])
      {
        uint64_t v7 = 2;
      }
      else if ([v6 isEqualToString:@"Is Less Than"])
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = 99;
      }
      v8 = [WFNumberSubstitutableState alloc];
      v9 = [NSNumber numberWithInteger:v7];
      v10 = [(WFNumberSubstitutableState *)v8 initWithNumber:v9];
      v11 = [(WFVariableSubstitutableParameterState *)v10 serializedRepresentation];
      [v12 setObject:v11 forKeyedSubscript:@"WFCondition"];

      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WFConditionalLegacyComparisonBehavior"];
    }

    id v5 = v12;
  }
}

@end