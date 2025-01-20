@interface WFIntentDynamicResolver
- (INCExtensionConnection)extensionConnection;
- (INCExtensionProxy)extensionProxy;
- (NSMutableSet)activeRequests;
- (NSString)intentKeyPathToResolve;
- (WFIntentDynamicResolver)initWithIntentKeyPathToResolve:(id)a3 dataSource:(id)a4;
- (WFIntentDynamicResolverDataSource)dataSource;
- (id)intent;
- (id)resolveWithUserInput:(id)a3 completionBlock:(id)a4;
- (unint64_t)state;
- (void)beginSessionWithCompletionBlock:(id)a3;
- (void)endSession;
- (void)failWithError:(id)a3;
- (void)populatedSkeletonIntentWithUserInput:(id)a3 forKeyPath:(id)a4 completionBlock:(id)a5;
- (void)setActiveRequests:(id)a3;
@end

@implementation WFIntentDynamicResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_extensionProxy, 0);
  objc_storeStrong((id *)&self->_extensionConnection, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_intentKeyPathToResolve, 0);
}

- (void)setActiveRequests:(id)a3
{
}

- (NSMutableSet)activeRequests
{
  return self->_activeRequests;
}

- (INCExtensionProxy)extensionProxy
{
  return self->_extensionProxy;
}

- (INCExtensionConnection)extensionConnection
{
  return self->_extensionConnection;
}

- (WFIntentDynamicResolverDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WFIntentDynamicResolverDataSource *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)intentKeyPathToResolve
{
  return self->_intentKeyPathToResolve;
}

- (void)failWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_state = 2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(WFIntentDynamicResolver *)self activeRequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v10 isCancelled] & 1) == 0)
        {
          v11 = [v10 resolutionBlock];
          ((void (**)(void, void, uint64_t, void, id))v11)[2](v11, 0, 1, 0, v4);
        }
        [v10 cancel];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12 = objc_opt_new();
  [(WFIntentDynamicResolver *)self setActiveRequests:v12];
}

- (void)populatedSkeletonIntentWithUserInput:(id)a3 forKeyPath:(id)a4 completionBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFIntentDynamicResolver *)self dataSource];
  if (v11)
  {

LABEL_4:
    long long v14 = [(WFIntentDynamicResolver *)self dataSource];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__WFIntentDynamicResolver_populatedSkeletonIntentWithUserInput_forKeyPath_completionBlock___block_invoke;
    v16[3] = &unk_1E654FF80;
    id v19 = v10;
    id v17 = v8;
    id v18 = v9;
    [v14 generateSkeletonIntentForDynamicResolver:self withCompletionBlock:v16];

    goto LABEL_5;
  }
  v12 = [(WFIntentDynamicResolver *)self dataSource];
  char v13 = objc_opt_respondsToSelector();

  if (v13) {
    goto LABEL_4;
  }
  long long v15 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFIntentDynamicResolver populatedSkeletonIntentWithUserInput:forKeyPath:completionBlock:]";
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Trying to populate skeleton intent, but there's no data source.", buf, 0xCu);
  }

  (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
LABEL_5:
}

void __91__WFIntentDynamicResolver_populatedSkeletonIntentWithUserInput_forKeyPath_completionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (a1[4] && a1[5])
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F30568]) initWithIdentifier:0 displayString:a1[4]];
      [v8 setValue:v7 forKeyPath:a1[5]];
    }
    uint64_t v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();
}

- (id)intent
{
  return (id)[(INCExtensionConnection *)self->_extensionConnection intent];
}

- (id)resolveWithUserInput:(id)a3 completionBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(WFIntentDynamicResolver *)self state] == 1)
  {
    id v8 = objc_opt_new();
    [v8 setResolutionBlock:v7];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke;
    aBlock[3] = &unk_1E654FF08;
    id v9 = v8;
    id v27 = v9;
    id v10 = v7;
    v28 = self;
    id v29 = v10;
    v11 = _Block_copy(aBlock);
    v12 = [(WFIntentDynamicResolver *)self intentKeyPathToResolve];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_2;
    uint64_t v22 = &unk_1E654FF58;
    v23 = self;
    id v24 = v10;
    v25 = v11;
    id v13 = v11;
    [(WFIntentDynamicResolver *)self populatedSkeletonIntentWithUserInput:v6 forKeyPath:v12 completionBlock:&v19];

    long long v14 = [(WFIntentDynamicResolver *)self activeRequests];
    [v14 addObject:v9];

    long long v15 = v25;
    id v16 = v9;
  }
  else
  {
    id v17 = getWFIntentExecutionLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[WFIntentDynamicResolver resolveWithUserInput:completionBlock:]";
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Currently not in a resolution session.", buf, 0xCu);
    }

    (*((void (**)(id, void, uint64_t, void, void))v7 + 2))(v7, 0, 1, 0, 0);
    id v16 = 0;
  }

  return v16;
}

void __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a2;
  id v8 = a4;
  id v9 = a5;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v10 = [*(id *)(a1 + 40) activeRequests];
  [v10 removeObject:*(void *)(a1 + 32)];
}

