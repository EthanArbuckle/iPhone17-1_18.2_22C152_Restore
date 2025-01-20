@interface SASRequestTrigger
- (SASRequestOptions)options;
- (SASRequestTrigger)initWithRequestOptions:(id)a3 updateHandle:(id *)a4;
- (int64_t)state;
- (void)_updateState:(int64_t)a3;
- (void)addTriggerTarget:(id)a3 action:(SEL)a4;
- (void)removeTriggerTarget:(id)a3;
@end

@implementation SASRequestTrigger

- (SASRequestTrigger)initWithRequestOptions:(id)a3 updateHandle:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SASRequestTrigger;
  v7 = [(SASRequestTrigger *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_state = a4 != 0;
    uint64_t v9 = [v6 copy];
    options = v8->_options;
    v8->_options = (SASRequestOptions *)v9;

    if (v8->_state == 1) {
      [(SASRequestOptions *)v8->_options setUseAutomaticEndpointing:0];
    }
    if (a4)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__SASRequestTrigger_initWithRequestOptions_updateHandle___block_invoke;
      v14[3] = &unk_1E6B68550;
      v15 = v8;
      v11 = (void *)[v14 copy];
      id v12 = *a4;
      *a4 = v11;
    }
  }

  return v8;
}

uint64_t __57__SASRequestTrigger_initWithRequestOptions_updateHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateState:a2];
}

- (void)_updateState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_state = a3;
  v4 = (void *)[(NSMapTable *)self->_observers copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = v4;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v11 = NSMapGet(v5, v10);
        objc_msgSend(v10, "performSelector:withObject:", v11, self, (void)v12);
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)addTriggerTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  observers = self->_observers;
  key = v6;
  if (!observers)
  {
    uint64_t v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:2 capacity:1];
    uint64_t v9 = self->_observers;
    self->_observers = v8;

    id v6 = key;
    observers = self->_observers;
  }
  NSMapInsert(observers, v6, a4);
}

- (void)removeTriggerTarget:(id)a3
{
}

- (SASRequestOptions)options
{
  return self->_options;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end