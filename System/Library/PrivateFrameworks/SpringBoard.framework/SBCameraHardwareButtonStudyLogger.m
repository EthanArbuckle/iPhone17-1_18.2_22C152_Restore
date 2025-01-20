@interface SBCameraHardwareButtonStudyLogger
- (SBCameraHardwareButtonStudyLogger)init;
- (void)_handleApplicationProcessStateDidChangeNotification:(id)a3;
- (void)_startProcessMonitor;
- (void)_stopProcessMonitor;
- (void)dealloc;
- (void)logButtonEvent:(__IOHIDEvent *)a3;
- (void)logPocketState:(int64_t)a3;
@end

@implementation SBCameraHardwareButtonStudyLogger

- (SBCameraHardwareButtonStudyLogger)init
{
  v3 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  char v4 = [v3 isEnabled];

  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBCameraHardwareButtonStudyLogger;
    v5 = [(SBCameraHardwareButtonStudyLogger *)&v13 init];
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FA8AA8]);
      id v7 = objc_alloc(MEMORY[0x1E4FA8A98]);
      v8 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      v9 = (void *)[v7 initWithLogger:v8];
      uint64_t v10 = [v6 initWithLogger:v9];
      logger = v5->_logger;
      v5->_logger = (SLGNotificationActivatedLogger *)v10;

      [(SLGNotificationActivatedLogger *)v5->_logger addBeginNotification:@"SBStudyLogBeginCameraButtonLogging" endNotification:@"SBStudyLogEndCameraButtonLogging"];
      [(SLGNotificationActivatedLogger *)v5->_logger setActivationHandler:&__block_literal_global_310];
      [(SLGNotificationActivatedLogger *)v5->_logger setDeactivationHandler:&__block_literal_global_25_1];
      [(SBCameraHardwareButtonStudyLogger *)v5 _startProcessMonitor];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t __41__SBCameraHardwareButtonStudyLogger_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 logBlock:&__block_literal_global_9_3 domain:@"com.apple.SpringBoard.cameraButton"];
}

id __41__SBCameraHardwareButtonStudyLogger_init__block_invoke_2()
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [(id)SBApp rawDeviceOrientationIgnoringOrientationLocks];
  v1 = [(id)SBApp orientationAggregator];
  uint64_t v2 = [v1 activeInterfaceOrientation];

  uint64_t v10 = @"orientation";
  v8[0] = @"interfaceOrientation";
  v3 = [NSNumber numberWithInteger:v2];
  v8[1] = @"deviceOrientation";
  v9[0] = v3;
  char v4 = [NSNumber numberWithInteger:v0];
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

uint64_t __41__SBCameraHardwareButtonStudyLogger_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 logBlock:&__block_literal_global_27_0 domain:@"com.apple.SpringBoard.cameraButton"];
}

__CFString *__41__SBCameraHardwareButtonStudyLogger_init__block_invoke_4()
{
  return @"cameraButtonLoggingTimeout";
}

- (void)logButtonEvent:(__IOHIDEvent *)a3
{
  [(SLGNotificationActivatedLogger *)self->_logger setActive:1];
  logger = self->_logger;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SBCameraHardwareButtonStudyLogger_logButtonEvent___block_invoke;
  v6[3] = &__block_descriptor_40_e5__8__0l;
  v6[4] = a3;
  [(SLGNotificationActivatedLogger *)logger logBlock:v6 domain:@"com.apple.SpringBoard.cameraButton"];
}

id __52__SBCameraHardwareButtonStudyLogger_logButtonEvent___block_invoke()
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v0 = IOHIDEventGetIntegerValue() != 0;
  uint64_t v1 = [(id)SBApp rawDeviceOrientationIgnoringOrientationLocks];
  uint64_t v2 = [(id)SBApp orientationAggregator];
  uint64_t v3 = [v2 activeInterfaceOrientation];

  v12 = @"cameraButtonEvent";
  v10[0] = @"down";
  char v4 = [NSNumber numberWithBool:v0];
  v11[0] = v4;
  v10[1] = @"interfaceOrientation";
  v5 = [NSNumber numberWithInteger:v3];
  v11[1] = v5;
  v10[2] = @"deviceOrientation";
  id v6 = [NSNumber numberWithInteger:v1];
  void v11[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v8;
}

- (void)logPocketState:(int64_t)a3
{
  logger = self->_logger;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SBCameraHardwareButtonStudyLogger_logPocketState___block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a3;
  [(SLGNotificationActivatedLogger *)logger logBlock:v4 domain:@"com.apple.SpringBoard.cameraButton"];
}

id __52__SBCameraHardwareButtonStudyLogger_logPocketState___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"pocketState";
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)dealloc
{
  [(SLGNotificationActivatedLogger *)self->_logger invalidate];
  [(SBCameraHardwareButtonStudyLogger *)self _stopProcessMonitor];
  v3.receiver = self;
  v3.super_class = (Class)SBCameraHardwareButtonStudyLogger;
  [(SBCameraHardwareButtonStudyLogger *)&v3 dealloc];
}

- (void)_handleApplicationProcessStateDidChangeNotification:(id)a3
{
  char v4 = [a3 object];
  v5 = [v4 processState];
  if ([v5 isForeground])
  {
    logger = self->_logger;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__SBCameraHardwareButtonStudyLogger__handleApplicationProcessStateDidChangeNotification___block_invoke;
    v7[3] = &unk_1E6AF5180;
    id v8 = v4;
    [(SLGNotificationActivatedLogger *)logger logBlock:v7 domain:@"com.apple.SpringBoard.cameraButton"];
  }
}

id __89__SBCameraHardwareButtonStudyLogger__handleApplicationProcessStateDidChangeNotification___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"frontmostApp";
  uint64_t v1 = [*(id *)(a1 + 32) bundleIdentifier];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)_startProcessMonitor
{
  if (!self->_monitoringProcesses)
  {
    self->_monitoringProcesses = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__handleApplicationProcessStateDidChangeNotification_ name:@"SBApplicationProcessStateDidChange" object:0];
  }
}

- (void)_stopProcessMonitor
{
  if (self->_monitoringProcesses)
  {
    self->_monitoringProcesses = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];
  }
}

- (void).cxx_destruct
{
}

@end