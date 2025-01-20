@interface WFDateFieldParameterState
+ (id)processingValueClasses;
- (NSDate)preprocessedDate;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setPreprocessedDate:(id)a3;
@end

@implementation WFDateFieldParameterState

- (void).cxx_destruct
{
}

- (void)setPreprocessedDate:(id)a3
{
}

- (NSDate)preprocessedDate
{
  return self->_preprocessedDate;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  v11 = [(WFVariableStringParameterState *)self variableString];
  v12 = [v11 variablesOfType:@"Ask"];
  uint64_t v13 = [v12 count];

  v14 = [v8 parameter];
  v15 = [v14 resultType];

  if (([v15 isEqualToString:@"String"] & 1) != 0 || v13)
  {
    v30.receiver = self;
    v30.super_class = (Class)WFDateFieldParameterState;
    [(WFVariableStringParameterState *)&v30 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    int v16 = [v15 isEqualToString:@"WFDetectedDate"];
    v17 = [(WFDateFieldParameterState *)self preprocessedDate];

    if (v17)
    {
      if (v16)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F5A8B8]);
        v19 = [(WFDateFieldParameterState *)self preprocessedDate];
        v20 = (void *)[v18 initWithDate:v19 timeIsSignificant:1];
        v10[2](v10, v20, 0);
      }
      else
      {
        v19 = [(WFDateFieldParameterState *)self preprocessedDate];
        v10[2](v10, v19, 0);
      }
    }
    else
    {
      v21 = [(WFVariableStringParameterState *)self variableString];
      if ([v21 representsSingleContentVariable])
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v27[3] = &unk_1E6551F90;
        v22 = (id *)&v28;
        v28 = v10;
        char v29 = v16;
        [v21 processIntoContentItemsWithContext:v8 completionHandler:v27];
      }
      else
      {
        v23 = [(WFVariableStringParameterState *)self variableString];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
        v24[3] = &unk_1E6551FB8;
        char v26 = v16;
        v22 = (id *)&v25;
        v25 = v10;
        [v23 processWithContext:v8 completionHandler:v24];
      }
    }
  }
}

void __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v4[3] = &unk_1E6551F68;
    id v5 = *(id *)(a1 + 32);
    char v6 = *(unsigned char *)(a1 + 40);
    [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = (void *)MEMORY[0x1E4F5A8B0];
  if (*(unsigned char *)(a1 + 40))
  {
    v17 = a5;
    id v9 = a5;
    v10 = &v17;
    uint64_t v11 = [v8 detectedDatesInString:a2 error:&v17];
  }
  else
  {
    int v16 = a5;
    id v12 = a5;
    v10 = &v16;
    uint64_t v11 = [v8 datesInString:a2 error:&v16];
  }
  uint64_t v13 = (void *)v11;
  id v14 = *v10;

  v15 = [v13 firstObject];

  (*(void (**)(void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v15);
}

void __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v12)
  {
    int v9 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F5A8B8]) initWithDate:v12 timeIsSignificant:1];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)processingValueClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

@end