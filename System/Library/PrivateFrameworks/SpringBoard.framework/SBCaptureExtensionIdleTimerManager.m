@interface SBCaptureExtensionIdleTimerManager
- (SBCaptureExtensionIdleTimerManager)init;
- (void)cameraViewfinderMonitorSessionDidBeginMovieRecording:(id)a3;
- (void)cameraViewfinderMonitorSessionDidEndMovieRecording:(id)a3;
- (void)invalidate;
@end

@implementation SBCaptureExtensionIdleTimerManager

- (SBCaptureExtensionIdleTimerManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBCaptureExtensionIdleTimerManager;
  v2 = [(SBCaptureExtensionIdleTimerManager *)&v7 init];
  if (v2)
  {
    v3 = +[SBCameraViewfinderMonitor sharedInstance];
    uint64_t v4 = [v3 addObserver:v2];
    cameraViewfinderMonitorToken = v2->_cameraViewfinderMonitorToken;
    v2->_cameraViewfinderMonitorToken = (SBCameraViewfinderMonitoring *)v4;
  }
  return v2;
}

- (void)invalidate
{
  v3 = +[SBLockScreenManager sharedInstanceIfExists];
  uint64_t v4 = [v3 lockScreenEnvironment];
  v5 = [v4 idleTimerController];
  [v5 removeIdleTimerDisabledAssertionReason:@"Capture Extension Movie Recording"];

  [(SBCameraViewfinderMonitoring *)self->_cameraViewfinderMonitorToken cancel];
  cameraViewfinderMonitorToken = self->_cameraViewfinderMonitorToken;
  self->_cameraViewfinderMonitorToken = 0;
}

- (void)cameraViewfinderMonitorSessionDidBeginMovieRecording:(id)a3
{
  id v5 = +[SBLockScreenManager sharedInstanceIfExists];
  v3 = [v5 lockScreenEnvironment];
  uint64_t v4 = [v3 idleTimerController];
  [v4 addIdleTimerDisabledAssertionReason:@"Capture Extension Movie Recording"];
}

- (void)cameraViewfinderMonitorSessionDidEndMovieRecording:(id)a3
{
  id v5 = +[SBLockScreenManager sharedInstanceIfExists];
  v3 = [v5 lockScreenEnvironment];
  uint64_t v4 = [v3 idleTimerController];
  [v4 removeIdleTimerDisabledAssertionReason:@"Capture Extension Movie Recording"];
}

- (void).cxx_destruct
{
}

@end