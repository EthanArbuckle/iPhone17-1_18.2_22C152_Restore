@interface SUScriptOperationDelegate
- (void)_removeOperation:(id)a3;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)enqueueOperation:(id)a3;
@end

@implementation SUScriptOperationDelegate

- (void)dealloc
{
  self->_lock = 0;
  [(SUScriptOperationDelegate *)self cancelAllOperations];

  self->_operations = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptOperationDelegate;
  [(SUScriptOperationDelegate *)&v3 dealloc];
}

- (void)cancelAllOperations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_lock lock];
  objc_super v3 = (void *)[(NSMutableArray *)self->_operations copy];
  [(NSMutableArray *)self->_operations removeAllObjects];
  [(NSLock *)self->_lock unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setDelegate:0];
        [v8 setScriptOptions:0];
        [v8 cancel];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)enqueueOperation:(id)a3
{
  [(NSLock *)self->_lock lock];
  operations = self->_operations;
  if (!operations)
  {
    operations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_operations = operations;
  }
  [(NSMutableArray *)operations addObject:a3];
  [(NSLock *)self->_lock unlock];
  [a3 setDelegate:self];
  uint64_t v6 = (void *)[MEMORY[0x263F894E0] mainQueue];

  [v6 addOperation:a3];
}

- (void)_removeOperation:(id)a3
{
  [a3 setDelegate:0];
  [a3 setScriptOptions:0];
  [(NSLock *)self->_lock lock];
  [(NSMutableArray *)self->_operations removeObject:a3];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

@end