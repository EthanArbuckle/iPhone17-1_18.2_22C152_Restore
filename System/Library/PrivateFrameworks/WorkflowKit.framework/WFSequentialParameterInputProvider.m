@interface WFSequentialParameterInputProvider
- (NSDictionary)defaultStates;
- (NSDictionary)prompts;
- (NSMutableDictionary)inputtedStates;
- (NSMutableOrderedSet)queuedParameters;
- (WFAction)fakeAction;
- (WFSequentialParameterInputProvider)initWithDelegate:(id)a3;
- (WFSequentialParameterInputProviderDelegate)delegate;
- (void)askForParameterIfAvailable;
- (void)persistInFlightParameters;
- (void)setDefaultStates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFakeAction:(id)a3;
- (void)setInputtedStates:(id)a3;
- (void)setPrompts:(id)a3;
- (void)setQueuedParameters:(id)a3;
- (void)startWithAction:(id)a3 parameters:(id)a4 defaultStates:(id)a5 prompts:(id)a6;
@end

@implementation WFSequentialParameterInputProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputtedStates, 0);
  objc_storeStrong((id *)&self->_prompts, 0);
  objc_storeStrong((id *)&self->_defaultStates, 0);
  objc_storeStrong((id *)&self->_queuedParameters, 0);
  objc_storeStrong((id *)&self->_fakeAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInputtedStates:(id)a3
{
}

- (NSMutableDictionary)inputtedStates
{
  return self->_inputtedStates;
}

- (void)setPrompts:(id)a3
{
}

- (NSDictionary)prompts
{
  return self->_prompts;
}

- (void)setDefaultStates:(id)a3
{
}

- (NSDictionary)defaultStates
{
  return self->_defaultStates;
}

- (void)setQueuedParameters:(id)a3
{
}

- (NSMutableOrderedSet)queuedParameters
{
  return self->_queuedParameters;
}

- (void)setFakeAction:(id)a3
{
}

- (WFAction)fakeAction
{
  return self->_fakeAction;
}

- (void)setDelegate:(id)a3
{
}

- (WFSequentialParameterInputProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFSequentialParameterInputProviderDelegate *)WeakRetained;
}

- (void)persistInFlightParameters
{
  id v4 = [(WFSequentialParameterInputProvider *)self delegate];
  v3 = [(WFSequentialParameterInputProvider *)self inputtedStates];
  [v4 sequentialParameterInputProvider:self didFinishWithInputtedStates:v3];
}

- (void)askForParameterIfAvailable
{
  v3 = [(WFSequentialParameterInputProvider *)self queuedParameters];
  id v4 = [v3 firstObject];

  if (v4)
  {
    v5 = [(WFSequentialParameterInputProvider *)self queuedParameters];
    [v5 removeObject:v4];

    v6 = [(WFSequentialParameterInputProvider *)self fakeAction];
    v7 = [v6 visibleParametersWithProcessing:1];

    v8 = [v4 key];
    v9 = [v7 objectMatchingKey:@"key" value:v8];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [[WFBooleanSubstitutableState alloc] initWithBoolValue:1];
        v11 = [(WFSequentialParameterInputProvider *)self fakeAction];
        v12 = [v4 key];
        [v11 setParameterState:v10 forKey:v12];

        [(WFSequentialParameterInputProvider *)self askForParameterIfAvailable];
      }
      else
      {
        v13 = [(WFSequentialParameterInputProvider *)self defaultStates];
        v14 = [v4 key];
        v22 = [v13 objectForKey:v14];

        v15 = [(WFSequentialParameterInputProvider *)self prompts];
        v16 = [v4 key];
        v17 = [v15 objectForKey:v16];

        v18 = [(WFSequentialParameterInputProvider *)self delegate];
        v19 = [(WFSequentialParameterInputProvider *)self fakeAction];
        v20 = [v17 prompt];
        v21 = [v17 linkDialog];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke;
        v23[3] = &unk_1E654EAD8;
        v23[4] = self;
        id v24 = v4;
        [v18 sequentialParameterInputProvider:self didAdvanceToParameter:v24 action:v19 defaultState:v22 prompt:v20 linkDialog:v21 completion:v23];
      }
    }
    else
    {
      [(WFSequentialParameterInputProvider *)self askForParameterIfAvailable];
    }
  }
  else
  {
    v7 = [(WFSequentialParameterInputProvider *)self delegate];
    v9 = [(WFSequentialParameterInputProvider *)self inputtedStates];
    [v7 sequentialParameterInputProvider:self didFinishWithInputtedStates:v9];
  }
}

