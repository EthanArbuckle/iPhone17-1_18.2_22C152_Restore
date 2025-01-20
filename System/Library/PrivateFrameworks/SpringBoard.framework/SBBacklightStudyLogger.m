@interface SBBacklightStudyLogger
- (SBBacklightStudyLogger)initWithController:(id)a3;
- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5;
- (void)dealloc;
@end

@implementation SBBacklightStudyLogger

- (SBBacklightStudyLogger)initWithController:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  char v7 = [v6 isEnabled];

  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBBacklightStudyLogger;
    v8 = [(SBBacklightStudyLogger *)&v13 init];
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
  [(SBBacklightController *)self->_controller removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBBacklightStudyLogger;
  [(SBBacklightStudyLogger *)&v3 dealloc];
}

- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  logger = self->_logger;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__SBBacklightStudyLogger_backlightController_didAnimateBacklightToFactor_source___block_invoke;
  v6[3] = &__block_descriptor_36_e5__8__0l;
  float v7 = a4;
  [(SLGLog *)logger logBlock:v6 domain:@"com.apple.SpringBoard.backlight"];
}

id __81__SBBacklightStudyLogger_backlightController_didAnimateBacklightToFactor_source___block_invoke(uint64_t a1, double a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"backlightFactor";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v2 = [NSNumber numberWithFloat:a2];
  v6[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end