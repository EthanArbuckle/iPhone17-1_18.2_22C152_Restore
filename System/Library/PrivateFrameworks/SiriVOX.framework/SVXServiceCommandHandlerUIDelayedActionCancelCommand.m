@interface SVXServiceCommandHandlerUIDelayedActionCancelCommand
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUIDelayedActionCancelCommand)initWithDelayedActionStore:(id)a3 performer:(id)a4;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXServiceCommandHandlerUIDelayedActionCancelCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_performer, 0);

  objc_storeStrong((id *)&self->_delayedActionStore, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIDelayedActionCancelCommand.m", 46, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIDelayedActionCancelCommand class]]" object file lineNumber description];
  }
  v11 = [v9 delayedActionAceId];
  performer = self->_performer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __105__SVXServiceCommandHandlerUIDelayedActionCancelCommand_handleCommand_withContext_taskTracker_completion___block_invoke;
  v16[3] = &unk_264554788;
  v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  [(SVXPerforming *)performer performBlock:v16];
}

void __105__SVXServiceCommandHandlerUIDelayedActionCancelCommand_handleCommand_withContext_taskTracker_completion___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) actionForKey:a1[5]];
  if (v5)
  {
    [*(id *)(a1[4] + 8) removeActionForKey:a1[5]];
    uint64_t v2 = a1[6];
    if (!v2) {
      goto LABEL_7;
    }
    uint64_t v3 = +[SVXServiceCommandResult resultSuccess];
  }
  else
  {
    uint64_t v2 = a1[6];
    if (!v2) {
      goto LABEL_7;
    }
    uint64_t v3 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:@"Unable to find the delayed action cached locally to cancel."];
  }
  v4 = (void *)v3;
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);

LABEL_7:
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (SVXServiceCommandHandlerUIDelayedActionCancelCommand)initWithDelayedActionStore:(id)a3 performer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SVXServiceCommandHandlerUIDelayedActionCancelCommand;
  id v9 = [(SVXServiceCommandHandlerUIDelayedActionCancelCommand *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delayedActionStore, a3);
    objc_storeStrong((id *)&v10->_performer, a4);
    id v11 = [NSString alloc];
    v12 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v13];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;
  }
  return v10;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end