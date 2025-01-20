@interface _PXCompletionHandlerManager
- (_PXCompletionHandlerManager)init;
- (_PXCompletionHandlerManagerDelegate)delegate;
- (void)_handleTimeoutOfCompletionHandler:(id)a3;
- (void)addCompletionHandler:(id)a3;
- (void)callCompletionHandlers;
- (void)setDelegate:(id)a3;
@end

@implementation _PXCompletionHandlerManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_PXCompletionHandlerManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PXCompletionHandlerManagerDelegate *)WeakRetained;
}

- (void)callCompletionHandlers
{
  completionHandlers = self->_completionHandlers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___PXCompletionHandlerManager_callCompletionHandlers__block_invoke;
  v5[3] = &unk_1E5DB1DB0;
  v5[4] = self;
  [(NSMutableArray *)completionHandlers enumerateObjectsUsingBlock:v5];
  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
  v4 = [(_PXCompletionHandlerManager *)self delegate];
  [v4 didCallLastCompletionHandlerForCompletionHandlerManager:self];
}

- (void)addCompletionHandler:(id)a3
{
  aBlock = (void *)[a3 copy];
  v4 = _Block_copy(aBlock);
  [(_PXCompletionHandlerManager *)self performSelector:sel__handleTimeoutOfCompletionHandler_ withObject:v4 afterDelay:10.0];

  completionHandlers = self->_completionHandlers;
  v6 = _Block_copy(aBlock);
  [(NSMutableArray *)completionHandlers addObject:v6];
}

- (void)_handleTimeoutOfCompletionHandler:(id)a3
{
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  completionHandlers = self->_completionHandlers;
  v7 = _Block_copy(v5);

  [(NSMutableArray *)completionHandlers removeObject:v7];
  if (![(NSMutableArray *)self->_completionHandlers count])
  {
    id v8 = [(_PXCompletionHandlerManager *)self delegate];
    [v8 didCallLastCompletionHandlerForCompletionHandlerManager:self];
  }
}

- (_PXCompletionHandlerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXCompletionHandlerManager;
  v2 = [(_PXCompletionHandlerManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;
  }
  return v2;
}

@end