@interface SASAnalytics
+ (id)analytics;
+ (id)new;
- (BOOL)shouldLogAnalyticsEvents;
- (NSMutableArray)pendingAnalyticsEventQueue;
- (SASAnalytics)init;
- (id)_init;
- (void)_enqueueAnalyticsEvent:(id)a3;
- (void)enqueueCurrentAnalyticsEventWithType:(int64_t)a3 context:(id)a4;
- (void)flushPendingAnalyticsEventQueue;
- (void)setPendingAnalyticsEventQueue:(id)a3;
- (void)setShouldLogAnalyticsEvents:(BOOL)a3;
@end

@implementation SASAnalytics

+ (id)analytics
{
  if (analytics_onceToken != -1) {
    dispatch_once(&analytics_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)analytics_sharedAnalytics;
  return v2;
}

uint64_t __25__SASAnalytics_analytics__block_invoke()
{
  analytics_sharedAnalytics = [[SASAnalytics alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)SASAnalytics;
  v2 = [(SASAnalytics *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri.SASAnalyticsEventQueue", v3);
    analyticsEventQueue = v2->_analyticsEventQueue;
    v2->_analyticsEventQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (SASAnalytics)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)enqueueCurrentAnalyticsEventWithType:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  analyticsEventQueue = self->_analyticsEventQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SASAnalytics_enqueueCurrentAnalyticsEventWithType_context___block_invoke;
  v9[3] = &unk_1E6B676D0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(analyticsEventQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__SASAnalytics_enqueueCurrentAnalyticsEventWithType_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = +[SiriActivationService service];
    char v3 = [v2 xcTestingActive];

    id WeakRetained = v5;
    if ((v3 & 1) == 0)
    {
      dispatch_queue_t v4 = AFAnalyticsEventCreateCurrent();
      [v5 _enqueueAnalyticsEvent:v4];

      id WeakRetained = v5;
    }
  }
}

- (void)_enqueueAnalyticsEvent:(id)a3
{
  id v4 = a3;
  if ([(SASAnalytics *)self shouldLogAnalyticsEvents])
  {
    [(SASAnalytics *)self flushPendingAnalyticsEventQueue];
    id v10 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v10 logEvent:v4];
    goto LABEL_9;
  }
  id v5 = [(SASAnalytics *)self pendingAnalyticsEventQueue];

  if (!v5)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:16];
    [(SASAnalytics *)self setPendingAnalyticsEventQueue:v8];
    goto LABEL_7;
  }
  id v6 = [(SASAnalytics *)self pendingAnalyticsEventQueue];
  unint64_t v7 = [v6 count];

  if (v7 >= 0x10)
  {
    id v8 = [(SASAnalytics *)self pendingAnalyticsEventQueue];
    v9 = [(SASAnalytics *)self pendingAnalyticsEventQueue];
    objc_msgSend(v8, "removeObjectsInRange:", 0, objc_msgSend(v9, "count") - 15);

LABEL_7:
  }
  id v10 = [(SASAnalytics *)self pendingAnalyticsEventQueue];
  [v10 addObject:v4];
LABEL_9:
}

- (void)flushPendingAnalyticsEventQueue
{
  objc_initWeak(&location, self);
  analyticsEventQueue = self->_analyticsEventQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SASAnalytics_flushPendingAnalyticsEventQueue__block_invoke;
  block[3] = &unk_1E6B676F8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(analyticsEventQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__SASAnalytics_flushPendingAnalyticsEventQueue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    char v3 = [WeakRetained pendingAnalyticsEventQueue];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) pendingAnalyticsEventQueue];
      id v6 = (void *)[v5 copy];

      unint64_t v7 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      [v7 logEvents:v6];
    }
    [v8 setPendingAnalyticsEventQueue:0];
    id WeakRetained = v8;
  }
}

- (BOOL)shouldLogAnalyticsEvents
{
  return self->_shouldLogAnalyticsEvents;
}

- (void)setShouldLogAnalyticsEvents:(BOOL)a3
{
  self->_shouldLogAnalyticsEvents = a3;
}

- (NSMutableArray)pendingAnalyticsEventQueue
{
  return self->_pendingAnalyticsEventQueue;
}

- (void)setPendingAnalyticsEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAnalyticsEventQueue, 0);
  objc_storeStrong((id *)&self->_analyticsEventQueue, 0);
}

@end