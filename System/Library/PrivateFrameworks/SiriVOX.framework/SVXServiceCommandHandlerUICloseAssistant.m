@interface SVXServiceCommandHandlerUICloseAssistant
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUICloseAssistant)initWithSessionManager:(id)a3;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXServiceCommandHandlerUICloseAssistant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_sessionManager, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  v9 = (void (**)(id, void *))a6;
  id v10 = a3;
  uint64_t v11 = mach_absolute_time();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUICloseAssistant.m", 50, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUICloseAssistant class]]" object file lineNumber description];
  }
  sessionManager = self->_sessionManager;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __93__SVXServiceCommandHandlerUICloseAssistant_handleCommand_withContext_taskTracker_completion___block_invoke;
  v16[3] = &__block_descriptor_40_e20_v16__0__SVXSession_8l;
  v16[4] = v11;
  [(SVXSessionManager *)sessionManager getCurrentSessionUsingBlock:v16];
  if (v9)
  {
    v14 = +[SVXServiceCommandResult resultSuccess];
    v9[2](v9, v14);
  }
}

void __93__SVXServiceCommandHandlerUICloseAssistant_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [SVXDeactivationContext alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  SVXClientInfoGetCurrent();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(SVXDeactivationContext *)v4 initWithSource:4 timestamp:v5 buttonEvent:0 clientInfo:v7 userInfo:0 options:0];
  [v3 deactivateWithContext:v6 completion:0];
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (SVXServiceCommandHandlerUICloseAssistant)initWithSessionManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SVXServiceCommandHandlerUICloseAssistant;
  v6 = [(SVXServiceCommandHandlerUICloseAssistant *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionManager, a3);
    id v8 = [NSString alloc];
    v9 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v10];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;
  }
  return v7;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end