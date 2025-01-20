@interface WFInputParameterMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (id)findActionProvidingInputToActionAtIndex:(unint64_t)a3 inWorkflow:(id)a4 reachedBeginning:(BOOL *)a5 inputActionIndex:(unint64_t *)a6;
- (id)findGetVariableActionProvidingInputToActionAtIndex:(int64_t)a3 inWorkflow:(id)a4;
- (void)migrateLegacyInputVariablesInParameterDictionary:(id)a3 toVariable:(id)a4;
- (void)migrateWorkflow;
- (void)recursivelyFindDictionaryWithKey:(id)a3 inArray:(id)a4 then:(id)a5;
- (void)recursivelyFindDictionaryWithKey:(id)a3 inDictionary:(id)a4 then:(id)a5;
- (void)recursivelyFindDictionaryWithKey:(id)a3 inObject:(id)a4 then:(id)a5;
@end

@implementation WFInputParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return WFCompareBundleVersions(a4, @"994") & 1;
}

- (void)migrateLegacyInputVariablesInParameterDictionary:(id)a3 toVariable:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke;
  v8[3] = &unk_1E6551ED8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WFInputParameterMigration *)self recursivelyFindDictionaryWithKey:@"WFSerializationType" inDictionary:a3 then:v8];
}

void __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke_2;
  v4[3] = &unk_1E6551EB0;
  v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 recursivelyFindDictionaryWithKey:@"Type" inDictionary:a2 then:v4];
}

void __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectForKey:@"Type"];
  int v5 = [v4 isEqualToString:@"Input"];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) serializedRepresentation];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v12 = 136315906;
        v13 = "WFEnforceClass";
        __int16 v14 = 2114;
        id v15 = v8;
        __int16 v16 = 2114;
        id v17 = (id)objc_opt_class();
        __int16 v18 = 2114;
        uint64_t v19 = v7;
        id v11 = v17;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v12, 0x2Au);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = v8;
    }

    [v3 setDictionary:v9];
  }
}

- (void)recursivelyFindDictionaryWithKey:(id)a3 inArray:(id)a4 then:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v9);
        }
        [(WFInputParameterMigration *)self recursivelyFindDictionaryWithKey:v8 inObject:*(void *)(*((void *)&v15 + 1) + 8 * v14++) then:v10];
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)recursivelyFindDictionaryWithKey:(id)a3 inDictionary:(id)a4 then:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  uint64_t v11 = [v9 objectForKey:v8];
  if (v11)
  {
    v10[2](v10, v9);
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          [(WFInputParameterMigration *)self recursivelyFindDictionaryWithKey:v8 inObject:v17 then:v10];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)recursivelyFindDictionaryWithKey:(id)a3 inObject:(id)a4 then:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(WFInputParameterMigration *)self recursivelyFindDictionaryWithKey:v10 inDictionary:v8 then:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WFInputParameterMigration *)self recursivelyFindDictionaryWithKey:v10 inArray:v8 then:v9];
    }
  }
}

