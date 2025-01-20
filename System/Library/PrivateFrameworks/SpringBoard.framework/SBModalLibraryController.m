@interface SBModalLibraryController
- (BOOL)isInvalidated;
- (BOOL)isPresentingLibrary;
- (BOOL)isPresentingLibraryInForeground;
- (BOOL)isPresentingOrTransitioningSearch;
- (BOOL)modalLibraryPresenterShouldAllowSwipeToDismissGesture:(id)a3;
- (BSInvalidatable)libraryDisplayLayoutElementAssertion;
- (BSInvalidatable)libraryWindowKeyboardFocusAssertion;
- (SBFloatingDockBehaviorAssertion)floatingDockBehaviorAssertion;
- (SBFloatingDockController)floatingDockController;
- (SBHIconManager)iconManager;
- (SBHModalLibraryPresenter)libraryPresenter;
- (SBLibraryViewController)libraryViewController;
- (SBMedusaHostedKeyboardWindowLevelAssertion)keyboardWindowLevelAssertion;
- (SBModalLibraryController)initWithIconManager:(id)a3 libraryViewController:(id)a4 floatingDockController:(id)a5 windowScene:(id)a6;
- (SBWindowScene)windowScene;
- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion;
- (id)_currentLayoutState;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (void)_configureFloatingDockBehaviorAssertionForPresented:(BOOL)a3;
- (void)_didCompleteTransitionWithLibraryToPresented:(BOOL)a3;
- (void)_evaluateKeyboardWindowLevelAssertion;
- (void)_evaluateResignActiveAssertion;
- (void)_evaluateWindowStatus;
- (void)_prepareLibraryViewControllerForDismissal:(id)a3;
- (void)_setLibraryDisplayLayoutElementActive:(BOOL)a3;
- (void)_willPerformTransitionWithLibraryToPresented:(BOOL)a3;
- (void)dealloc;
- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4;
- (void)modalLibraryPresenter:(id)a3 didDismissLibrary:(id)a4;
- (void)modalLibraryPresenter:(id)a3 didPassCriticalDismissalPoint:(id)a4;
- (void)modalLibraryPresenter:(id)a3 didPresentLibrary:(id)a4;
- (void)modalLibraryPresenter:(id)a3 willDismissLibrary:(id)a4;
- (void)modalLibraryPresenter:(id)a3 willPresentLibrary:(id)a4;
- (void)presentLibraryAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentLibraryCategoryPodForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setFloatingDockBehaviorAssertion:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setKeyboardWindowLevelAssertion:(id)a3;
- (void)setLibraryDisplayLayoutElementAssertion:(id)a3;
- (void)setLibraryWindowKeyboardFocusAssertion:(id)a3;
- (void)setPresentingOrTransitioningSearch:(BOOL)a3;
- (void)toggleLibraryPresentedAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation SBModalLibraryController

- (SBModalLibraryController)initWithIconManager:(id)a3 libraryViewController:(id)a4 floatingDockController:(id)a5 windowScene:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SBModalLibraryController;
  v15 = [(SBModalLibraryController *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_iconManager, a3);
    objc_storeStrong((id *)&v16->_libraryViewController, a4);
    [v12 addObserver:v16];
    objc_storeWeak((id *)&v16->_floatingDockController, v13);
    objc_storeWeak((id *)&v16->_windowScene, v14);
    v17 = [v14 layoutStateTransitionCoordinator];
    [v17 addObserver:v16];

    v18 = [v13 floatingDockViewController];
    uint64_t v19 = [v18 configureForPresentingLibraryViewController:v12];
    libraryPresenter = v16->_libraryPresenter;
    v16->_libraryPresenter = (SBHModalLibraryPresenter *)v19;

    [(SBHModalLibraryPresenter *)v16->_libraryPresenter setPresentationDelegate:v16];
    [(SBHModalLibraryPresenter *)v16->_libraryPresenter addObserver:v16];
    v21 = +[SBSceneManagerCoordinator sharedInstance];
    v22 = [v21 sceneDeactivationManager];
    uint64_t v23 = [v22 newAssertionWithReason:18];
    resignActiveAssertion = v16->_resignActiveAssertion;
    v16->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v23;
  }
  return v16;
}

- (void)dealloc
{
  if (![(SBModalLibraryController *)self isInvalidated])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBModalLibraryController;
  [(SBModalLibraryController *)&v5 dealloc];
}

