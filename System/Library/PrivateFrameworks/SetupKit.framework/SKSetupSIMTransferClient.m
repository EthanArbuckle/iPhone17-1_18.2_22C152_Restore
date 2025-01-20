@interface SKSetupSIMTransferClient
- (SKSetupSIMTransferClient)init;
- (void)_run;
@end

@implementation SKSetupSIMTransferClient

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      if (runState <= 11) {
        break;
      }
      if (runState == 12)
      {
        int v5 = [(SKConnection *)self->super._skCnx state];
        int v4 = self->super._runState;
        if (v5 != 1) {
          goto LABEL_14;
        }
        ++v4;
        goto LABEL_13;
      }
      if (runState != 13) {
        return;
      }
      [(SKSetupBase *)self _completeWithError:0];
      int v4 = self->super._runState;
LABEL_14:
      if (v4 == runState) {
        return;
      }
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    if (runState)
    {
      if (runState != 11) {
        return;
      }
      [(SKSetupBase *)self _connectionStartWithSKConnection:0 clientMode:1 completeOnFailure:1 completion:&__block_literal_global_321];
      int v4 = self->super._runState + 1;
    }
    else
    {
      int v4 = 11;
    }
LABEL_13:
    self->super._int runState = v4;
    goto LABEL_14;
  }
}

- (SKSetupSIMTransferClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupSIMTransferClient;
  v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupSIMTransferClient];
  v3 = v2;
  if (v2)
  {
    v2->super._bluetoothUseCase = 258;
    int v4 = v2;
  }

  return v3;
}

@end