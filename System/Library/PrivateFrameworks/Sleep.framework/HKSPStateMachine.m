@interface HKSPStateMachine
+ (id)_contextKey;
- (BOOL)initialized;
- (HKSPStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4;
- (HKSPStateMachineContext)currentContext;
- (HKSPStateMachineDelegate)delegate;
- (HKSPStateMachineInfoProvider)infoProvider;
- (HKSPStateMachineState)currentState;
- (NSArray)allStates;
- (NSString)currentStateIdentifier;
- (NSString)description;
- (id)stateMachineName;
- (unint64_t)loggingCategory;
- (void)enterState:(id)a3;
- (void)notifyDelegateWithBlock:(id)a3;
- (void)perform:(id)a3 withContext:(id)a4;
- (void)setInitialState:(id)a3;
- (void)updateState;
@end

@implementation HKSPStateMachine

+ (id)_contextKey
{
  v2 = NSString;
  v3 = NSStringFromClass((Class)a1);
  v4 = [v2 stringWithFormat:@"%@Context", v3];

  return v4;
}

- (HKSPStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKSPStateMachine;
  v8 = [(HKSPStateMachine *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_infoProvider, v7);
    v10 = v9;
  }

  return v9;
}

- (void)setInitialState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (HKSPStateMachineState *)a3;
  if (self->_currentState) {
    __assert_rtn("-[HKSPStateMachine setInitialState:]", "HKSPStateMachine.m", 41, "_currentState == nil");
  }
  v5 = v4;
  id v6 = HKSPLogForCategory([(HKSPStateMachine *)self loggingCategory]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HKSPStateMachine *)self stateMachineName];
    v8 = [(HKSPStateMachineState *)v5 stateName];
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting in state %{public}@", (uint8_t *)&v10, 0x16u);
  }
  currentState = self->_currentState;
  self->_currentState = v5;
}

- (NSArray)allStates
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSString)currentStateIdentifier
{
  v2 = [(HKSPStateMachine *)self currentState];
  v3 = [v2 stateIdentifier];

  return (NSString *)v3;
}

- (void)perform:(id)a3 withContext:(id)a4
{
  v16 = (void (**)(void))a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v6 threadDictionary];

  if (v5)
  {
    v8 = [(id)objc_opt_class() _contextKey];
    v9 = [v7 objectForKeyedSubscript:v8];
    int v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    __int16 v12 = v11;

    [v12 addObject:v5];
    v13 = [(id)objc_opt_class() _contextKey];
    [v7 setObject:v12 forKeyedSubscript:v13];

    v16[2]();
    uint64_t v14 = [(id)objc_opt_class() _contextKey];
    v15 = [v7 objectForKeyedSubscript:v14];
    [v15 removeLastObject];
  }
  else
  {
    v16[2]();
  }
}

- (HKSPStateMachineContext)currentContext
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [(id)objc_opt_class() _contextKey];
  id v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [v5 lastObject];

  return (HKSPStateMachineContext *)v6;
}

- (void)enterState:(id)a3
{
  v4 = (HKSPStateMachineState *)a3;
  id v5 = v4;
  currentState = self->_currentState;
  if (currentState == v4) {
    id v7 = (HKSPStateMachineState *)[(HKSPStateMachineState *)v4 copy];
  }
  else {
    id v7 = currentState;
  }
  v8 = v7;
  v9 = [(HKSPStateMachine *)self currentContext];
  int v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init(HKSPStateMachineContext);
  }
  __int16 v12 = v11;

  v13 = [(HKSPStateMachineContext *)v12 contextWithNextState:v5 previousState:v8 isInitializing:!self->_initialized];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __31__HKSPStateMachine_enterState___block_invoke;
  v16[3] = &unk_1E5D31B38;
  BOOL v20 = currentState != v5;
  v17 = v8;
  v18 = self;
  v19 = v5;
  uint64_t v14 = v5;
  v15 = v8;
  [(HKSPStateMachine *)self perform:v16 withContext:v13];
  self->_initialized = 1;
}

uint64_t __31__HKSPStateMachine_enterState___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _willExit];
    if (*(unsigned char *)(a1 + 56))
    {
      if (HKSPIsUnitTesting()) {
        goto LABEL_11;
      }
      v2 = HKSPLogForCategory([*(id *)(a1 + 40) loggingCategory]);
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      v3 = [*(id *)(a1 + 40) stateMachineName];
      v4 = [*(id *)(a1 + 48) stateName];
      id v5 = [*(id *)(a1 + 32) stateName];
      *(_DWORD *)v16 = 138543874;
      *(void *)&void v16[4] = v3;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v4;
      *(_WORD *)&v16[22] = 2114;
      v17 = v5;
      _os_log_impl(&dword_1A7E74000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will enter state %{public}@ with previous state %{public}@", v16, 0x20u);

      goto LABEL_9;
    }
  }
  if (HKSPIsUnitTesting()) {
    goto LABEL_11;
  }
  v2 = HKSPLogForCategory([*(id *)(a1 + 40) loggingCategory]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 40) stateMachineName];
    v4 = [*(id *)(*(void *)(a1 + 40) + 16) stateName];
    *(_DWORD *)v16 = 138543618;
    *(void *)&void v16[4] = v3;
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v4;
    _os_log_impl(&dword_1A7E74000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will update current state %{public}@", v16, 0x16u);
LABEL_9:
  }
