@interface SVXServiceCommandHandlerUIShowRequestHandlingStatus
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUIShowRequestHandlingStatus)initWithSessionManager:(id)a3 performer:(id)a4;
- (SVXServiceCommandHandlerUIShowRequestHandlingStatus)initWithSessionManager:(id)a3 performer:(id)a4 afPreferencesProvider:(id)a5;
- (void)_clearLEDs;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
- (void)sessionDidResignActiveWithDeactivationContext:(id)a3;
@end

@implementation SVXServiceCommandHandlerUIShowRequestHandlingStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ledStatusFactory, 0);
  objc_storeStrong((id *)&self->_performer, 0);

  objc_storeStrong((id *)&self->_debugInterface, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)sessionDidResignActiveWithDeactivationContext:(id)a3
{
  performer = self->_performer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __101__SVXServiceCommandHandlerUIShowRequestHandlingStatus_sessionDidResignActiveWithDeactivationContext___block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [(SVXPerforming *)performer performBlock:v4 afterDelay:4.0];
}

uint64_t __101__SVXServiceCommandHandlerUIShowRequestHandlingStatus_sessionDidResignActiveWithDeactivationContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearLEDs];
}

- (void)_clearLEDs
{
  debugInterface = self->_debugInterface;
  id v3 = [(SVXLEDStatusFactory *)self->_ledStatusFactory createClearLEDStatus];
  [(SBSDebugInterface *)debugInterface sendLEDCommand:v3];
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(void, void))v14;
  if (self->_shouldShowStatus)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [MEMORY[0x263F08690] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIShowRequestHandlingStatus.m", 94, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIShowRequestHandlingStatus class]]" object file lineNumber description];
    }
    id v16 = v11;
    ledStatusFactory = self->_ledStatusFactory;
    v18 = [v16 requestHandlingStatus];
    v19 = [(SVXLEDStatusFactory *)ledStatusFactory createCommandForStatus:v18];

    if (v19)
    {
      v20 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
      {
        v23 = v20;
        v24 = [v16 requestHandlingStatus];
        *(_DWORD *)buf = 136315650;
        v27 = "-[SVXServiceCommandHandlerUIShowRequestHandlingStatus handleCommand:withContext:taskTracker:completion:]";
        __int16 v28 = 2112;
        v29 = v24;
        __int16 v30 = 2112;
        v31 = v19;
        _os_log_debug_impl(&dword_220062000, v23, OS_LOG_TYPE_DEBUG, "%s Handling requestHandlingStatus [%@] with command [%@]", buf, 0x20u);
      }
      [(SBSDebugInterface *)self->_debugInterface sendLEDCommand:v19];
    }
    if (v15)
    {
      v21 = +[SVXServiceCommandResult resultSuccess];
      ((void (**)(void, void *))v15)[2](v15, v21);
    }
  }
  else if (v14)
  {
    v22 = +[SVXServiceCommandResult resultSuccess];
    ((void (**)(void, void *))v15)[2](v15, v22);
  }
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (SVXServiceCommandHandlerUIShowRequestHandlingStatus)initWithSessionManager:(id)a3 performer:(id)a4 afPreferencesProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SVXServiceCommandHandlerUIShowRequestHandlingStatus;
  id v11 = [(SVXServiceCommandHandlerUIShowRequestHandlingStatus *)&v23 init];
  if (v11)
  {
    id v12 = [NSString alloc];
    id v13 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v14 = NSStringFromClass(v13);
    uint64_t v15 = [v12 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v14];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v15;

    v17 = [v10 get];
    v11->_shouldShowStatus = [v17 siriXDebugStatusEnabled];

    if (v11->_shouldShowStatus)
    {
      objc_storeStrong((id *)&v11->_performer, a4);
      v18 = (SBSDebugInterface *)objc_alloc_init((Class)getSBSDebugInterfaceClass());
      debugInterface = v11->_debugInterface;
      v11->_debugInterface = v18;

      v20 = objc_alloc_init(SVXLEDStatusFactory);
      ledStatusFactory = v11->_ledStatusFactory;
      v11->_ledStatusFactory = v20;

      [v8 addActivityListener:v11];
    }
  }

  return v11;
}

- (SVXServiceCommandHandlerUIShowRequestHandlingStatus)initWithSessionManager:(id)a3 performer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(SVXAFPreferencesProvider);
  id v9 = [(SVXServiceCommandHandlerUIShowRequestHandlingStatus *)self initWithSessionManager:v7 performer:v6 afPreferencesProvider:v8];

  return v9;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end