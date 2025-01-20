@interface SBDashBoardEmergencyDialerController
- (BOOL)isMakingEmergencyCall;
- (SBDashBoardEmergencyDialerController)initWithCoverSheetViewController:(id)a3;
- (void)dealloc;
- (void)emergencyDialerExitedWithError:(id)a3;
- (void)exitEmergencyDialerAnimated:(BOOL)a3;
- (void)launchEmergencyDialer;
- (void)launchEmergencyDialerAnimated:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBDashBoardEmergencyDialerController

- (SBDashBoardEmergencyDialerController)initWithCoverSheetViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDashBoardEmergencyDialerController;
  v6 = [(SBDashBoardEmergencyDialerController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    v8 = [MEMORY[0x1E4F5E408] rootSettings];
    [v8 addKeyObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F5E408] rootSettings];
  [v3 removeKeyObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardEmergencyDialerController;
  [(SBDashBoardEmergencyDialerController *)&v4 dealloc];
}

- (BOOL)isMakingEmergencyCall
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyDialerViewController);
  char v3 = objc_msgSend(WeakRetained, "bs_isAppearingOrAppeared");

  return v3;
}

- (void)launchEmergencyDialer
{
}

- (void)launchEmergencyDialerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  p_emergencyDialerViewController = &self->_emergencyDialerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyDialerViewController);

  if (!WeakRetained)
  {
    v7 = objc_alloc_init(SBDashBoardEmergencyDialerViewController);
    objc_storeWeak((id *)p_emergencyDialerViewController, v7);
    coverSheetViewController = self->_coverSheetViewController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__SBDashBoardEmergencyDialerController_launchEmergencyDialerAnimated___block_invoke;
    v9[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v10 = v3;
    [(CSCoverSheetViewController *)coverSheetViewController _presentModalViewController:v7 animated:v3 completion:v9];
  }
}

void __70__SBDashBoardEmergencyDialerController_launchEmergencyDialerAnimated___block_invoke(uint64_t a1)
{
  id v2 = +[SBCoverSheetPresentationManager sharedInstance];
  if ([v2 isCoverSheetHostingAnApp]) {
    [v2 setCoverSheetPresented:1 animated:*(unsigned __int8 *)(a1 + 32) withCompletion:0];
  }
}

- (void)emergencyDialerExitedWithError:(id)a3
{
}

- (void)exitEmergencyDialerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  coverSheetViewController = self->_coverSheetViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyDialerViewController);
  [(CSCoverSheetViewController *)coverSheetViewController _dismissModalViewController:WeakRetained animated:v3 completion:0];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F5E408];
  id v6 = a4;
  id v7 = [v5 rootSettings];
  LODWORD(v5) = [v6 isEqualToString:@"showEmergencyDialer"];

  if (v5)
  {
    if ([v7 showEmergencyDialer]) {
      [(SBDashBoardEmergencyDialerController *)self launchEmergencyDialer];
    }
    else {
      [(SBDashBoardEmergencyDialerController *)self exitEmergencyDialerAnimated:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_emergencyDialerViewController);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end