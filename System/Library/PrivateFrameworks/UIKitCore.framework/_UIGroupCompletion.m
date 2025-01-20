@interface _UIGroupCompletion
- (void)_performAllCompletions;
- (void)addCompletion:(id)a3;
- (void)addNonIncrementingCompletion:(id)a3;
- (void)complete;
- (void)completeImmediately;
- (void)increment;
@end

@implementation _UIGroupCompletion

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_isCompleting)
  {
    v5 = v4;
    scheduledCompletions = self->_scheduledCompletions;
    if (!scheduledCompletions)
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
      v8 = self->_scheduledCompletions;
      self->_scheduledCompletions = v7;

      v5 = v10;
      scheduledCompletions = self->_scheduledCompletions;
    }
    v9 = _Block_copy(v5);
    [(NSMutableArray *)scheduledCompletions addObject:v9];
  }
  else
  {
    [(_UIGroupCompletion *)self addNonIncrementingCompletion:v4];
    [(_UIGroupCompletion *)self increment];
  }
}

- (void)addNonIncrementingCompletion:(id)a3
{
  id v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_completions;
    self->_completions = v6;

    id v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completions addObject:v8];
}

- (void)increment
{
}

- (void)complete
{
  unint64_t refCount = self->_refCount;
  if (refCount)
  {
    unint64_t v3 = refCount - 1;
    self->_unint64_t refCount = v3;
    if (!v3) {
      [(_UIGroupCompletion *)self _performAllCompletions];
    }
  }
}

- (void)completeImmediately
{
  self->_unint64_t refCount = 0;
  [(_UIGroupCompletion *)self _performAllCompletions];
}

- (void)_performAllCompletions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_isCompleting = 1;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v3 = self->_completions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  completions = self->_completions;
  self->_completions = 0;

  self->_isCompleting = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = self->_scheduledCompletions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[_UIGroupCompletion addCompletion:](self, "addCompletion:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), (void)v15);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  scheduledCompletions = self->_scheduledCompletions;
  self->_scheduledCompletions = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledCompletions, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end