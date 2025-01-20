@interface SBSpotlightMultiplexingViewController
+ (BOOL)isShownWithinWindow:(id)a3;
+ (BOOL)isShownWithinWindowScene:(id)a3;
+ (SBSpotlightHostedContentMetrics)_class_spotlightHostedContentMetrics;
+ (SPUIRemoteSearchViewController)sharedRemoteSearchViewController;
+ (SPUIRemoteSearchViewController)sharedRemoteSearchViewControllerIfExists;
+ (double)effectiveSpotlightSearchFieldAvoidanceHeight;
+ (id)keyboardFocusTargetIfActiveForeground;
+ (id)spotlightSceneIdentityTokenIfActiveForeground;
+ (unint64_t)spotlightSupportedInterfaceOrientations;
- (BOOL)_isStatusBarEffectivelyHidden;
- (BOOL)_remoteSearchViewControllerHasKeyboardPresented;
- (BOOL)externalKeyboardViewContainsKeyboard;
- (BOOL)isActiveDelegate;
- (BOOL)isInvalidated;
- (BOOL)isSearchContentAvailable;
- (BOOL)isVisibleOnScreen;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)wantsExternalKeyboardView;
- (FBSDisplayConfiguration)targetDisplayConfiguration;
- (SBMedusaHostedKeyboardWindowLevelAssertion)medusaHostedKeyboardWindowLevelAssertion;
- (SBSpotlightHostedContentMetrics)spotlightHostedContentMetrics;
- (SBSpotlightMultiplexingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBSpotlightMultiplexingViewControllerDelegate)delegate;
- (SPUIRemoteSearchViewDelegate)spotlightDelegate;
- (UIScenePresenter)keyboardPresenter;
- (UIView)externalKeyboardView;
- (UIView)hostedInputUIView;
- (UIView)inputUIView;
- (UIView)keyboardHostView;
- (_UILegibilitySettings)legibilitySettings;
- (id)_effectiveKeyboardContentView;
- (id)_getSceneHandleFromSceneManager:(id)a3;
- (id)_spotlightSceneIdentifier;
- (id)dismissScene:(id)a3;
- (id)parentSceneIdentityToken;
- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4;
- (id)sceneHandle;
- (unint64_t)_appStatusBarSettingsLevelForSpotlightMultiplexingLevel:(unint64_t)a3;
- (unint64_t)level;
- (unint64_t)remoteSearchViewPresentationSource;
- (void)_acquireInputUIPresentingAssertionIfNecessary;
- (void)_analyticsLogSpotlightInvocationWhereAndHowWithSource:(unint64_t)a3;
- (void)_clearStatusBarHiddenAssertion;
- (void)_clearStatusBarStyleAssertionAnimated:(BOOL)a3;
- (void)_configureExternalKeyboardView;
- (void)_configureExternalKeyboardView:(BOOL)a3;
- (void)_configureSceneObservation:(BOOL)a3 forScene:(id)a4;
- (void)_configureStatusBarScrollToTopView;
- (void)_evaluateSearchContentAvailabilityForScene:(id)a3;
- (void)_invalidateInputUIPresentingAssertion;
- (void)_notifyExternalKeyboardViewContainsKeyboard:(BOOL)a3;
- (void)_registerStatusBarScrollToTopView;
- (void)_registerStatusBarScrollToTopViewWithWindow:(id)a3;
- (void)_returnKeyboardToSpotlightIfNecessary;
- (void)_unregisterStatusBarScrollToTopView;
- (void)_unregisterStatusBarScrollToTopViewWithWindow:(id)a3;
- (void)_updateStatusBarHiddenAssertion;
- (void)_updateStatusBarStyleAssertion;
- (void)_updateStatusBarStyleAssertionToStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)didBecomeActiveDelegate;
- (void)didResignActiveDelegate:(BOOL)a3;
- (void)dismissSearchView;
- (void)invalidate;
- (void)keyboardLayersDidChange:(id)a3;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAlphaTo:(double)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4;
- (void)scrollToTopSceneProxyViewDidEnterViewHierarchy:(id)a3 rootedAtWindow:(id)a4;
- (void)scrollToTopSceneProxyViewWillExitViewHierarchy:(id)a3 rootedAtWindow:(id)a4;
- (void)searchViewContentAvailabilityDidChange;
- (void)searchViewKeyboardPresentationStateDidChange;
- (void)setActiveDelegate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalKeyboardView:(id)a3;
- (void)setHostedInputUIView:(id)a3;
- (void)setInputUIView:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setKeyboardHostView:(id)a3;
- (void)setKeyboardPresenter:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMedusaHostedKeyboardWindowLevelAssertion:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setSearchContentAvailable:(BOOL)a3;
- (void)setSpotlightDelegate:(id)a3;
- (void)setTargetDisplayConfiguration:(id)a3;
- (void)setWantsExternalKeyboardView:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBSpotlightMultiplexingViewController

+ (SPUIRemoteSearchViewController)sharedRemoteSearchViewControllerIfExists
{
  return (SPUIRemoteSearchViewController *)(id)__remoteSearchViewController;
}

+ (SPUIRemoteSearchViewController)sharedRemoteSearchViewController
{
  if (sharedRemoteSearchViewController_onceToken != -1) {
    dispatch_once(&sharedRemoteSearchViewController_onceToken, &__block_literal_global_109_0);
  }
  v2 = (void *)__remoteSearchViewController;
  return (SPUIRemoteSearchViewController *)v2;
}