- (void)invalidate
{
  if (![(SBModalLibraryController *)self isInvalidated])
  {
    [(SBModalLibraryController *)self setInvalidated:1];
    v3 = [(SBModalLibraryController *)self libraryViewController];
    [v3 invalidate];

    v4 = [(SBModalLibraryController *)self libraryViewController];
    [v4 removeObserver:self];

    objc_super v5 = [(SBModalLibraryController *)self windowScene];
    v6 = [v5 layoutStateTransitionCoordinator];
    [v6 removeObserver:self];

    v7 = [(SBModalLibraryController *)self libraryDisplayLayoutElementAssertion];
    [v7 invalidate];

    v8 = [(SBModalLibraryController *)self floatingDockBehaviorAssertion];
    [v8 invalidate];

    v9 = [(SBModalLibraryController *)self resignActiveAssertion];
    [v9 relinquish];

    id v10 = [(SBModalLibraryController *)self libraryWindowKeyboardFocusAssertion];
    [v10 invalidate];
  }
}

- (BOOL)isPresentingLibraryInForeground
{
  v2 = [(SBModalLibraryController *)self libraryPresenter];
  char v3 = [v2 isPresentingLibrary];
  char v4 = v3 & [v2 isLibraryContainedInForeground];

  return v4;
}

- (BOOL)isPresentingLibrary
{
  v2 = [(SBModalLibraryController *)self libraryPresenter];
  char v3 = [v2 isPresentingLibrary];

  return v3;
}

- (void)presentLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBModalLibraryController *)self libraryPresenter];
  [v7 presentLibraryWithAnimation:v4 completion:v6];
}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBModalLibraryController *)self libraryPresenter];
  [v7 dismissLibraryWithAnimation:v4 completion:v6];
}

- (void)toggleLibraryPresentedAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBModalLibraryController *)self libraryPresenter];
  [v7 toggleLibraryPresentedInForegroundWithAnimation:v4 completion:v6];
}

- (void)presentLibraryCategoryPodForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SBModalLibraryController_presentLibraryCategoryPodForCategoryIdentifier_animated_completion___block_invoke;
  v12[3] = &unk_1E6AF6980;
  id v13 = v8;
  id v14 = self;
  BOOL v16 = v6;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SBModalLibraryController *)self presentLibraryAnimated:v6 completion:v12];
}

void __95__SBModalLibraryController_presentLibraryCategoryPodForCategoryIdentifier_animated_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 32))
    {
      id v5 = [*(id *)(a1 + 40) libraryViewController];
      [v5 presentPodWithCategoryIdentifier:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v3 = *(void *)(a1 + 48);
      if (v3)
      {
        BOOL v4 = *(void (**)(void))(v3 + 16);
        v4();
      }
    }
  }
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior defaultBehavior];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  [(SBModalLibraryController *)self _evaluateKeyboardWindowLevelAssertion];
  [(SBModalLibraryController *)self _evaluateResignActiveAssertion];
  [(SBModalLibraryController *)self _evaluateWindowStatus];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  objc_msgSend(a4, "toLayoutState", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 unlockedEnvironmentMode] == 1
    && [(SBModalLibraryController *)self isPresentingLibrary])
  {
    id v5 = [(SBModalLibraryController *)self libraryPresenter];
    [v5 setOverrideContainerViewController:0];
  }
  [(SBModalLibraryController *)self _evaluateWindowStatus];
}

- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4
{
  -[SBModalLibraryController setPresentingOrTransitioningSearch:](self, "setPresentingOrTransitioningSearch:", 1, a4);
  [(SBModalLibraryController *)self _evaluateKeyboardWindowLevelAssertion];
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  -[SBModalLibraryController setPresentingOrTransitioningSearch:](self, "setPresentingOrTransitioningSearch:", 0, a4);
  [(SBModalLibraryController *)self _evaluateKeyboardWindowLevelAssertion];
}

- (BOOL)modalLibraryPresenterShouldAllowSwipeToDismissGesture:(id)a3
{
  BOOL v4 = [(SBModalLibraryController *)self iconManager];
  id v5 = [(SBModalLibraryController *)self libraryViewController];
  char v6 = [v4 _shouldLibraryOverlayAllowSwipeToDismissGesture:v5];

  return v6;
}

- (void)modalLibraryPresenter:(id)a3 willPresentLibrary:(id)a4
{
  id v5 = a4;
  id v7 = [(SBModalLibraryController *)self iconManager];
  char v6 = [v5 _sbWindowScene];

  LODWORD(v5) = [v6 isMainDisplayWindowScene];
  if (v5) {
    [v7 setMainDisplayLibraryViewVisible:1 libraryViewTransitioning:1];
  }
  [(SBModalLibraryController *)self _willPerformTransitionWithLibraryToPresented:1];
}

