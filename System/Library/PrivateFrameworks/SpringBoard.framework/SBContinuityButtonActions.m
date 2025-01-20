@interface SBContinuityButtonActions
- (BOOL)_processHomeButtonInApp;
- (BOOL)_processHomeButtonInBannerManager;
- (BOOL)_processHomeButtonInCommandTabUI;
- (BOOL)_processHomeButtonInLibraryViewController;
- (BOOL)_processHomeButtonInSwitcherController;
- (BOOL)_processHomeButtonInSystemApertureController;
- (SBContinuityButtonActions)initWithWindowScene:(id)a3 debugName:(id)a4;
- (SBWindowScene)windowScene;
- (id)_menuButtonEventName;
- (void)_requeueHomeButtonRequest;
- (void)invalidate;
- (void)performHomeButtonAction;
- (void)performSpotlightButtonAction;
- (void)performSwitcherButtonAction;
@end

@implementation SBContinuityButtonActions

- (SBContinuityButtonActions)initWithWindowScene:(id)a3 debugName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuityButtonActions;
  v8 = [(SBContinuityButtonActions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_debugName, a4);
  }

  return v9;
}

- (void)invalidate
{
  id v4 = [MEMORY[0x1E4F624E0] sharedInstance];
  v3 = [(SBContinuityButtonActions *)self _menuButtonEventName];
  [v4 cancelEventsWithName:v3];
}

- (void)performHomeButtonAction
{
  if (![(SBContinuityButtonActions *)self _processHomeButtonInSystemApertureController]&& ![(SBContinuityButtonActions *)self _processHomeButtonInBannerManager]&& ![(SBContinuityButtonActions *)self _processHomeButtonInCommandTabUI]&& ![(SBContinuityButtonActions *)self _processHomeButtonInLibraryViewController]&& ![(SBContinuityButtonActions *)self _processHomeButtonInSwitcherController]&& ![(SBContinuityButtonActions *)self _processHomeButtonInApp])
  {
    [(SBContinuityButtonActions *)self _requeueHomeButtonRequest];
  }
}

- (void)performSwitcherButtonAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v2 = [WeakRetained switcherController];
  [v2 toggleMainSwitcherWithSource:20 animated:1];
}

- (void)performSpotlightButtonAction
{
  v2 = (void *)SBApp;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v2 toggleSearchOnWindowScene:WeakRetained fromBreadcrumbSource:0 withWillBeginHandler:0 completionHandler:0];
}

- (id)_menuButtonEventName
{
  return (id)[NSString stringWithFormat:@"%@-%@", @"HandleMenuButton", self->_debugName];
}

- (BOOL)_processHomeButtonInSystemApertureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = [WeakRetained systemApertureController];

  int v4 = [v3 handleHomeButtonPress];
  if (v4)
  {
    v5 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "System aperture controller handled the home button event", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)_processHomeButtonInBannerManager
{
  v3 = [(SBContinuityButtonActions *)self windowScene];
  int v4 = +[SBWorkspace mainWorkspace];
  v5 = [v4 transientOverlayPresentationManager];
  id v6 = [v5 transientOverlayPresenterForWindowScene:v3];

  id v7 = [(id)SBApp bannerManager];
  v8 = [v7 bannerWindowInWindowScene:v3];
  [v8 windowLevel];
  if (objc_msgSend(v6, "hasPresentationAboveWindowLevel:"))
  {

LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v10 = [v7 handleHomeButtonPressInWindowScene:WeakRetained];

  if (!v10) {
    goto LABEL_7;
  }
  objc_super v11 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Banner manager handled the home button event", v14, 2u);
  }

  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)_processHomeButtonInCommandTabUI
{
  v2 = +[SBCommandTabController sharedInstance];
  int v3 = [v2 isVisible];

  if (v3)
  {
    int v4 = +[SBCommandTabController sharedInstance];
    [v4 dismiss];

    v5 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing command-tab UI", v7, 2u);
    }
  }
  return v3;
}

- (BOOL)_processHomeButtonInLibraryViewController
{
  v2 = [(SBContinuityButtonActions *)self windowScene];
  int v3 = [v2 modalLibraryController];
  int v4 = [v2 layoutStateProvider];
  v5 = [v4 layoutState];
  uint64_t v6 = [v5 unlockedEnvironmentMode];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2 && [v3 isPresentingLibraryInForeground])
  {
    id v7 = [v3 libraryViewController];
    [v7 popPresentationState];

    v8 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Library view controller handled the home button event", v11, 2u);
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_processHomeButtonInSwitcherController
{
  v2 = [(SBContinuityButtonActions *)self windowScene];
  int v3 = [v2 switcherController];
  int v4 = [v3 handleHomeButtonPress];
  if (v4)
  {
    v5 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBMainSwitcherCoordinator handled the home button event", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)_processHomeButtonInApp
{
  v2 = [(SBContinuityButtonActions *)self windowScene];
  int v3 = +[SBUIController sharedInstance];
  int v4 = [v3 handleHomeButtonSinglePressUpForWindowScene:v2 withSourceType:0];

  if (v4)
  {
    v5 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "UIController handled the home button event", v7, 2u);
    }
  }
  return v4;
}

- (void)_requeueHomeButtonRequest
{
  int v3 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SBUIController is busy - queued the home button event for later processing", (uint8_t *)buf, 2u);
  }

  int v4 = [(SBContinuityButtonActions *)self _menuButtonEventName];
  objc_initWeak(buf, self);
  v5 = (void *)MEMORY[0x1E4F624D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SBContinuityButtonActions__requeueHomeButtonRequest__block_invoke;
  v8[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v9, buf);
  uint64_t v6 = [v5 eventWithName:v4 handler:v8];
  id v7 = [MEMORY[0x1E4F624E0] sharedInstance];
  [v7 cancelEventsWithName:v4];
  [v7 executeOrAppendEvent:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __54__SBContinuityButtonActions__requeueHomeButtonRequest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performHomeButtonAction];
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_debugName, 0);
}

@end