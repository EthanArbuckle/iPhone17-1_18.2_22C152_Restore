@interface SBLibraryViewController
- (ATXAppDirectoryClient)loggingClient;
- (BOOL)_canHandleKeyEvents;
- (BOOL)_canHandleKeyUIEvent:(id)a3;
- (BOOL)_isPresentationForegroundModal;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isInvalidated;
- (BOOL)isRotating;
- (BSInvalidatable)expandedPodDisplayLayoutElementAssertion;
- (BSInvalidatable)useSnapshotAsBackgroundViewAssertion;
- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion;
- (SBLibraryViewController)initWithCategoryMapProvider:(id)a3 windowScene:(id)a4;
- (SBWindowScene)windowScene;
- (SBWindowSceneStatusBarSettingsAssertion)statusBarSettingsAssertion;
- (id)_currentLayoutState;
- (id)_sbWindowScene;
- (id)keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:(id)a3;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary;
- (void)_didActivateTypeAheadSearchWithPhysicalKeyboardEvent:(id)a3;
- (void)_evaluateAffordanceActivation;
- (void)_evaluateAsyncRenderingAssertion;
- (void)_evaluateFirstResponderStatus;
- (void)_handlePressesBegan:(id)a3;
- (void)_setExpandedPodDisplayLayoutElementActive:(BOOL)a3;
- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3;
- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3 quickly:(BOOL)a4;
- (void)dealloc;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 didPresentSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4;
- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4;
- (void)libraryViewControllerDidDismiss:(id)a3;
- (void)libraryViewControllerDidPresent:(id)a3;
- (void)libraryViewControllerWillDismiss:(id)a3;
- (void)libraryViewControllerWillPresent:(id)a3;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAsynchronousRenderingAssertion:(id)a3;
- (void)setExpandedPodDisplayLayoutElementAssertion:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)setRotating:(BOOL)a3;
- (void)setStatusBarSettingsAssertion:(id)a3;
- (void)setUseSnapshotAsBackgroundViewAssertion:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBLibraryViewController

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
  [(SBLibraryViewController *)self _evaluateAsyncRenderingAssertion];
  [(SBLibraryViewController *)self _evaluateFirstResponderStatus];
}

- (void)_evaluateFirstResponderStatus
{
  if ([(SBLibraryViewController *)self bs_isAppearingOrAppeared]
    && [(SBLibraryViewController *)self _isPresentationForegroundModal])
  {
    [(SBLibraryViewController *)self becomeFirstResponder];
  }
  else
  {
    [(SBLibraryViewController *)self resignFirstResponder];
  }
}

- (void)_evaluateAsyncRenderingAssertion
{
  BOOL v3 = [(SBLibraryViewController *)self _isPresentationForegroundModal];
  v4 = [(SBLibraryViewController *)self _currentLayoutState];
  uint64_t v5 = [v4 unlockedEnvironmentMode];

  int v6 = 0;
  if (v3 && v5 == 3) {
    int v6 = ![(SBLibraryViewController *)self isRotating];
  }
  v7 = [(SBLibraryViewController *)self asynchronousRenderingAssertion];
  int v8 = [v7 isValid];

  if (!v6 || (v8 & 1) != 0)
  {
    if (((v6 | v8 ^ 1) & 1) == 0)
    {
      v14 = SBLogAppLibrary();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[SBLibraryViewController] Updating async rendering assertion to: Relinquished", v16, 2u);
      }

      v15 = [(SBLibraryViewController *)self asynchronousRenderingAssertion];
      [v15 invalidate];

      [(SBLibraryViewController *)self setAsynchronousRenderingAssertion:0];
    }
  }
  else
  {
    v9 = SBLogAppLibrary();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBLibraryViewController] Updating async rendering assertion to: Acquired", buf, 2u);
    }

    v10 = [SBAsynchronousRenderingAssertion alloc];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [(SBAsynchronousRenderingAssertion *)v10 initWithReason:v12];
    [(SBLibraryViewController *)self setAsynchronousRenderingAssertion:v13];
  }
}

- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion
{
  return self->_asynchronousRenderingAssertion;
}

- (BOOL)_isPresentationForegroundModal
{
  v2 = self;
  BOOL v3 = [(SBHLibraryViewController *)self presenter];
  char v4 = [v3 isLibraryPresentationModal];
  LOBYTE(v2) = v4 & [v3 isPresentingLibraryInMostForegroundState:v2];

  return (char)v2;
}