void __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = [v6 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) delegate];
      [v9 sequentialParameterInputProviderDidCancel:*(void *)(a1 + 32)];
    }
  }
  else
  {
    v10 = [v6 fakeAction];
    v11 = [*(id *)(a1 + 40) key];
    char v12 = [v10 setParameterState:v5 forKey:v11];

    if ((v12 & 1) == 0)
    {
      v13 = getWFGeneralLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [*(id *)(a1 + 40) key];
        *(_DWORD *)buf = 136315650;
        v19 = "-[WFSequentialParameterInputProvider askForParameterIfAvailable]_block_invoke";
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Unable to set parameter state: %@ for key: %@ in sequential parameter input provider", buf, 0x20u);
      }
    }
    v15 = [*(id *)(a1 + 32) inputtedStates];
    v16 = [*(id *)(a1 + 40) key];
    [v15 setValue:v5 forKey:v16];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke_175;
    block[3] = &unk_1E6558B28;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke_175(uint64_t a1)
{
  return [*(id *)(a1 + 32) askForParameterIfAvailable];
}

- (void)startWithAction:(id)a3 parameters:(id)a4 defaultStates:(id)a5 prompts:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v34 = a6;
  v13 = (void *)[v10 copyForProcessing];
  [(WFSequentialParameterInputProvider *)self setFakeAction:v13];

  v14 = (void *)MEMORY[0x1E4F1CA70];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __87__WFSequentialParameterInputProvider_startWithAction_parameters_defaultStates_prompts___block_invoke;
  v39[3] = &unk_1E654EAB0;
  v39[4] = self;
  v15 = objc_msgSend(v11, "if_compactMap:", v39);
  v16 = [v14 orderedSetWithOrderedSet:v15];
  [(WFSequentialParameterInputProvider *)self setQueuedParameters:v16];

  v17 = [(WFSequentialParameterInputProvider *)self fakeAction];
  v18 = [v10 workflow];
  [v17 willBeAddedToWorkflow:v18];

  v19 = [(WFSequentialParameterInputProvider *)self fakeAction];
  __int16 v20 = [v10 workflow];
  [v19 wasAddedToWorkflow:v20];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v11;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v27 = [v26 key];
        v28 = [v12 objectForKey:v27];

        if (v28)
        {
          v29 = [(WFSequentialParameterInputProvider *)self fakeAction];
          v30 = [v26 key];
          [v29 setParameterState:v28 forKey:v30];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v23);
  }

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(WFSequentialParameterInputProvider *)self setInputtedStates:v31];

  v32 = (void *)[v12 copy];
  [(WFSequentialParameterInputProvider *)self setDefaultStates:v32];

  v33 = (void *)[v34 copy];
  [(WFSequentialParameterInputProvider *)self setPrompts:v33];

  [(WFSequentialParameterInputProvider *)self askForParameterIfAvailable];
}

id __87__WFSequentialParameterInputProvider_startWithAction_parameters_defaultStates_prompts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fakeAction];
  id v5 = [v3 key];
  v6 = [v4 parameterForKey:v5];

  v7 = [v3 localizedPrompt];

  if (v7)
  {
    char v8 = [v3 localizedPrompt];
    v9 = (void *)[v8 copy];
    [v6 setLocalizedPrompt:v9];
  }
  return v6;
}

- (WFSequentialParameterInputProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFSequentialParameterInputProvider;
  id v5 = [(WFSequentialParameterInputProvider *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

@end