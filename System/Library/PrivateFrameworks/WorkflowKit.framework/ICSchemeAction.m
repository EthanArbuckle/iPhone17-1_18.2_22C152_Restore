@interface ICSchemeAction
- (BOOL)isCallbackAction;
- (ICScheme)scheme;
- (ICSchemeAction)initWithDefinition:(id)a3 scheme:(id)a4;
- (NSString)formatString;
- (id)defersCompletionUntilReturn;
- (id)formatKeys;
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
@end

@implementation ICSchemeAction

- (void).cxx_destruct
{
}

- (ICScheme)scheme
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheme);
  return (ICScheme *)WeakRetained;
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v33 = a4;
  id v31 = a5;
  id v29 = a6;
  id v30 = a7;
  v12 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v32 = self;
  v13 = [(ICAction *)self outputMapping];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v19 = [v18 sourceType];
        int v20 = [v19 isEqualToString:@"ResultPlaceholder"];

        if (v20)
        {
          v21 = [v18 sourceKey];
          v22 = NSString;
          v23 = [v18 destinationKey];
          v24 = [v22 stringWithFormat:@"%@", v23];
          [v12 setObject:v24 forKey:v21];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v15);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v35[3] = &unk_1E6556CE0;
  v35[4] = v32;
  id v36 = v31;
  id v38 = v30;
  id v39 = v29;
  id v37 = v12;
  id v25 = v12;
  id v26 = v29;
  id v27 = v31;
  id v28 = v30;
  [(ICAction *)v32 processInput:v34 parameters:v33 completionHandler:v35];
}

void __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5, void *a6)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  v13 = a5;
  id v14 = a6;
  if (v14)
  {
    v13[2](v13);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    char v39 = a4;
    long long v41 = v13;
    uint64_t v40 = a1;
    uint64_t v15 = [*(id *)(a1 + 32) formatString];
    uint64_t v16 = (void *)[v15 mutableCopy];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v17 = [v11 keyEnumerator];
    v18 = [v17 allObjects];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          v24 = [v11 objectForKey:v23];
          id v25 = [NSString stringWithFormat:@"[[%@]]", v23];
          objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", v25, v24, 0, 0, objc_msgSend(v16, "length"));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v20);
    }

    id v26 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
    id v27 = [v26 URLByAddingValuesFromQueryDictionary:v12];

    uint64_t v28 = [*(id *)(v40 + 32) scheme];
    uint64_t v37 = *(void *)(v40 + 40);
    id v38 = (void *)v28;
    id v29 = [*(id *)(v40 + 32) scheme];
    id v30 = [v29 app];
    id v31 = [v30 bundleIdentifier];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2;
    v45[3] = &unk_1E6556C90;
    v13 = v41;
    v32 = v41;
    v45[4] = *(void *)(v40 + 32);
    id v46 = v32;
    id v47 = *(id *)(v40 + 64);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_4;
    v42[3] = &unk_1E6556CB8;
    long long v43 = v32;
    id v44 = *(id *)(v40 + 56);
    id v33 = +[_ICURLRequest requestWithURL:v27 scheme:v38 userInterface:v37 bundleIdentifier:v31 successHandler:v45 failureHandler:v42];

    if ([*(id *)(v40 + 48) count])
    {
      id v34 = objc_msgSend(MEMORY[0x1E4F1CB10], "dc_queryStringWithQueryDictionary:addingPercentEscapes:", *(void *)(v40 + 48), 0);
      [v33 setSuccessURLQueryString:v34];
    }
    if ((v39 & 1) != 0 || ([*(id *)(v40 + 32) isCallbackAction] & 1) == 0) {
      [v33 setCallbackRequest:0];
    }
    v35 = [*(id *)(v40 + 32) defersCompletionUntilReturn];
    if (v35 || ([v33 isCallbackRequest] & 1) == 0) {
      objc_msgSend(v33, "setDeferCompletionUntilReturn:", objc_msgSend(v35, "BOOLValue"));
    }
    id v36 = +[ICManager sharedManager];
    [v36 performRequest:v33];

    id v14 = 0;
  }
}

void __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v20 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = a1;
  v5 = [*(id *)(a1 + 32) outputMapping];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = [v11 destinationType];
        int v13 = [v12 isEqualToString:@"Output"];

        if (v13)
        {
          id v14 = [v11 sourceKey];
          uint64_t v15 = [v4 objectForKey:v14];

          if (v15)
          {
            uint64_t v16 = [v11 contentItemClasses];
            uint64_t v17 = [v16 array];

            [v20 addObject:v15];
            v8 = (void *)v17;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if ([v20 numberOfItems])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3;
    v21[3] = &unk_1E6556C68;
    id v22 = *(id *)(v18 + 48);
    char v23 = a3;
    [v20 generateCollectionByCoercingToItemClasses:v8 completionHandler:v21];
  }
  else
  {
    (*(void (**)(void))(*(void *)(v18 + 48) + 16))();
  }
}

void __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)defersCompletionUntilReturn
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"DeferCompletion"];

  return v3;
}

- (BOOL)isCallbackAction
{
  uint64_t v3 = [(ICSchemeAction *)self scheme];
  if ([v3 isCallbackScheme])
  {
    id v4 = [(ICAction *)self definition];
    id v5 = [v4 objectForKey:@"CallbackUnsupported"];
    int v6 = [v5 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)formatKeys
{
  v2 = [(ICSchemeAction *)self formatString];
  uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\[\\[(.*?)\\]\\]" options:0 error:0];
  id v4 = objc_msgSend(v3, "matchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__ICSchemeAction_formatKeys__block_invoke;
  v8[3] = &unk_1E6556C30;
  id v9 = v2;
  id v5 = v2;
  int v6 = objc_msgSend(v4, "if_map:", v8);

  return v6;
}

uint64_t __28__ICSchemeAction_formatKeys__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 rangeAtIndex:1];
  return objc_msgSend(v2, "substringWithRange:", v4, v3);
}

- (NSString)formatString
{
  uint64_t v3 = [(ICAction *)self definition];
  uint64_t v4 = [v3 objectForKey:@"Format"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (v5)
    {
LABEL_3:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v6 = v5;
      }
      else {
        int v6 = 0;
      }
      goto LABEL_15;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [(ICAction *)self definition];
      id v9 = [v5 objectForKey:@"Format"];
      goto LABEL_16;
    }
    id v7 = v4;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v10 = v8;

    id v5 = [v10 objectForKey:@"Phone"];

    if (v5) {
      goto LABEL_3;
    }
  }
  int v6 = 0;
LABEL_15:
  id v9 = v6;
LABEL_16:
  id v11 = v9;

  return (NSString *)v11;
}

- (ICSchemeAction)initWithDefinition:(id)a3 scheme:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 app];
  id v9 = [(ICAction *)self initWithDefinition:v7 app:v8];

  if (v9)
  {
    objc_storeWeak((id *)&v9->_scheme, v6);
    id v10 = v9;
  }

  return v9;
}

@end