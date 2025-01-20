@interface SKSetupFieldDiagnosticsClient
- (SKSetupFieldDiagnosticsClient)init;
- (void)_activate;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupFieldDiagnosticsClient

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      switch(runState)
      {
        case 11:
          [(SKSetupBase *)self _connectionStartWithSKConnection:0 clientMode:1 completeOnFailure:1 completion:&__block_literal_global];
          int v4 = self->super._runState + 1;
          break;
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
      self->super._int runState = v4;
LABEL_13:
      if (v4 == runState) {
        break;
      }
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)_prepareSteps
{
  v3 = objc_alloc_init(SKStepBasicConfigClient);
  [(SKStepBasicConfigClient *)v3 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepBasicConfigClient *)v3 setSkMessaging:self];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke;
  v6[3] = &unk_2645496B0;
  v6[4] = self;
  v6[5] = v3;
  [(SKStepBasicConfigClient *)v3 setSkCompletionHandler:v6];
  [(SKSetupBase *)self _addStep:v3];

  int v4 = objc_alloc_init(SKStepWiFiSetupClientLegacy);
  [(SKStepWiFiSetupClientLegacy *)v4 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepWiFiSetupClientLegacy *)v4 setSkMessaging:self];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke_2;
  v5[3] = &unk_2645496B0;
  v5[4] = self;
  v5[5] = v4;
  [(SKStepWiFiSetupClientLegacy *)v4 setSkCompletionHandler:v5];
  [(SKSetupBase *)self _addStep:v4];
}

uint64_t __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

uint64_t __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

- (void)_activate
{
  [(SKSetupFieldDiagnosticsClient *)self _prepareSteps];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupFieldDiagnosticsClient;
  [(SKSetupBase *)&v3 _activate];
}

- (SKSetupFieldDiagnosticsClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupFieldDiagnosticsClient;
  v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupFieldDiagnosticsClient];
  objc_super v3 = v2;
  if (v2) {
    int v4 = v2;
  }

  return v3;
}

@end