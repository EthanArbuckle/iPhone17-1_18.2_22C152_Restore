@interface PKAsyncTaskProgressTracker
- (PKAsyncTaskProgressTracker)init;
- (unint64_t)status;
- (void)_executeCompletionHandlers;
- (void)notifyOnCompletion:(id)a3;
- (void)taskDidComplete;
- (void)taskDidStart;
@end

@implementation PKAsyncTaskProgressTracker

- (PKAsyncTaskProgressTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKAsyncTaskProgressTracker;
  v2 = [(PKAsyncTaskProgressTracker *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_status = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    completionHandlers = v3->_completionHandlers;
    v3->_completionHandlers = v4;
  }
  return v3;
}

- (void)notifyOnCompletion:(id)a3
{
  if (self->_status == 2)
  {
    v3 = (void (*)(id))*((void *)a3 + 2);
    v3(a3);
  }
  else
  {
    completionHandlers = self->_completionHandlers;
    id v5 = _Block_copy(a3);
    [(NSMutableSet *)completionHandlers addObject:v5];
  }
}

- (void)taskDidStart
{
  self->_status = 1;
}

- (void)taskDidComplete
{
  self->_status = 2;
  [(PKAsyncTaskProgressTracker *)self _executeCompletionHandlers];
}

- (void)_executeCompletionHandlers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableSet *)self->_completionHandlers copy];
  [(NSMutableSet *)self->_completionHandlers removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end