+ (SBSpotlightHostedContentMetrics)_class_spotlightHostedContentMetrics
{
  retstr->searchBarCornerRadius = 0.0;
  *(_OWORD *)&retstr->keyboardHeight = 0u;
  retstr->dockedSearchBarSize = 0u;
  p_dockedSearchBarSize = &retstr->dockedSearchBarSize;
  retstr->searchBarSize = 0u;
  p_searchBarSize = &retstr->searchBarSize;
  id v32 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  [v32 keyboardHeight];
  double v7 = v6;
  retstr->keyboardHeight = v6;
  [v32 keyboardProtectorHeight];
  retstr->keyboardProtectorHeight = v8;
  [v32 searchBarSize];
  double v10 = v9;
  double v12 = v11;
  p_searchBarSize->width = v9;
  retstr->searchBarSize.height = v11;
  [v32 dockedSearchBarSize];
  double v14 = v13;
  double v16 = v15;
  p_dockedSearchBarSize->width = v13;
  retstr->dockedSearchBarSize.height = v15;
  [v32 searchBarCornerRadius];
  retstr->searchBarCornerRadius = v17;
  v18 = [v32 _sbDisplayConfiguration];
  v19 = [v18 identity];
  if ([v19 isContinuityDisplay]) {
    char v20 = 1;
  }
  else {
    char v20 = [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode];
  }

  if (BSFloatIsZero() && (v20 & 1) == 0)
  {
    [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:1];
    double v7 = v21;
    retstr->keyboardHeight = v21;
  }
  if (BSFloatIsZero())
  {
    int v22 = _os_feature_enabled_impl();
    double v23 = 62.0;
    if (v22) {
      double v23 = v7 + 62.0;
    }
    retstr->keyboardProtectorHeight = v23;
  }
  double v24 = *MEMORY[0x1E4F1DB30];
  double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v10 == *MEMORY[0x1E4F1DB30] && v12 == v25)
  {
    v27 = [MEMORY[0x1E4F42D90] mainScreen];
    [v27 bounds];
    double v29 = v28;

    retstr->searchBarSize.width = v29 + -16.0;
    retstr->searchBarSize.height = 48.0;
  }
  if (v14 == v24 && v16 == v25)
  {
    CGSize *p_dockedSearchBarSize = *p_searchBarSize;
    p_dockedSearchBarSize->width = p_dockedSearchBarSize->width + -40.0;
  }
  if (BSFloatIsZero()) {
    retstr->searchBarCornerRadius = 10.0;
  }

  return result;
}

+ (unint64_t)spotlightSupportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    unint64_t v4 = 30;
  }
  else {
    unint64_t v4 = 2;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v4;
  }
  v5 = objc_opt_class();
  return [v5 spotlightSupportedInterfaceOrientations];
}

+ (double)effectiveSpotlightSearchFieldAvoidanceHeight
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double result = 0.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_msgSend(a1, "_class_spotlightHostedContentMetrics", 0);
    return 0.0;
  }
  return result;
}

void __73__SBSpotlightMultiplexingViewController_sharedRemoteSearchViewController__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)__remoteSearchViewController;
  __remoteSearchViewController = v0;

  v2 = (void *)__remoteSearchViewController;
  id v3 = +[SBSpotlightDelegateManager sharedInstance];
  [v2 setDelegate:v3];
}

