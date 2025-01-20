@interface BRCAccountOnlinePerformer
+ (BOOL)addPerformer:(id)a3;
+ (void)removePerformer:(id)a3;
- (BRCAccountOnlinePerformer)initWithDSID:(id)a3;
- (id)_key;
- (void)_close;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)perform;
- (void)resumeAndAutoClose;
@end

@implementation BRCAccountOnlinePerformer

- (id)_key
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@/%@", v5, self->_dsid];

  return v6;
}

+ (BOOL)addPerformer:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if (!g_performers)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    v7 = (void *)g_performers;
    g_performers = v6;
  }
  v8 = [v4 _key];
  v9 = [(id)g_performers objectForKey:v8];

  if (!v9) {
    [(id)g_performers setObject:v4 forKey:v8];
  }

  objc_sync_exit(v5);
  return v9 == 0;
}

+ (void)removePerformer:(id)a3
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  id v5 = (void *)g_performers;
  uint64_t v6 = [v7 _key];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (BRCAccountOnlinePerformer)initWithDSID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCAccountOnlinePerformer;
  uint64_t v6 = [(BRCAccountOnlinePerformer *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dsid, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bird.account-migrator", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (a3)
  {
    [(BRCThrottler *)self->_throttler reset];
    throttler = self->_throttler;
    [(BRCThrottler *)throttler scheduleNextEvent];
  }
}

- (void)resumeAndAutoClose
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] performer already registered for %@%@", (void)v3, DWORD2(v3));
}

uint64_t __47__BRCAccountOnlinePerformer_resumeAndAutoClose__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) perform];
}

- (void)perform
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  os_log_t v2 = brc_bread_crumbs();
  long long v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_fault_impl(&dword_23FA42000, v3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: implemented by subclass%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_close
{
  long long v3 = +[BRCSystemResourcesManager manager];
  [v3 removeReachabilityObserver:self];

  [(BRCThrottler *)self->_throttler cancel];
  int v4 = objc_opt_class();
  [v4 removePerformer:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end