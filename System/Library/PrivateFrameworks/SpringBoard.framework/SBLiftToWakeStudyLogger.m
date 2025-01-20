@interface SBLiftToWakeStudyLogger
- (SBLiftToWakeStudyLogger)initWithController:(id)a3;
- (void)dealloc;
- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5;
@end

@implementation SBLiftToWakeStudyLogger

- (SBLiftToWakeStudyLogger)initWithController:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  char v7 = [v6 isEnabled];

  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBLiftToWakeStudyLogger;
    v8 = [(SBLiftToWakeStudyLogger *)&v13 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_controller, a3);
      uint64_t v10 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      logger = v9->_logger;
      v9->_logger = (SLGLog *)v10;

      [v5 addObserver:v9];
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(SBLiftToWakeController *)self->_controller removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBLiftToWakeStudyLogger;
  [(SBLiftToWakeStudyLogger *)&v3 dealloc];
}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  logger = self->_logger;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__SBLiftToWakeStudyLogger_liftToWakeController_didObserveTransition_deviceOrientation___block_invoke;
  v6[3] = &__block_descriptor_48_e5__8__0l;
  v6[4] = a4;
  v6[5] = a5;
  [(SLGLog *)logger logBlock:v6 domain:@"com.apple.SpringBoard.liftToWake"];
}

id __87__SBLiftToWakeStudyLogger_liftToWakeController_didObserveTransition_deviceOrientation___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"liftToWake";
  v7[0] = @"transition";
  v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v7[1] = @"deviceOrientation";
  v8[0] = v2;
  objc_super v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v8[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end