LABEL_10:

LABEL_11:
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    uint64_t result = [v6 _willEnter];
    if (!result) {
      return result;
    }
    v8 = *(void **)(a1 + 48);
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v8);
  int v9 = *(unsigned __int8 *)(a1 + 56);
  char v10 = HKSPIsUnitTesting();
  if (v9)
  {
    if (v10) {
      goto LABEL_24;
    }
    id v11 = HKSPLogForCategory([*(id *)(a1 + 40) loggingCategory]);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v12 = [*(id *)(a1 + 40) stateMachineName];
    v13 = [*(id *)(*(void *)(a1 + 40) + 16) stateName];
    uint64_t v14 = [*(id *)(a1 + 32) stateName];
    *(_DWORD *)v16 = 138543874;
    *(void *)&void v16[4] = v12;
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v13;
    *(_WORD *)&v16[22] = 2114;
    v17 = v14;
    v15 = "[%{public}@] Did enter state %{public}@ with previous state %{public}@";
    goto LABEL_22;
  }
  if (v10) {
    goto LABEL_24;
  }
  id v11 = HKSPLogForCategory([*(id *)(a1 + 40) loggingCategory]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [*(id *)(a1 + 40) stateMachineName];
    v13 = [*(id *)(*(void *)(a1 + 40) + 16) stateName];
    uint64_t v14 = [*(id *)(a1 + 32) stateName];
    *(_DWORD *)v16 = 138543874;
    *(void *)&void v16[4] = v12;
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v13;
    *(_WORD *)&v16[22] = 2114;
    v17 = v14;
    v15 = "[%{public}@] Did update current state %{public}@ with previous state %{public}@";
LABEL_22:
    _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_DEFAULT, v15, v16, 0x20u);
  }
LABEL_23:

LABEL_24:
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "_didEnter", *(_OWORD *)v16, *(void *)&v16[16], v17);
  if (*(unsigned char *)(a1 + 56)) {
    return [*(id *)(a1 + 32) _didExit];
  }
  return result;
}

- (void)updateState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(HKSPStateMachine *)self currentState];

  if (!v4)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v12 = [(HKSPStateMachine *)self stateMachineName];
    [v11 handleFailureInMethod:a2, self, @"HKSPStateMachine.m", 119, @"%@ currentState is nil", v12 object file lineNumber description];
  }
  id v5 = [(HKSPStateMachine *)self currentState];
  [v5 _updateState];

  if (!self->_initialized)
  {
    id v6 = HKSPLogForCategory([(HKSPStateMachine *)self loggingCategory]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(HKSPStateMachine *)self stateMachineName];
      v8 = [(HKSPStateMachine *)self currentState];
      int v9 = [v8 stateName];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] State not yet initialized, re-entering state %{public}@", buf, 0x16u);
    }
    char v10 = [(HKSPStateMachine *)self currentState];
    [(HKSPStateMachine *)self enterState:v10];
  }
}

- (void)notifyDelegateWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPStateMachine *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(HKSPStateMachine *)self delegate];
    v8 = [v7 callbackScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke;
    v14[3] = &unk_1E5D31A80;
    int v9 = &v15;
    v14[4] = self;
    id v15 = v4;
    id v10 = v4;
    [v8 performBlock:v14];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke_2;
    v12[3] = &unk_1E5D31A80;
    int v9 = &v13;
    v12[4] = self;
    id v13 = v4;
    id v11 = v4;
    [v7 performBlock:v12];
  }
}

void __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) delegate];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __44__HKSPStateMachine_notifyDelegateWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) delegate];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (unint64_t)loggingCategory
{
  return 0;
}

- (id)stateMachineName
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)HKSPStateMachine;
  v3 = [(HKSPStateMachine *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  id v5 = [(HKSPStateMachine *)self currentState];
  [v4 appendFormat:@"; currentState: %@>", v5];

  return (NSString *)v4;
}

- (HKSPStateMachineState)currentState
{
  return self->_currentState;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (HKSPStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPStateMachineDelegate *)WeakRetained;
}

- (HKSPStateMachineInfoProvider)infoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoProvider);
  return (HKSPStateMachineInfoProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end