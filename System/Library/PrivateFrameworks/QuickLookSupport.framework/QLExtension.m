@interface QLExtension
- (BOOL)isRequestingExtension;
- (NSExtension)extension;
- (NSExtensionContext)context;
- (NSMutableArray)extensionRequestHandlers;
- (NSMutableSet)observers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)completionHandlersQueue;
- (OS_dispatch_queue)queue;
- (QLExtension)initWithExtension:(id)a3;
- (QLGracePeriodTimer)gracePeriodTimer;
- (id)description;
- (id)requestIdentifier;
- (int64_t)extensionScore;
- (unint64_t)externalResourcesPermission;
- (void)_callExtensionRequestHandlers;
- (void)_invalidate;
- (void)_invalidateAndCancelExtensionRequest;
- (void)_setupConnectionIfNeededWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)extensionContextWithCompletionHandler:(id)a3;
- (void)invalidateAndCancelExtensionRequest;
- (void)registerClient:(id)a3;
- (void)setCompletionHandlersQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setContext:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestHandlers:(id)a3;
- (void)setExtensionScore:(int64_t)a3;
- (void)setExternalResourcesPermission:(unint64_t)a3;
- (void)setGracePeriodTimer:(id)a3;
- (void)setIsRequestingExtension:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation QLExtension

- (QLExtension)initWithExtension:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)QLExtension;
  v6 = [(QLExtension *)&v22 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.quicklook.qlextension.request", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.quicklook.qlextension.request", MEMORY[0x263EF83A8]);
    completionHandlersQueue = v6->_completionHandlersQueue;
    v6->_completionHandlersQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_extension, a3);
    uint64_t v11 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (NSMutableSet *)v11;

    v6->_externalResourcesPermission = 0;
    objc_initWeak(&location, v6);
    v13 = [QLGracePeriodTimer alloc];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __33__QLExtension_initWithExtension___block_invoke;
    v19[3] = &unk_2642F24C0;
    objc_copyWeak(&v20, &location);
    uint64_t v14 = [(QLGracePeriodTimer *)v13 initWithAction:v19 callbackQueue:v6->_queue delay:*(double *)&QLExtensionGracePeriodDelay];
    gracePeriodTimer = v6->_gracePeriodTimer;
    v6->_gracePeriodTimer = (QLGracePeriodTimer *)v14;

    uint64_t v16 = objc_opt_new();
    extensionRequestHandlers = v6->_extensionRequestHandlers;
    v6->_extensionRequestHandlers = (NSMutableArray *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __33__QLExtension_initWithExtension___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateAndCancelExtensionRequest];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@ identifier:%@>", objc_opt_class(), self, self->_extension, self->_requestIdentifier];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)QLExtension;
  [(QLExtension *)&v2 dealloc];
}

- (void)_setupConnectionIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  extensionRequestHandlers = self->_extensionRequestHandlers;
  v6 = (void *)MEMORY[0x21D45D660](v4);
  [(NSMutableArray *)extensionRequestHandlers addObject:v6];

  if (self->_connection)
  {
    [(QLExtension *)self _callExtensionRequestHandlers];
  }
  else if (!self->_isRequestingExtension)
  {
    self->_isRequestingExtension = 1;
    extension = self->_extension;
    id v21 = 0;
    v8 = [(NSExtension *)extension beginExtensionRequestWithOptions:1 inputItems:0 error:&v21];
    id v9 = v21;
    self->_isRequestingExtension = 0;
    if (v8)
    {
      v10 = [(QLExtension *)self extension];
      uint64_t v11 = [v10 _extensionContextForUUID:v8];
      [(QLExtension *)self setContext:v11];

      v12 = [(QLExtension *)self context];
      v13 = [v12 _auxiliaryConnection];
      [(QLExtension *)self setConnection:v13];

      [(QLExtension *)self setRequestIdentifier:v8];
      objc_initWeak((id *)location, self);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke;
      v19[3] = &unk_2642F24C0;
      objc_copyWeak(&v20, (id *)location);
      uint64_t v14 = [(QLExtension *)self connection];
      [v14 setInterruptionHandler:v19];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_3;
      v17[3] = &unk_2642F24C0;
      objc_copyWeak(&v18, (id *)location);
      v15 = [(QLExtension *)self connection];
      [v15 setInvalidationHandler:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v16 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        uint64_t v16 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)id location = 138412546;
        *(void *)&location[4] = self;
        __int16 v23 = 2112;
        id v24 = v9;
        _os_log_impl(&dword_217F31000, v16, OS_LOG_TYPE_FAULT, "%@: error while instantiating extension's object: %@ #Remote", location, 0x16u);
      }
    }
    [(QLExtension *)self _callExtensionRequestHandlers];
  }
}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_2;
    block[3] = &unk_2642F24C0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_4;
    block[3] = &unk_2642F24C0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

