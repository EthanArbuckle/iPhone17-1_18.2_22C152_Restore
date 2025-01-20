@interface SBAccessoryController
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
- (BOOL)isWindowedAccessoryWindowVisible;
- (SBWindow)window;
- (SBWindowedAccessoryViewController)windowedAccessoryViewController;
- (void)_showWindowedAccessoryWindow:(BOOL)a3 forWindowScene:(id)a4;
- (void)setWindowedAccessoryViewController:(id)a3;
- (void)windowedAccessoryViewControllerForceDetachButtonTapped:(id)a3;
@end

@implementation SBAccessoryController

+ (id)sharedInstance
{
  if (sharedInstance___once_8 != -1) {
    dispatch_once(&sharedInstance___once_8, &__block_literal_global_211);
  }
  v2 = (void *)__controllerInstance_3;
  return v2;
}

uint64_t __39__SBAccessoryController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBAccessoryController);
  v1 = (void *)__controllerInstance_3;
  __controllerInstance_3 = (uint64_t)v0;

  return kdebug_trace();
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_3;
}

- (void)_showWindowedAccessoryWindow:(BOOL)a3 forWindowScene:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  if (v4)
  {
    v6 = [[SBWindowedAccessoryWindow alloc] initWithWindowScene:v14 role:@"SBTraitsParticipantRoleWindowedAccessory" debugName:@"Windowed Accessory Window"];
    window = self->_window;
    self->_window = &v6->super.super;

    v8 = objc_alloc_init(SBWindowedAccessoryViewController);
    windowedAccessoryViewController = self->_windowedAccessoryViewController;
    self->_windowedAccessoryViewController = v8;

    [(SBWindowedAccessoryViewController *)self->_windowedAccessoryViewController setDelegate:self];
    [(SBWindow *)self->_window setRootViewController:self->_windowedAccessoryViewController];
    [(SBWindow *)self->_window setWindowLevel:*MEMORY[0x1E4F43CF8] + 50.0];
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleWindowedAccessory") & 1) == 0) {
      -[SBWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_window, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", [(id)SBApp activeInterfaceOrientation], 0, 0, 0.0);
    }
    [(SBWindow *)self->_window setHidden:0];
  }
  else
  {
    v10 = self->_windowedAccessoryViewController;
    self->_windowedAccessoryViewController = 0;

    [(SBWindow *)self->_window setHidden:1];
    v11 = self->_window;
    self->_window = 0;
  }
  v12 = +[SBKeyboardFocusCoordinator sharedInstance];
  v13 = +[SBKeyboardFocusArbitrationReason showWindowedAccessoryWindow];
  [v12 requestArbitrationForSBWindowScene:v14 forReason:v13];
}

- (void)windowedAccessoryViewControllerForceDetachButtonTapped:(id)a3
{
  id v3 = +[SBUIController sharedInstanceIfExists];
  [v3 windowedAccessoryDismissed];
}

- (BOOL)isWindowedAccessoryWindowVisible
{
  window = self->_window;
  if (window) {
    LOBYTE(window) = [(SBWindow *)window isHidden] ^ 1;
  }
  return (char)window;
}

- (SBWindow)window
{
  return self->_window;
}

- (SBWindowedAccessoryViewController)windowedAccessoryViewController
{
  return self->_windowedAccessoryViewController;
}

- (void)setWindowedAccessoryViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowedAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end