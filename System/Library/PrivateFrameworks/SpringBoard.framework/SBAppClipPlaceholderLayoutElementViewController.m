@interface SBAppClipPlaceholderLayoutElementViewController
- (BOOL)SB_conformsToMainDisplaySceneLayoutElementViewControlling;
- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescriberProviding;
- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescribing;
- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding;
- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding;
- (BOOL)sceneWantsDeviceOrientationEventsEnabled;
- (BOOL)statusBarHidden;
- (CGRect)statusBarAvoidanceFrame;
- (FBScene)sceneToHandleStatusBarTapIfExists;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)statusBarSceneIdentifier;
- (SBDeviceApplicationSceneHandle)classicApplicationSceneHandleIfExists;
- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider;
- (SBDeviceApplicationSceneStatusBarStateObserver)statusBarDelegate;
- (_UIStatusBarData)overlayStatusBarData;
- (double)statusBarAlpha;
- (id)_aggregateStatusBarOverrideSettings;
- (id)_newDisplayLayoutElementForEntity:(id)a3;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5;
- (int64_t)defaultStatusBarStyle;
- (int64_t)statusBarStyle;
- (unint64_t)supportedContentInterfaceOrientations;
- (void)_beginObservingApplicationInstalls;
- (void)_beginPollingUpdateStillAvailable;
- (void)_cleanup;
- (void)_installedApplicationsDidChange:(id)a3;
- (void)_launchApplication:(id)a3;
- (void)_statusBarAssertionDidUpdate;
- (void)_stopObservingApplicationInstalls;
- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6;
- (void)invalidate;
- (void)prepareForReuse;
- (void)setCornerRadiusConfiguration:(id)a3;
- (void)setMaskDisplayCorners:(BOOL)a3 forReason:(id)a4;
- (void)setStatusBarDelegate:(id)a3;
- (void)statusBarAssertionDidInvalidate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBAppClipPlaceholderLayoutElementViewController

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  [(SBLayoutElementViewController *)&v3 invalidate];
  [(SBAppClipPlaceholderLayoutElementViewController *)self _cleanup];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  [(SBLayoutElementViewController *)&v3 prepareForReuse];
  [(SBAppClipPlaceholderLayoutElementViewController *)self _cleanup];
}

- (void)_cleanup
{
  placeholderViewController = self->_placeholderViewController;
  if (placeholderViewController)
  {
    [(SBAppClipOverlayViewController *)placeholderViewController invalidate];
    [(SBAppClipPlaceholderLayoutElementViewController *)self bs_removeChildViewController:self->_placeholderViewController];
    v4 = self->_placeholderViewController;
    self->_placeholderViewController = 0;
  }
  [(SBAppClipPlaceholderLayoutElementViewController *)self _stopObservingApplicationInstalls];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = 0;

  sceneIdentifier = self->_sceneIdentifier;
  self->_sceneIdentifier = 0;

  [(NSMutableArray *)self->_statusBarAssertions removeAllObjects];
  statusBarAssertions = self->_statusBarAssertions;
  self->_statusBarAssertions = 0;

  maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
  self->_maskDisplayCornersReasons = 0;

  v9 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  v10 = [v9 layer];
  [v10 setMaskedCorners:0];

  id v11 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  [v11 setClipsToBounds:0];
}

- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  id v14 = a3;
  -[SBLayoutElementViewController configureWithWorkspaceEntity:forLayoutElement:layoutState:referenceFrame:](&v30, sel_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame_, v14, a4, a5, x, y, width, height);
  v15 = objc_msgSend(v14, "appClipPlaceholderEntity", v30.receiver, v30.super_class);

  if (!v15)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"SBAppClipPlaceholderLayoutElementViewController.m" lineNumber:92 description:@"Can only configure app clip placeholder entities."];
  }
  [(SBAppClipPlaceholderLayoutElementViewController *)self loadViewIfNeeded];
  placeholderViewController = self->_placeholderViewController;
  if ((placeholderViewController == 0) == (self->_bundleIdentifier == 0))
  {
    if (placeholderViewController) {
      goto LABEL_8;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"SBAppClipPlaceholderLayoutElementViewController.m" lineNumber:96 description:@"Unexpected state. Are we trying to reuse this VC without going through -prepareForReuse?"];

    if (self->_placeholderViewController) {
      goto LABEL_8;
    }
  }
  v17 = [v15 bundleIdentifier];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v17;

  v19 = [v15 futureSceneIdentifier];
  sceneIdentifier = self->_sceneIdentifier;
  self->_sceneIdentifier = v19;

  self->_isPendingUpdate = [v15 needsUpdate];
  v21 = [SBAppClipOverlayViewController alloc];
  v22 = [(id)SBApp appClipOverlayCoordinator];
  v23 = [(SBAppClipOverlayViewController *)v21 initWithCoordinator:v22 bundleIdentifier:self->_bundleIdentifier sceneIdentifier:self->_sceneIdentifier];
  v24 = self->_placeholderViewController;
  self->_placeholderViewController = v23;

  v25 = self->_placeholderViewController;
  v26 = [(SBLayoutElementViewController *)self _contentContainerView];
  [(SBAppClipPlaceholderLayoutElementViewController *)self bs_addChildViewController:v25 withSuperview:v26];

  [(SBAppClipOverlayViewController *)self->_placeholderViewController setDisplayedOverPlaceholder:1 animated:0];
  [(SBAppClipOverlayViewController *)self->_placeholderViewController setSceneActivationState:-1 animated:0];
  if (self->_isPendingUpdate) {
    [(SBAppClipOverlayViewController *)self->_placeholderViewController setNeedsUpdate];
  }
  v27 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  [v27 setNeedsLayout];

LABEL_8:
}

- (unint64_t)supportedContentInterfaceOrientations
{
  return 30;
}

- (id)_newDisplayLayoutElementForEntity:(id)a3
{
  objc_super v3 = [a3 appClipPlaceholderEntity];
  id v4 = objc_alloc(MEMORY[0x1E4FA6A68]);
  v5 = [v3 futureSceneIdentifier];
  v6 = (void *)[v4 initWithIdentifier:v5];

  v7 = [v3 bundleIdentifier];
  [v6 setBundleIdentifier:v7];

  [v6 setUIApplicationElement:1];
  return v6;
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  [v11 topLeft];
  double v5 = v4;
  [v11 bottomLeft];
  uint64_t v13 = v6;
  [v11 bottomRight];
  uint64_t v14 = v7;
  [v11 topRight];
  uint64_t v15 = v8;
  for (uint64_t i = 8; i != 32; i += 8)
  {
    if (v5 < *(double *)&v12[i]) {
      double v5 = *(double *)&v12[i];
    }
  }
  v10 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  [v10 _setContinuousCornerRadius:v5];
}

- (void)setMaskDisplayCorners:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
  id v16 = v6;
  if (v4)
  {
    if (!maskDisplayCornersReasons)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      v9 = self->_maskDisplayCornersReasons;
      self->_maskDisplayCornersReasons = v8;

      id v6 = v16;
      maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
    }
    [(NSMutableSet *)maskDisplayCornersReasons addObject:v6];
  }
  else
  {
    [(NSMutableSet *)maskDisplayCornersReasons removeObject:v6];
  }
  v10 = [(SBLayoutElementViewController *)self layoutElement];
  id v11 = [(SBLayoutElementViewController *)self layoutState];
  uint64_t v12 = SBCornerMaskForElementInLayoutState(v10, v11, [(NSMutableSet *)self->_maskDisplayCornersReasons count] != 0);

  uint64_t v13 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  uint64_t v14 = [v13 layer];
  [v14 setMaskedCorners:v12];

  uint64_t v15 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  [v15 setClipsToBounds:v12 != 0];
}

