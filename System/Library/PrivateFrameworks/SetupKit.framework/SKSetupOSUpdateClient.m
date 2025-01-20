@interface SKSetupOSUpdateClient
- (SKSetupOSUpdateClient)init;
- (void)_activate;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupOSUpdateClient

- (void)_run
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      uint64_t runState = self->super._runState;
      switch((int)runState)
      {
        case 11:
          [(SKSetupBase *)self _connectionStartWithSKConnection:0 clientMode:1 completeOnFailure:1 completion:&__block_literal_global_2262];
          int v4 = self->super._runState;
          goto LABEL_10;
        case 12:
          int v5 = [(SKConnection *)self->super._skCnx state];
          int v4 = self->super._runState;
          if (v5 != 1) {
            goto LABEL_13;
          }
          goto LABEL_10;
        case 13:
          BOOL v6 = [(SKSetupBase *)self _runSteps];
          int v4 = self->super._runState;
          if (!v6) {
            goto LABEL_13;
          }
LABEL_10:
          ++v4;
          break;
        case 14:
          [(SKSetupBase *)self _completeWithError:0];
          int v4 = self->super._runState;
          goto LABEL_13;
        default:
          if (runState) {
            return;
          }
          int v4 = 11;
          break;
      }
      self->super._uint64_t runState = v4;
LABEL_13:
      if (v4 == runState) {
        break;
      }
      if (sCUOSLogCreateOnce_logger_2263 != -1) {
        dispatch_once(&sCUOSLogCreateOnce_logger_2263, &__block_literal_global_11);
      }
      v7 = sCUOSLogHandle_logger_2264;
      if (os_log_type_enabled((os_log_t)sCUOSLogHandle_logger_2264, OS_LOG_TYPE_DEFAULT))
      {
        if ((0x78FFu >> runState))
        {
          v8 = off_2645495E0[runState];
        }
        else if ((int)runState <= 9)
        {
          v8 = "?";
        }
        else
        {
          v8 = "User";
        }
        uint64_t v9 = self->super._runState;
        if v9 < 0xF && ((0x78FFu >> v9))
        {
          v10 = off_2645495E0[v9];
        }
        else if ((int)v9 <= 9)
        {
          v10 = "?";
        }
        else
        {
          v10 = "User";
        }
        *(_DWORD *)buf = 136315394;
        v12 = v8;
        __int16 v13 = 2080;
        v14 = v10;
        _os_log_impl(&dword_21FF61000, v7, OS_LOG_TYPE_DEFAULT, "State: %s -> %s", buf, 0x16u);
      }
    }
  }
}

- (void)_prepareSteps
{
  v3 = objc_alloc_init(SKStepWiFiSetupClientLegacy);
  [(SKStepWiFiSetupClientLegacy *)v3 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepWiFiSetupClientLegacy *)v3 setSkMessaging:self];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__SKSetupOSUpdateClient__prepareSteps__block_invoke;
  v4[3] = &unk_2645496B0;
  v4[4] = self;
  v4[5] = v3;
  [(SKStepWiFiSetupClientLegacy *)v3 setSkCompletionHandler:v4];
  [(SKSetupBase *)self _addStep:v3];
}

uint64_t __38__SKSetupOSUpdateClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

- (void)_activate
{
  [(SKSetupOSUpdateClient *)self _prepareSteps];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupOSUpdateClient;
  [(SKSetupBase *)&v3 _activate];
}

- (SKSetupOSUpdateClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupOSUpdateClient;
  v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupOSUpdateClient];
  objc_super v3 = v2;
  if (v2) {
    int v4 = v2;
  }

  return v3;
}

@end