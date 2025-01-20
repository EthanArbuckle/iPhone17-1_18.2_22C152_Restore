@interface WFCalendarUnitSubstitutableState
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFCalendarUnitSubstitutableState

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

      v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __93__WFCalendarUnitSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_1E65550D8;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16 = [(WFNumberSubstitutableState *)self number];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v16, 0);
  }
}

void __93__WFCalendarUnitSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = &unk_1F2317A78;
  uint64_t v9 = [&unk_1F2317A78 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(&unk_1F2317A78);
        }
        v13 = WFLabelForCalendarUnit([*(id *)(*((void *)&v16 + 1) + 8 * v12) unsignedIntegerValue], 0, 1);
        uint64_t v14 = [v6 rangeOfString:v13 options:1];

        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [&unk_1F2317A78 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_11:
}

@end