- (void)_evaluateAffordanceActivation
{
  BOOL v3 = [(SBHLibraryViewController *)self barSwipeViewController];
  if (v3)
  {
    id v14 = v3;
    char v4 = [(SBHLibraryViewController *)self presenter];
    int v5 = [v4 isLibraryPresentationModal];
    int v6 = [(SBLibraryViewController *)self _currentLayoutState];
    uint64_t v7 = [v6 unlockedEnvironmentMode];

    if ([(SBLibraryViewController *)self bs_isDisappearingOrDisappeared])
    {
LABEL_3:
      uint64_t v8 = 0;
LABEL_15:
      [v14 setWantsToBeActiveAffordance:v8];

      BOOL v3 = v14;
      goto LABEL_16;
    }
    int v9 = [v4 isPresentingLibraryInMostForegroundState:self];
    if (v5)
    {
      if ((v9 & 1) == 0) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (!v9 || v7 != 1) {
        goto LABEL_15;
      }
    }
    BOOL v10 = [(SBHLibraryViewController *)self isPresentingFolder];
    BOOL v11 = [(SBHLibraryViewController *)self isPresentingSearch];
    if (v7 == 1) {
      int v12 = 0;
    }
    else {
      int v12 = v5;
    }
    unsigned int v13 = v11 | v12;
    if (v10) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v13;
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_currentLayoutState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [WeakRetained layoutStateProvider];
  char v4 = [v3 layoutState];

  return v4;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  int v5 = objc_msgSend(a4, "toLayoutState", a3);
  if ([v5 unlockedEnvironmentMode] == 1)
  {
    int v6 = (void *)*MEMORY[0x1E4F43630];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __98__SBLibraryViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
    v8[3] = &unk_1E6AF4AC0;
    v8[4] = self;
    objc_msgSend(v6, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);
  }
  else
  {
    uint64_t v7 = [(SBLibraryViewController *)self useSnapshotAsBackgroundViewAssertion];
    [v7 invalidate];

    [(SBLibraryViewController *)self setUseSnapshotAsBackgroundViewAssertion:0];
  }
  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
}

- (BSInvalidatable)useSnapshotAsBackgroundViewAssertion
{
  return self->_useSnapshotAsBackgroundViewAssertion;
}

- (void)setUseSnapshotAsBackgroundViewAssertion:(id)a3
{
}

uint64_t __98__SBLibraryViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acquireUseSnapshotAsBackgroundViewAssertionIfNecessary];
}

- (void)_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary
{
  BOOL v3 = [(SBLibraryViewController *)self _currentLayoutState];
  uint64_t v4 = [v3 unlockedEnvironmentMode];

  if ([(SBLibraryViewController *)self _appearState] == 2
    && ![(SBLibraryViewController *)self isRotating]
    && v4 == 1)
  {
    int v5 = [(SBLibraryViewController *)self useSnapshotAsBackgroundViewAssertion];

    if (!v5)
    {
      int v6 = [(SBHLibraryViewController *)self presenter];
      id v7 = [v6 acquireUseSnapshotAsBackgroundViewAssertionForReason:@"SBLibraryViewControllerSnapshotBackgroundViewReason"];

      [(SBLibraryViewController *)self setUseSnapshotAsBackgroundViewAssertion:v7];
    }
  }
}

- (SBLibraryViewController)initWithCategoryMapProvider:(id)a3 windowScene:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBLibraryViewController;
  id v7 = [(SBHLibraryViewController *)&v16 initWithCategoryMapProvider:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_windowScene, v6);
    int v9 = [v6 layoutStateTransitionCoordinator];
    [v9 addObserver:v8];

    if (SBHomeGestureEnabled())
    {
      BOOL v10 = [[SBBarSwipeAffordanceViewController alloc] initWithZStackParticipantIdentifier:3 windowScene:v6];
      [(SBBarSwipeAffordanceViewController *)v10 setDelegate:v8];
      BOOL v11 = [(SBBarSwipeAffordanceViewController *)v10 view];
      [v11 setColorBias:2];
      [v11 setIgnoresLuminance:1];
      [v11 addObserver:v8];
      [v11 setDelegate:v8];
      [v11 setUserInteractionEnabled:0];
      [(SBHLibraryViewController *)v8 setBarSwipeViewController:v10];
    }
    uint64_t v12 = [MEMORY[0x1E4F4AEB8] sharedInstance];
    loggingClient = v8->_loggingClient;
    v8->_loggingClient = (ATXAppDirectoryClient *)v12;

    id v14 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
    [(SBHLibraryViewController *)v8 setOverrideLegibilitySettings:v14];

    [(SBHLibraryViewController *)v8 addObserver:v8];
  }

  return v8;
}

