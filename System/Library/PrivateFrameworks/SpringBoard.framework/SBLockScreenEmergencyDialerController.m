@interface SBLockScreenEmergencyDialerController
- (BOOL)isActive;
- (SBLockScreenEmergencyDialerDelegate)delegate;
- (UIViewController)viewController;
- (void)activateWithCompletion:(id)a3;
- (void)deactivate;
- (void)dismissEmergencyCallViewController:(id)a3;
- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBLockScreenEmergencyDialerController

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBLockScreenEmergencyDialerController_activateWithCompletion___block_invoke;
  v6[3] = &unk_1E6B0DDA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[SBUIEmergencyCallHostViewController requestEmergencyCallControllerWithCompletion:v6];
}

void __64__SBLockScreenEmergencyDialerController_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 16))
  {
    id v8 = v4;
    if (v4)
    {
      *(unsigned char *)(v6 + 16) = 1;
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
      id v5 = v8;
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, *(void *)(*(void *)(a1 + 32) + 8) != 0);
      id v5 = v8;
    }
  }
}

- (void)deactivate
{
  if (self->_active)
  {
    self->_active = 0;
    [(SBLockScreenEmergencyCallViewController *)self->_viewController setDelegate:0];
    viewController = self->_viewController;
    self->_viewController = 0;
  }
}

- (void)dismissEmergencyCallViewController:(id)a3
{
  if (self->_active)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained emergencyDialer:self willDeactivateWithError:0];
  }
}

- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4
{
  if (self->_active)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained emergencyDialer:self willDeactivateWithError:v6];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIViewController)viewController
{
  return &self->_viewController->super.super.super;
}

- (SBLockScreenEmergencyDialerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenEmergencyDialerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end