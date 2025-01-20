@interface SBFAnalyticsBackend
+ (id)sharedInstance;
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBFAnalyticsBackend)init;
- (void)registerEventHandler:(id)a3;
- (void)registerForQueryName:(unint64_t)a3 handler:(id)a4;
- (void)registerSynchronousEventHandler:(id)a3;
- (void)stateForQueryName:(unint64_t)a3 completion:(id)a4;
@end

@implementation SBFAnalyticsBackend

void __47__SBFAnalyticsBackend_handleEvent_withContext___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "handleEvent:withContext:", a1[6], a1[5], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v7 = self->_syncEventHandlers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v11++) handleEvent:a3 withContext:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  asyncHandlerQueue = self->_asyncHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBFAnalyticsBackend_handleEvent_withContext___block_invoke;
  block[3] = &unk_1E548CEF0;
  id v16 = v6;
  unint64_t v17 = a3;
  block[4] = self;
  id v13 = v6;
  dispatch_async(asyncHandlerQueue, block);

  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_9);
  }
  id v2 = (void *)sharedInstance___backend;
  return v2;
}

uint64_t __37__SBFAnalyticsBackend_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBFAnalyticsBackend);
  uint64_t v1 = sharedInstance___backend;
  sharedInstance___backend = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBFAnalyticsBackend)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBFAnalyticsBackend;
  id v2 = [(SBFAnalyticsBackend *)&v14 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    asyncEventHandlers = v2->_asyncEventHandlers;
    v2->_asyncEventHandlers = v3;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    syncEventHandlers = v2->_syncEventHandlers;
    v2->_syncEventHandlers = v5;

    long long v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stateQueryHandlers = v2->_stateQueryHandlers;
    v2->_stateQueryHandlers = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.springboard.analytics.statequery", 0);
    queryHandlerQueue = v2->_queryHandlerQueue;
    v2->_queryHandlerQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.springboard.analytics.eventhandling", 0);
    asyncHandlerQueue = v2->_asyncHandlerQueue;
    v2->_asyncHandlerQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)registerEventHandler:(id)a3
{
  uint64_t v4 = (SBFAnalyticsBackend *)a3;
  if (v4 == self)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"don't be a jerk" userInfo:0];
    objc_exception_throw(v7);
  }
  asyncHandlerQueue = self->_asyncHandlerQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SBFAnalyticsBackend_registerEventHandler___block_invoke;
  v8[3] = &unk_1E548CBA0;
  v8[4] = self;
  dispatch_queue_t v9 = v4;
  id v6 = v4;
  dispatch_async(asyncHandlerQueue, v8);
}

uint64_t __44__SBFAnalyticsBackend_registerEventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)registerSynchronousEventHandler:(id)a3
{
  uint64_t v4 = (SBFAnalyticsBackend *)a3;
  if (v4 == self)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"don't be a jerk" userInfo:0];
    objc_exception_throw(v5);
  }
  id v6 = v4;
  [(NSMutableArray *)self->_syncEventHandlers addObject:v4];
}

- (void)registerForQueryName:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  queryHandlerQueue = self->_queryHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBFAnalyticsBackend_registerForQueryName_handler___block_invoke;
  block[3] = &unk_1E548CF18;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queryHandlerQueue, block);
  dispatch_queue_t v9 = NSStringFromAnalyticsQueryName();
  AnalyticsSetCallbackForQueriedEventWithQueue();
}

void __52__SBFAnalyticsBackend_registerForQueryName_handler___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 24);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"state query handler already registered for name" userInfo:0];
    objc_exception_throw(v7);
  }
  id v5 = *(void **)(a1[4] + 24);
  id v8 = (id)MEMORY[0x18C133210](a1[5]);
  id v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v5 setObject:v8 forKey:v6];
}

- (void)stateForQueryName:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queryHandlerQueue = self->_queryHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBFAnalyticsBackend_stateForQueryName_completion___block_invoke;
  block[3] = &unk_1E548CF18;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queryHandlerQueue, block);
}

void __52__SBFAnalyticsBackend_stateForQueryName_completion___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 24);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  id v5 = [v2 objectForKey:v3];

  if (v5)
  {
    uint64_t v4 = v5[2]();
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncHandlerQueue, 0);
  objc_storeStrong((id *)&self->_queryHandlerQueue, 0);
  objc_storeStrong((id *)&self->_stateQueryHandlers, 0);
  objc_storeStrong((id *)&self->_syncEventHandlers, 0);
  objc_storeStrong((id *)&self->_asyncEventHandlers, 0);
}

@end