- (void)dealloc
{
  if (![(SBLibraryViewController *)self isInvalidated])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBLibraryViewController;
  [(SBHLibraryViewController *)&v5 dealloc];
}

- (void)invalidate
{
  if (![(SBLibraryViewController *)self isInvalidated])
  {
    [(SBLibraryViewController *)self setInvalidated:1];
    BOOL v3 = [(SBLibraryViewController *)self windowScene];
    uint64_t v4 = [v3 layoutStateTransitionCoordinator];
    [v4 removeObserver:self];

    objc_super v5 = [(SBLibraryViewController *)self expandedPodDisplayLayoutElementAssertion];
    [v5 invalidate];

    id v6 = [(SBLibraryViewController *)self useSnapshotAsBackgroundViewAssertion];
    [v6 invalidate];

    id v7 = [(SBLibraryViewController *)self asynchronousRenderingAssertion];
    [v7 invalidate];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(SBLibraryViewController *)self setRotating:1];
  [(SBLibraryViewController *)self _evaluateAsyncRenderingAssertion];
  uint64_t v8 = [(SBLibraryViewController *)self useSnapshotAsBackgroundViewAssertion];
  [v8 invalidate];

  [(SBLibraryViewController *)self setUseSnapshotAsBackgroundViewAssertion:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6AF53F8;
  v10[4] = self;
  [v7 animateAlongsideTransition:0 completion:v10];
  v9.receiver = self;
  v9.super_class = (Class)SBLibraryViewController;
  -[SBHLibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRotating:0];
  [*(id *)(a1 + 32) _evaluateAsyncRenderingAssertion];
  v2 = (void *)*MEMORY[0x1E4F43630];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "sb_performBlockAfterCATransactionSynchronizedCommit:", v4);
}

uint64_t __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acquireUseSnapshotAsBackgroundViewAssertionIfNecessary];
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBLibraryViewController;
  id v4 = a3;
  [(SBLibraryViewController *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceStyle];

  id v6 = [(SBLibraryViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    uint64_t v8 = [(SBLibraryViewController *)self useSnapshotAsBackgroundViewAssertion];
    objc_super v9 = v8;
    if (v8)
    {
      [v8 invalidate];
      [(SBLibraryViewController *)self setUseSnapshotAsBackgroundViewAssertion:0];
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__SBLibraryViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6AF4AC0;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __52__SBLibraryViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acquireUseSnapshotAsBackgroundViewAssertionIfNecessary];
}

- (void)setPresenter:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLibraryViewController;
  id v5 = [(SBHLibraryViewController *)&v10 presenter];

  if (v5 != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLibraryViewController;
    [(SBHLibraryViewController *)&v9 setPresenter:v4];
    uint64_t v6 = [v4 isLibraryPresentationModal];
    uint64_t v7 = [(SBHLibraryViewController *)self barSwipeViewController];
    [v7 setActivationPolicyForParticipantsBelow:v6];

    if ([v4 hasBackgroundBlur])
    {
      uint64_t v8 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
      [(SBHLibraryViewController *)self setOverrideLegibilitySettings:v8];
    }
    else
    {
      [(SBHLibraryViewController *)self setOverrideLegibilitySettings:0];
    }
  }
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)SBLibraryViewController;
  -[SBHLibraryViewController overlayController:didChangePresentationProgress:newPresentationProgress:fromLeading:](&v8, sel_overlayController_didChangePresentationProgress_newPresentationProgress_fromLeading_, a3, a4);
  if (!a6) {
    [(SBLibraryViewController *)self _setStatusBarSettingsAssertionActive:BSFloatGreaterThanFloat() quickly:1];
  }
}

- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4
{
  -[SBLibraryViewController _setExpandedPodDisplayLayoutElementActive:](self, "_setExpandedPodDisplayLayoutElementActive:", 1, a4);
  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
}

- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4
{
  -[SBLibraryViewController _setExpandedPodDisplayLayoutElementActive:](self, "_setExpandedPodDisplayLayoutElementActive:", 0, a4);
  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
}