+ (BOOL)isShownWithinWindow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() sharedRemoteSearchViewControllerIfExists];
  v5 = v4;
  if (v4)
  {
    double v6 = [v4 view];
    id v7 = [v6 window];
    if (v7 == v3) {
      char v8 = [v5 isBeingPresented];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isShownWithinWindowScene:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(a3, "windows", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([a1 isShownWithinWindow:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (id)keyboardFocusTargetIfActiveForeground
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  CGFloat v15 = __Block_byref_object_copy__75;
  uint64_t v16 = __Block_byref_object_dispose__75;
  id v17 = 0;
  v2 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  id v3 = [v2 sceneIdentifier];

  uint64_t v4 = [MEMORY[0x1E4F62A60] identityForIdentifier:v3 workspaceIdentifier:@"com.apple.Spotlight"];
  uint64_t v5 = [MEMORY[0x1E4F62490] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__SBSpotlightMultiplexingViewController_keyboardFocusTargetIfActiveForeground__block_invoke;
  v9[3] = &unk_1E6AFC208;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 enumerateScenesWithBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __78__SBSpotlightMultiplexingViewController_keyboardFocusTargetIfActiveForeground__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  int v5 = [v13 isActive];
  id v6 = v13;
  if (v5)
  {
    id v7 = [v13 settings];
    if ([v7 isForeground])
    {
      char v8 = [v13 identity];
      int v9 = [v8 isEqual:*(void *)(a1 + 32)];

      id v6 = v13;
      if (v9)
      {
        uint64_t v10 = +[SBKeyboardFocusTarget targetForFBScene:v13];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        id v6 = v13;
        *a3 = 1;
      }
    }
    else
    {

      id v6 = v13;
    }
  }
}

+ (id)spotlightSceneIdentityTokenIfActiveForeground
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  CGFloat v15 = __Block_byref_object_copy__75;
  uint64_t v16 = __Block_byref_object_dispose__75;
  id v17 = 0;
  v2 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  id v3 = [v2 sceneIdentifier];

  uint64_t v4 = [MEMORY[0x1E4F62A60] identityForIdentifier:v3 workspaceIdentifier:@"com.apple.Spotlight"];
  int v5 = [MEMORY[0x1E4F62490] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SBSpotlightMultiplexingViewController_spotlightSceneIdentityTokenIfActiveForeground__block_invoke;
  v9[3] = &unk_1E6AFC208;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateScenesWithBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __86__SBSpotlightMultiplexingViewController_spotlightSceneIdentityTokenIfActiveForeground__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  int v5 = [v13 isActive];
  id v6 = v13;
  if (v5)
  {
    id v7 = [v13 settings];
    if ([v7 isForeground])
    {
      char v8 = [v13 identity];
      int v9 = [v8 isEqual:*(void *)(a1 + 32)];

      id v6 = v13;
      if (v9)
      {
        uint64_t v10 = [v13 identityToken];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        id v6 = v13;
        *a3 = 1;
      }
    }
    else
    {

      id v6 = v13;
    }
  }
}

- (SBSpotlightMultiplexingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBSpotlightMultiplexingViewController;
  uint64_t v4 = [(SBSpotlightMultiplexingViewController *)&v7 initWithNibName:a3 bundle:a4];
  int v5 = v4;
  if (v4) {
    [(SBSpotlightMultiplexingViewController *)v4 _acquireInputUIPresentingAssertionIfNecessary];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (![(SBSpotlightMultiplexingViewController *)self isInvalidated])
  {
    id v3 = SBLogSpotlight();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v6 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ was deallocated without being invalidated. Invalidating now.", buf, 0xCu);
    }

    [(SBSpotlightMultiplexingViewController *)self invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightMultiplexingViewController;
  [(SBSpotlightMultiplexingViewController *)&v4 dealloc];
}

- (SBSpotlightHostedContentMetrics)spotlightHostedContentMetrics
{
  retstr->searchBarCornerRadius = 0.0;
  retstr->searchBarSize = 0u;
  retstr->dockedSearchBarSize = 0u;
  *(_OWORD *)&retstr->keyboardHeight = 0u;
  double result = (SBSpotlightHostedContentMetrics *)objc_opt_class();
  if (result)
  {
    return (SBSpotlightHostedContentMetrics *)[(SBSpotlightHostedContentMetrics *)result _class_spotlightHostedContentMetrics];
  }
  else
  {
    retstr->searchBarCornerRadius = 0.0;
    retstr->searchBarSize = 0u;
    retstr->dockedSearchBarSize = 0u;
    *(_OWORD *)&retstr->keyboardHeight = 0u;
  }
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  id v6 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    if ([(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
    {
      int v5 = [(id)objc_opt_class() sharedRemoteSearchViewController];
      [v5 setLegibilitySettings:v6];
    }
  }
}

- (unint64_t)level
{
  return 0;
}

- (void)invalidate
{
  if (![(SBSpotlightMultiplexingViewController *)self isInvalidated])
  {
    [(SBSpotlightMultiplexingViewController *)self setInvalidated:1];
    [(SBSpotlightMultiplexingViewController *)self _invalidateInputUIPresentingAssertion];
    id v3 = +[SBSpotlightDelegateManager sharedInstance];
    objc_msgSend(v3, "removeSpotlightDelegate:forLevel:", self, -[SBSpotlightMultiplexingViewController level](self, "level"));
  }
}

- (void)setWantsExternalKeyboardView:(BOOL)a3
{
  if (self->_wantsExternalKeyboardView != a3)
  {
    self->_wantsExternalKeyboardView = a3;
    [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
  }
}

- (BOOL)externalKeyboardViewContainsKeyboard
{
  id v3 = [(SBSpotlightMultiplexingViewController *)self _effectiveKeyboardContentView];

  if (!v3) {
    return 0;
  }
  return [(SBSpotlightMultiplexingViewController *)self _remoteSearchViewControllerHasKeyboardPresented];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBSpotlightMultiplexingViewController;
  [(SBSpotlightMultiplexingViewController *)&v8 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    if ([(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
    {
      id v6 = [(UIViewController *)self _sbWindowScene];
      uint64_t v7 = [v6 medusaHostedKeyboardWindowController];
      [v7 addObserver:self];

      [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
      [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = +[SBControlCenterController sharedInstanceIfExists];
  [v5 dismissAnimated:1];

  id v6 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  if ([(SBSpotlightMultiplexingViewController *)self isInvalidated])
  {
    uint64_t v7 = SBLogSpotlight();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is invalidated, so not adding spotlight delegate", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = +[SBSpotlightDelegateManager sharedInstance];
    [v7 addSpotlightDelegate:self forLevel:[(SBSpotlightMultiplexingViewController *)self level]];
  }

  [(SBSpotlightMultiplexingViewController *)self _registerStatusBarScrollToTopView];
  if ([(SBSpotlightMultiplexingViewController *)self isActiveDelegate]) {
    objc_msgSend(v6, "setSource:", -[SBSpotlightMultiplexingViewController remoteSearchViewPresentationSource](self, "remoteSearchViewPresentationSource"));
  }
  v15.receiver = self;
  v15.super_class = (Class)SBSpotlightMultiplexingViewController;
  [(SBSpotlightMultiplexingViewController *)&v15 viewWillAppear:v3];
  objc_super v8 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  int v9 = [v8 statusBarStateProvider];
  [v9 addStatusBarObserver:self];

  [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
  [(SBSpotlightMultiplexingViewController *)self _updateStatusBarStyleAssertion];
  if ([(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
  {
    if ([MEMORY[0x1E4FA5E28] enableFloatingWindow])
    {
      uint64_t v10 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
      [v10 setKeyboardContextMaskStyle:2];
    }
    uint64_t v11 = SBLogSpotlight();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ is appearing, and is the active Spotlight delegate", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
    [v6 setDisplayConfiguration:WeakRetained];

    [(SBSpotlightMultiplexingViewController *)self bs_beginAppearanceTransitionForChildViewController:v6 toVisible:1 animated:v3];
  }
  else
  {
    id v13 = SBLogSpotlight();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is appearing, but is not the active Spotlight delegate", buf, 0xCu);
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_inputUIPresentingDelegate);
  [v14 scenePresenterVisibilityDidChange:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SBSpotlightMultiplexingViewController;
  [(SBSpotlightMultiplexingViewController *)&v13 viewDidAppear:a3];
  if ([(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
  {
    objc_super v4 = [(id)objc_opt_class() sharedRemoteSearchViewController];
    int v5 = SBLogSpotlight();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v15 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did appear, and is the active Spotlight delegate", buf, 0xCu);
    }

    [(SBSpotlightMultiplexingViewController *)self bs_endAppearanceTransitionForChildViewController:v4 toVisible:1];
  }
  else
  {
    objc_super v4 = SBLogSpotlight();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v15 = self;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ did appear, but is not the active Spotlight delegate", buf, 0xCu);
    }
  }

  if (!self->_medusaHostedKeyboardWindowLevelAssertion
    && [MEMORY[0x1E4FA5E28] enableFloatingWindow])
  {
    id v6 = [(UIViewController *)self _sbWindowScene];
    uint64_t v7 = [v6 medusaHostedKeyboardWindowController];
    objc_super v8 = [(SBSpotlightMultiplexingViewController *)self view];
    int v9 = [v8 window];
    [v9 windowLevel];
    uint64_t v11 = (SBMedusaHostedKeyboardWindowLevelAssertion *)[v7 newMedusaHostedKeyboardWindowLevelAssertionWithPriority:2 windowLevel:v10 + 1.0];
    medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
    self->_medusaHostedKeyboardWindowLevelAssertion = v11;
  }
  [(SBSpotlightMultiplexingViewController *)self _updateStatusBarStyleAssertion];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  if ([(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
  {
    int v5 = [(id)objc_opt_class() sharedRemoteSearchViewController];
    id v6 = SBLogSpotlight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v9 = self;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ is disappearing, and is the active Spotlight delegate", buf, 0xCu);
    }

    [(SBSpotlightMultiplexingViewController *)self bs_beginAppearanceTransitionForChildViewController:v5 toVisible:0 animated:v3];
  }
  else
  {
    int v5 = SBLogSpotlight();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v9 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is disappearing, but is not the active Spotlight delegate", buf, 0xCu);
    }
  }

  [(SBSpotlightMultiplexingViewController *)self _clearStatusBarStyleAssertionAnimated:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBSpotlightMultiplexingViewController;
  [(SBSpotlightMultiplexingViewController *)&v16 viewDidDisappear:a3];
  BOOL v4 = [(SBSpotlightMultiplexingViewController *)self isActiveDelegate];
  int v5 = SBLogSpotlight();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did disappear, and is the active Spotlight delegate", buf, 0xCu);
    }

    int v5 = [(id)objc_opt_class() sharedRemoteSearchViewController];
    [(SBSpotlightMultiplexingViewController *)self bs_endAppearanceTransitionForChildViewController:v5 toVisible:0];
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = self;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did disappear, but is not the active Spotlight delegate", buf, 0xCu);
  }

  objc_super v7 = +[SBSpotlightDelegateManager sharedInstance];
  objc_msgSend(v7, "removeSpotlightDelegate:forLevel:", self, -[SBSpotlightMultiplexingViewController level](self, "level"));

  objc_super v8 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  int v9 = [v8 statusBarStateProvider];
  [v9 removeStatusBarObserver:self];

  [(SBSpotlightMultiplexingViewController *)self _clearStatusBarHiddenAssertion];
  [(SBSpotlightMultiplexingViewController *)self _clearStatusBarStyleAssertionAnimated:1];
  [(SBSpotlightMultiplexingViewController *)self _unregisterStatusBarScrollToTopView];
  uint64_t v10 = +[SBKeyboardFocusCoordinator sharedInstance];
  uint64_t v11 = [(UIViewController *)self _sbWindowScene];
  uint64_t v12 = +[SBKeyboardFocusArbitrationReason spotlightMultiplexingViewDidDisappear];
  [v10 requestArbitrationForSBWindowScene:v11 forReason:v12];

  medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
  if (medusaHostedKeyboardWindowLevelAssertion)
  {
    [(SBMedusaHostedKeyboardWindowLevelAssertion *)medusaHostedKeyboardWindowLevelAssertion invalidate];
    id v14 = self->_medusaHostedKeyboardWindowLevelAssertion;
    self->_medusaHostedKeyboardWindowLevelAssertion = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputUIPresentingDelegate);
  [WeakRetained scenePresenterVisibilityDidChange:self];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightMultiplexingViewController;
  [(SBSpotlightMultiplexingViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(SBSpotlightMultiplexingViewController *)self inputUIView];
  if (v3)
  {
    BOOL v4 = [(SBSpotlightMultiplexingViewController *)self view];
    int v5 = [v3 superview];

    if (v5 == v4)
    {
      [v4 bounds];
      UIRectGetCenter();
      objc_msgSend(v3, "setCenter:");
    }
  }
}

- (void)dismissSearchView
{
  id v2 = [(SBSpotlightMultiplexingViewController *)self spotlightDelegate];
  [v2 dismissSearchView];
}

- (void)searchViewKeyboardPresentationStateDidChange
{
  uint64_t v3 = [(SBSpotlightMultiplexingViewController *)self _remoteSearchViewControllerHasKeyboardPresented] ^ 1;
  [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView:v3];
}

- (void)searchViewContentAvailabilityDidChange
{
  id v2 = [(SBSpotlightMultiplexingViewController *)self spotlightDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 searchViewContentAvailabilityDidChange];
  }
}

- (void)didBecomeActiveDelegate
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(SBSpotlightMultiplexingViewController *)self setActiveDelegate:1];
  uint64_t v3 = [MEMORY[0x1E4F62490] sharedInstance];
  [v3 addObserver:self];

  BOOL v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  [v4 addObserver:self];

  int v5 = [(UIViewController *)self _sbWindowScene];
  objc_super v6 = [v5 medusaHostedKeyboardWindowController];
  [v6 addObserver:self];

  [(SBSpotlightMultiplexingViewController *)self _configureStatusBarScrollToTopView];
  objc_super v7 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  objc_super v8 = [(SBSpotlightMultiplexingViewController *)self legibilitySettings];
  [v7 setLegibilitySettings:v8];

  objc_msgSend(v7, "setSource:", -[SBSpotlightMultiplexingViewController remoteSearchViewPresentationSource](self, "remoteSearchViewPresentationSource"));
  [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
  int v9 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  uint64_t v10 = [v9 sceneIfExists];
  [(SBSpotlightMultiplexingViewController *)self _configureSceneObservation:1 forScene:v10];

  uint64_t v11 = [v7 parentViewController];
  uint64_t v12 = v11;
  if (v11 != self)
  {
    if (v11)
    {
      [v7 willMoveToParentViewController:0];
      objc_super v13 = [v7 view];
      [v13 removeFromSuperview];

      [v7 removeFromParentViewController];
    }
    [(SBSpotlightMultiplexingViewController *)self addChildViewController:v7];
    id v14 = [v7 view];
    objc_super v15 = [(SBSpotlightMultiplexingViewController *)self view];
    [v15 bounds];
    objc_msgSend(v14, "setFrame:");

    [v14 setAutoresizingMask:18];
    objc_super v16 = [(SBSpotlightMultiplexingViewController *)self view];
    [v16 addSubview:v14];

    [v7 didMoveToParentViewController:self];
  }
  int v17 = [(SBSpotlightMultiplexingViewController *)self _appearState];
  int v18 = [v7 _appearState];
  if (v17 != v18)
  {
    if ((v17 - 1) < 2)
    {
      if ((v18 - 3) <= 0xFFFFFFFD)
      {
        int v22 = SBLogSpotlight();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138543362;
          double v28 = self;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Appearing state", (uint8_t *)&v27, 0xCu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
        [v7 setDisplayConfiguration:WeakRetained];

        [(SBSpotlightMultiplexingViewController *)self bs_beginAppearanceTransitionForChildViewController:v7 toVisible:1 animated:v17 == 1];
      }
      if (v17 == 2)
      {
        char v20 = SBLogSpotlight();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138543362;
          double v28 = self;
          _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Appeared state", (uint8_t *)&v27, 0xCu);
        }
        uint64_t v21 = 1;
        goto LABEL_26;
      }
    }
    else if (v17 == 3 || !v17)
    {
      if (v18 && v18 != 3)
      {
        uint64_t v19 = SBLogSpotlight();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138543362;
          double v28 = self;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Disappearing state", (uint8_t *)&v27, 0xCu);
        }

        [(SBSpotlightMultiplexingViewController *)self bs_beginAppearanceTransitionForChildViewController:v7 toVisible:0 animated:v17 == 3];
      }
      if (!v17)
      {
        char v20 = SBLogSpotlight();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138543362;
          double v28 = self;
          _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Disappeared state", (uint8_t *)&v27, 0xCu);
        }
        uint64_t v21 = 0;
LABEL_26:

        [(SBSpotlightMultiplexingViewController *)self bs_endAppearanceTransitionForChildViewController:v7 toVisible:v21];
      }
    }
  }
  double v24 = +[SBKeyboardFocusCoordinator sharedInstance];
  double v25 = [(UIViewController *)self _sbWindowScene];
  v26 = +[SBKeyboardFocusArbitrationReason spotlightMultiplexingDidBecomeActiveDelegate];
  [v24 requestArbitrationForSBWindowScene:v25 forReason:v26];

  [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
  [(SBSpotlightMultiplexingViewController *)self _analyticsLogSpotlightInvocationWhereAndHowWithSource:[(SBSpotlightMultiplexingViewController *)self remoteSearchViewPresentationSource]];
}

- (void)didResignActiveDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = SBLogSpotlight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    objc_super v15 = self;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "didResignActiveDelegate called on %{public}@", (uint8_t *)&v14, 0xCu);
  }

  [(SBSpotlightMultiplexingViewController *)self setActiveDelegate:0];
  [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
  objc_super v6 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  objc_super v7 = [v6 sceneIfExists];
  [(SBSpotlightMultiplexingViewController *)self _configureSceneObservation:0 forScene:v7];

  if (v3)
  {
    objc_super v8 = [(id)objc_opt_class() sharedRemoteSearchViewController];
    int v9 = [v8 parentViewController];

    if (v9 == self && [v8 _appearState]) {
      [(SBSpotlightMultiplexingViewController *)self bs_endAppearanceTransitionForChildViewController:v8 toVisible:0];
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F62490] sharedInstance];
  [v10 removeObserver:self];

  uint64_t v11 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  [v11 removeObserver:self];

  uint64_t v12 = [(UIViewController *)self _sbWindowScene];
  objc_super v13 = [v12 medusaHostedKeyboardWindowController];
  [v13 removeObserver:self];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v13 = a4;
  int v5 = [v13 identifier];
  objc_super v6 = [(SBSpotlightMultiplexingViewController *)self _spotlightSceneIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    objc_super v8 = +[SBKeyboardFocusCoordinator sharedInstance];
    int v9 = [(UIViewController *)self _sbWindowScene];
    uint64_t v10 = +[SBKeyboardFocusArbitrationReason spotlightMultiplexingDidCreateScene];
    [v8 requestArbitrationForSBWindowScene:v9 forReason:v10];

    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarStyleAssertion];
    [(SBSpotlightMultiplexingViewController *)self _configureSceneObservation:1 forScene:v13];
    if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
    {
      uint64_t v11 = [(SBSpotlightMultiplexingViewController *)self externalKeyboardView];
      if (v11)
      {
        uint64_t v12 = [v13 settings];
        [v12 frame];
        objc_msgSend(v11, "setFrame:");
      }
    }
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v11 = a4;
  int v5 = [v11 identifier];
  objc_super v6 = [(SBSpotlightMultiplexingViewController *)self _spotlightSceneIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    objc_super v8 = +[SBKeyboardFocusCoordinator sharedInstance];
    int v9 = [(UIViewController *)self _sbWindowScene];
    uint64_t v10 = +[SBKeyboardFocusArbitrationReason spotlightMultiplexingDidDestroyScene];
    [v8 requestArbitrationForSBWindowScene:v9 forReason:v10];

    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarStyleAssertion];
    [(SBSpotlightMultiplexingViewController *)self _configureSceneObservation:0 forScene:v11];
  }
}

- (id)sceneHandle
{
  sceneHandle = self->_sceneHandle;
  if (!sceneHandle)
  {
    BOOL v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    int v5 = [(SBSpotlightMultiplexingViewController *)self _getSceneHandleFromSceneManager:v4];
    objc_super v6 = self->_sceneHandle;
    self->_sceneHandle = v5;

    sceneHandle = self->_sceneHandle;
  }
  return sceneHandle;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 previousSettings];
  int v9 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");

  uint64_t v10 = [v7 settings];

  id v11 = objc_msgSend(v10, "sb_displayIdentityForSceneManagers");

  if (v9 && v11 && ([v11 isEqual:v9] & 1) == 0)
  {
    uint64_t v12 = SBLogSpotlight();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543874;
      double v23 = self;
      __int16 v24 = 2114;
      double v25 = v9;
      __int16 v26 = 2114;
      int v27 = v11;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ notified that Spotlight scene has changed displays from %{public}@ to %{public}@", (uint8_t *)&v22, 0x20u);
    }

    id v13 = [(id)SBApp windowSceneManager];
    int v14 = [v13 windowSceneForDisplayIdentity:v11];
    objc_super v15 = [v14 sceneManager];

    if (v15)
    {
      uint64_t v16 = [v15 existingSceneHandleForScene:v6];

      if (!v16)
      {
        int v17 = [v13 windowSceneForDisplayIdentity:v9];
        int v18 = [v17 sceneManager];

        uint64_t v19 = [v6 identity];
        [v18 transferOwnershipOfSceneWithIdentity:v19 toSceneManager:v15];

        char v20 = [(SBSpotlightMultiplexingViewController *)self _getSceneHandleFromSceneManager:v15];
        sceneHandle = self->_sceneHandle;
        self->_sceneHandle = v20;
      }
    }
  }
}

- (id)_getSceneHandleFromSceneManager:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F62A60];
  id v5 = a3;
  id v6 = [(SBSpotlightMultiplexingViewController *)self _spotlightSceneIdentifier];
  id v7 = [v4 identityForIdentifier:v6 workspaceIdentifier:@"com.apple.Spotlight"];

  objc_super v8 = _SBApp(@"com.apple.Spotlight");
  int v9 = [v5 displayIdentity];
  uint64_t v10 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v8 sceneIdentity:v7 displayIdentity:v9];

  id v11 = [v5 fetchOrCreateApplicationSceneHandleForRequest:v10];

  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
  }
  else
  {
    int v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (void)_configureSceneObservation:(BOOL)a3 forScene:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = v6;
  if (v6)
  {
    if (v4 && (v7 = [(SBSpotlightMultiplexingViewController *)self isActiveDelegate], id v6 = v8, v7)) {
      [v8 addObserver:self];
    }
    else {
      [v6 removeObserver:self];
    }
    id v6 = v8;
  }
  [(SBSpotlightMultiplexingViewController *)self _evaluateSearchContentAvailabilityForScene:v6];
}

- (void)_evaluateSearchContentAvailabilityForScene:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(SBSpotlightMultiplexingViewController *)self isSearchContentAvailable];
  if (v7 && [(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
  {
    BOOL v5 = [v7 contentState] == 2;
    [(SBSpotlightMultiplexingViewController *)self setSearchContentAvailable:v5];
    if (v4 == v5) {
      goto LABEL_9;
    }
  }
  else
  {
    [(SBSpotlightMultiplexingViewController *)self setSearchContentAvailable:0];
    BOOL v5 = 0;
    if (!v4) {
      goto LABEL_9;
    }
  }
  id v6 = [(SBSpotlightMultiplexingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 spotlightMultiplexingViewController:self searchContentAvailabilityDidChange:v5];
  }

LABEL_9:
}

- (void)keyboardLayersDidChange:(id)a3
{
  BOOL v4 = [a3 identifier];
  BOOL v5 = [(SBSpotlightMultiplexingViewController *)self _spotlightSceneIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
  }
}

- (void)scrollToTopSceneProxyViewDidEnterViewHierarchy:(id)a3 rootedAtWindow:(id)a4
{
}

- (void)scrollToTopSceneProxyViewWillExitViewHierarchy:(id)a3 rootedAtWindow:(id)a4
{
}

- (id)_spotlightSceneIdentifier
{
  id v2 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  BOOL v3 = [v2 sceneIdentifier];

  return v3;
}

- (void)_configureStatusBarScrollToTopView
{
  if (!self->_scrollToTopView)
  {
    id v8 = [(SBSpotlightMultiplexingViewController *)self view];
    BOOL v3 = [SBScrollToTopSceneProxyView alloc];
    [v8 bounds];
    BOOL v4 = -[SBScrollToTopSceneProxyView initWithFrame:](v3, "initWithFrame:");
    scrollToTopView = self->_scrollToTopView;
    self->_scrollToTopView = v4;

    int v6 = self->_scrollToTopView;
    id v7 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
    [(SBScrollToTopSceneProxyView *)v6 setSceneHandle:v7];

    [(SBScrollToTopSceneProxyView *)self->_scrollToTopView setDelegate:self];
    [v8 addSubview:self->_scrollToTopView];
    [(SBSpotlightMultiplexingViewController *)self _registerStatusBarScrollToTopView];
  }
}

- (void)_registerStatusBarScrollToTopView
{
  id v4 = [(SBSpotlightMultiplexingViewController *)self view];
  BOOL v3 = [v4 window];
  [(SBSpotlightMultiplexingViewController *)self _registerStatusBarScrollToTopViewWithWindow:v3];
}

- (void)_registerStatusBarScrollToTopViewWithWindow:(id)a3
{
  scrollToTopView = self->_scrollToTopView;
  if (scrollToTopView) {
    [a3 _registerScrollToTopView:scrollToTopView];
  }
}

- (void)_unregisterStatusBarScrollToTopView
{
  id v4 = [(SBSpotlightMultiplexingViewController *)self view];
  BOOL v3 = [v4 window];
  [(SBSpotlightMultiplexingViewController *)self _unregisterStatusBarScrollToTopViewWithWindow:v3];
}

- (void)_unregisterStatusBarScrollToTopViewWithWindow:(id)a3
{
  scrollToTopView = self->_scrollToTopView;
  if (scrollToTopView) {
    [a3 _unregisterScrollToTopView:scrollToTopView];
  }
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAlphaTo:(double)a4
{
  id v5 = a3;
  int v6 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  id v7 = [v6 sceneIdentifier];
  int v8 = [v7 isEqualToString:v5];

  if (v8)
  {
    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
  }
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5
{
  id v6 = a3;
  id v7 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  int v8 = [v7 sceneIdentifier];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarHiddenAssertion];
  }
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  int v8 = [v7 sceneIdentifier];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    [(SBSpotlightMultiplexingViewController *)self _updateStatusBarStyleAssertionToStyle:a4 animated:1];
  }
}

- (BOOL)_isStatusBarEffectivelyHidden
{
  BOOL v3 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  id v4 = [v3 sceneIfExists];
  if (v4)
  {
    BOOL v5 = [(SBSpotlightMultiplexingViewController *)self isActiveDelegate];

    if (v5)
    {
      id v6 = [v3 statusBarStateProvider];
      if ([v6 statusBarHidden])
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        [v6 statusBarAlpha];
        LOBYTE(v4) = v7 == 0.0;
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)_updateStatusBarHiddenAssertion
{
  if ([(SBSpotlightMultiplexingViewController *)self _isStatusBarEffectivelyHidden])
  {
    unint64_t v3 = [(SBSpotlightMultiplexingViewController *)self _appStatusBarSettingsLevelForSpotlightMultiplexingLevel:[(SBSpotlightMultiplexingViewController *)self level]];
    id v4 = [(UIViewController *)self _sbWindowScene];
    BOOL v5 = [v4 statusBarManager];
    id v8 = [v5 assertionManager];

    id v6 = (SBWindowSceneStatusBarSettingsAssertion *)[v8 newSettingsAssertionWithStatusBarHidden:1 atLevel:v3 reason:@"hiding for Spotlight"];
    hideStatusBarAssertion = self->_hideStatusBarAssertion;
    self->_hideStatusBarAssertion = v6;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_hideStatusBarAssertion acquire];
  }
  else
  {
    [(SBSpotlightMultiplexingViewController *)self _clearStatusBarHiddenAssertion];
  }
}

- (void)_clearStatusBarHiddenAssertion
{
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_hideStatusBarAssertion invalidate];
  hideStatusBarAssertion = self->_hideStatusBarAssertion;
  self->_hideStatusBarAssertion = 0;
}

- (void)_updateStatusBarStyleAssertion
{
  unint64_t v3 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  id v4 = [v3 sceneIfExists];
  id v8 = [v4 settings];

  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v8 forcedStatusBarStyle];
    id v6 = v5;
    if (v5) {
      uint64_t v7 = [v5 integerValue];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(SBSpotlightMultiplexingViewController *)self _updateStatusBarStyleAssertionToStyle:v7 animated:1];
}

- (void)_updateStatusBarStyleAssertionToStyle:(int64_t)a3 animated:(BOOL)a4
{
  id v15 = objc_alloc_init(SBMutableStatusBarSettings);
  [(SBMutableStatusBarSettings *)v15 setStyle:_SBStatusBarLegacyStyleFromStyle(a3)];
  id v6 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:_SBStatusBarLegibilityStyleFromStyle(a3)];
  [(SBMutableStatusBarSettings *)v15 setLegibilitySettings:v6];

  unint64_t v7 = [(SBSpotlightMultiplexingViewController *)self _appStatusBarSettingsLevelForSpotlightMultiplexingLevel:[(SBSpotlightMultiplexingViewController *)self level]];
  id v8 = [(UIViewController *)self _sbWindowScene];
  int v9 = [v8 statusBarManager];
  uint64_t v10 = [v9 assertionManager];

  id v11 = (SBWindowSceneStatusBarSettingsAssertion *)[v10 newSettingsAssertionWithSettings:v15 atLevel:v7 reason:@"style for Spotlight"];
  statusBarStyleAssertion = self->_statusBarStyleAssertion;
  self->_statusBarStyleAssertion = v11;

  id v13 = self->_statusBarStyleAssertion;
  int v14 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
  [(SBWindowSceneStatusBarSettingsAssertion *)v13 acquireWithAnimationParameters:v14];
}

- (void)_clearStatusBarStyleAssertionAnimated:(BOOL)a3
{
  statusBarStyleAssertion = self->_statusBarStyleAssertion;
  if (a3)
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)statusBarStyleAssertion invalidateWithAnimationParameters:v5];
  }
  else
  {
    [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarStyleAssertion invalidate];
  }
  id v6 = self->_statusBarStyleAssertion;
  self->_statusBarStyleAssertion = 0;
}

- (unint64_t)_appStatusBarSettingsLevelForSpotlightMultiplexingLevel:(unint64_t)a3
{
  if (a3 == 3) {
    return 7;
  }
  else {
    return 4 * (a3 == 2);
  }
}

- (unint64_t)remoteSearchViewPresentationSource
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSpotlightMultiplexingViewController.m" lineNumber:872 description:@"Subclassers must override to use"];

  return 0;
}

- (BOOL)_remoteSearchViewControllerHasKeyboardPresented
{
  id v2 = [(id)objc_opt_class() sharedRemoteSearchViewController];
  char v3 = [v2 isKeyboardPresented];

  return v3;
}

- (void)_configureExternalKeyboardView
{
  BOOL v3 = [(SBSpotlightMultiplexingViewController *)self _remoteSearchViewControllerHasKeyboardPresented];
  [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView:v3];
}

- (void)_configureExternalKeyboardView:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [MEMORY[0x1E4F42B08] usesInputSystemUI];
  id v6 = [(SBSpotlightMultiplexingViewController *)self _effectiveKeyboardContentView];
  if (v6) {
    BOOL v7 = v3;
  }
  else {
    BOOL v7 = 0;
  }

  if (![(SBSpotlightMultiplexingViewController *)self wantsExternalKeyboardView])
  {
    [(SBSpotlightMultiplexingViewController *)self _returnKeyboardToSpotlightIfNecessary];
    [(SBSpotlightMultiplexingViewController *)self setExternalKeyboardView:0];
    goto LABEL_23;
  }
  id v8 = [(SBSpotlightMultiplexingViewController *)self sceneHandle];
  int v9 = [v8 sceneIfExists];
  uint64_t v10 = [(SBSpotlightMultiplexingViewController *)self externalKeyboardView];
  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v12 = [v9 settings];
    [v12 frame];
    uint64_t v10 = objc_msgSend(v11, "initWithFrame:");

    [(SBSpotlightMultiplexingViewController *)self setExternalKeyboardView:v10];
  }
  if (![(SBSpotlightMultiplexingViewController *)self isActiveDelegate])
  {
    [(SBSpotlightMultiplexingViewController *)self _returnKeyboardToSpotlightIfNecessary];
    goto LABEL_22;
  }
  if (!v5)
  {
    int v14 = [(SBSpotlightMultiplexingViewController *)self keyboardPresenter];
    if (v14) {
      goto LABEL_15;
    }
    int v17 = [v9 layerManager];
    int v18 = [v17 layers];
    uint64_t v19 = objc_msgSend(v18, "bs_firstObjectPassingTest:", &__block_literal_global_158);

    if (v19)
    {
      char v20 = [v9 uiPresentationManager];
      uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      int v22 = [v21 UUIDString];
      int v14 = [v20 createPresenterForLayerTarget:v19 identifier:v22];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2;
      v24[3] = &unk_1E6AF51C8;
      v24[4] = self;
      [v14 modifyPresentationContext:v24];
      [(SBSpotlightMultiplexingViewController *)self setKeyboardPresenter:v14];
      [v14 activate];

      if (v14)
      {
LABEL_15:
        id v15 = [(SBSpotlightMultiplexingViewController *)self keyboardHostView];

        if (!v15)
        {
          uint64_t v16 = [v14 presentationView];
          [(SBSpotlightMultiplexingViewController *)self setKeyboardHostView:v16];
          [v10 addSubview:v16];
        }
      }
    }
    else
    {
      int v14 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  id v13 = [(SBSpotlightMultiplexingViewController *)self hostedInputUIView];

  if (!v13)
  {
    int v14 = [(SBSpotlightMultiplexingViewController *)self inputUIView];
    if (v14)
    {
      [(SBSpotlightMultiplexingViewController *)self setHostedInputUIView:v14];
      [v10 bounds];
      objc_msgSend(v14, "setFrame:");
      [v10 addSubview:v14];
    }
    goto LABEL_21;
  }
LABEL_22:

LABEL_23:
  BOOL v23 = [(SBSpotlightMultiplexingViewController *)self externalKeyboardViewContainsKeyboard];
  if (v7 != v23) {
    [(SBSpotlightMultiplexingViewController *)self _notifyExternalKeyboardViewContainsKeyboard:v23];
  }
}

BOOL __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 type] - 3) < 2;
}

void __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v5 = *(void **)(a1 + 32);
  id v4 = (uint64_t *)(a1 + 32);
  id v6 = [v5 view];
  BOOL v7 = [v6 window];

  if (v7)
  {
    id v8 = [v3 hostTransformer];
    if (v8)
    {
      int v9 = [v3 hostTransformer];
      uint64_t v10 = [v9 mutableCopy];
    }
    else
    {
      uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F42BE0]);
    }

    memset(&v14, 0, sizeof(v14));
    [v7 interfaceOrientation];
    SBFTransformFromOrientationToOrientation();
    CGAffineTransformInvert(&v14, &v13);
    CGAffineTransform v12 = v14;
    id v11 = [MEMORY[0x1E4F42FD0] transformWithCGAffineTransform:&v12];
    [v10 addTransform:v11 reason:@"Configure External Keyboard View"];

    [v3 setHostTransformer:v10];
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2_cold_1(v4, v10);
    }
  }
}

