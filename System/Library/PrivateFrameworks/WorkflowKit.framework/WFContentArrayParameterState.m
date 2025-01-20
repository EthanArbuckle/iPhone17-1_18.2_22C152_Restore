@interface WFContentArrayParameterState
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFContentArrayParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_class();
  v12 = [(WFArrayParameterState *)self values];
  uint64_t v13 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__WFContentArrayParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v15[3] = &unk_1E6556BE0;
  id v16 = v8;
  id v14 = v8;
  [v11 processValues:v12 context:v10 processingClass:v13 userInputRequiredHandler:v9 valueHandler:v15 processSingleVariableStringsAsContentItems:1];
}

void __89__WFContentArrayParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v7 addItem:v13];
          }
          else {
            objc_msgSend(v7, "addObject:", v13, (void)v14);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end