void __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) extensionConnection];
    [v7 setIntent:v5];

    id v8 = (void *)[v5 copy];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v9 = [*(id *)(a1 + 32) extensionProxy];
    id v10 = [*(id *)(a1 + 32) intentKeyPathToResolve];
    v18[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_3;
    v13[3] = &unk_1E654FF30;
    objc_copyWeak(&v16, &location);
    id v15 = *(id *)(a1 + 48);
    id v12 = v8;
    id v14 = v12;
    [v9 resolveIntentSlotKeyPaths:v11 completionHandler:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = [WeakRetained intentKeyPathToResolve];
  id v11 = [v8 objectForKeyedSubscript:v10];

  if (!a2)
  {
    id v17 = [WeakRetained intent];
    id v18 = [v17 _intentInstanceDescription];
    uint64_t v19 = [WeakRetained intentKeyPathToResolve];
    uint64_t v20 = [v18 slotByName:v19];

    v21 = (void *)[v20 resolutionResultClass];
    uint64_t v22 = [v11 data];
    v23 = [v21 _resolutionResultWithData:v22 slotDescription:v20];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = getWFIntentExecutionLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[WFIntentDynamicResolver resolveWithUserInput:completionBlock:]_block_invoke_3";
        _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_FAULT, "%s Parameter resolution is not implemented for array parameters. See rdar://51679504", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_23;
    }
    uint64_t v25 = objc_opt_class();
    id v26 = v23;
    if (v26 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = getWFGeneralLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v37 = "WFEnforceClass";
        __int16 v38 = 2114;
        id v39 = v26;
        __int16 v40 = 2114;
        id v41 = (id)objc_opt_class();
        __int16 v42 = 2114;
        uint64_t v43 = v25;
        id v29 = v41;
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v27 = 0;
    }
    else
    {
      id v27 = v26;
    }

    uint64_t v30 = [v27 resolutionResultCode];
    if (v30 == 3)
    {
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v32 = [v27 itemToConfirm];
      v35 = v32;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      (*(void (**)(uint64_t, void *, uint64_t, void, void))(v33 + 16))(v33, v34, 3, *(void *)(a1 + 32), 0);
    }
    else
    {
      if (v30 != 2)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_22;
      }
      uint64_t v31 = *(void *)(a1 + 40);
      uint64_t v32 = [v27 disambiguationItems];
      (*(void (**)(uint64_t, void *, uint64_t, void, void))(v31 + 16))(v31, v32, 2, *(void *)(a1 + 32), 0);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if ([v11 result] == 7) {
    uint64_t v12 = 7;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [WeakRetained intentKeyPathToResolve];
  id v14 = [v7 valueForKeyPath:v13];

  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v14, 0);
  (*(void (**)(uint64_t, void *, uint64_t, void, void))(v15 + 16))(v15, v16, v12, *(void *)(a1 + 32), 0);

LABEL_24:
}

- (void)endSession
{
  v3 = [(WFIntentDynamicResolver *)self extensionConnection];
  [v3 reset];

  extensionConnection = self->_extensionConnection;
  self->_extensionConnection = 0;

  extensionProxy = self->_extensionProxy;
  self->_extensionProxy = 0;

  self->_state = 0;
}

- (void)beginSessionWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(WFIntentDynamicResolver *)self state] == 1)
  {
    v4[2](v4, 0);
  }
  else
  {
    [(WFIntentDynamicResolver *)self endSession];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke;
    v5[3] = &unk_1E654FEE0;
    v5[4] = self;
    id v6 = v4;
    [(WFIntentDynamicResolver *)self populatedSkeletonIntentWithUserInput:0 forKeyPath:0 completionBlock:v5];
  }
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F70BF8]) initWithIntent:v5 supportedExtensionTypes:7 donateInteraction:0 groupIdentifier:0 remoteProxyProvider:0];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  [*(id *)(*(void *)(a1 + 32) + 32) setRequiresTCC:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setRequestTimeoutInterval:30.0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_2;
  v16[3] = &unk_1E6552488;
  objc_copyWeak(&v17, &location);
  [*(id *)(*(void *)(a1 + 32) + 32) setTimeoutHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_3;
  v14[3] = &unk_1E6552488;
  objc_copyWeak(&v15, &location);
  [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:v14];
  id v10 = *(void **)(*(void *)(a1 + 32) + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_4;
  v11[3] = &unk_1E654FEB8;
  objc_copyWeak(&v13, &location);
  id v12 = *(id *)(a1 + 40);
  [v10 resumeWithCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = *MEMORY[0x1E4F28A50];
  if (v3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v16[0] = v3;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F70BD8] code:1307 userInfo:v6];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  v14[0] = v7;
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v13[0] = v5;
  v13[1] = v9;
  id v10 = WFLocalizedString(@"Cannot Communicate With App");
  v14[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v12 = [v8 errorWithDomain:@"WFIntentDynamicResolverErrorDomain" code:100 userInfo:v11];

  [WeakRetained failWithError:v12];
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = *MEMORY[0x1E4F28A50];
  if (v3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v16[0] = v3;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F70BD8] code:1301 userInfo:v6];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  v14[0] = v7;
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v13[0] = v5;
  v13[1] = v9;
  id v10 = WFLocalizedString(@"Cannot Communicate With App");
  v14[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v12 = [v8 errorWithDomain:@"WFIntentDynamicResolverErrorDomain" code:100 userInfo:v11];

  [WeakRetained failWithError:v12];
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (v7)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v17[0] = v7;
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v16[0] = v11;
    v16[1] = v12;
    id v13 = WFLocalizedString(@"Cannot Communicate With App");
    v17[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v15 = [v10 errorWithDomain:@"WFIntentDynamicResolverErrorDomain" code:100 userInfo:v14];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained[2] = (id)1;
    objc_storeStrong(WeakRetained + 5, a2);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v15 = 0;
  }
}

- (WFIntentDynamicResolver)initWithIntentKeyPathToResolve:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFIntentDynamicResolver;
  uint64_t v9 = [(WFIntentDynamicResolver *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intentKeyPathToResolve, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    uint64_t v11 = v10;
  }

  return v10;
}

@end