- (void)_notifyExternalKeyboardViewContainsKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBSpotlightMultiplexingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 spotlightMultiplexingViewController:self externalKeyboardViewContainsKeyboardDidChange:v3];
  }
}

- (id)_effectiveKeyboardContentView
{
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI]) {
    [(SBSpotlightMultiplexingViewController *)self hostedInputUIView];
  }
  else {
  BOOL v3 = [(SBSpotlightMultiplexingViewController *)self keyboardHostView];
  }
  return v3;
}

- (void)_returnKeyboardToSpotlightIfNecessary
{
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    BOOL v3 = [(SBSpotlightMultiplexingViewController *)self hostedInputUIView];
    id v4 = [v3 window];
    id v5 = [(SBSpotlightMultiplexingViewController *)self view];
    id v6 = [v5 window];
    int v7 = [v4 isEqual:v6];

    if (v7)
    {
      id v8 = [(SBSpotlightMultiplexingViewController *)self hostedInputUIView];
      [v8 removeFromSuperview];
    }
    [(SBSpotlightMultiplexingViewController *)self setHostedInputUIView:0];
    int v9 = [(SBSpotlightMultiplexingViewController *)self inputUIView];
    if (v9)
    {
      id v13 = v9;
      uint64_t v10 = [(SBSpotlightMultiplexingViewController *)self view];
      [v10 addSubview:v13];
      [v10 bounds];
      UIRectGetCenter();
      objc_msgSend(v13, "setCenter:");

      int v9 = v13;
    }
  }
  else
  {
    id v11 = [(SBSpotlightMultiplexingViewController *)self keyboardHostView];
    [v11 removeFromSuperview];

    [(SBSpotlightMultiplexingViewController *)self setKeyboardHostView:0];
    CGAffineTransform v12 = [(SBSpotlightMultiplexingViewController *)self keyboardPresenter];
    [v12 invalidate];

    [(SBSpotlightMultiplexingViewController *)self setKeyboardPresenter:0];
  }
}