- (void)_callExtensionRequestHandlers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_extensionRequestHandlers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_async((dispatch_queue_t)self->_completionHandlersQueue, *(dispatch_block_t *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_extensionRequestHandlers removeAllObjects];
}

- (void)_invalidateAndCancelExtensionRequest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    v3 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v3 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 138412290;
      uint64_t v5 = self;
      _os_log_impl(&dword_217F31000, v3, OS_LOG_TYPE_DEBUG, "%@: cancelling extension request #Extensions", (uint8_t *)&v4, 0xCu);
    }
    if (self->_requestIdentifier) {
      -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
    }
    [(QLExtension *)self _invalidate];
  }
}

- (void)_invalidate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v3 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    long long v8 = self;
    _os_log_impl(&dword_217F31000, v3, OS_LOG_TYPE_DEBUG, "%@: invalidating extension connection #Extensions", (uint8_t *)&v7, 0xCu);
  }
  id requestIdentifier = self->_requestIdentifier;
  self->_id requestIdentifier = 0;

  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  context = self->_context;
  self->_context = 0;
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__QLExtension_registerClient___block_invoke;
  v7[3] = &unk_2642F2250;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __30__QLExtension_registerClient___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) gracePeriodTimer];
  [v2 suppress];

  id v3 = [*(id *)(a1 + 32) observers];
  [v3 addObject:*(void *)(a1 + 40)];
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__QLExtension_unregisterClient___block_invoke;
  v7[3] = &unk_2642F2250;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __32__QLExtension_unregisterClient___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) observers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v5 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      uint64_t v5 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_217F31000, v5, OS_LOG_TYPE_DEBUG, "Arming timer to invalidate QLExtension %@ because there is no more active observer. #Extensions", (uint8_t *)&v8, 0xCu);
    }
    int v7 = [*(id *)(a1 + 32) gracePeriodTimer];
    [v7 arm];
  }
}

- (void)extensionContextWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__QLExtension_extensionContextWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F2510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__QLExtension_extensionContextWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__QLExtension_extensionContextWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_2642F24E8;
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _setupConnectionIfNeededWithCompletionHandler:v4];
}

void __53__QLExtension_extensionContextWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) context];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)invalidateAndCancelExtensionRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__QLExtension_invalidateAndCancelExtensionRequest__block_invoke;
  block[3] = &unk_2642F2228;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__QLExtension_invalidateAndCancelExtensionRequest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAndCancelExtensionRequest];
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (int64_t)extensionScore
{
  return self->_extensionScore;
}

- (void)setExtensionScore:(int64_t)a3
{
  self->_extensionScore = a3;
}

- (unint64_t)externalResourcesPermission
{
  return self->_externalResourcesPermission;
}

- (void)setExternalResourcesPermission:(unint64_t)a3
{
  self->_externalResourcesPermission = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)completionHandlersQueue
{
  return self->_completionHandlersQueue;
}

- (void)setCompletionHandlersQueue:(id)a3
{
}

- (NSExtensionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (QLGracePeriodTimer)gracePeriodTimer
{
  return self->_gracePeriodTimer;
}

- (void)setGracePeriodTimer:(id)a3
{
}

- (NSMutableArray)extensionRequestHandlers
{
  return self->_extensionRequestHandlers;
}

- (void)setExtensionRequestHandlers:(id)a3
{
}

- (BOOL)isRequestingExtension
{
  return self->_isRequestingExtension;
}

- (void)setIsRequestingExtension:(BOOL)a3
{
  self->_isRequestingExtension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequestHandlers, 0);
  objc_storeStrong((id *)&self->_gracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_completionHandlersQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end