@interface RPPairingUIController
- (OS_dispatch_queue)dispatchQueue;
- (RPPairingUIController)init;
- (UIViewController)presentingViewController;
- (id)invalidationHandler;
- (id)retryHandler;
- (id)tryPINHandler;
- (void)_cleanup;
- (void)activate;
- (void)invalidate;
- (void)promptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRetryHandler:(id)a3;
- (void)setTryPINHandler:(id)a3;
@end

@implementation RPPairingUIController

- (RPPairingUIController)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPPairingUIController;
  v2 = [(RPPairingUIController *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
  }
  return v3;
}

- (void)_cleanup
{
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  id tryPINHandler = self->_tryPINHandler;
  self->_id tryPINHandler = 0;
}

- (void)activate
{
  if (gLogCategory_RPPairingUIController <= 30
    && (gLogCategory_RPPairingUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__RPPairingUIController_invalidate__block_invoke;
  block[3] = &unk_26504A600;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPPairingUIController_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_RPPairingUIController <= 30
    && (gLogCategory_RPPairingUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[2]);
    v2 = *(void **)(a1 + 32);
  }
  return [v2 _cleanup];
}

- (void)promptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__RPPairingUIController_promptWithFlags_throttleSeconds___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  unsigned int v6 = a3;
  int v7 = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__RPPairingUIController_promptWithFlags_throttleSeconds___block_invoke()
{
  if (gLogCategory_RPPairingUIController <= 30)
  {
    if (gLogCategory_RPPairingUIController != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)retryHandler
{
  return self->_retryHandler;
}

- (void)setRetryHandler:(id)a3
{
}

- (id)tryPINHandler
{
  return self->_tryPINHandler;
}

- (void)setTryPINHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_tryPINHandler, 0);
  objc_storeStrong(&self->_retryHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end