- (void)libraryViewControllerWillPresent:(id)a3
{
  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
  [(SBLibraryViewController *)self _evaluateAsyncRenderingAssertion];
  [(SBLibraryViewController *)self _evaluateFirstResponderStatus];
  id v4 = [(SBHLibraryViewController *)self presenter];
  int v5 = [v4 isLibraryPresentationModal];

  if (v5)
  {
    [(SBLibraryViewController *)self _setStatusBarSettingsAssertionActive:1];
  }
}

- (void)libraryViewControllerDidPresent:(id)a3
{
  id v4 = [(SBLibraryViewController *)self loggingClient];
  int v5 = [MEMORY[0x1E4F1C9C8] now];
  [v4 logDidEnterAppDirectoryWithDate:v5];

  [(SBLibraryViewController *)self _acquireUseSnapshotAsBackgroundViewAssertionIfNecessary];
  [(SBLibraryViewController *)self _evaluateAsyncRenderingAssertion];
}

- (void)libraryViewControllerWillDismiss:(id)a3
{
  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
  [(SBLibraryViewController *)self _evaluateAsyncRenderingAssertion];
  [(SBLibraryViewController *)self _evaluateFirstResponderStatus];
  id v4 = [(SBHLibraryViewController *)self presenter];
  int v5 = [v4 isLibraryPresentationModal];

  if (v5)
  {
    [(SBLibraryViewController *)self _setStatusBarSettingsAssertionActive:0];
  }
}

- (void)libraryViewControllerDidDismiss:(id)a3
{
  id v4 = [(SBHLibraryViewController *)self libraryCategoryMap];
  int v5 = [v4 metadata];
  id v9 = [v5 objectForKey:*MEMORY[0x1E4FA65B8]];

  uint64_t v6 = [(SBLibraryViewController *)self loggingClient];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  [v6 logDidLeaveAppDirectoryWithDate:v7 appDirectoryResponse:v9];

  objc_super v8 = [(SBLibraryViewController *)self useSnapshotAsBackgroundViewAssertion];
  [v8 invalidate];

  [(SBLibraryViewController *)self setUseSnapshotAsBackgroundViewAssertion:0];
  [(SBLibraryViewController *)self _evaluateAsyncRenderingAssertion];
}

- (void)libraryViewController:(id)a3 didPresentSearchController:(id)a4
{
  int v5 = [(SBLibraryViewController *)self loggingClient];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
  [v5 logOpenSearchWithDate:v6];

  [(SBLibraryViewController *)self _evaluateAffordanceActivation];
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  id v5 = [(SBLibraryViewController *)self loggingClient];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v5 logCloseSearchWithDate:v4];
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  unint64_t v4 = 60;
  if (a4 != 3) {
    unint64_t v4 = 0;
  }
  if (a4 == 1) {
    return 59;
  }
  else {
    return v4;
  }
}

- (id)keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:(id)a3
{
  if (!objc_msgSend(MEMORY[0x1E4F42B08], "usesInputSystemUI", a3)) {
    goto LABEL_5;
  }
  unint64_t v4 = [(SBHLibraryViewController *)self barSwipeViewController];
  if (![v4 wantsToBeActiveAffordance])
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  int v5 = [(SBLibraryViewController *)self isViewLoaded];

  if (!v5)
  {
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  unint64_t v4 = [(SBLibraryViewController *)self view];
  uint64_t v6 = [v4 window];
  uint64_t v7 = +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:v6];

LABEL_7:
LABEL_8:
  return v7;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHLibraryViewController *)self barSwipeViewController];
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", objc_msgSend(v6, "activationPolicyForParticipantsBelow"));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBLibraryViewController;
  id v6 = a4;
  [(SBLibraryViewController *)&v7 pressesBegan:a3 withEvent:v6];
  -[SBLibraryViewController _handlePressesBegan:](self, "_handlePressesBegan:", v6, v7.receiver, v7.super_class);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBLibraryViewController;
  [(SBLibraryViewController *)&v4 pressesChanged:a3 withEvent:a4];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBLibraryViewController;
  [(SBLibraryViewController *)&v4 pressesEnded:a3 withEvent:a4];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBLibraryViewController;
  [(SBLibraryViewController *)&v4 pressesCancelled:a3 withEvent:a4];
}