- (void)_acquireInputUIPresentingAssertionIfNecessary
{
  if (!self->_inputUIPresenterAssertion)
  {
    id v6 = [(id)SBApp systemUIScenesCoordinator];
    BOOL v3 = [v6 inputUISceneController];
    id v4 = [v3 addPresenter:self];
    inputUIPresenterAssertion = self->_inputUIPresenterAssertion;
    self->_inputUIPresenterAssertion = v4;
  }
}

- (void)_invalidateInputUIPresentingAssertion
{
  [(BSInvalidatable *)self->_inputUIPresenterAssertion invalidate];
  inputUIPresenterAssertion = self->_inputUIPresenterAssertion;
  self->_inputUIPresenterAssertion = 0;
}

- (void)_analyticsLogSpotlightInvocationWhereAndHowWithSource:(unint64_t)a3
{
}

id __95__SBSpotlightMultiplexingViewController__analyticsLogSpotlightInvocationWhereAndHowWithSource___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FA6508];
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FA6510];
  BOOL v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  id v5 = (*((void (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  id v6 = [v5 traitsOrientedViewController];

  int v7 = [v6 view];
  [(SBSpotlightMultiplexingViewController *)self setInputUIView:v7];

  [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
  return 0;
}

- (id)dismissScene:(id)a3
{
  id v4 = [(SBSpotlightMultiplexingViewController *)self inputUIView];
  [v4 removeFromSuperview];

  [(SBSpotlightMultiplexingViewController *)self setInputUIView:0];
  [(SBSpotlightMultiplexingViewController *)self _configureExternalKeyboardView];
  return 0;
}

- (id)parentSceneIdentityToken
{
  id v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  BOOL v3 = [v2 identityToken];

  return v3;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (BOOL)isVisibleOnScreen
{
  id v2 = [(SBSpotlightMultiplexingViewController *)self view];
  BOOL v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBSpotlightMultiplexingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSpotlightMultiplexingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SPUIRemoteSearchViewDelegate)spotlightDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spotlightDelegate);
  return (SPUIRemoteSearchViewDelegate *)WeakRetained;
}

- (void)setSpotlightDelegate:(id)a3
{
}

- (BOOL)wantsExternalKeyboardView
{
  return self->_wantsExternalKeyboardView;
}

- (UIView)externalKeyboardView
{
  return self->_externalKeyboardView;
}

- (void)setExternalKeyboardView:(id)a3
{
}

- (BOOL)isSearchContentAvailable
{
  return self->_searchContentAvailable;
}

- (void)setSearchContentAvailable:(BOOL)a3
{
  self->_searchContentAvailable = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  return (FBSDisplayConfiguration *)WeakRetained;
}

- (void)setTargetDisplayConfiguration:(id)a3
{
}

- (BOOL)isActiveDelegate
{
  return self->_activeDelegate;
}

- (void)setActiveDelegate:(BOOL)a3
{
  self->_activeDelegate = a3;
}

- (SBMedusaHostedKeyboardWindowLevelAssertion)medusaHostedKeyboardWindowLevelAssertion
{
  return self->_medusaHostedKeyboardWindowLevelAssertion;
}

- (void)setMedusaHostedKeyboardWindowLevelAssertion:(id)a3
{
}

- (UIView)keyboardHostView
{
  return self->_keyboardHostView;
}

- (void)setKeyboardHostView:(id)a3
{
}

- (UIView)inputUIView
{
  return self->_inputUIView;
}

- (void)setInputUIView:(id)a3
{
}

- (UIView)hostedInputUIView
{
  return self->_hostedInputUIView;
}

- (void)setHostedInputUIView:(id)a3
{
}

- (UIScenePresenter)keyboardPresenter
{
  return self->_keyboardPresenter;
}

- (void)setKeyboardPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPresenter, 0);
  objc_storeStrong((id *)&self->_hostedInputUIView, 0);
  objc_storeStrong((id *)&self->_inputUIView, 0);
  objc_storeStrong((id *)&self->_keyboardHostView, 0);
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowLevelAssertion, 0);
  objc_destroyWeak((id *)&self->_targetDisplayConfiguration);
  objc_storeStrong((id *)&self->_externalKeyboardView, 0);
  objc_destroyWeak((id *)&self->_spotlightDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_inputUIPresenterAssertion, 0);
  objc_destroyWeak((id *)&self->_inputUIPresentingDelegate);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_scrollToTopView, 0);
}

void __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Couldn't orient external keyboard for Spotlight presentation since not in the view hierarchy yet %{public}@", (uint8_t *)&v3, 0xCu);
}

@end