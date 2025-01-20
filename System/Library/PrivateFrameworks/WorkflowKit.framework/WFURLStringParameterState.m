@interface WFURLStringParameterState
+ (Class)processingValueClass;
+ (id)forceStringToURL:(id)a3 error:(id *)a4;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFURLStringParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFVariableStringParameterState *)self variableString];
  v12 = [v11 variablesOfType:@"Ask"];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v18.receiver = self;
    v18.super_class = (Class)WFURLStringParameterState;
    [(WFVariableStringParameterState *)&v18 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    v14 = [(WFVariableStringParameterState *)self variableString];

    if (v14)
    {
      v15 = [(WFVariableStringParameterState *)self variableString];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __86__WFURLStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v16[3] = &unk_1E65503B8;
      id v17 = v10;
      [v15 processWithContext:v8 completionHandler:v16];
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __86__WFURLStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  if ([v7 length])
  {
    id v11 = v8;
    id v9 = +[WFURLStringParameterState forceStringToURL:v7 error:&v11];
    id v10 = v11;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v8 = v10;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)forceStringToURL:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  id v9 = [v8 scheme];
  if (!v9)
  {
    if (![MEMORY[0x1E4F5AA50] stringMatchesExactly:v7]) {
      goto LABEL_5;
    }
    id v10 = [MEMORY[0x1E4F5AA50] URLsInString:v7 error:0];
    id v11 = [v10 firstObject];

    uint64_t v12 = [v11 absoluteString];
    id v9 = v7;
    id v8 = v11;
    id v7 = (void *)v12;
  }

LABEL_5:
  if (!v8)
  {
    if ([v5 rangeOfString:@":"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = 0;
      goto LABEL_13;
    }
    uint64_t v17 = [v7 stringByAddingPercentEscapesUsingEncoding:4];

    id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    id v7 = (void *)v17;
    if (!v8) {
      goto LABEL_13;
    }
  }
  if (([MEMORY[0x1E4F5AA50] stringMatchesExactly:v7] & 1) != 0
    || ([v8 scheme], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v14 = (void *)v13,
        uint64_t v15 = [v5 rangeOfString:@":"],
        v14,
        v15 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v8 = v8;
    v16 = v8;
    goto LABEL_14;
  }
LABEL_13:
  objc_super v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F289A0];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v20 = NSString;
  v21 = WFLocalizedString(@"Invalid URL: %@");
  v22 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v5, v25);
  v26[0] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  *a4 = [v18 errorWithDomain:v19 code:-1000 userInfo:v23];

  v16 = 0;
LABEL_14:

  return v16;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end