- (void)_handlePressesBegan:(id)a3
{
  id v4 = a3;
  if ([(SBLibraryViewController *)self _canHandleKeyEvents]
    && [(SBLibraryViewController *)self _canHandleKeyUIEvent:v4])
  {
    id v5 = [(SBHLibraryViewController *)self containerViewController];
    if (([v5 isActive] & 1) == 0)
    {
      id v6 = SBLogAppLibrary();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v10 = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Activating type-ahead search in App Library due to key input event", v10, 2u);
      }

      objc_super v7 = [(SBLibraryViewController *)self view];
      objc_super v8 = [v7 window];

      if (([v8 isKeyWindow] & 1) == 0) {
        [v8 makeKeyWindow];
      }
      id v9 = [v5 searchResultsController];
      [v9 setDisablesNullQueryExecution:1];
      [v5 setActive:1];
      [v9 setDisablesNullQueryExecution:0];
      [(SBLibraryViewController *)self _didActivateTypeAheadSearchWithPhysicalKeyboardEvent:v4];
    }
  }
}

- (BOOL)_canHandleKeyEvents
{
  int v3 = [(SBLibraryViewController *)self isViewLoaded];
  if (v3)
  {
    id v4 = [(SBLibraryViewController *)self viewIfLoaded];
    if ([v4 isHidden])
    {

LABEL_7:
      LOBYTE(v3) = 0;
      return v3;
    }
    char v5 = [(SBLibraryViewController *)self bs_isDisappearingOrDisappeared];

    if ((v5 & 1) != 0
      || [(SBHLibraryViewController *)self contentVisibility]
      || [(SBHLibraryViewController *)self isPresentingSearch])
    {
      goto LABEL_7;
    }
    LOBYTE(v3) = ![(SBHLibraryViewController *)self isPresentingFolder];
  }
  return v3;
}

- (BOOL)_canHandleKeyUIEvent:(id)a3
{
  id v3 = a3;
  if ([v3 type] != 4) {
    goto LABEL_4;
  }
  if (![v3 _isKeyDown]) {
    goto LABEL_4;
  }
  if ([v3 modifierFlags]) {
    goto LABEL_4;
  }
  id v6 = [v3 _unmodifiedInput];
  objc_super v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  objc_super v8 = [v6 stringByTrimmingCharactersInSet:v7];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    if (_canHandleKeyUIEvent__onceToken != -1) {
      dispatch_once(&_canHandleKeyUIEvent__onceToken, &__block_literal_global_324);
    }
    objc_super v10 = (void *)_canHandleKeyUIEvent__keyInputsToIgnore;
    BOOL v11 = [v3 _unmodifiedInput];
    int v4 = [v10 containsObject:v11] ^ 1;
  }
  else
  {
LABEL_4:
    LOBYTE(v4) = 0;
  }

  return v4;
}

void __48__SBLibraryViewController__canHandleKeyUIEvent___block_invoke()
{
  v13[23] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F439D8];
  v13[0] = *MEMORY[0x1E4F43A80];
  v13[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F43A78];
  v13[2] = *MEMORY[0x1E4F43A60];
  v13[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F43A70];
  v13[4] = *MEMORY[0x1E4F439F0];
  v13[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F43A58];
  v13[6] = *MEMORY[0x1E4F43A68];
  v13[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F439F8];
  v13[8] = *MEMORY[0x1E4F439E8];
  v13[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F43A18];
  v13[10] = v4;
  v13[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F43A28];
  v13[12] = *MEMORY[0x1E4F43A20];
  v13[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F43A38];
  v13[14] = *MEMORY[0x1E4F43A30];
  v13[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F43A48];
  v13[16] = *MEMORY[0x1E4F43A40];
  v13[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F43A00];
  v13[18] = *MEMORY[0x1E4F43A50];
  v13[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F43A10];
  v13[20] = *MEMORY[0x1E4F43A08];
  v13[21] = v10;
  v13[22] = *MEMORY[0x1E4F439D0];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:23];
  objc_super v12 = (void *)_canHandleKeyUIEvent__keyInputsToIgnore;
  _canHandleKeyUIEvent__keyInputsToIgnore = v11;
}

- (void)_didActivateTypeAheadSearchWithPhysicalKeyboardEvent:(id)a3
{
  uint64_t v3 = (void *)[a3 _cloneEvent];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__SBLibraryViewController__didActivateTypeAheadSearchWithPhysicalKeyboardEvent___block_invoke;
    v5[3] = &unk_1E6AF4AC0;
    id v6 = v3;
    [v4 performBlock:v5];
  }
}

void __80__SBLibraryViewController__didActivateTypeAheadSearchWithPhysicalKeyboardEvent___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42B20] activeInstance];
  [v2 performDelete];
  [v2 handleKeyEvent:*(void *)(a1 + 32)];
}

