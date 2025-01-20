@interface QLTAnalyticsManager
+ (id)sharedManager;
- (id)_eventsQueue;
- (void)_sendEvent:(id)a3;
- (void)sendCacheSizeEventWithCacheSize:(unint64_t)a3;
@end

@implementation QLTAnalyticsManager

- (id)_eventsQueue
{
  if (_eventsQueue_onceToken != -1) {
    dispatch_once(&_eventsQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)_eventsQueue__eventsSerialBackgroundQueue;
  return v2;
}

void __35__QLTAnalyticsManager__eventsQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, -1);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.quicklook.AnalyticsEventsQueue", attr);
  v2 = (void *)_eventsQueue__eventsSerialBackgroundQueue;
  _eventsQueue__eventsSerialBackgroundQueue = (uint64_t)v1;
}

- (void)_sendEvent:(id)a3
{
  id v5 = a3;
  v6 = [(QLTAnalyticsManager *)self _eventsQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__QLTAnalyticsManager__sendEvent___block_invoke;
  v8[3] = &unk_1E6D0C5F8;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __34__QLTAnalyticsManager__sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  v3 = [*(id *)(a1 + 32) propertiesBuilder];
  int v4 = AnalyticsSendEventLazy();

  uint64_t v5 = MEMORY[0x1E4F3A768];
  v6 = *(NSObject **)(MEMORY[0x1E4F3A768] + 152);
  if (!v6)
  {
    QLTInitLogging();
    v6 = *(NSObject **)(v5 + 152);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = *(const char **)(a1 + 40);
    v8 = v6;
    id v9 = NSStringFromSelector(v7);
    uint64_t v10 = [*(id *)(a1 + 32) name];
    v11 = (void *)v10;
    v12 = @"failed";
    int v13 = 138412802;
    v14 = v9;
    __int16 v15 = 2112;
    if (v4) {
      v12 = @"succeeded";
    }
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_INFO, "%@: Tracking event %@ %@", (uint8_t *)&v13, 0x20u);
  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedManager_sharedAnalyticsManager;
  return v2;
}

uint64_t __36__QLTAnalyticsManager_sharedManager__block_invoke()
{
  sharedManager_sharedAnalyticsManager = objc_alloc_init(QLTAnalyticsManager);
  return MEMORY[0x1F41817F8]();
}

- (void)sendCacheSizeEventWithCacheSize:(unint64_t)a3
{
  int v4 = [[QLTCacheSizeEvent alloc] initWithCacheSize:a3];
  [(QLTAnalyticsManager *)self _sendEvent:v4];
}

@end