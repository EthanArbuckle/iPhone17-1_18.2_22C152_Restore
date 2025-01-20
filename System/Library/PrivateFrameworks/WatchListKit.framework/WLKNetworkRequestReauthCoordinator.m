@interface WLKNetworkRequestReauthCoordinator
+ (id)coordinator;
- (BOOL)sessionPrompt;
- (id)_init;
- (void)dealloc;
- (void)lock;
- (void)markPrompt;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSessionPrompt:(BOOL)a3;
- (void)unlock;
@end

@implementation WLKNetworkRequestReauthCoordinator

+ (id)coordinator
{
  if (coordinator_onceToken != -1) {
    dispatch_once(&coordinator_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)coordinator___coordinator;

  return v2;
}

uint64_t __49__WLKNetworkRequestReauthCoordinator_coordinator__block_invoke()
{
  coordinator___coordinator = [[WLKNetworkRequestReauthCoordinator alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)WLKNetworkRequestReauthCoordinator;
  v2 = [(WLKNetworkRequestReauthCoordinator *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;

    [(NSLock *)v2->_lock setName:@"WLKNetworkRequestRetryLock"];
    v5 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];
    [v5 addObserver:v2 forKeyPath:@"operationCount" options:3 context:@"_WLKNetworkRequestReauthCoordinatorObservationContext"];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];
  [v3 removeObserver:self forKeyPath:@"operationCount"];

  v4.receiver = self;
  v4.super_class = (Class)WLKNetworkRequestReauthCoordinator;
  [(WLKNetworkRequestReauthCoordinator *)&v4 dealloc];
}

- (void)markPrompt
{
  v3 = [MEMORY[0x1E4F28F08] currentQueue];
  objc_super v4 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];

  if (v3 == v4)
  {
    [(WLKNetworkRequestReauthCoordinator *)self setSessionPrompt:1];
  }
}

- (void)lock
{
  v3 = [MEMORY[0x1E4F28F08] currentQueue];
  objc_super v4 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];

  if (v3 == v4)
  {
    lock = self->_lock;
    [(NSLock *)lock lock];
  }
}

- (void)unlock
{
  v3 = [MEMORY[0x1E4F28F08] currentQueue];
  objc_super v4 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];

  if (v3 == v4)
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"_WLKNetworkRequestReauthCoordinatorObservationContext")
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (![v7 unsignedIntegerValue]) {
      [(WLKNetworkRequestReauthCoordinator *)self setSessionPrompt:0];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WLKNetworkRequestReauthCoordinator;
    -[WLKNetworkRequestReauthCoordinator observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)sessionPrompt
{
  return self->_sessionPrompt;
}

- (void)setSessionPrompt:(BOOL)a3
{
  self->_sessionPrompt = a3;
}

- (void).cxx_destruct
{
}

@end