@interface WFFileEntityParameterState
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFFileEntityParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      v14 = (void *)[(id)objc_opt_class() processingValueClass];
      if ([v14 isEqual:objc_opt_class()]
        && ([(WFVariableSubstitutableParameterState *)self variable],
            v15 = objc_claimAutoreleasedReturnValue(),
            [v15 possibleContentClasses],
            v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "firstObject"), "superclass"), "isEqual:", objc_opt_class()), v16, v15, (v17 & 1) == 0))
      {
        v20 = [(WFVariableSubstitutableParameterState *)self variable];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v23[3] = &unk_1E6552A90;
        id v24 = v10;
        [v20 getFileRepresentationWithContext:v8 completionHandler:v23];

        v12 = v24;
      }
      else
      {
        v18 = [(WFVariableSubstitutableParameterState *)self variable];
        uint64_t v19 = objc_opt_class();
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
        v21[3] = &unk_1E6552A68;
        id v22 = v10;
        [v18 getObjectRepresentationForClass:v19 context:v8 completionHandler:v21];

        v12 = v22;
      }
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WFFileEntityParameterState;
    [(WFFileParameterState *)&v25 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

uint64_t __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end