- (BOOL)SB_conformsToMainDisplaySceneLayoutElementViewControlling
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  [(SBAppClipPlaceholderLayoutElementViewController *)&v13 viewDidLayoutSubviews];
  objc_super v3 = [(SBLayoutElementViewController *)self _contentContainerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(SBAppClipOverlayViewController *)self->_placeholderViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  [(SBAppClipPlaceholderLayoutElementViewController *)&v5 viewDidLoad];
  objc_super v3 = [(SBAppClipPlaceholderLayoutElementViewController *)self view];
  double v4 = [MEMORY[0x1E4F428B8] whiteColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  [(SBAppClipPlaceholderLayoutElementViewController *)&v20 viewWillAppear:a3];
  objc_super v5 = +[SBApplicationPlaceholderController sharedInstance];
  double v6 = [v5 placeholderForDisplayID:self->_bundleIdentifier];

  if (v6 || self->_isPendingUpdate)
  {
    double v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      bundleIdentifier = self->_bundleIdentifier;
      sceneIdentifier = self->_sceneIdentifier;
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      __int16 v23 = 2114;
      v24 = bundleIdentifier;
      __int16 v25 = 2114;
      v26 = sceneIdentifier;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Placeholder present or update available, will observe installation for app clip: %{public}@:%{public}@", buf, 0x20u);
    }
    [(SBAppClipPlaceholderLayoutElementViewController *)self _beginObservingApplicationInstalls];
    if (self->_isPendingUpdate) {
      [(SBAppClipPlaceholderLayoutElementViewController *)self _beginPollingUpdateStillAvailable];
    }
  }
  else
  {
    uint64_t v12 = +[SBApplicationController sharedInstance];
    objc_super v13 = [v12 applicationWithBundleIdentifier:self->_bundleIdentifier];

    if (!v13)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"SBAppClipPlaceholderLayoutElementViewController.m", 190, @"If we don't have a placeholder, we expect to have an installed application for %@", self->_bundleIdentifier object file lineNumber description];
    }
    uint64_t v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      v17 = self->_bundleIdentifier;
      v18 = self->_sceneIdentifier;
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      __int16 v23 = 2114;
      v24 = v17;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Application already present, will launch app clip: %{public}@:%{public}@", buf, 0x20u);
    }
    [(SBAppClipPlaceholderLayoutElementViewController *)self _launchApplication:v13];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  [(SBAppClipPlaceholderLayoutElementViewController *)&v4 viewWillDisappear:a3];
  [(SBAppClipPlaceholderLayoutElementViewController *)self _stopObservingApplicationInstalls];
}

- (void)statusBarAssertionDidInvalidate:(id)a3
{
  [(NSMutableArray *)self->_statusBarAssertions removeObject:a3];
  [(SBAppClipPlaceholderLayoutElementViewController *)self _statusBarAssertionDidUpdate];
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 1;
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  return [(SBAppClipPlaceholderLayoutElementViewController *)self statusBarAssertionWithStatusBarHidden:a3 atLevel:a5];
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  BOOL v5 = a3;
  double v7 = objc_alloc_init(SBMutableStatusBarSettings);
  double v8 = 1.0;
  if (v5) {
    double v8 = 0.0;
  }
  double v9 = [NSNumber numberWithDouble:v8];
  [(SBMutableStatusBarSettings *)v7 setAlpha:v9];

  double v10 = [[SBSceneViewStatusBarAssertion alloc] initWithStatusBarSettings:v7 nubViewHidden:0x7FFFFFFFFFFFFFFFLL atLevel:a4];
  [(SBSceneViewStatusBarAssertion *)v10 addObserver:self];
  statusBarAssertions = self->_statusBarAssertions;
  if (!statusBarAssertions)
  {
    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v13 = self->_statusBarAssertions;
    self->_statusBarAssertions = v12;

    statusBarAssertions = self->_statusBarAssertions;
  }
  [(NSMutableArray *)statusBarAssertions addObject:v10];
  [(SBAppClipPlaceholderLayoutElementViewController *)self _statusBarAssertionDidUpdate];

  return v10;
}

