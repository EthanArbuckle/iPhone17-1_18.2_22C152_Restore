@interface SBAssistantContext
+ (id)contextForWindowScene:(id)a3;
- (CSCoverSheetViewController)coverSheetViewController;
- (FBSDisplayLayoutPublishing)displayLayoutPublisher;
- (SBAlertItemsController)alertItemsController;
- (SBAssistantOrientationAccomodating)orientationAccomodation;
- (SBControlCenterController)controlCenterController;
- (SBCoverSheetPresentationManager)coverSheetPresentationManager;
- (SBFZStackResolver)zStackResolver;
- (SBFloatingDockController)floatingDockController;
- (SBIconController)iconController;
- (SBLockScreenEnvironment)lockScreenEnvironment;
- (SBLockScreenManager)lockScreenManager;
- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator;
- (SBSwitcherController)switcherController;
- (SBSystemApertureController)systemApertureController;
- (SBSystemGestureManager)systemGestureManager;
- (SBTransientOverlayPresenting)transientOverlayPresenter;
- (SBWallpaperController)wallpaperController;
- (SBWindowHidingManager)windowHidingManager;
- (TRAArbiter)traitsArbiter;
- (void)setAlertItemsController:(id)a3;
- (void)setControlCenterController:(id)a3;
- (void)setCoverSheetPresentationManager:(id)a3;
- (void)setCoverSheetViewController:(id)a3;
- (void)setDisplayLayoutPublisher:(id)a3;
- (void)setFloatingDockController:(id)a3;
- (void)setIconController:(id)a3;
- (void)setLockScreenEnvironment:(id)a3;
- (void)setLockScreenManager:(id)a3;
- (void)setModalAlertPresentationCoordinator:(id)a3;
- (void)setOrientationAccomodation:(id)a3;
- (void)setSwitcherController:(id)a3;
- (void)setSystemApertureController:(id)a3;
- (void)setSystemGestureManager:(id)a3;
- (void)setTraitsArbiter:(id)a3;
- (void)setTransientOverlayPresenter:(id)a3;
- (void)setWallpaperController:(id)a3;
- (void)setWindowHidingManager:(id)a3;
- (void)setZStackResolver:(id)a3;
@end

@implementation SBAssistantContext

+ (id)contextForWindowScene:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SBAssistantContext);
  v5 = [v3 traitsArbiter];
  [(SBAssistantContext *)v4 setTraitsArbiter:v5];

  v6 = [v3 coverSheetViewController];
  [(SBAssistantContext *)v4 setCoverSheetViewController:v6];

  v7 = [v3 displayLayoutPublisher];
  [(SBAssistantContext *)v4 setDisplayLayoutPublisher:v7];

  v8 = [v3 lockScreenManager];
  v9 = [v8 lockScreenEnvironment];
  [(SBAssistantContext *)v4 setLockScreenEnvironment:v9];

  v10 = [v3 alertItemsController];
  [(SBAssistantContext *)v4 setAlertItemsController:v10];

  v11 = [v3 coverSheetPresentationManager];
  [(SBAssistantContext *)v4 setCoverSheetPresentationManager:v11];

  v12 = [v3 floatingDockController];
  [(SBAssistantContext *)v4 setFloatingDockController:v12];

  v13 = [v3 zStackResolver];
  [(SBAssistantContext *)v4 setZStackResolver:v13];

  v14 = [v3 systemApertureController];
  [(SBAssistantContext *)v4 setSystemApertureController:v14];

  v15 = +[SBIconController sharedInstance];
  [(SBAssistantContext *)v4 setIconController:v15];

  v16 = [v3 lockScreenManager];
  [(SBAssistantContext *)v4 setLockScreenManager:v16];

  v17 = [v3 switcherController];
  [(SBAssistantContext *)v4 setSwitcherController:v17];

  v18 = [v3 modalAlertPresentationCoordinator];
  [(SBAssistantContext *)v4 setModalAlertPresentationCoordinator:v18];

  v19 = [v3 systemGestureManager];
  [(SBAssistantContext *)v4 setSystemGestureManager:v19];

  v20 = [v3 transientOverlayPresenter];
  [(SBAssistantContext *)v4 setTransientOverlayPresenter:v20];

  v21 = [v3 wallpaperController];
  [(SBAssistantContext *)v4 setWallpaperController:v21];

  v22 = [v3 windowHidingManager];
  [(SBAssistantContext *)v4 setWindowHidingManager:v22];

  v23 = [v3 controlCenterController];

  [(SBAssistantContext *)v4 setControlCenterController:v23];
  [(SBAssistantContext *)v4 setOrientationAccomodation:SBApp];
  return v4;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return self->_coverSheetViewController;
}

- (void)setCoverSheetViewController:(id)a3
{
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (void)setDisplayLayoutPublisher:(id)a3
{
}

- (SBLockScreenEnvironment)lockScreenEnvironment
{
  return self->_lockScreenEnvironment;
}

- (void)setLockScreenEnvironment:(id)a3
{
}

- (SBAlertItemsController)alertItemsController
{
  return self->_alertItemsController;
}

- (void)setAlertItemsController:(id)a3
{
}

- (SBControlCenterController)controlCenterController
{
  return self->_controlCenterController;
}

- (void)setControlCenterController:(id)a3
{
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return self->_coverSheetPresentationManager;
}

- (void)setCoverSheetPresentationManager:(id)a3
{
}

- (SBFloatingDockController)floatingDockController
{
  return self->_floatingDockController;
}

- (void)setFloatingDockController:(id)a3
{
}

- (SBSystemApertureController)systemApertureController
{
  return self->_systemApertureController;
}

- (void)setSystemApertureController:(id)a3
{
}

- (TRAArbiter)traitsArbiter
{
  return self->_traitsArbiter;
}

- (void)setTraitsArbiter:(id)a3
{
}

- (SBFZStackResolver)zStackResolver
{
  return self->_zStackResolver;
}

- (void)setZStackResolver:(id)a3
{
}

- (SBIconController)iconController
{
  return self->_iconController;
}

- (void)setIconController:(id)a3
{
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
}

- (SBSwitcherController)switcherController
{
  return self->_switcherController;
}

- (void)setSwitcherController:(id)a3
{
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  return self->_modalAlertPresentationCoordinator;
}

- (void)setModalAlertPresentationCoordinator:(id)a3
{
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (void)setSystemGestureManager:(id)a3
{
}

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  return self->_transientOverlayPresenter;
}

- (void)setTransientOverlayPresenter:(id)a3
{
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (void)setWallpaperController:(id)a3
{
}

- (SBWindowHidingManager)windowHidingManager
{
  return self->_windowHidingManager;
}

- (void)setWindowHidingManager:(id)a3
{
}

- (SBAssistantOrientationAccomodating)orientationAccomodation
{
  return self->_orientationAccomodation;
}

- (void)setOrientationAccomodation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationAccomodation, 0);
  objc_storeStrong((id *)&self->_windowHidingManager, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_transientOverlayPresenter, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_modalAlertPresentationCoordinator, 0);
  objc_storeStrong((id *)&self->_switcherController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_traitsArbiter, 0);
  objc_storeStrong((id *)&self->_systemApertureController, 0);
  objc_storeStrong((id *)&self->_floatingDockController, 0);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_controlCenterController, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end