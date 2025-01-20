@interface SPNetworkMonitor
- (BOOL)cachedIsNetworkUp;
- (BOOL)isMonitoring;
- (BOOL)isNetworkUp;
- (NWPathEvaluator)evaluator;
- (OS_dispatch_queue)callbackQueue;
- (id)block;
- (void)notifyNetworkStateChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBlock:(id)a3;
- (void)setCachedIsNetworkUp:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setEvaluator:(id)a3;
- (void)startMonitoringWithCallback:(id)a3;
- (void)stopMonitoring;
@end

@implementation SPNetworkMonitor

- (void)startMonitoringWithCallback:(id)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("SPNetworkMonitor", v5);
  [(SPNetworkMonitor *)self setCallbackQueue:v7];

  [(SPNetworkMonitor *)self setBlock:v6];
  v8 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  [(SPNetworkMonitor *)self setEvaluator:v8];

  id v9 = [(SPNetworkMonitor *)self evaluator];
  [v9 addObserver:self forKeyPath:@"path" options:5 context:0];
}

- (void)stopMonitoring
{
  [(SPNetworkMonitor *)self setCallbackQueue:0];
  [(SPNetworkMonitor *)self setBlock:0];
  v3 = [(SPNetworkMonitor *)self evaluator];
  [v3 removeObserver:self forKeyPath:@"path" context:0];

  [(SPNetworkMonitor *)self setEvaluator:0];
}

- (BOOL)isMonitoring
{
  v2 = [(SPNetworkMonitor *)self evaluator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isNetworkUp
{
  BOOL v3 = [(SPNetworkMonitor *)self isMonitoring];
  if (v3)
  {
    v4 = [(SPNetworkMonitor *)self evaluator];
    v5 = [v4 path];
    uint64_t v6 = [v5 status];

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  return v3;
}

- (void)setCachedIsNetworkUp:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SPNetworkMonitor *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_cachedIsNetworkUp != v3)
  {
    self->_cachedIsNetworkUp = v3;
    [(SPNetworkMonitor *)self notifyNetworkStateChange];
  }
}

- (void)notifyNetworkStateChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SPNetworkMonitor *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(SPNetworkMonitor *)self cachedIsNetworkUp];
    v5 = @"DOWN";
    if (v4) {
      v5 = @"UP";
    }
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Network state changed: %@", buf, 0xCu);
  }
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "Network state changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) block];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(NSObject **)(v3 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke_2;
    v8[3] = &unk_1E601B790;
    v8[4] = v3;
    dispatch_async(v4, v8);
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = @"IsNetworkAvailable";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "cachedIsNetworkUp"));
  v10[0] = v6;
  dispatch_queue_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 postNotificationName:@"com.apple.icloud.SPOwner.SPNetworkMonitor.networkChanged" object:0 userInfo:v7];
}

void __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) block];
  v2[2](v2, [*(id *)(a1 + 32) cachedIsNetworkUp]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"path"])
  {
    uint64_t v9 = [(SPNetworkMonitor *)self callbackQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __67__SPNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v10[3] = &unk_1E601B920;
    v10[4] = self;
    id v11 = v8;
    dispatch_async(v9, v10);
  }
}

void __67__SPNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) evaluator];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) isNetworkUp];
    v5 = *(void **)(a1 + 32);
    [v5 setCachedIsNetworkUp:v4];
  }
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (BOOL)cachedIsNetworkUp
{
  return self->_cachedIsNetworkUp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_evaluator, 0);
}

@end