- (id)findGetVariableActionProvidingInputToActionAtIndex:(int64_t)a3 inWorkflow:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = a3 - 1;
    id v10 = [v6 actions];
    uint64_t v11 = [v10 objectAtIndex:a3 - 1];

    id v12 = [v11 identifier];
    int v13 = [v12 isEqualToString:@"is.workflow.actions.getvariable"];

    if (v13)
    {
      id v8 = v11;
    }
    else if ([v11 inputPassthrough])
    {
      uint64_t v14 = [(WFInputParameterMigration *)self findActionProvidingInputToActionAtIndex:v9 inWorkflow:v7 reachedBeginning:0 inputActionIndex:0];
      uint64_t v15 = [v14 identifier];
      int v16 = [v15 isEqualToString:@"is.workflow.actions.getvariable"];

      id v8 = 0;
      if (v16) {
        id v8 = v14;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)findActionProvidingInputToActionAtIndex:(unint64_t)a3 inWorkflow:(id)a4 reachedBeginning:(BOOL *)a5 inputActionIndex:(unint64_t *)a6
{
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  int64_t v9 = [v7 actions];
  id v10 = (void *)[v8 initWithArray:v9];

  uint64_t v11 = [v10 objectAtIndex:a3];
  id v12 = objc_opt_new();
  while (1)
  {
    int v13 = (void *)MEMORY[0x1C87CA430]();
    uint64_t v14 = [v10 indexOfObject:v11];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_13;
    }
    uint64_t v15 = v14;
    if (!v14)
    {
      if (a5)
      {
        int v16 = 0;
        *a5 = 1;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if ([v12 containsObject:v11]) {
      goto LABEL_13;
    }
    [v12 addObject:v11];
    int v16 = [v11 inputSourceInWorkflow:v7];
    if (!v16
      || (unint64_t v17 = [v10 indexOfObject:v16], v17 == v15 - 1)
      && ([v11 legacyBehaviorIgnoresOutputFromAction:v16 inWorkflow:v7] & 1) != 0)
    {

LABEL_13:
      int v16 = 0;
      goto LABEL_14;
    }
    long long v18 = [[WFInputMigrationUUIDProvider alloc] initWithAction:v16 atPosition:v17];
    long long v19 = [v16 outputVariableWithVariableProvider:v11 UUIDProvider:v18];

    if (v19) {
      break;
    }

    uint64_t v11 = v16;
  }
  if (a6) {
    *a6 = v17;
  }

LABEL_14:

  return v16;
}

- (void)migrateWorkflow
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [WFWorkflowFile alloc];
  v4 = [(WFWorkflowMigration *)self workflow];
  int v5 = [(WFWorkflowFile *)v3 initWithDictionary:v4 name:@"Migrating Workflow" performMigration:0];

  id v40 = 0;
  id v6 = [(WFWorkflowFile *)v5 recordRepresentationWithError:&v40];
  id v7 = v40;
  if (v6)
  {
    id v39 = v7;
    id v8 = [[WFWorkflow alloc] initWithRecord:v6 reference:0 storageProvider:0 migrateIfNecessary:0 environment:0 error:&v39];
    id v9 = v39;

    if (v8)
    {
      id v30 = v9;
      v32 = v6;
      v33 = v5;
      id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v11 = [(WFWorkflow *)v8 actions];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __44__WFInputParameterMigration_migrateWorkflow__block_invoke;
      v34[3] = &unk_1E6558910;
      id v12 = v11;
      id v35 = v12;
      v36 = self;
      v31 = v8;
      v37 = v8;
      id v29 = v10;
      id v38 = v29;
      [(WFWorkflow *)v37 performBatchOperation:v34];
      id v13 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      if ([v12 count])
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = [v12 objectAtIndex:v14];
          int v16 = [(WFWorkflowMigration *)self actions];
          unint64_t v17 = [v16 objectAtIndex:v14];

          long long v18 = [(WFWorkflowMigration *)self actionIdentifierKey];
          long long v19 = [v17 objectForKey:v18];

          long long v20 = [(WFWorkflowMigration *)self actionParametersKey];
          long long v21 = [v17 objectForKey:v20];

          v22 = [v15 UUID];

          if (v22)
          {
            uint64_t v23 = [v15 UUID];
            [v21 setObject:v23 forKey:@"UUID"];
          }
          if ([v19 isEqualToString:@"is.workflow.actions.getvariable"]) {
            [v13 addIndex:v14];
          }

          ++v14;
        }
        while (v14 < [v12 count]);
      }
      [v13 removeIndexes:v29];
      if ([v13 count])
      {
        v24 = [(WFWorkflowMigration *)self actions];
        [v24 removeObjectsAtIndexes:v13];
      }
      [(WFWorkflowMigration *)self finish];

      id v6 = v32;
      int v5 = v33;
      id v9 = v30;
      id v8 = v31;
    }
    else
    {
      v27 = getWFWorkflowMigrationLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v28 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v42 = "-[WFInputParameterMigration migrateWorkflow]";
        __int16 v43 = 2114;
        v44 = v28;
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s WFInputParameterMigration failed to open workflow with error: %{public}@", buf, 0x16u);
      }
      [(WFWorkflowMigration *)self finish];
    }

    id v7 = v9;
  }
  else
  {
    v25 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v42 = "-[WFInputParameterMigration migrateWorkflow]";
      __int16 v43 = 2114;
      v44 = v26;
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s WFInputParameterMigration failed to open record with error: %{public}@", buf, 0x16u);
    }
    [(WFWorkflowMigration *)self finish];
  }
}

