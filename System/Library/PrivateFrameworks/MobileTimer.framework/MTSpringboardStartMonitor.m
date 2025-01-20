@interface MTSpringboardStartMonitor
+ (id)sharedInstance;
- (BOOL)_checkSpringBoardStarted;
- (BOOL)isSpringboardStarted;
- (MTSpringboardStartMonitor)init;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didReceiveSpringboardStarted:(BOOL)a3;
- (void)enumerateObservers:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation MTSpringboardStartMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __43__MTSpringboardStartMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MTSpringboardStartMonitor);
  uint64_t v1 = sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTSpringboardStartMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTSpringboardStartMonitor;
  v2 = [(MTSpringboardStartMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (MTObserverStore *)v3;

    v2->_notifyToken = -1;
    dispatch_queue_t v5 = dispatch_queue_create("Serial MTSpringboardStartMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_isSpringBoardStarted = [(MTSpringboardStartMonitor *)v2 _checkSpringBoardStarted];
  }
  return v2;
}

- (void)dealloc
{
  [(MTSpringboardStartMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)MTSpringboardStartMonitor;
  [(MTSpringboardStartMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    char v4 = 0;
    [(MTObserverStore *)self->_observers addObserver:a3 wasFirst:&v4];
    if (v4) {
      [(MTSpringboardStartMonitor *)self _startMonitoringWithQueue:self->_queue];
    }
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    char v4 = 0;
    [(MTObserverStore *)self->_observers removeObserver:a3 wasLast:&v4];
    if (v4) {
      [(MTSpringboardStartMonitor *)self _stopMonitoring];
    }
  }
}

- (void)enumerateObservers:(id)a3
{
}

- (void)_startMonitoringWithQueue:(id)a3
{
  char v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55__MTSpringboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E5915D90;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, v4, handler);
    dispatch_queue_t v5 = MTLogForCategory(1);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)v7 = 0;
    v6 = "Start monitoring : Springboard/Carousel start";
  }
  else
  {
    dispatch_queue_t v5 = MTLogForCategory(1);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)v7 = 0;
    v6 = "Cannot start monitoring Springboard/Carousel start because it was already started";
  }
  _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
LABEL_7:

  if (!self->_isSpringBoardStarted) {
    self->_isSpringBoardStarted = [(MTSpringboardStartMonitor *)self _checkSpringBoardStarted];
  }
}

uint64_t __55__MTSpringboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = [*(id *)(a1 + 32) _checkSpringBoardStarted];
  v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[12];
  return [v2 didReceiveSpringboardStarted:v3];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    char v4 = MTLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Springboard/Carousel start", v5, 2u);
    }
  }
}

- (void)didReceiveSpringboardStarted:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__MTSpringboardStartMonitor_didReceiveSpringboardStarted___block_invoke;
  v3[3] = &unk_1E5915DB8;
  v3[4] = self;
  BOOL v4 = a3;
  [(MTSpringboardStartMonitor *)self enumerateObservers:v3];
}

void __58__MTSpringboardStartMonitor_didReceiveSpringboardStarted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 springboardStartMonitor:*(void *)(a1 + 32) didReceiveStarted:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isSpringboardStarted
{
  return self->_isSpringBoardStarted;
}

- (BOOL)_checkSpringBoardStarted
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (MTIsHorseman())
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token == -1)
    {
      BOOL v2 = 0;
    }
    else
    {
      *(void *)state64 = 0;
      notify_get_state(out_token, (uint64_t *)state64);
      BOOL v2 = *(void *)state64 != 0;
    }
    id v3 = MTLogForCategory(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = @"NO";
      if (v2) {
        BOOL v4 = @"YES";
      }
      *(_DWORD *)state64 = 138543362;
      *(void *)&state64[4] = v4;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Springboard/Carousel started = %{public}@", state64, 0xCu);
    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end