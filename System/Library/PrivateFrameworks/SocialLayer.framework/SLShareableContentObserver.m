@interface SLShareableContentObserver
+ (SLShareableContentObserver)sharedObserver;
- (BOOL)applicationIsActive;
- (BOOL)needsRefresh;
- (BOOL)needsToRefresh;
- (BOOL)needsToResume;
- (OS_dispatch_queue)serviceQueue;
- (SLDServiceProxy)serviceProxy;
- (SLShareableContentObserver)init;
- (unint64_t)state;
- (void)activityItemsConfigurationReadyNotification:(id)a3;
- (void)addObservers;
- (void)connectAndRefreshNow;
- (void)didBecomeActiveNotification:(id)a3;
- (void)didEnterBackgroundNotification:(id)a3;
- (void)documentStateChangedNotification:(id)a3;
- (void)pause;
- (void)refreshIfNeeded;
- (void)reset;
- (void)resumeIfNeeded;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setNeedsRefresh;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)userActivityWasCreated:(id)a3;
- (void)willResignActiveNotification:(id)a3;
@end

@implementation SLShareableContentObserver

+ (SLShareableContentObserver)sharedObserver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SLShareableContentObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, block);
  }
  v2 = (void *)sharedObserver_sharedObserver;
  return (SLShareableContentObserver *)v2;
}

uint64_t __44__SLShareableContentObserver_sharedObserver__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (SLShareableContentObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SLShareableContentObserver;
  uint64_t v2 = [(SLShareableContentObserver *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SLShareableContentObserver *)v2 addObservers];
    v4 = v3;
  }

  return v3;
}

- (void)addObservers
{
  [MEMORY[0x1E4FB36C8] addUserActivityObserver:self];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_didBecomeActiveNotification_ name:*MEMORY[0x1E4FB2628] object:0];
  [v3 addObserver:self selector:sel_didEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel_willResignActiveNotification_ name:*MEMORY[0x1E4FB2738] object:0];
  [v3 addObserver:self selector:sel_documentStateChangedNotification_ name:*MEMORY[0x1E4FB2840] object:0];
  [v3 addObserver:self selector:sel_activityItemsConfigurationReadyNotification_ name:@"ActivityItemsConfigurationReadyNotification" object:0];
}

- (SLDServiceProxy)serviceProxy
{
  serviceProxy = self->_serviceProxy;
  if (!serviceProxy)
  {
    uint64_t v4 = objc_opt_class();
    v5 = [(SLShareableContentObserver *)self serviceQueue];
    objc_super v6 = +[SLDServiceProxy proxyForServiceClass:v4 targetSerialQueue:v5 delegate:self];
    v7 = self->_serviceProxy;
    self->_serviceProxy = v6;

    serviceProxy = self->_serviceProxy;
  }
  return serviceProxy;
}

- (OS_dispatch_queue)serviceQueue
{
  serviceQueue = self->_serviceQueue;
  if (!serviceQueue)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SocialLayer.ShareableContentObserver.ServiceQueue", v4);
    objc_super v6 = self->_serviceQueue;
    self->_serviceQueue = v5;

    serviceQueue = self->_serviceQueue;
  }
  return serviceQueue;
}

- (void)setNeedsRefresh
{
  [(SLShareableContentObserver *)self setNeedsRefresh:1];
  id v3 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[observer] set needs refresh", v4, 2u);
  }

  [(SLShareableContentObserver *)self resumeIfNeeded];
}

- (BOOL)applicationIsActive
{
  uint64_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v3 = [v2 applicationState] == 0;

  return v3;
}

- (BOOL)needsToResume
{
  if ([(SLShareableContentObserver *)self state]) {
    return 0;
  }
  return [(SLShareableContentObserver *)self applicationIsActive];
}

- (void)resumeIfNeeded
{
  BOOL v3 = [(SLShareableContentObserver *)self needsToResume];
  uint64_t v4 = SLShareableContentLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[observer] resuming", v6, 2u);
    }

    [(SLShareableContentObserver *)self setState:1];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[observer] resume not needed", buf, 2u);
    }
  }
}

- (BOOL)needsToRefresh
{
  if ([(SLShareableContentObserver *)self state] != 1) {
    return 0;
  }
  return [(SLShareableContentObserver *)self needsRefresh];
}

- (void)refreshIfNeeded
{
  BOOL v3 = [(SLShareableContentObserver *)self needsToRefresh];
  uint64_t v4 = SLShareableContentLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[observer] refreshing", v6, 2u);
    }

    [(SLShareableContentObserver *)self setState:2];
    [(SLShareableContentObserver *)self connectAndRefreshNow];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[observer] refresh not needed", buf, 2u);
    }
  }
}

- (void)connectAndRefreshNow
{
  BOOL v3 = [(SLShareableContentObserver *)self serviceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(v3, block);
}

void __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceProxy];
  char v3 = [v2 connectionActive];

  uint64_t v4 = [*(id *)(a1 + 32) serviceProxy];
  id v7 = v4;
  if (v3)
  {
    BOOL v5 = [v4 remoteService];
    [v5 refreshShareableContentMetadataInJoinedConversation];

    objc_super v6 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "[observer] refreshed", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke_17;
    block[3] = &unk_1E58A8720;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [v4 connect];
  }
}

uint64_t __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)pause
{
  char v3 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[observer] pausing", v4, 2u);
  }

  [(SLShareableContentObserver *)self setState:0];
}

- (void)reset
{
  char v3 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[observer] resetting", v4, 2u);
  }

  [(SLShareableContentObserver *)self setState:0];
  [(SLShareableContentObserver *)self setNeedsRefresh:0];
}

- (void)didBecomeActiveNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 name];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v7, 0xCu);
  }
  [(SLShareableContentObserver *)self resumeIfNeeded];
}

- (void)didEnterBackgroundNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 name];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v7, 0xCu);
  }
  [(SLShareableContentObserver *)self reset];
}

- (void)willResignActiveNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 name];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v7, 0xCu);
  }
  [(SLShareableContentObserver *)self pause];
}

- (void)documentStateChangedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 name];
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v11, 0xCu);
  }
  int v7 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = [v8 documentState];
    v10 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_INFO, "[observer] document %@ changed state to %tu", (uint8_t *)&v11, 0x16u);
    }

    if (!v9) {
      [(SLShareableContentObserver *)self refreshIfNeeded];
    }
  }
}

- (void)activityItemsConfigurationReadyNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SLShareableContentObserver_activityItemsConfigurationReadyNotification___block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__SLShareableContentObserver_activityItemsConfigurationReadyNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshIfNeeded];
}

- (void)userActivityWasCreated:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 activityType];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[observer] user activity created with type %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SLShareableContentObserver_userActivityWasCreated___block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__SLShareableContentObserver_userActivityWasCreated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshIfNeeded];
}

- (void)serviceProxyDidConnect:(id)a3
{
  id v4 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "[observer] service proxy connected", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SLShareableContentObserver_serviceProxyDidConnect___block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__SLShareableContentObserver_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 connectAndRefreshNow];
  }
  return result;
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  char v3 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[observer] service proxy disconnected", v4, 2u);
  }
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end