@interface MTSessionManagerExportedObject
- (MTSessionManager)sessionManager;
- (MTSessionManagerExportedObject)initWithSessionManager:(id)a3;
- (NSNotificationCenter)notificationCenter;
- (void)_didReceiveSessionServerReadyNotification:(id)a3;
- (void)dealloc;
@end

@implementation MTSessionManagerExportedObject

- (MTSessionManagerExportedObject)initWithSessionManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSessionManagerExportedObject;
  v5 = [(MTSessionManagerExportedObject *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sessionManager, v4);
    v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v6 selector:sel__didReceiveSessionServerReadyNotification_ name:@"com.apple.MTSessionServer.ready" object:0];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.MTSessionServer.ready" object:0];

  v5.receiver = self;
  v5.super_class = (Class)MTSessionManagerExportedObject;
  [(MTSessionManagerExportedObject *)&v5 dealloc];
}

- (void)_didReceiveSessionServerReadyNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [(MTSessionManagerExportedObject *)self sessionManager];
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTSessionServerReadyNotification", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MTSessionManagerExportedObject__didReceiveSessionServerReadyNotification___block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__MTSessionManagerExportedObject__didReceiveSessionServerReadyNotification___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sessionManager];
  v2 = [v4 notificationCenter];
  v3 = [*(id *)(a1 + 32) sessionManager];
  [v2 postNotificationName:@"MTSessionManagerStateReset" object:v3];
}

- (MTSessionManager)sessionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionManager);
  return (MTSessionManager *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
}

@end