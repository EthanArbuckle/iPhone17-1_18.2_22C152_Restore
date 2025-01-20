@interface PLCameraAppWatcher
- (BOOL)isCameraRunning;
- (PLCameraAppWatcher)init;
- (id)foregroundMonitorIdentifier;
- (void)_cameraForegroundStateDidChangeTo:(BOOL)a3;
- (void)dealloc;
@end

@implementation PLCameraAppWatcher

- (void).cxx_destruct
{
}

- (id)foregroundMonitorIdentifier
{
  return self->_foregroundMonitorIdentifier;
}

- (BOOL)isCameraRunning
{
  v2 = self;
  p_isCameraRunningLock = &self->_isCameraRunningLock;
  os_unfair_lock_lock(&self->_isCameraRunningLock);
  LOBYTE(v2) = v2->_isCameraRunning;
  os_unfair_lock_unlock(p_isCameraRunningLock);
  return (char)v2;
}

- (void)_cameraForegroundStateDidChangeTo:(BOOL)a3
{
  p_isCameraRunningLock = &self->_isCameraRunningLock;
  os_unfair_lock_lock(&self->_isCameraRunningLock);
  self->_isCameraRunning = a3;
  os_unfair_lock_unlock(p_isCameraRunningLock);
}

- (void)dealloc
{
  v3 = +[PLForegroundMonitor sharedInstance];
  [v3 stopMonitoring:self->_foregroundMonitorIdentifier];

  v4.receiver = self;
  v4.super_class = (Class)PLCameraAppWatcher;
  [(PLCameraAppWatcher *)&v4 dealloc];
}

- (PLCameraAppWatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)PLCameraAppWatcher;
  v2 = [(PLCameraAppWatcher *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_isCameraRunningLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    objc_super v4 = +[PLForegroundMonitor sharedInstance];
    v5 = PLCameraBundleIdentifiers();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__PLCameraAppWatcher_init__block_invoke;
    v9[3] = &unk_1E586D6D0;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [v4 startMonitoringBundleIdentifiers:v5 block:v9];
    id foregroundMonitorIdentifier = v3->_foregroundMonitorIdentifier;
    v3->_id foregroundMonitorIdentifier = (id)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __26__PLCameraAppWatcher_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cameraForegroundStateDidChangeTo:a3];
}

@end