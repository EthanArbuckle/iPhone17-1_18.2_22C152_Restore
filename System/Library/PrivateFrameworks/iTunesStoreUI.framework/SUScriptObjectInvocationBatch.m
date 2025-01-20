@interface SUScriptObjectInvocationBatch
- (SUScriptObject)rootObject;
- (SUScriptObjectInvocationBatch)init;
- (id)batchProxyForObject:(id)a3;
- (id)copyQueuedInvocationsForObject:(id)a3;
- (void)_delayedDequeueInvocations;
- (void)checkOutBatchTarget:(id)a3;
- (void)dealloc;
- (void)dequeueInvocations;
- (void)enqueueInvocation:(id)a3;
- (void)setRootObject:(id)a3;
@end

@implementation SUScriptObjectInvocationBatch

- (SUScriptObjectInvocationBatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptObjectInvocationBatch;
  v2 = [(SUScriptObjectInvocationBatch *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (void)dealloc
{
  invocationQueue = self->_invocationQueue;
  self->_invocationQueue = 0;

  lock = self->_lock;
  self->_lock = 0;

  proxies = self->_proxies;
  if (proxies)
  {
    CFRelease(proxies);
    self->_proxies = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUScriptObjectInvocationBatch;
  [(SUScriptObjectInvocationBatch *)&v6 dealloc];
}

- (id)batchProxyForObject:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  proxies = self->_proxies;
  if (!proxies)
  {
    proxies = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    self->_proxies = proxies;
  }
  CFDictionaryGetValue(proxies, v4);
  objc_super v6 = (SUScriptObjectBatchProxy *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_super v6 = objc_alloc_init(SUScriptObjectBatchProxy);
    [(SUScriptObjectBatchProxy *)v6 setInvocationBatch:self];
    [(SUScriptObjectBatchProxy *)v6 setTarget:v4];
    CFDictionarySetValue(self->_proxies, v4, v6);
  }
  [(NSLock *)self->_lock unlock];

  return v6;
}

- (void)checkOutBatchTarget:(id)a3
{
  id key = a3;
  [(NSLock *)self->_lock lock];
  proxies = self->_proxies;
  if (proxies)
  {
    v5 = CFDictionaryGetValue(proxies, key);
    objc_super v6 = v5;
    if (v5)
    {
      [v5 setTarget:0];
      CFDictionaryRemoveValue(self->_proxies, key);
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (id)copyQueuedInvocationsForObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(NSLock *)self->_lock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v6 = self->_invocationQueue;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "target", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(NSLock *)self->_lock unlock];
  return v5;
}

- (void)dequeueInvocations
{
  [(NSLock *)self->_lock lock];
  id v5 = (id)[(NSMutableArray *)self->_invocationQueue copy];
  invocationQueue = self->_invocationQueue;
  self->_invocationQueue = 0;

  [(NSLock *)self->_lock unlock];
  if ([v5 count])
  {
    id v4 = [(SUScriptObjectInvocationBatch *)self rootObject];
    [v4 willPerformBatchedInvocations];
    [v5 makeObjectsPerformSelector:sel_invoke];
    [v4 didPerformBatchedInvocations];
  }
}

- (void)_delayedDequeueInvocations
{
}

uint64_t __59__SUScriptObjectInvocationBatch__delayedDequeueInvocations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dequeueInvocations];
}

- (void)enqueueInvocation:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  if (!self->_invocationQueue)
  {
    objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    invocationQueue = self->_invocationQueue;
    self->_invocationQueue = v6;
  }
  [v5 retainArguments];
  [(NSMutableArray *)self->_invocationQueue addObject:v5];

  [(NSLock *)self->_lock unlock];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedDequeueInvocations object:0];

  [(SUScriptObjectInvocationBatch *)self performSelector:sel__delayedDequeueInvocations withObject:0 afterDelay:0.0];
}

- (SUScriptObject)rootObject
{
  [(NSLock *)self->_lock lock];
  v3 = self->_rootObject;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)setRootObject:(id)a3
{
  id v4 = (SUScriptObject *)a3;
  [(NSLock *)self->_lock lock];
  rootObject = self->_rootObject;
  self->_rootObject = v4;
  objc_super v6 = v4;

  [(NSLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_invocationQueue, 0);
}

@end