- (void)_setExpandedPodDisplayLayoutElementActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBLibraryViewController *)self expandedPodDisplayLayoutElementAssertion];
  if (v3 && !v5)
  {
    id v17 = 0;
    id v6 = objc_alloc(MEMORY[0x1E4FA6A68]);
    uint64_t v7 = (void *)[v6 initWithIdentifier:*MEMORY[0x1E4FA6F28]];
    [v7 setFillsDisplayBounds:1];
    [v7 setLayoutRole:6];
    uint64_t v8 = [(SBLibraryViewController *)self view];
    uint64_t v9 = [v8 window];
    [v9 level];
    double v11 = v10;
    uint64_t v12 = (uint64_t)v10;

    if (*MEMORY[0x1E4F43F20] + -2.0 >= (double)(uint64_t)v11) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    [v7 setLevel:v13];
    id v14 = [(SBLibraryViewController *)self _sbWindowScene];
    v15 = [v14 displayLayoutPublisher];
    objc_super v16 = [v15 addElement:v7];

    [(SBLibraryViewController *)self setExpandedPodDisplayLayoutElementAssertion:v16];
    goto LABEL_10;
  }
  if (!v3 && v5)
  {
    id v17 = v5;
    [v5 invalidate];
    [(SBLibraryViewController *)self setExpandedPodDisplayLayoutElementAssertion:0];
LABEL_10:
    uint64_t v5 = v17;
  }
}

- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3
{
}

- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3 quickly:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(SBLibraryViewController *)self statusBarSettingsAssertion];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__SBLibraryViewController__setStatusBarSettingsAssertionActive_quickly___block_invoke;
  v18[3] = &__block_descriptor_33_e42___UIStatusBarStyleAnimationParameters_8__0l;
  BOOL v19 = a4;
  uint64_t v8 = MEMORY[0x1D948C7A0](v18);
  uint64_t v9 = (void (**)(void))v8;
  if (!v5 || v7)
  {
    if (!v5 && v7)
    {
      id v17 = (*(void (**)(uint64_t))(v8 + 16))(v8);
      [v7 invalidateWithAnimationParameters:v17];

      [(SBLibraryViewController *)self setStatusBarSettingsAssertion:0];
    }
  }
  else
  {
    double v10 = [(SBLibraryViewController *)self _sbWindowScene];
    double v11 = [v10 statusBarManager];
    uint64_t v12 = [v11 assertionManager];

    uint64_t v13 = objc_alloc_init(SBMutableStatusBarSettings);
    id v14 = [(SBHLibraryViewController *)self effectiveLegibilitySettings];
    [(SBMutableStatusBarSettings *)v13 setLegibilitySettings:v14];

    v15 = (void *)[v12 newSettingsAssertionWithSettings:v13 atLevel:3 reason:@"App Library"];
    objc_super v16 = v9[2](v9);
    [v15 acquireWithAnimationParameters:v16];

    [(SBLibraryViewController *)self setStatusBarSettingsAssertion:v15];
  }
}

id __72__SBLibraryViewController__setStatusBarSettingsAssertionActive_quickly___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
  BOOL v3 = v2;
  if (*(unsigned char *)(a1 + 32))
  {
    [v2 duration];
    [v3 setDuration:v4 * 0.6];
  }
  return v3;
}

- (id)_sbWindowScene
{
  BOOL v3 = [(SBLibraryViewController *)self windowScene];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLibraryViewController;
    id v5 = [(UIViewController *)&v8 _sbWindowScene];
  }
  id v6 = v5;

  return v6;
}

- (SBWindowSceneStatusBarSettingsAssertion)statusBarSettingsAssertion
{
  return self->_statusBarSettingsAssertion;
}

- (void)setStatusBarSettingsAssertion:(id)a3
{
}

- (void)setAsynchronousRenderingAssertion:(id)a3
{
}

- (BSInvalidatable)expandedPodDisplayLayoutElementAssertion
{
  return self->_expandedPodDisplayLayoutElementAssertion;
}

- (void)setExpandedPodDisplayLayoutElementAssertion:(id)a3
{
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (ATXAppDirectoryClient)loggingClient
{
  return self->_loggingClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_useSnapshotAsBackgroundViewAssertion, 0);
  objc_storeStrong((id *)&self->_expandedPodDisplayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, 0);
}

@end