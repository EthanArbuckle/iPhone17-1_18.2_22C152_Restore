@interface MRPowerLogger
+ (MRPowerLogger)sharedLogger;
- (MRPowerLogger)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (void)logEvent:(id)a3 withInfo:(id)a4;
@end

@implementation MRPowerLogger

- (MRPowerLogger)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPowerLogger;
  v6 = [(MRPowerLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

+ (MRPowerLogger)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_89);
  }
  v2 = (void *)sharedLogger___logger;

  return (MRPowerLogger *)v2;
}

void __29__MRPowerLogger_sharedLogger__block_invoke()
{
  v0 = [MRPowerLogger alloc];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.amp.MediaRemote.MRPowerLogger.shared", v4);
  uint64_t v2 = [(MRPowerLogger *)v0 initWithQueue:v1];
  v3 = (void *)sharedLogger___logger;
  sharedLogger___logger = v2;
}

- (void)logEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MRPowerLogger *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__MRPowerLogger_logEvent_withInfo___block_invoke;
  v11[3] = &unk_1E57D0790;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

uint64_t __35__MRPowerLogger_logEvent_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRPowerLogger] logging event %@", (uint8_t *)&v5, 0xCu);
  }

  return softLinkPLLogRegisteredEvent(118, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end