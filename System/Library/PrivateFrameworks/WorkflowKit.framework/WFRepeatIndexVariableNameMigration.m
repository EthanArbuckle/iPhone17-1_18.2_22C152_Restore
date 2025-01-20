@interface WFRepeatIndexVariableNameMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)calculateVariableNamesAtActionIndex:(unint64_t)a3 oldRepeatScopeVariables:(id *)a4;
- (void)migrateWorkflow;
@end

@implementation WFRepeatIndexVariableNameMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  BOOL v6 = (unint64_t)(WFCompareBundleVersions(a4, @"154") - 1) >= 2
    && WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.getvariable", v5)
    && ((WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.repeat.each", v5) & 1) != 0
     || WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.repeat.count", v5));

  return v6;
}

- (void)calculateVariableNamesAtActionIndex:(unint64_t)a3 oldRepeatScopeVariables:(id *)a4
{
  v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v8 = [(WFWorkflowMigration *)self actions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__WFRepeatIndexVariableNameMigration_calculateVariableNamesAtActionIndex_oldRepeatScopeVariables___block_invoke;
  v10[3] = &unk_1E65588E8;
  v12 = v16;
  v13 = v15;
  v10[4] = self;
  unint64_t v14 = a3;
  id v9 = v7;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v10];

  if (a4) {
    *a4 = v9;
  }

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
}

void __98__WFRepeatIndexVariableNameMigration_calculateVariableNamesAtActionIndex_oldRepeatScopeVariables___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  if (*(void *)(a1 + 64) < a3 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a4 = 1;
    goto LABEL_20;
  }
  v7 = [*(id *)(a1 + 32) actionIdentifierKey];
  v8 = [v16 objectForKey:v7];

  if (([v8 isEqualToString:@"is.workflow.actions.repeat.each"] & 1) != 0
    || [v8 isEqualToString:@"is.workflow.actions.repeat.count"])
  {
    id v9 = [*(id *)(a1 + 32) actionParametersKey];
    v10 = [v16 objectForKey:v9];

    id v11 = [v10 objectForKey:@"WFControlFlowMode"];
    v12 = v11;
    if (!v11) {
      goto LABEL_8;
    }
    uint64_t v13 = [v11 integerValue];
    if (v13 == 2)
    {
      --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    else if (!v13)
    {
LABEL_8:
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (*(void *)(a1 + 64) != a3)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
        {
          unint64_t v14 = @"Repeat Index";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Repeat Index %ld", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
          unint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
        {
          v15 = @"Repeat Index";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Repeat Index %ld", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [*(id *)(a1 + 40) setObject:v15 forKey:v14];
      }
    }
  }
LABEL_20:
}

- (void)migrateWorkflow
{
  v3 = [(WFWorkflowMigration *)self actions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E65588C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];

  [(WFWorkflowMigration *)self finish];
}

void __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = [*(id *)(a1 + 32) actionIdentifierKey];
  v7 = [v5 objectForKey:v6];

  if ([v7 isEqualToString:@"is.workflow.actions.getvariable"])
  {
    v8 = *(void **)(a1 + 32);
    id v31 = 0;
    [v8 calculateVariableNamesAtActionIndex:a3 oldRepeatScopeVariables:&v31];
    id v9 = v31;
    v10 = [*(id *)(a1 + 32) actionParametersKey];
    id v11 = [v5 objectForKey:v10];

    v12 = [v11 objectForKey:@"WFVariable"];
    uint64_t v13 = [v12 objectForKey:@"Value"];
    unint64_t v14 = [v13 objectForKey:@"VariableName"];
    v15 = [v13 objectForKey:@"VariableUUID"];
    uint64_t v16 = [v9 objectForKey:v14];
    if (v16)
    {
      v17 = (void *)v16;
      [v13 setObject:v16 forKey:@"VariableName"];
      v26 = [*(id *)(a1 + 32) workflow];
      [v26 objectForKey:@"WFWorkflowVariables"];
      v27 = v11;
      v18 = id v28 = v9;
      v19 = (void *)MEMORY[0x1E4F28F60];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke_2;
      v29[3] = &unk_1E6558898;
      id v30 = v15;
      id v25 = v15;
      v20 = [v19 predicateWithBlock:v29];
      v21 = [v18 filteredArrayUsingPredicate:v20];
      [v21 firstObject];
      v22 = v14;
      v24 = v23 = v12;

      id v11 = v27;
      id v9 = v28;

      [v24 setObject:v17 forKey:@"Name"];
      v12 = v23;
      unint64_t v14 = v22;

      v15 = v17;
    }
  }
}

uint64_t __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"UUID"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end