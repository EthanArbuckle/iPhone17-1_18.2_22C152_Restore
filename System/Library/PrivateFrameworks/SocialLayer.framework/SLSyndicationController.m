@interface SLSyndicationController
+ (OS_dispatch_queue)syndicationProcessingQueue;
+ (id)sharedController;
- (NSMutableSet)pendingmessageGUIDsToRemove;
- (SLDServiceProxy)syndicationServiceProxy;
- (void)_disconnectSyndicationServiceConnectionIfNecessary;
- (void)_sendCurrentRemovalsToDaemonAndDisconnect;
- (void)removeMessageGUIDFromSyndication:(id)a3;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setPendingmessageGUIDsToRemove:(id)a3;
- (void)setSyndicationServiceProxy:(id)a3;
@end

@implementation SLSyndicationController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

uint64_t __43__SLSyndicationController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SLSyndicationController);
  uint64_t v1 = sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)removeMessageGUIDFromSyndication:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = +[SLSyndicationController syndicationProcessingQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__SLSyndicationController_removeMessageGUIDFromSyndication___block_invoke;
    v6[3] = &unk_1E58A8680;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __60__SLSyndicationController_removeMessageGUIDFromSyndication___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingmessageGUIDsToRemove];
  [v2 addObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) syndicationServiceProxy];
  int v4 = [v3 connectionActive];

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _sendCurrentRemovalsToDaemonAndDisconnect];
  }
  else
  {
    id v6 = [v5 syndicationServiceProxy];
    [v6 connect];
  }
}

- (void)_sendCurrentRemovalsToDaemonAndDisconnect
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SLSyndicationController _sendCurrentRemovalsToDaemonAndDisconnect]";
  _os_log_debug_impl(&dword_19BE17000, log, OS_LOG_TYPE_DEBUG, "%s: Not currently connected to syndication service. We'll wait for the connection to finish posting pending removals.", (uint8_t *)&v1, 0xCu);
}

void __68__SLSyndicationController__sendCurrentRemovalsToDaemonAndDisconnect__block_invoke(uint64_t a1, char a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = SWFrameworkLogHandle();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_INFO, "Received success for removal for message with guid: '%@'", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __68__SLSyndicationController__sendCurrentRemovalsToDaemonAndDisconnect__block_invoke_cold_1(a1, v6);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:*(void *)(a1 + 32)];
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    [WeakRetained _disconnectSyndicationServiceConnectionIfNecessary];
  }
}

- (void)_disconnectSyndicationServiceConnectionIfNecessary
{
  uint64_t v3 = +[SLSyndicationController syndicationProcessingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SLSyndicationController__disconnectSyndicationServiceConnectionIfNecessary__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(v3, block);
}

void __77__SLSyndicationController__disconnectSyndicationServiceConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) pendingmessageGUIDsToRemove];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v5 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = "-[SLSyndicationController _disconnectSyndicationServiceConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "%s: No more message GUIDS to remove, disconnecting from syndication service proxy.", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) syndicationServiceProxy];
    [v6 disconnect];
  }
}

- (void)serviceProxyDidConnect:(id)a3
{
  id v4 = a3;
  v5 = +[SLSyndicationController syndicationProcessingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SLSyndicationController_serviceProxyDidConnect___block_invoke;
  v7[3] = &unk_1E58A8680;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__SLSyndicationController_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syndicationServiceProxy];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 _sendCurrentRemovalsToDaemonAndDisconnect];
  }
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = +[SLSyndicationController syndicationProcessingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SLSyndicationController_serviceProxyDidDisconnect___block_invoke;
  v7[3] = &unk_1E58A8680;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__SLSyndicationController_serviceProxyDidDisconnect___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syndicationServiceProxy];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 40) pendingmessageGUIDsToRemove];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) syndicationServiceProxy];
      [v6 connect];
    }
  }
}

- (NSMutableSet)pendingmessageGUIDsToRemove
{
  pendingmessageGUIDsToRemove = self->_pendingmessageGUIDsToRemove;
  if (!pendingmessageGUIDsToRemove)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = self->_pendingmessageGUIDsToRemove;
    self->_pendingmessageGUIDsToRemove = v4;

    pendingmessageGUIDsToRemove = self->_pendingmessageGUIDsToRemove;
  }
  return pendingmessageGUIDsToRemove;
}

- (SLDServiceProxy)syndicationServiceProxy
{
  syndicationServiceProxy = self->_syndicationServiceProxy;
  if (!syndicationServiceProxy)
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = +[SLSyndicationController syndicationProcessingQueue];
    id v6 = +[SLDServiceProxy proxyForServiceClass:v4 targetSerialQueue:v5 delegate:self];
    int v7 = self->_syndicationServiceProxy;
    self->_syndicationServiceProxy = v6;

    syndicationServiceProxy = self->_syndicationServiceProxy;
  }
  return syndicationServiceProxy;
}

+ (OS_dispatch_queue)syndicationProcessingQueue
{
  if (syndicationProcessingQueue_onceToken != -1) {
    dispatch_once(&syndicationProcessingQueue_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)syndicationProcessingQueue_syndicationProcessingQueue;
  return (OS_dispatch_queue *)v2;
}

void __53__SLSyndicationController_syndicationProcessingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SocialLayer.SLSyndicationProcessingQueue", v2);
  int v1 = (void *)syndicationProcessingQueue_syndicationProcessingQueue;
  syndicationProcessingQueue_syndicationProcessingQueue = (uint64_t)v0;
}

- (void)setSyndicationServiceProxy:(id)a3
{
}

- (void)setPendingmessageGUIDsToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingmessageGUIDsToRemove, 0);
  objc_storeStrong((id *)&self->_syndicationServiceProxy, 0);
}

void __68__SLSyndicationController__sendCurrentRemovalsToDaemonAndDisconnect__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Unsuccessful sending remove for message with guid: '%@'", (uint8_t *)&v3, 0xCu);
}

@end