- (void)modalLibraryPresenter:(id)a3 didPresentLibrary:(id)a4
{
  id v5 = a4;
  [(SBModalLibraryController *)self _didCompleteTransitionWithLibraryToPresented:1];
  char v6 = [v5 _sbWindowScene];

  LODWORD(v5) = [v6 isMainDisplayWindowScene];
  if (v5)
  {
    id v9 = [(SBModalLibraryController *)self iconManager];
    [v9 setMainDisplayLibraryViewVisibilityTransitioning:0];
    id v7 = [v9 rootFolderController];
    id v8 = [MEMORY[0x1E4F42A28] focusSystemForEnvironment:v7];
    [v8 _focusEnvironmentWillDisappear:v7];
  }
}

- (void)modalLibraryPresenter:(id)a3 willDismissLibrary:(id)a4
{
  id v8 = a4;
  id v5 = [v8 _sbWindowScene];
  int v6 = [v5 isMainDisplayWindowScene];

  if (v6)
  {
    id v7 = [(SBModalLibraryController *)self iconManager];
    [v7 setMainDisplayLibraryViewVisibilityTransitioning:1];
  }
  [(SBModalLibraryController *)self _prepareLibraryViewControllerForDismissal:v8];
  [(SBModalLibraryController *)self _willPerformTransitionWithLibraryToPresented:0];
}

- (void)modalLibraryPresenter:(id)a3 didPassCriticalDismissalPoint:(id)a4
{
  id v5 = a4;
  id v6 = [(SBModalLibraryController *)self iconManager];
  [v6 _scrollToLastIconPageIfNecessaryForLibraryOverlayDismissal:v5];
}

- (void)modalLibraryPresenter:(id)a3 didDismissLibrary:(id)a4
{
  id v5 = objc_msgSend(a4, "_sbWindowScene", a3);
  int v6 = [v5 isMainDisplayWindowScene];

  if (v6)
  {
    id v7 = [(SBModalLibraryController *)self iconManager];
    [v7 setMainDisplayLibraryViewVisible:0 libraryViewTransitioning:0];
  }
  [(SBModalLibraryController *)self _didCompleteTransitionWithLibraryToPresented:0];
}

- (void)_willPerformTransitionWithLibraryToPresented:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBModalLibraryController *)self floatingDockController];
  int v6 = [v5 floatingDockViewController];
  [v6 setLibraryPodIconVisible:v3 ^ 1];

  [(SBModalLibraryController *)self _configureFloatingDockBehaviorAssertionForPresented:v3];
  if (v3)
  {
    [(SBModalLibraryController *)self _evaluateResignActiveAssertion];
    [(SBModalLibraryController *)self _evaluateKeyboardWindowLevelAssertion];
    id v7 = [(SBModalLibraryController *)self libraryViewController];
    [v7 enumerateDisplayedIconViewsUsingBlock:&__block_literal_global_289];
  }
  [(SBModalLibraryController *)self _evaluateWindowStatus];
}

uint64_t __73__SBModalLibraryController__willPerformTransitionWithLibraryToPresented___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisallowCursorInteraction:0];
}

- (void)_didCompleteTransitionWithLibraryToPresented:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBModalLibraryController *)self _setLibraryDisplayLayoutElementActive:"_setLibraryDisplayLayoutElementActive:"];
  [(SBModalLibraryController *)self _evaluateKeyboardWindowLevelAssertion];
  [(SBModalLibraryController *)self _evaluateResignActiveAssertion];
  if (v3)
  {
    id v5 = [(SBModalLibraryController *)self _currentLayoutState];
    uint64_t v6 = [v5 unlockedEnvironmentMode];

    if (v6 == 3)
    {
      id v9 = +[SBWorkspace mainWorkspace];
      id v7 = [(SBModalLibraryController *)self coordinatorRequestedIdleTimerBehavior:v9];
      id v8 = (id)[v9 idleTimerProvider:self didProposeBehavior:v7 forReason:@"SBModalLibraryPresentedReason"];
    }
  }
}

- (void)_setLibraryDisplayLayoutElementActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBModalLibraryController *)self libraryDisplayLayoutElementAssertion];
  if (v3 && !v5)
  {
    id v19 = 0;
    id v6 = objc_alloc(MEMORY[0x1E4FA6A68]);
    id v7 = (void *)[v6 initWithIdentifier:*MEMORY[0x1E4FA6F20]];
    [v7 setFillsDisplayBounds:1];
    [v7 setLayoutRole:3];
    id v8 = [(SBModalLibraryController *)self libraryViewController];
    id v9 = [v8 view];
    id v10 = [v9 window];
    [v10 level];
    double v12 = v11;
    uint64_t v13 = (uint64_t)v11;

    if (*MEMORY[0x1E4F43F20] + -2.0 >= (double)(uint64_t)v12) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v13;
    }
    [v7 setLevel:v14];
    id v15 = [(SBModalLibraryController *)self libraryViewController];
    BOOL v16 = [v15 _sbWindowScene];
    v17 = [v16 displayLayoutPublisher];
    v18 = [v17 addElement:v7];

    [(SBModalLibraryController *)self setLibraryDisplayLayoutElementAssertion:v18];
    goto LABEL_10;
  }
  if (!v3 && v5)
  {
    id v19 = v5;
    [v5 invalidate];
    [(SBModalLibraryController *)self setLibraryDisplayLayoutElementAssertion:0];
LABEL_10:
    id v5 = v19;
  }
}

- (void)_prepareLibraryViewControllerForDismissal:(id)a3
{
  [a3 enumerateDisplayedIconViewsUsingBlock:&__block_literal_global_23_4];
  id v5 = [(SBModalLibraryController *)self iconManager];
  [v5 dismissIconShareSheets];
  BOOL v4 = [MEMORY[0x1E4F42B00] sharedHUDService];
  [v4 dismissOrCancelHUDPresentationIfNeeded];
}

void __70__SBModalLibraryController__prepareLibraryViewControllerForDismissal___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  if ([v4 isShowingContextMenu])
  {
    [v4 dismissContextMenuWithCompletion:0];
    *a3 = 1;
  }
}

- (void)_configureFloatingDockBehaviorAssertionForPresented:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBModalLibraryController *)self floatingDockBehaviorAssertion];
  if (v3 && !v5)
  {
    id v9 = 0;
    id v6 = [SBFloatingDockBehaviorAssertion alloc];
    id v7 = [(SBModalLibraryController *)self floatingDockController];
    id v8 = [(SBFloatingDockBehaviorAssertion *)v6 initWithFloatingDockController:v7 visibleProgress:1 animated:1 gesturePossible:9 atLevel:@"SBModalLibraryPresentedReason" reason:0 withCompletion:0.0];

    [(SBModalLibraryController *)self setFloatingDockBehaviorAssertion:v8];
LABEL_7:
    id v5 = v9;
    goto LABEL_8;
  }
  if (!v3 && v5)
  {
    id v9 = v5;
    [v5 invalidate];
    [(SBModalLibraryController *)self setFloatingDockBehaviorAssertion:0];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_evaluateKeyboardWindowLevelAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v4 = [WeakRetained isMainDisplayWindowScene];

  if (!v4) {
    return;
  }
  id v5 = [(SBModalLibraryController *)self _currentLayoutState];
  uint64_t v6 = [v5 unlockedEnvironmentMode];

  BOOL v7 = (v6 & 0xFFFFFFFFFFFFFFFELL) == 2
    && [(SBModalLibraryController *)self isPresentingLibraryInForeground]
    && [(SBModalLibraryController *)self isPresentingOrTransitioningSearch];
  id v8 = [(SBModalLibraryController *)self keyboardWindowLevelAssertion];
  if (!v7 || v8)
  {
    if (v8) {
      char v17 = v7;
    }
    else {
      char v17 = 1;
    }
    if (v17) {
      goto LABEL_16;
    }
    id v18 = v8;
    [v8 invalidate];
    [(SBModalLibraryController *)self setKeyboardWindowLevelAssertion:0];
  }
  else
  {
    id v18 = 0;
    id v9 = [(SBModalLibraryController *)self libraryViewController];
    id v10 = [v9 _sbWindowScene];
    double v11 = [v10 medusaHostedKeyboardWindowController];
    double v12 = [(SBModalLibraryController *)self libraryViewController];
    uint64_t v13 = [v12 view];
    uint64_t v14 = [v13 window];
    [v14 windowLevel];
    BOOL v16 = (void *)[v11 newMedusaHostedKeyboardWindowLevelAssertionWithPriority:1 windowLevel:v15 + 1.0];

    [(SBModalLibraryController *)self setKeyboardWindowLevelAssertion:v16];
  }
  id v8 = v18;
LABEL_16:
}