- (void)_statusBarAssertionDidUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  sceneIdentifier = self->_sceneIdentifier;
  [(SBAppClipPlaceholderLayoutElementViewController *)self statusBarAlpha];
  objc_msgSend(WeakRetained, "sceneWithIdentifier:didChangeStatusBarAlphaTo:", sceneIdentifier);
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescriberProviding
{
  return 1;
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescribing
{
  return 1;
}

- (int64_t)statusBarStyle
{
  return 1;
}

- (int64_t)defaultStatusBarStyle
{
  return 1;
}

- (BOOL)statusBarHidden
{
  return 0;
}

- (double)statusBarAlpha
{
  if (![(NSMutableArray *)self->_statusBarAssertions count]) {
    return 1.0;
  }
  objc_super v3 = [(SBAppClipPlaceholderLayoutElementViewController *)self _aggregateStatusBarOverrideSettings];
  objc_super v4 = [v3 alpha];
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (CGRect)statusBarAvoidanceFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  return 0;
}

- (NSString)statusBarSceneIdentifier
{
  return self->_sceneIdentifier;
}

- (_UIStatusBarData)overlayStatusBarData
{
  return 0;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider
{
  return 0;
}

- (SBDeviceApplicationSceneHandle)classicApplicationSceneHandleIfExists
{
  return 0;
}

- (FBScene)sceneToHandleStatusBarTapIfExists
{
  return 0;
}

- (id)_aggregateStatusBarOverrideSettings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v2 = [(NSMutableArray *)self->_statusBarAssertions sortedArrayUsingComparator:&__block_literal_global_192];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    double v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = [v8 settings];

        if (v9)
        {
          double v10 = [v8 settings];
          double v11 = v10;
          if (v5) {
            [v5 applySettings:v10];
          }
          else {
            double v5 = (void *)[v10 mutableCopy];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

uint64_t __86__SBAppClipPlaceholderLayoutElementViewController__aggregateStatusBarOverrideSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "level"));
  double v7 = NSNumber;
  uint64_t v8 = [v5 level];

  double v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)_beginObservingApplicationInstalls
{
  if (!self->_isObservingApplicationInstalls)
  {
    self->_isObservingApplicationInstalls = 1;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = +[SBApplicationController sharedInstance];
    [v4 addObserver:self selector:sel__installedApplicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:v3];
  }
}

- (void)_stopObservingApplicationInstalls
{
  if (self->_isObservingApplicationInstalls)
  {
    self->_isObservingApplicationInstalls = 0;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = +[SBApplicationController sharedInstance];
    [v4 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:v3];
  }
}

- (void)_beginPollingUpdateStillAvailable
{
  if (self->_isPendingUpdate)
  {
    if (self->_bundleIdentifier)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v2 = dispatch_time(0, 8000000000);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __84__SBAppClipPlaceholderLayoutElementViewController__beginPollingUpdateStillAvailable__block_invoke;
      v3[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v4, &location);
      dispatch_after(v2, MEMORY[0x1E4F14428], v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __84__SBAppClipPlaceholderLayoutElementViewController__beginPollingUpdateStillAvailable__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 136);
    if (v3)
    {
      id v4 = v3;
      BOOL v5 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:v4];
      uint64_t v6 = SBLogCommon();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          uint64_t v8 = (objc_class *)objc_opt_class();
          double v9 = NSStringFromClass(v8);
          int v14 = 138543618;
          long long v15 = v9;
          __int16 v16 = 2114;
          id v17 = v4;
          _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ The update for %{public}@ is still available. Polling.", (uint8_t *)&v14, 0x16u);
        }
        [v2 _beginPollingUpdateStillAvailable];
      }
      else
      {
        if (v7)
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          double v11 = NSStringFromClass(v10);
          int v14 = 138543618;
          long long v15 = v11;
          __int16 v16 = 2114;
          id v17 = v4;
          _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ The update for %{public}@ is no longer available. Launching previous version.", (uint8_t *)&v14, 0x16u);
        }
        uint64_t v12 = +[SBApplicationController sharedInstance];
        long long v13 = [v12 applicationWithBundleIdentifier:v4];

        if (v13)
        {
          v2[1112] = 0;
          [v2 _launchApplication:v13];
        }
      }
    }
  }
}

