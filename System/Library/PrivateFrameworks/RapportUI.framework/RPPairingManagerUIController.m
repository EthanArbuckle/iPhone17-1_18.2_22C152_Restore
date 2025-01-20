@interface RPPairingManagerUIController
- (BOOL)allowManualIP;
- (BOOL)runInProcess;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPPairingManagerUIController)init;
- (UIViewController)presentingViewController;
- (id)invalidationHandler;
- (void)_cleanup;
- (void)activate;
- (void)invalidate;
- (void)setAllowManualIP:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRunInProcess:(BOOL)a3;
- (void)setServiceType:(id)a3;
@end

@implementation RPPairingManagerUIController

- (RPPairingManagerUIController)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPPairingManagerUIController;
  v2 = [(RPPairingManagerUIController *)&v5 init];
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
}

- (void)activate
{
}

void __40__RPPairingManagerUIController_activate__block_invoke()
{
  if (gLogCategory_RPPairingManagerUIController <= 30
    && (gLogCategory_RPPairingManagerUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__RPPairingManagerUIController_invalidate__block_invoke;
  block[3] = &unk_26504A600;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__RPPairingManagerUIController_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_RPPairingManagerUIController <= 30
    && (gLogCategory_RPPairingManagerUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[5];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[5]);
    v2 = *(void **)(a1 + 32);
  }
  return [v2 _cleanup];
}

- (BOOL)allowManualIP
{
  return self->_allowManualIP;
}

- (void)setAllowManualIP:(BOOL)a3
{
  self->_allowManualIP = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BOOL)runInProcess
{
  return self->_runInProcess;
}

- (void)setRunInProcess:(BOOL)a3
{
  self->_runInProcess = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end