- (void)_evaluateResignActiveAssertion
{
  BOOL v3 = [(SBModalLibraryController *)self _currentLayoutState];
  uint64_t v4 = [v3 unlockedEnvironmentMode];

  BOOL v5 = [(SBModalLibraryController *)self isPresentingLibraryInForeground];
  BOOL v6 = v4 == 3 && v5;
  BOOL v7 = [(SBModalLibraryController *)self resignActiveAssertion];
  int v8 = [v7 isAcquired];

  if (!v6 || (v8 & 1) != 0)
  {
    if ((v6 | v8 ^ 1)) {
      return;
    }
    uint64_t v13 = SBLogAppLibrary();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[Modal Library Controller] Updating resign active assertion to: Relinquished", v14, 2u);
    }

    id v10 = [(SBModalLibraryController *)self resignActiveAssertion];
    [v10 relinquish];
  }
  else
  {
    id v9 = SBLogAppLibrary();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[Modal Library Controller] Updating resign active assertion to: Acquired", buf, 2u);
    }

    id v10 = [(SBModalLibraryController *)self resignActiveAssertion];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v12 = [WeakRetained _fbsDisplayIdentity];
    objc_msgSend(v10, "sb_acquireForDisplayIdentity:", v12);
  }
}

- (void)_evaluateWindowStatus
{
  if ([(SBModalLibraryController *)self isPresentingLibraryInForeground])
  {
    BOOL v3 = [(SBModalLibraryController *)self libraryViewController];
    uint64_t v4 = [v3 viewIfLoaded];
    double v12 = [v4 window];

    if (!self->_libraryWindowKeyboardFocusAssertion)
    {
      BOOL v5 = +[SBWorkspace mainWorkspace];
      BOOL v6 = [v5 keyboardFocusController];
      BOOL v7 = +[SBKeyboardFocusLockReason modalAppLibrary];
      int v8 = [v6 focusLockSpringBoardWindow:v12 forReason:v7];
      libraryWindowKeyboardFocusAssertion = self->_libraryWindowKeyboardFocusAssertion;
      self->_libraryWindowKeyboardFocusAssertion = v8;
    }
    if (([v12 isKeyWindow] & 1) == 0) {
      [v12 makeKeyWindow];
    }
    id v10 = (BSInvalidatable *)v12;
  }
  else
  {
    double v11 = self->_libraryWindowKeyboardFocusAssertion;
    if (!v11) {
      return;
    }
    [(BSInvalidatable *)v11 invalidate];
    id v10 = self->_libraryWindowKeyboardFocusAssertion;
    self->_libraryWindowKeyboardFocusAssertion = 0;
  }
}

- (id)_currentLayoutState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [WeakRetained layoutStateProvider];
  uint64_t v4 = [v3 layoutState];

  return v4;
}

- (SBLibraryViewController)libraryViewController
{
  return self->_libraryViewController;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBFloatingDockController)floatingDockController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingDockController);
  return (SBFloatingDockController *)WeakRetained;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (SBHModalLibraryPresenter)libraryPresenter
{
  return self->_libraryPresenter;
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (SBMedusaHostedKeyboardWindowLevelAssertion)keyboardWindowLevelAssertion
{
  return self->_keyboardWindowLevelAssertion;
}

- (void)setKeyboardWindowLevelAssertion:(id)a3
{
}

- (SBFloatingDockBehaviorAssertion)floatingDockBehaviorAssertion
{
  return self->_floatingDockBehaviorAssertion;
}

- (void)setFloatingDockBehaviorAssertion:(id)a3
{
}

- (BSInvalidatable)libraryDisplayLayoutElementAssertion
{
  return self->_libraryDisplayLayoutElementAssertion;
}

- (void)setLibraryDisplayLayoutElementAssertion:(id)a3
{
}

- (BSInvalidatable)libraryWindowKeyboardFocusAssertion
{
  return self->_libraryWindowKeyboardFocusAssertion;
}

- (void)setLibraryWindowKeyboardFocusAssertion:(id)a3
{
}

- (BOOL)isPresentingOrTransitioningSearch
{
  return self->_presentingOrTransitioningSearch;
}

- (void)setPresentingOrTransitioningSearch:(BOOL)a3
{
  self->_presentingOrTransitioningSearch = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryWindowKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_libraryDisplayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_libraryPresenter, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_floatingDockController);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);
}

@end