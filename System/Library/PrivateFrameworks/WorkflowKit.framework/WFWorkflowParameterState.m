@interface WFWorkflowParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (id)legacySerializedRepresentation;
- (void)processValue:(id)a3 withContext:(id)a4 valueHandler:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFWorkflowParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [[WFWorkflowParameterStateDescriptor alloc] initWithWorkflowName:v6 workflowIdentifier:0 isSelf:0];
LABEL_11:
    v12 = v7;
    goto LABEL_12;
  }
  uint64_t v8 = objc_opt_class();
  id v9 = v5;
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315906;
      v15 = "WFEnforceClass";
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      id v11 = v19;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v14, 0x2Au);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v9;
  }

  if ([v6 count])
  {
    v7 = +[MTLJSONAdapter modelOfClass:objc_opt_class() fromJSONDictionary:v6 error:0];
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5)
    {
LABEL_3:
      id v6 = +[MTLJSONAdapter JSONDictionaryFromModel:v5 error:0];
      goto LABEL_6;
    }
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"WFWorkflowParameterState.m", 100, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFWorkflowParameterStateDescriptor class]]" object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (void)processValue:(id)a3 withContext:(id)a4 valueHandler:(id)a5
{
  v7 = (void (**)(id, void *, void))a5;
  id v8 = a3;
  id v13 = [a4 parameter];
  id v9 = [v13 workflow];
  v10 = [v9 reference];

  id v11 = +[WFDatabaseProxy defaultDatabase];
  v12 = [v8 matchingWorkflowInDatabase:v11 containingWorkflow:v10];

  v7[2](v7, v12, 0);
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  id v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      int v14 = [(WFVariableSubstitutableParameterState *)self variable];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v15[3] = &unk_1E6558FD0;
      id v17 = v10;
      v15[4] = self;
      id v16 = v8;
      [v14 getContentWithContext:v16 completionHandler:v15];

      v12 = v17;
    }
  }
  else
  {
    v12 = [(WFVariableSubstitutableParameterState *)self value];
    [(WFWorkflowParameterState *)self processValue:v12 withContext:v8 valueHandler:v10];
  }
}

void __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 numberOfItems])
  {
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v9[3] = &unk_1E6558FA8;
    id v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = *(id *)(a1 + 48);
    [v5 generateCollectionByCoercingToItemClasses:v7 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v16 = a4;
  id v6 = [a2 items];
  v7 = [v6 firstObject];

  id v8 = v7;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v10)
    {
      int v14 = [v10 workflowReference];
      v15 = [[WFWorkflowParameterStateDescriptor alloc] initWithWorkflowReference:v14 isSelf:0];
      [*(id *)(a1 + 32) processValue:v15 withContext:*(void *)(a1 + 40) valueHandler:*(void *)(a1 + 48)];

LABEL_12:
      goto LABEL_14;
    }
    if (v13)
    {
      id v13 = [v13 string];
      int v14 = [[WFWorkflowParameterStateDescriptor alloc] initWithWorkflowName:v13 workflowIdentifier:0 isSelf:0];
      [*(id *)(a1 + 32) processValue:v14 withContext:*(void *)(a1 + 40) valueHandler:*(void *)(a1 + 48)];
      goto LABEL_12;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

- (id)legacySerializedRepresentation
{
  v3 = [(WFVariableSubstitutableParameterState *)self value];

  if (v3)
  {
    v4 = [(WFVariableSubstitutableParameterState *)self value];
    id v5 = [v4 workflowName];
  }
  else
  {
    id v5 = [(WFVariableSubstitutableParameterState *)self serializedRepresentation];
  }
  return v5;
}

@end