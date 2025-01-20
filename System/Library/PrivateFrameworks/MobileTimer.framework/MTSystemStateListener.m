@interface MTSystemStateListener
+ (BOOL)isSystemRestoreDone;
+ (id)_restoreNotification;
- (BOOL)_checkIfRestoreDone;
- (BOOL)checkSystemReady;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (BOOL)restoreDoneHandled;
- (MTScheduler)serializer;
- (MTSystemStateDelegate)delegate;
- (MTSystemStateListener)initWithDelegate:(id)a3;
- (id)gatherDiagnostics;
- (id)liveDarwinNotifications;
- (void)_handleF5Reset;
- (void)_handleRestoreDone;
- (void)_verifyRestoreDone;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)printDiagnostics;
- (void)setDelegate:(id)a3;
- (void)setRestoreDoneHandled:(BOOL)a3;
- (void)setSerializer:(id)a3;
- (void)springboardStartMonitor:(id)a3 didReceiveStarted:(BOOL)a4;
@end

@implementation MTSystemStateListener

- (MTSystemStateListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTSystemStateListener;
  v5 = [(MTSystemStateListener *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v6, +[MTScheduler defaultPriority]);
    serializer = v6->_serializer;
    v6->_serializer = (MTScheduler *)v7;
  }
  return v6;
}

- (BOOL)checkSystemReady
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MTSystemStateListener *)self _checkIfRestoreDone];
  id v4 = +[MTSpringboardStartMonitor sharedInstance];
  [v4 addObserver:self];

  if (v3)
  {
    v5 = MTLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ System is ready.", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3;
}

- (BOOL)_checkIfRestoreDone
{
  int v3 = [(id)objc_opt_class() isSystemRestoreDone];
  id v4 = MTLogForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Restore is done or not needed.", buf, 2u);
    }

    [(MTSystemStateListener *)self _handleRestoreDone];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Restore isn't done.", v7, 2u);
    }
  }
  return v3;
}

+ (BOOL)isSystemRestoreDone
{
  v2 = +[MTSpringboardStartMonitor sharedInstance];
  int v3 = [v2 isSpringboardStarted];

  id v4 = MTLogForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      __int16 v10 = 0;
      v6 = "Springboard/Carousel is started.";
      int v7 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v9 = 0;
    v6 = "Springboard/Carousel not started.";
    int v7 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  return v3;
}

- (void)springboardStartMonitor:(id)a3 didReceiveStarted:(BOOL)a4
{
  BOOL v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "Carousel/Springboard started", v7, 2u);
  }

  [(MTSystemStateListener *)self _verifyRestoreDone];
  v6 = +[MTSpringboardStartMonitor sharedInstance];
  [v6 removeObserver:self];
}

- (void)_verifyRestoreDone
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    BOOL v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ verifying restore is done", (uint8_t *)&v4, 0xCu);
  }

  [(MTSystemStateListener *)self _handleRestoreDone];
}

+ (id)_restoreNotification
{
  return 0;
}

- (void)_handleRestoreDone
{
  int v3 = [(MTSystemStateListener *)self serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__MTSystemStateListener__handleRestoreDone__block_invoke;
  v4[3] = &unk_1E59150A8;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __43__MTSystemStateListener__handleRestoreDone__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) restoreDoneHandled];
  int v3 = MTLogForCategory(1);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ restore already handled", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = [(id)objc_opt_class() _restoreNotification];
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ has been notified that restore is done (received %{public}@) or not needed.", (uint8_t *)&v9, 0x16u);
    }
    v8 = [*(id *)(a1 + 32) delegate];
    [v8 restoreDidFinish];

    [*(id *)(a1 + 32) setRestoreDoneHandled:1];
  }
}

- (void)_handleF5Reset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ has been notified of F5 demo", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = [(MTSystemStateListener *)self delegate];
  [v4 handleF5Reset];
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(MTSystemStateListener *)self liveDarwinNotifications];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__MTSystemStateListener_handlesNotification_ofType___block_invoke;
  v10[3] = &unk_1E5914F20;
  id v11 = v5;
  id v7 = v5;
  char v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __52__MTSystemStateListener_handlesNotification_ofType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(void))a5;
  id v8 = a3;
  int v9 = [(id)objc_opt_class() _restoreNotification];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v11 = MTLogForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "Received %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [(MTSystemStateListener *)self _verifyRestoreDone];
  }
  if (v7) {
    v7[2](v7);
  }
}

- (id)liveDarwinNotifications
{
  char v2 = [MEMORY[0x1E4F1CA48] array];
  int v3 = [(id)objc_opt_class() _restoreNotification];
  if (v3) {
    [v2 addObject:v3];
  }

  return v2;
}

- (void)printDiagnostics
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v2 = MTLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "-----MTSystemStateListener-----", (uint8_t *)v5, 2u);
  }

  int v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(id)objc_opt_class() isSystemRestoreDone];
    v5[0] = 67240192;
    v5[1] = v4;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Restore done: %{public}d", (uint8_t *)v5, 8u);
  }
}

- (id)gatherDiagnostics
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"Restore done";
  int v2 = [(id)objc_opt_class() isSystemRestoreDone];
  int v3 = @"NO";
  if (v2) {
    int v3 = @"YES";
  }
  v7[0] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (MTSystemStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTSystemStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)restoreDoneHandled
{
  return self->_restoreDoneHandled;
}

- (void)setRestoreDoneHandled:(BOOL)a3
{
  self->_restoreDoneHandled = a3;
}

- (MTScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end