unint64_t __44__WFInputParameterMigration_migrateWorkflow__block_invoke(id *a1)
{
  v1 = a1;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unint64_t result = [a1[4] count];
  if (result)
  {
    unint64_t v3 = 0;
    uint64_t v44 = *MEMORY[0x1E4FB4FB8];
    id v38 = sel_initWithVariable_;
    id v39 = v1;
    while (1)
    {
      v4 = (void *)MEMORY[0x1C87CA430]();
      int v5 = [v1[4] objectAtIndex:v3];
      id v6 = [v5 identifier];
      int v7 = [v6 isEqualToString:@"is.workflow.actions.conditional"];

      if (v7)
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = @"WFInput";
      }
      else
      {
        id v10 = [v5 inputParameter];
        id v9 = [v10 keyForSerialization];
        id v8 = (objc_class *)[v10 stateClass];
      }
      uint64_t v11 = objc_msgSend(v1[5], "actions", v38);
      id v12 = [v11 objectAtIndex:v3];

      id v13 = [v1[5] actionParametersKey];
      v48 = v12;
      v49 = [v12 objectForKey:v13];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 inputPassthrough] && !v9)
      {
        unint64_t v14 = [v1[5] findGetVariableActionProvidingInputToActionAtIndex:v3 inWorkflow:v1[6]];
        if (v14) {
          objc_msgSend(v1[7], "addIndex:", objc_msgSend(v1[4], "indexOfObject:", v14));
        }
      }
      char v55 = 0;
      uint64_t v54 = 0;
      uint64_t v15 = [v1[5] findActionProvidingInputToActionAtIndex:v3 inWorkflow:v1[6] reachedBeginning:&v55 inputActionIndex:&v54];
      if (v15)
      {
        int v16 = [WFInputMigrationUUIDProvider alloc];
        unint64_t v17 = [(WFInputMigrationUUIDProvider *)v16 initWithAction:v15 atPosition:v54];
        long long v18 = [v15 outputVariableWithVariableProvider:v5 UUIDProvider:v17];
      }
      else
      {
        long long v18 = 0;
      }
      if (v55) {
        break;
      }
LABEL_21:
      if (v18)
      {
        v47 = v4;
        if (v9 && v8)
        {
          uint64_t v23 = [v49 objectForKeyedSubscript:v9];

          if ([v5 inputRequired])
          {
            if (!v23) {
              goto LABEL_40;
            }
LABEL_46:
            [v1[5] migrateLegacyInputVariablesInParameterDictionary:v49 toVariable:v18];
            v4 = v47;
            goto LABEL_47;
          }
          id v40 = v23;
          v41 = v8;
          __int16 v43 = v15;
          v46 = v9;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v28 = [v5 containedVariables];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v56 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v51;
            while (2)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v51 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = [*(id *)(*((void *)&v50 + 1) + 8 * i) UUID];
                v34 = [(WFVariable *)v18 UUID];
                int v35 = [v33 isEqualToString:v34];

                if (v35)
                {

                  v1 = v39;
                  id v9 = v46;
                  uint64_t v15 = v43;
                  goto LABEL_46;
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v56 count:16];
              if (v30) {
                continue;
              }
              break;
            }
          }

          v1 = v39;
          id v9 = v46;
          id v8 = v41;
          uint64_t v15 = v43;
          if (v40) {
            goto LABEL_46;
          }
LABEL_40:
          if ([(objc_class *)v8 instancesRespondToSelector:v38])
          {
            v36 = v15;
            v37 = (void *)[[v8 alloc] initWithVariable:v18];
            v24 = [v37 serializedRepresentation];

            uint64_t v15 = v36;
          }
          else
          {
            v24 = 0;
          }
          [v49 setObject:v24 forKeyedSubscript:v9];
        }
        else
        {
          v24 = [v15 identifier];
          if ([v24 isEqualToString:@"is.workflow.actions.getvariable"]
            && ![v5 inputPassthrough])
          {
            [v5 inputTypes];
            v26 = v25 = v15;
            uint64_t v27 = [v26 count];

            uint64_t v15 = v25;
            if (v27) {
              objc_msgSend(v1[7], "addIndex:", objc_msgSend(v1[4], "indexOfObject:", v25));
            }
            goto LABEL_46;
          }
        }

        goto LABEL_46;
      }
LABEL_47:

      ++v3;
      unint64_t result = [v1[4] count];
      if (v3 >= result) {
        return result;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = [v1[6] workflowTypes];
      if (![v19 containsObject:v44])
      {
LABEL_20:

        goto LABEL_21;
      }
      [v1[6] effectiveInputClasses];
      uint64_t v45 = v9;
      v21 = long long v20 = v4;
      v22 = [v5 inputContentClasses];
      int v42 = [v5 canHandleInputOfContentClasses:v21 withSupportedClasses:v22 includingCoercedTypes:1];

      v4 = v20;
      id v9 = v45;

      if (!v42) {
        goto LABEL_21;
      }
    }
    long long v19 = v18;
    long long v18 = [[WFShortcutInputVariable alloc] initWithVariableProvider:v5 aggrandizements:0];
    goto LABEL_20;
  }
  return result;
}

@end