- (void)_installedApplicationsDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = +[SBApplicationController sharedInstance];
  BOOL v5 = [v4 applicationWithBundleIdentifier:self->_bundleIdentifier];

  uint64_t v6 = SBLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      __int16 v25 = 2114;
      v26 = bundleIdentifier;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Application did finish installing: %{public}@", buf, 0x16u);
    }
    double v11 = (void *)MEMORY[0x1E4F624D8];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __83__SBAppClipPlaceholderLayoutElementViewController__installedApplicationsDidChange___block_invoke;
    objc_super v20 = &unk_1E6AF5290;
    v21 = self;
    id v22 = v5;
    uint64_t v12 = [v11 eventWithName:@"LaunchAppClipApplication" handler:&v17];
    long long v13 = objc_msgSend(MEMORY[0x1E4F624E0], "sharedInstance", v17, v18, v19, v20, v21);
    [v13 executeOrAppendEvent:v12];
  }
  else
  {
    if (v7)
    {
      int v14 = (objc_class *)objc_opt_class();
      long long v15 = NSStringFromClass(v14);
      __int16 v16 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      __int16 v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Installed applications did change, but we still don't have an application for: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __83__SBAppClipPlaceholderLayoutElementViewController__installedApplicationsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchApplication:*(void *)(a1 + 40)];
}

- (void)_launchApplication:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBAppClipPlaceholderLayoutElementViewController.m", 396, @"We expect to have an application at this point for %@:%@", self->_bundleIdentifier, self->_sceneIdentifier object file lineNumber description];
  }
  uint64_t v6 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v5 uniqueIdentifier:self->_sceneIdentifier];
  BOOL v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  double v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    __int16 v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Will launch app clip from placeholder with workspace entity: %{public}@", buf, 0x16u);
  }

  uint64_t v10 = (void *)MEMORY[0x1E4F628D8];
  double v11 = [v5 bundleIdentifier];
  uint64_t v12 = [v10 storeForApplication:v11];

  long long v13 = [(SBApplicationSceneEntity *)v6 sceneHandle];
  int v14 = [v13 sceneIdentifier];
  long long v15 = [v12 sceneStoreForIdentifier:v14 creatingIfNecessary:0];

  __int16 v16 = [v15 objectForKey:@"appClipIdentifier"];
  uint64_t v17 = [(id)SBApp webClipService];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke;
  v21[3] = &unk_1E6B03F70;
  id v22 = v6;
  id v23 = v8;
  v24 = self;
  id v18 = v8;
  v19 = v6;
  [v17 buildLaunchActionsForAppClipWithWebClipIdentifier:v16 completion:v21];
}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addActions:a2];
  uint64_t v3 = +[SBWorkspace mainWorkspace];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_2;
  v5[3] = &unk_1E6AF67B0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_69;
  v4[3] = &unk_1E6AFBD00;
  v4[4] = *(void *)(a1 + 48);
  [v3 requestTransitionWithOptions:0 builder:v5 validator:v4];
}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabel:@"ActivateAppClipFromPlaceholder"];
  [v3 setSource:44];
  [v3 setTransactionProvider:&__block_literal_global_64];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_4;
  v8[3] = &unk_1E6AF57C0;
  id v9 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_5;
  v5[3] = &unk_1E6AF4A98;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = (id)[v3 addCompletionHandler:v5];
}

SBActivateAppClipFromPlaceholderWorkspaceTransaction *__70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(SBAppToAppWorkspaceTransaction *)[SBActivateAppClipFromPlaceholderWorkspaceTransaction alloc] initWithTransitionRequest:v2];

  return v3;
}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setActivatingEntity:v2];
  [v3 setWaitsForSceneUpdates:0];
}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogCommon();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Did launch app clip from placeholder with workspace entity: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5_cold_1(a1, v5);
  }
}

BOOL __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _sbWindowScene];
  id v5 = [v4 switcherController];

  if (!v5)
  {
    uint64_t v6 = SBLogCommon();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7) {
      NSLog(&cfstr_ExpectedASwitc.isa);
    }
  }
  if ([v5 unlockedEnvironmentMode] == 2) {
    [v3 modifyApplicationContext:&__block_literal_global_75_2];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 1088)) {
    BOOL v9 = *(void *)(v8 + 1096) != 0;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_2_73(uint64_t a1, void *a2)
{
  return [a2 setRequestedUnlockedEnvironmentMode:2];
}

- (SBDeviceApplicationSceneStatusBarStateObserver)statusBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  return (SBDeviceApplicationSceneStatusBarStateObserver *)WeakRetained;
}

- (void)setStatusBarDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_storeStrong((id *)&self->_maskDisplayCornersReasons, 0);
  objc_storeStrong((id *)&self->_statusBarAssertions, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end