@interface SBDashBoardSetupController
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBDashBoardSetupController)init;
- (SBDashBoardSetupController)initWithCoverSheetViewController:(id)a3 setupManager:(id)a4;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_addOrRemoveSetupViewIfNecessaryAnimated:(BOOL)a3;
- (void)_clearSetupViewIfNecessaryAnimated:(BOOL)a3;
- (void)_configureForCurrentSetupMode;
- (void)dealloc;
@end

@implementation SBDashBoardSetupController

- (SBDashBoardSetupController)init
{
  return 0;
}

- (SBDashBoardSetupController)initWithCoverSheetViewController:(id)a3 setupManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardSetupController;
  v9 = [(SBDashBoardSetupController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverSheetViewController, a3);
    objc_storeStrong((id *)&v10->_setupManager, a4);
    [(CSCoverSheetViewController *)v10->_coverSheetViewController registerExternalBehaviorProvider:v10];
    [(CSCoverSheetViewController *)v10->_coverSheetViewController registerExternalEventHandler:v10];
    [(SBDashBoardSetupController *)v10 _configureForCurrentSetupMode];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel__setupModeChanged_ name:@"SBInBuddyModeDidChangeNotification" object:0];
  }
  return v10;
}

- (void)dealloc
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalBehaviorProvider:self];
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBInBuddyModeDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupController;
  [(SBDashBoardSetupController *)&v4 dealloc];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(SBSetupManager *)self->_setupManager isInSetupMode]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unint64_t)restrictedCapabilities
{
  v2 = +[SBApplicationController sharedInstance];
  v3 = [v2 setupApplication];

  if (v3) {
    return 12199108;
  }
  else {
    return 12203260;
  }
}

- (int64_t)notificationBehavior
{
  if (SUSUIRequiresAlertPresentationAfterUpdate()) {
    return 0;
  }
  else {
    return 3;
  }
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  switch([v4 type])
  {
    case 3:
    case 8:
      [(SBDashBoardSetupController *)self _configureForCurrentSetupMode];
      goto LABEL_4;
    case 6:
    case 9:
      [(SBDashBoardSetupController *)self _clearSetupViewIfNecessaryAnimated:0];
LABEL_4:
      char v5 = [v4 isConsumable];
      break;
    default:
      break;
  }

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void)_configureForCurrentSetupMode
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController externalBehaviorProviderBehaviorChanged:self];
  [(SBDashBoardSetupController *)self _addOrRemoveSetupViewIfNecessaryAnimated:0];
}

- (void)_addOrRemoveSetupViewIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBDashBoardSetupController *)self participantState] == 2
    && (SUSUIRequiresAlertPresentationAfterUpdate() & 1) == 0)
  {
    if (!self->_setupViewController)
    {
      char v5 = [[SBDashBoardSetupViewController alloc] initWithCoverSheetViewController:self->_coverSheetViewController];
      setupViewController = self->_setupViewController;
      self->_setupViewController = v5;
    }
    id v7 = [(CSCoverSheetViewController *)self->_coverSheetViewController mainPagePresentationViewController];
    [v7 presentContentViewController:self->_setupViewController animated:v3 completion:0];
  }
  else
  {
    [(SBDashBoardSetupController *)self _clearSetupViewIfNecessaryAnimated:v3];
  }
}

- (void)_clearSetupViewIfNecessaryAnimated:(BOOL)a3
{
  if (self->_setupViewController)
  {
    BOOL v3 = a3;
    char v5 = [(CSCoverSheetViewController *)self->_coverSheetViewController mainPagePresentationViewController];
    setupViewController = self->_setupViewController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__SBDashBoardSetupController__clearSetupViewIfNecessaryAnimated___block_invoke;
    v7[3] = &unk_1E6AF4AC0;
    v7[4] = self;
    [v5 dismissContentViewController:setupViewController animated:v3 completion:v7];
  }
}

void __65__SBDashBoardSetupController__clearSetupViewIfNecessaryAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupViewController, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end