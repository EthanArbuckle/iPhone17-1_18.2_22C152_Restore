@interface SUICProgressStateMachine
- (NSPointerArray)_stateMachineObservers;
- (SUICProgressStateMachine)init;
- (unint64_t)state;
- (void)_ignoreEvent:(unint64_t)a3;
- (void)_setStateMachineObservers:(id)a3;
- (void)_transitionToState:(unint64_t)a3 forEvent:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)addObservers:(id)a3;
- (void)dealloc;
- (void)handleEvent:(unint64_t)a3;
- (void)setObservers:(id)a3;
@end

@implementation SUICProgressStateMachine

- (SUICProgressStateMachine)init
{
  v27[5] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SUICProgressStateMachine;
  v2 = [(SUICProgressStateMachine *)&v24 init];
  if (v2)
  {
    v3 = (CUStateMachine *)objc_alloc_init(MEMORY[0x1E4F5E1E8]);
    underlyingStateMachine = v2->_underlyingStateMachine;
    v2->_underlyingStateMachine = v3;

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F5E1D8]) initWithName:@"Abstract" parent:0];
    [v5 setEventHandler:&__block_literal_global_1];
    objc_storeStrong((id *)&v2->_abstractState, v5);
    objc_initWeak(&location, v2);
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F5E1D8]) initWithName:@"None" parent:v5];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__SUICProgressStateMachine_init__block_invoke_2;
    v21[3] = &unk_1E5C597B0;
    objc_copyWeak(&v22, &location);
    [v6 setEventHandler:v21];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F5E1D8]) initWithName:@"Arbitrary" parent:v5];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __32__SUICProgressStateMachine_init__block_invoke_3;
    v19[3] = &unk_1E5C597B0;
    objc_copyWeak(&v20, &location);
    [v7 setEventHandler:v19];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F5E1D8]) initWithName:@"Percentage" parent:v5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__SUICProgressStateMachine_init__block_invoke_4;
    v17[3] = &unk_1E5C597B0;
    objc_copyWeak(&v18, &location);
    [v8 setEventHandler:v17];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F5E1D8]) initWithName:@"Done" parent:v5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__SUICProgressStateMachine_init__block_invoke_5;
    v15[3] = &unk_1E5C597B0;
    objc_copyWeak(&v16, &location);
    [v9 setEventHandler:v15];
    v10 = v2->_underlyingStateMachine;
    v27[0] = v5;
    v27[1] = v6;
    v27[2] = v7;
    v27[3] = v8;
    v27[4] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
    [(CUStateMachine *)v10 setStates:v11];

    v25[0] = @"None";
    v25[1] = @"Arbitrary";
    v26[0] = v6;
    v26[1] = v7;
    v25[2] = @"Percentage";
    v25[3] = @"Done";
    v26[2] = v8;
    v26[3] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
    stateForStateName = v2->_stateForStateName;
    v2->_stateForStateName = (NSDictionary *)v12;

    [(CUStateMachine *)v2->_underlyingStateMachine setInitialState:v6];
    [(CUStateMachine *)v2->_underlyingStateMachine start];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke()
{
  return 2;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [v3 name];

  id v6 = v5;
  if (([v6 isEqualToString:@"Start"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"Report"])
    {

      uint64_t v7 = 2;
      v8 = WeakRetained;
      uint64_t v9 = 2;
      uint64_t v10 = 1;
LABEL_5:
      [v8 _transitionToState:v9 forEvent:v10];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"Reset"])
    {
      uint64_t v11 = 4;
    }
    else
    {
      if (([v6 isEqualToString:@"Fail"] & 1) == 0)
      {
        char v13 = [v6 isEqualToString:@"Finish"];

        if (v13)
        {
          uint64_t v7 = 2;
          v8 = WeakRetained;
          uint64_t v9 = 3;
          uint64_t v10 = 2;
          goto LABEL_5;
        }
LABEL_11:
        uint64_t v7 = 1;
        goto LABEL_12;
      }
      uint64_t v11 = 3;
    }

    [WeakRetained _ignoreEvent:v11];
    goto LABEL_11;
  }

  [WeakRetained _transitionToState:1 forEvent:0];
  uint64_t v7 = 2;
LABEL_12:

  return v7;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [v3 name];

  id v6 = v5;
  if (([v6 isEqualToString:@"Start"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"Report"])
    {

      uint64_t v7 = 2;
      v8 = WeakRetained;
      uint64_t v9 = 2;
      uint64_t v10 = 1;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:@"Reset"])
    {
      uint64_t v11 = 4;
    }
    else
    {
      if (([v6 isEqualToString:@"Fail"] & 1) == 0)
      {
        char v13 = [v6 isEqualToString:@"Finish"];

        if ((v13 & 1) == 0) {
          goto LABEL_3;
        }
        uint64_t v7 = 2;
        v8 = WeakRetained;
        uint64_t v9 = 3;
        uint64_t v10 = 2;
LABEL_6:
        [v8 _transitionToState:v9 forEvent:v10];
        goto LABEL_12;
      }
      uint64_t v11 = 3;
    }

    [WeakRetained _transitionToState:0 forEvent:v11];
    uint64_t v7 = 2;
    goto LABEL_12;
  }

  [WeakRetained _ignoreEvent:0];
