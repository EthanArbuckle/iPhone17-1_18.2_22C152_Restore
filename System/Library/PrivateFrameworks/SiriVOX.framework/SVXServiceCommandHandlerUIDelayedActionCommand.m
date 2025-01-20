@interface SVXServiceCommandHandlerUIDelayedActionCommand
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUIDelayedActionCommand)initWithDelayedActionStore:(id)a3 sessionManager:(id)a4 performer:(id)a5;
- (void)_performDelayedAction:(id)a3;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXServiceCommandHandlerUIDelayedActionCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);

  objc_storeStrong((id *)&self->_delayedActionStore, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_performDelayedAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 command];
  v6 = [v5 commands];
  v7 = [v4 taskTracker];

  sessionManager = self->_sessionManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__SVXServiceCommandHandlerUIDelayedActionCommand__performDelayedAction___block_invoke;
  v11[3] = &unk_2645530F0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SVXSessionManager *)sessionManager getCurrentSessionUsingBlock:v11];
}

void __72__SVXServiceCommandHandlerUIDelayedActionCommand__performDelayedAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "handleCommand:taskTracker:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), *(void *)(a1 + 40), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  long long v12 = (void (**)(id, void *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIDelayedActionCommand.m", 50, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIDelayedActionCommand class]]" object file lineNumber description];
  }
  id v13 = v10;
  uint64_t v14 = [v13 aceId];
  performer = self->_performer;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke;
  v28[3] = &unk_264554210;
  id v16 = v13;
  id v29 = v16;
  id v17 = v11;
  id v30 = v17;
  v31 = self;
  id v18 = v14;
  id v32 = v18;
  [(SVXPerforming *)performer performBlock:v28];
  v19 = [v16 timerValue];
  [v19 doubleValue];
  double v21 = v20;

  v22 = self->_performer;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke_2;
  v26[3] = &unk_2645548C8;
  v26[4] = self;
  id v23 = v18;
  id v27 = v23;
  [(SVXPerforming *)v22 performBlock:v26 afterDelay:v21 / 1000.0];
  if (v12)
  {
    v24 = +[SVXServiceCommandResult resultSuccess];
    v12[2](v12, v24);
  }
}

void __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke(void *a1)
{
  v2 = [[SVXServiceCommandDelayedAction alloc] initWithCommand:a1[4] taskTracker:a1[5]];
  [*(id *)(a1[6] + 8) setAction:v2 forKey:a1[7]];
}

uint64_t __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) actionForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 32) _performDelayedAction:v2];
    [*(id *)(*(void *)(a1 + 32) + 8) removeActionForKey:*(void *)(a1 + 40)];
  }

  return MEMORY[0x270F9A758]();
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (SVXServiceCommandHandlerUIDelayedActionCommand)initWithDelayedActionStore:(id)a3 sessionManager:(id)a4 performer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SVXServiceCommandHandlerUIDelayedActionCommand;
  long long v12 = [(SVXServiceCommandHandlerUIDelayedActionCommand *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delayedActionStore, a3);
    objc_storeStrong((id *)&v13->_sessionManager, a4);
    objc_storeStrong((id *)&v13->_performer, a5);
    id v14 = [NSString alloc];
    v15 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v16];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;
  }
  return v13;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end