LABEL_3:
  uint64_t v7 = 1;
LABEL_12:

  return v7;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [v3 name];

  id v6 = v5;
  if (([v6 isEqualToString:@"Start"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"Report"])
    {

      uint64_t v7 = 2;
      v8 = WeakRetained;
      uint64_t v9 = 2;
      uint64_t v10 = 1;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:@"Reset"])
    {
      uint64_t v11 = 4;
    }
    else
    {
      if (([v6 isEqualToString:@"Fail"] & 1) == 0)
      {
        char v13 = [v6 isEqualToString:@"Finish"];

        if ((v13 & 1) == 0) {
          goto LABEL_3;
        }
        uint64_t v7 = 2;
        v8 = WeakRetained;
        uint64_t v9 = 3;
        uint64_t v10 = 2;
LABEL_6:
        [v8 _transitionToState:v9 forEvent:v10];
        goto LABEL_12;
      }
      uint64_t v11 = 3;
    }

    [WeakRetained _transitionToState:0 forEvent:v11];
    uint64_t v7 = 2;
    goto LABEL_12;
  }

  [WeakRetained _ignoreEvent:0];
LABEL_3:
  uint64_t v7 = 1;
LABEL_12:

  return v7;
}

uint64_t __32__SUICProgressStateMachine_init__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [v3 name];

  id v6 = v5;
  if ([v6 isEqualToString:@"Start"])
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:@"Report"])
  {
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  if (([v6 isEqualToString:@"Reset"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"Fail"])
    {
      uint64_t v7 = 3;
    }
    else
    {
      if (([v6 isEqualToString:@"Finish"] & 1) == 0)
      {

        goto LABEL_12;
      }
      uint64_t v7 = 2;
    }
LABEL_11:

    [WeakRetained _ignoreEvent:v7];
LABEL_12:
    uint64_t v8 = 1;
    goto LABEL_13;
  }

  [WeakRetained _transitionToState:0 forEvent:4];
  uint64_t v8 = 2;
LABEL_13:

  return v8;
}

- (void)dealloc
{
  [(CUStateMachine *)self->_underlyingStateMachine invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SUICProgressStateMachine;
  [(SUICProgressStateMachine *)&v3 dealloc];
}

- (void)handleEvent:(unint64_t)a3
{
  underlyingStateMachine = self->_underlyingStateMachine;
  id v5 = objc_alloc(MEMORY[0x1E4F5E1E0]);
  if (a3 + 1 > 5) {
    id v6 = @"Start";
  }
  else {
    id v6 = off_1E5C597F8[a3 + 1];
  }
  id v7 = (id)[v5 initWithName:v6 userInfo:0];
  [(CUStateMachine *)underlyingStateMachine dispatchEvent:v7];
}

- (unint64_t)state
{
  return self->_currentState;
}

- (void)setObservers:(id)a3
{
  stateMachineObservers = self->_stateMachineObservers;
  self->_stateMachineObservers = 0;
  id v5 = a3;

  [(SUICProgressStateMachine *)self addObservers:v5];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SUICProgressStateMachine *)self _stateMachineObservers];
  [v5 addPointer:v4];
}

- (void)addObservers:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__SUICProgressStateMachine_addObservers___block_invoke;
  v3[3] = &unk_1E5C597D8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

uint64_t __41__SUICProgressStateMachine_addObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObserver:a2];
}

- (NSPointerArray)_stateMachineObservers
{
  stateMachineObservers = self->_stateMachineObservers;
  if (!stateMachineObservers)
  {
    id v4 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    id v5 = self->_stateMachineObservers;
    self->_stateMachineObservers = v4;

    stateMachineObservers = self->_stateMachineObservers;
  }
  [(NSPointerArray *)stateMachineObservers addPointer:0];
  [(NSPointerArray *)self->_stateMachineObservers compact];
  id v6 = self->_stateMachineObservers;

  return v6;
}

- (void)_transitionToState:(unint64_t)a3 forEvent:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(SUICProgressStateMachine *)self _stateMachineObservers];
  uint64_t v8 = [v7 allObjects];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "progressStateMachine:didTransitionToState:fromState:forEvent:", self, a3, -[SUICProgressStateMachine state](self, "state"), a4);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  underlyingStateMachine = self->_underlyingStateMachine;
  if (a3 + 1 > 4) {
    v14 = @"None";
  }
  else {
    v14 = off_1E5C59828[a3 + 1];
  }
  v15 = [(NSDictionary *)self->_stateForStateName objectForKey:v14];
  [(CUStateMachine *)underlyingStateMachine transitionToState:v15];

  self->_currentState = a3;
}

- (void)_ignoreEvent:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SUICProgressStateMachine *)self _stateMachineObservers];
  id v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) progressStateMachine:self ignoredEvent:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_setStateMachineObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachineObservers, 0);
  objc_storeStrong((id *)&self->_abstractState, 0);
  objc_storeStrong((id *)&self->_stateForStateName, 0);

  objc_storeStrong((id *)&self->_underlyingStateMachine, 0);
}

@end