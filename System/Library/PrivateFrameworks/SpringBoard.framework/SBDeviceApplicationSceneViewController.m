@interface SBDeviceApplicationSceneViewController
- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding;
- (BOOL)_activeOverlaysWantResignActiveAssertion;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isApplicationStatusBarHidden;
- (BOOL)_shouldSuppressHomeGrabber;
- (BOOL)_statusBarHasMatchMoveAnimation;
- (BOOL)definesPresentationContext;
- (BOOL)overlayViewProviderIsHostedInNonrotatingWindow:(id)a3;
- (BOOL)overlayViewProviderIsHostedInSecureWindow:(id)a3;
- (BOOL)rendersWhileLocked;
- (BOOL)sceneRendersAsynchronously;
- (BOOL)sceneResizesHostedContext;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldDrawStatusBarInsideSceneView;
- (MTLumaDodgePillSettings)homeGrabberPillSettings;
- (NSHashTable)_statusBarAssertions;
- (NSString)sceneMinificationFilter;
- (SBApplicationSceneBackgroundView)backgroundView;
- (SBDeviceApplicationSceneViewController)initWithSceneHandle:(id)a3;
- (SBDeviceApplicationSceneViewControllerDelegate)delegate;
- (SBHomeGrabberView)homeGrabberView;
- (double)currentStatusBarHeight;
- (id)_underlyingStatusBarViewIfAvailable;
- (id)animationFactoryForImplicitTransitionFromMode:(int64_t)a3 toMode:(int64_t)a4 defaultFactory:(id)a5;
- (id)backgroundActivitiesToSuppress;
- (id)hostWindowForOverlayViewProvider:(id)a3;
- (id)initialTraitsParticipantForOverlayViewProvider:(id)a3;
- (id)prepareForContentRotation;
- (id)statusBar:(id)a3 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:(id)a4;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4;
- (id)statusBarAssertionWithStatusBarSettings:(id)a3 atLevel:(unint64_t)a4;
- (id)windowSceneForOverlayViewProvider:(id)a3;
- (int64_t)_currentStatusBarStyle;
- (int64_t)_currentStatusBarStyleForPartWithIdentifier:(id)a3;
- (int64_t)_effectiveStyleForPartIdentifier:(id)a3;
- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3;
- (int64_t)homeGrabberDisplayMode;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3;
- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (void)_addStatusBarMatchMoveAnimationForView:(id)a3;
- (void)_applyBackgroundActivitiesToSuppress:(id)a3 toSceneWithIdentifier:(id)a4;
- (void)_configureForCurrentSecureDisplayState;
- (void)_configureForSecureDisplay:(BOOL)a3;
- (void)_configureStatusBarWithCurrentStyleRequest;
- (void)_createSceneOverlayViewProvidersIfNecessary;
- (void)_createStatusBar;
- (void)_deactivateOverlay:(id)a3 forViewProvider:(id)a4;
- (void)_destroySceneOverlayViewProviders;
- (void)_didDisableSecureDisplay;
- (void)_layoutStatusBar;
- (void)_recalculateResignActiveAssertionForActiveOverlays;
- (void)_relinquishResignActiveAssertion;
- (void)_removeStatusBar;
- (void)_removeStatusBarMatchMoveAnimation;
- (void)_setRealStatusBarStyleDelegate:(id)a3;
- (void)_setStatusBarAssertions:(id)a3;
- (void)_setStatusBarStyle:(int64_t)a3;
- (void)_setStatusBarStyle:(int64_t)a3 forPartWithIdentifier:(id)a4;
- (void)_setupStatusBarStylesFromSceneHandle:(id)a3;
- (void)_statusBarScrollToTop:(id)a3;
- (void)_statusBarShowDebug:(id)a3;
- (void)_statusBarTapped:(id)a3 type:(int64_t)a4;
- (void)_updateStatusBarAppearanceForOverlayProvider:(id)a3;
- (void)_updateStatusBarState;
- (void)_willEnableSecureDisplay;
- (void)activateOverlayForViewProvider:(id)a3;
- (void)beginMaskingForReason:(int64_t)a3 continuation:(id)a4 scene:(id)a5;
- (void)containerDidUpdateTraitsParticipant:(id)a3;
- (void)deactivateOverlayForViewProvider:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)invalidate;
- (void)invalidateMasking:(id)a3;
- (void)overlayViewProviderNeedsStatusBarAppearanceUpdate:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didMoveFromSceneManager:(id)a4;
- (void)sceneView:(id)a3 changedPreferredStatusBarStyleTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5;
- (void)setHomeGrabberDisplayMode:(int64_t)a3;
- (void)setHomeGrabberPillSettings:(id)a3;
- (void)setRendersWhileLocked:(BOOL)a3;
- (void)setSceneMinificationFilter:(id)a3;
- (void)setSceneRendersAsynchronously:(BOOL)a3;
- (void)setSceneResizesHostedContext:(BOOL)a3;
- (void)setShouldDrawStatusBarInsideSceneView:(BOOL)a3;
- (void)statusBarAssertionDidInvalidate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6;
@end

@implementation SBDeviceApplicationSceneViewController

- (void)_layoutStatusBar
{
  if (self->_statusBar)
  {
    v3 = [(SBDeviceApplicationSceneViewController *)self view];
    v4 = [(SBSceneViewController *)self sceneHandle];
    v5 = [v4 application];
    v6 = [(UIStatusBar *)self->_statusBar styleRequest];
    v33 = v3;
    [v3 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = [v4 statusBarOrientation];
    uint64_t v16 = v15;
    if (([v5 isMedusaCapable] & 1) == 0)
    {
      v17 = [v4 statusBarStateProvider];
      uint64_t v16 = [v17 statusBarOrientation];
    }
    if (([v4 isEffectivelyForeground] & 1) == 0)
    {
      v18 = [(SBSceneViewController *)self _sceneView];
      uint64_t v15 = [v18 orientation];
    }
    if ((unint64_t)(v16 - 3) < 2 != (unint64_t)(v15 - 3) < 2) {
      double v19 = v14;
    }
    else {
      double v19 = v12;
    }
    objc_msgSend(MEMORY[0x1E4F42E28], "heightForStyle:orientation:", objc_msgSend(v6, "style"), v16);
    double v21 = v20;
    v22 = [v4 displayIdentity];
    v34 = [v22 currentConfiguration];
    int v23 = [v5 classicAppNonFullScreenWithHomeAffordance];
    if ([v22 isMainRootDisplay])
    {
      if (v23)
      {
        v24 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v25 = [v24 userInterfaceIdiom];

        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ([v5 classicAppPhoneAppRunningOnPad] & 1) == 0)
        {
          +[SBUIController statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:](SBUIController, "statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:", v4, v34, v16, v6, 0, v8, v10, v12, v14);
          double v8 = v26;
          double v10 = v27;
          double v19 = v28;
          double v21 = v29;
        }
      }
    }
    v30 = +[SBMedusaDomain rootSettings];
    if ([v30 statusBarDebugOffsettingEnabled])
    {
      v36.origin.x = v8;
      v36.origin.y = v10;
      v36.size.width = v19;
      v36.size.height = v21;
      CGRectGetHeight(v36);
    }
    -[UIStatusBar setBounds:](self->_statusBar, "setBounds:", v8, v10, v19, v21);
    statusBar = self->_statusBar;
    UIRectGetCenter();
    -[UIStatusBar setCenter:](statusBar, "setCenter:");
    if ((BSFloatIsOne() & 1) == 0)
    {
      v32 = self->_statusBar;
      CGAffineTransformMakeScale(&v35, 1.0, 1.0);
      [(UIStatusBar *)v32 setTransform:&v35];
    }
    [(UIStatusBar *)self->_statusBar setAutoresizingMask:34];
    [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView setContentOrientation:v16];
    [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView setContainerOrientation:v15];
    [(UIStatusBar *)self->_statusBar requestResolvedStyle:[(UIStatusBar *)self->_statusBar currentResolvedStyle]];
  }
}

- (id)statusBar:(id)a3 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SBSceneViewController *)self sceneHandle];
  double v9 = [v8 statusBarStateProvider];
  double v10 = [v9 backgroundActivitiesToSuppress];

  double v11 = v7;
  if ((*(unsigned char *)&self->_conformanceFlags & 2) != 0)
  {
    double v11 = [(UIStatusBarStyleDelegate_SpringBoardOnly *)self->_realStatusBarStyleDelegate statusBar:v6 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:v7];
  }
  double v12 = (void *)[v11 mutableCopy];
  [v12 minusSet:v10];

  return v12;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneViewController;
  [(SBDeviceApplicationSceneViewController *)&v3 viewDidLayoutSubviews];
  [(SBDeviceApplicationSceneViewController *)self _layoutStatusBar];
}

- (void)_updateStatusBarState
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(SBDeviceApplicationSceneViewController *)self isViewLoaded])
  {
    if ([(NSHashTable *)self->_statusBarAssertions count] || self->_shouldDrawStatusBarInsideSceneView)
    {
      objc_super v3 = [(NSHashTable *)self->_statusBarAssertions allObjects];
      v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_136];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        double v8 = 0;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v5);
            }
            double v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            double v12 = [v11 settings];

            if (v12)
            {
              double v13 = [v11 settings];
              double v14 = v13;
              if (v8) {
                [v8 applySettings:v13];
              }
              else {
                double v8 = (void *)[v13 mutableCopy];
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v7);
      }
      else
      {
        double v8 = 0;
      }

      if (!self->_statusBar) {
        [(SBDeviceApplicationSceneViewController *)self _createStatusBar];
      }
      [(SBDeviceApplicationSceneViewController *)self _configureStatusBarWithCurrentStyleRequest];
      if (!self->_statusBar) {
        goto LABEL_33;
      }
      if (v8)
      {
        uint64_t v15 = [v8 alpha];
        if (!v15)
        {
          double v18 = 1.0;
          goto LABEL_30;
        }
        uint64_t v16 = [v8 alpha];
        [v16 floatValue];
        double v18 = v17;
      }
      else
      {
        uint64_t v15 = [(SBSceneViewController *)self sceneHandle];
        uint64_t v16 = [v15 statusBarStateProvider];
        [v16 statusBarAlpha];
        double v18 = v19;
      }

LABEL_30:
      BOOL v23 = [(SBDeviceApplicationSceneViewController *)self _isApplicationStatusBarHidden];
      double v24 = 0.0;
      if (!v23) {
        double v24 = v18;
      }
      [(UIStatusBar *)self->_statusBar setAlpha:v24];
      [v8 setAlpha:&unk_1F334A028];
LABEL_33:
      [(SBApplicationSceneViewController *)self _setOverrideStatusBarSettings:v8];
      uint64_t v25 = [(SBSceneViewController *)self _sceneView];
      [v25 setForcesStatusBarHidden:1];

      return;
    }
    [(SBDeviceApplicationSceneViewController *)self _removeStatusBar];
    [(SBApplicationSceneViewController *)self _setOverrideStatusBarSettings:0];
    double v20 = [(SBSceneViewController *)self _sceneView];
    [v20 setForcesStatusBarHidden:0];

    id v26 = [(SBSceneViewController *)self sceneHandle];
    double v21 = [v26 statusBarStateProvider];
    [v21 removeStatusBarObserver:self];

    v22 = [v26 breadcrumbProvider];
    [v22 removeObserver:self];
  }
}

- (void)_configureStatusBarWithCurrentStyleRequest
{
  if (self->_statusBar)
  {
    objc_super v3 = [(SBSceneViewController *)self sceneHandle];
    uint64_t v4 = [(SBApplicationSceneViewController *)self overrideStatusBarStyle];
    if (v4 == -1) {
      [v3 currentEffectiveStatusBarStyleRequest];
    }
    else {
    id v5 = [v3 statusBarEffectiveStyleRequestWithStyle:_SBStatusBarStyleFromLegacyStyle(v4)];
    }
    [(UIStatusBar *)self->_statusBar setStyleRequest:v5];
    [(UIStatusBar *)self->_statusBar setHidden:[(SBDeviceApplicationSceneViewController *)self _isApplicationStatusBarHidden]];
    -[UIStatusBar sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:](self->_statusBar, "sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:", [v3 statusBarParts]);
    uint64_t v6 = [(UIViewController *)self _sbWindowScene];
    uint64_t v7 = [v6 statusBarManager];
    [v3 statusBarAvoidanceFrame];
    objc_msgSend(v7, "setAvoidanceFrame:reason:statusBar:animationSettings:", @"SBDeviceApplicationSceneViewController", self->_statusBar, 0);

    double v8 = [v3 breadcrumbProvider];
    uint64_t v9 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke;
    v15[3] = &unk_1E6AF4E00;
    v15[4] = self;
    id v10 = v8;
    id v16 = v10;
    id v11 = v3;
    id v17 = v11;
    [v9 performWithoutAnimation:v15];
    if ([(_SBStatusBarChanges *)self->_statusBarChanges statusBarStyleChanged]) {
      [(SBDeviceApplicationSceneViewController *)self _setStatusBarStyle:[(_SBStatusBarChanges *)self->_statusBarChanges statusBarStyle]];
    }
    if ([(_SBStatusBarChanges *)self->_statusBarChanges statusBarPartStyleChanged])
    {
      int64_t v12 = [(_SBStatusBarChanges *)self->_statusBarChanges statusBarPartStyle];
      double v13 = [(_SBStatusBarChanges *)self->_statusBarChanges statusBarPartIdentifier];
      [(SBDeviceApplicationSceneViewController *)self _setStatusBarStyle:v12 forPartWithIdentifier:v13];
    }
    [(_SBStatusBarChanges *)self->_statusBarChanges invalidate];
    double v14 = [v6 recordingIndicatorManager];
    [v14 updateRecordingIndicatorForStatusBarChanges];
    [(SBDeviceApplicationSceneViewController *)self _layoutStatusBar];
  }
}

- (BOOL)_isApplicationStatusBarHidden
{
  v2 = [(SBSceneViewController *)self sceneHandle];
  objc_super v3 = [v2 statusBarStateProvider];
  char v4 = [v3 statusBarHidden];

  return v4;
}

void __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1120) statusBar];
  if ([*(id *)(a1 + 40) hasBreadcrumb])
  {
    objc_super v3 = [*(id *)(a1 + 48) overlayStatusBarData];
    [v2 setOverlayData:v3];

    char v4 = *(void **)(*(void *)(a1 + 32) + 1120);
    id v5 = (void *)MEMORY[0x1E4F43310];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke_2;
    v7[3] = &unk_1E6AFE270;
    id v8 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 actionWithBlock:v7];
    [v4 setAction:v6 forPartWithIdentifier:*MEMORY[0x1E4F44198]];
  }
  else
  {
    [v2 setOverlayData:0];
    [*(id *)(*(void *)(a1 + 32) + 1120) setAction:0 forPartWithIdentifier:*MEMORY[0x1E4F44198]];
  }
}

- (void)_setStatusBarStyle:(int64_t)a3
{
  id v4 = [(SBDeviceApplicationSceneViewController *)self _underlyingStatusBarViewIfAvailable];
  [v4 setStyle:a3];
}

- (void)_setStatusBarStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(SBDeviceApplicationSceneViewController *)self _underlyingStatusBarViewIfAvailable];
  [v7 setStyle:a3 forPartWithIdentifier:v6];
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  if ([(NSMutableArray *)self->_activeOverlayViewProviders count])
  {
    id v5 = [(NSMutableArray *)self->_activeOverlayViewProviders lastObject];
    a3 = [v5 bestHomeAffordanceOrientationForOrientation:a3];
  }
  return a3;
}

- (void)setSceneResizesHostedContext:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBSceneViewController *)self _sceneView];
  [v4 setResizesHostedContext:v3];
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBDeviceApplicationSceneViewController;
  [(SBSceneViewController *)&v16 setDisplayMode:a3 animationFactory:a4 completion:a5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_overlayViewProviders;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "noteDisplayModeChange:", a3, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setShouldDrawStatusBarInsideSceneView:(BOOL)a3
{
  self->_shouldDrawStatusBarInsideSceneView = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)containerDidUpdateTraitsParticipant:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_traitsParticipantForOverlayContainer, v4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_activeOverlayViewProviders;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "containerDidUpdateTraitsParticipant:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (SBApplicationSceneBackgroundView)backgroundView
{
  v2 = [(SBSceneViewController *)self _sceneView];
  BOOL v3 = [v2 backgroundView];

  return (SBApplicationSceneBackgroundView *)v3;
}

- (double)currentStatusBarHeight
{
  [(UIStatusBar *)self->_statusBar currentHeight];
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return self->_rendersWhileLocked;
}

- (void)_configureForCurrentSecureDisplayState
{
  id v5 = [(SBSceneViewController *)self sceneHandle];
  BOOL v3 = [v5 _windowScene];
  id v4 = [v3 secureDisplayStateProvider];
  -[SBDeviceApplicationSceneViewController _configureForSecureDisplay:](self, "_configureForSecureDisplay:", [v4 isInSecureDisplayMode]);
}

- (void)_configureForSecureDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(SBSceneViewController *)self sceneHandle];
  uint64_t v6 = [v5 _windowScene];
  uint64_t v7 = [v6 secureDisplayStateProvider];
  int v8 = [v7 supportsSecureDisplayMode];

  int v9 = v8 & v3;
  if ((v8 & v3) != 1 || [(SBDeviceApplicationSceneViewController *)self rendersWhileLocked])
  {
    [(BSInvalidatable *)self->_liveContentDisableAssertion invalidate];
    liveContentDisableAssertion = self->_liveContentDisableAssertion;
    self->_liveContentDisableAssertion = 0;
LABEL_4:

    goto LABEL_5;
  }
  if (!self->_liveContentDisableAssertion)
  {
    liveContentDisableAssertion = [(SBSceneViewController *)self _sceneView];
    uint64_t v18 = [liveContentDisableAssertion acquireLiveContentDisableAssertionForReason:@"Secure Rendering Enabled"];
    double v19 = self->_liveContentDisableAssertion;
    self->_liveContentDisableAssertion = v18;

    goto LABEL_4;
  }
LABEL_5:
  if (v9 != [(SBDeviceApplicationSceneViewController *)self rendersWhileLocked])
  {
    long long v11 = [(SBSceneViewController *)self _sceneView];
    uint64_t v12 = [v11 effectiveDisplayMode];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v13 = self->_overlayViewProviders;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "noteDisplayModeChange:", v12, (void)v20);
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }
  }
}

- (BOOL)rendersWhileLocked
{
  return self->_rendersWhileLocked;
}

- (SBDeviceApplicationSceneViewController)initWithSceneHandle:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBDeviceApplicationSceneViewController.m", 148, @"SceneHandle must be of type SBDeviceApplicationSceneHandle, but was: %@", v5 object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneViewController;
  uint64_t v6 = [(SBApplicationSceneViewController *)&v12 initWithSceneHandle:v5];
  if (v6)
  {
    [v5 setShouldApplyAppProtectionSceneSettings:1];
    uint64_t v7 = [MEMORY[0x1E4FA5F28] rootSettings];
    homeGrabberSettings = v6->_homeGrabberSettings;
    v6->_homeGrabberSettings = (SBFHomeGrabberSettings *)v7;

    [v5 addObserver:v6];
    [(SBDeviceApplicationSceneViewController *)v6 _setRealStatusBarStyleDelegate:SBApp];
    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__willEnableSecureDisplay name:*MEMORY[0x1E4FA60E8] object:0];
    [v9 addObserver:v6 selector:sel__didDisableSecureDisplay name:*MEMORY[0x1E4FA60E0] object:0];
  }
  return v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBDeviceApplicationSceneViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (a3) {
    [(SBDeviceApplicationSceneViewController *)self _createSceneOverlayViewProvidersIfNecessary];
  }
  else {
    [(SBDeviceApplicationSceneViewController *)self _destroySceneOverlayViewProviders];
  }
}

- (void)_createSceneOverlayViewProvidersIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_overlayViewProviders) {
    return;
  }
  BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  overlayViewProviders = self->_overlayViewProviders;
  self->_overlayViewProviders = v3;

  objc_super v5 = [(SBSceneViewController *)self sceneHandle];
  double v19 = [[SBDeviceApplicationScreenTimeLockoutViewProvider alloc] initWithSceneHandle:v5 delegate:self];
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:");
  uint64_t v18 = [[SBDeviceApplicationRemoteTransientOverlayViewProvider alloc] initWithSceneHandle:v5 delegate:self handlesSceneBackedRemoteTransientOverlaysOnly:0];
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:");
  uint64_t v6 = [[SBDeviceApplicationRemoteTransientOverlayViewProvider alloc] initWithSceneHandle:v5 delegate:self handlesSceneBackedRemoteTransientOverlaysOnly:1];
  [(NSMutableArray *)self->_overlayViewProviders addObject:v6];
  uint64_t v7 = [[SBDeviceApplicationAppClipOverlayViewProvider alloc] initWithSceneHandle:v5 delegate:self];
  [(NSMutableArray *)self->_overlayViewProviders addObject:v7];
  int v8 = [[SBDeviceApplicationAppProtectionSceneOverlayViewProvider alloc] initWithSceneHandle:v5 delegate:self];
  [(NSMutableArray *)self->_overlayViewProviders addObject:v8];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_9;
    }
LABEL_6:
    if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
    {
      long long v11 = [(SBDeviceApplicationSceneOverlayViewProvider *)[SBDeviceApplicationInputUIViewProvider alloc] initWithSceneHandle:v5 delegate:self];
      [(NSMutableArray *)self->_overlayViewProviders addObject:v11];
    }
    objc_super v12 = [(SBDeviceApplicationSceneOverlayViewProvider *)[SBDeviceApplicationMomentsUIViewProvider alloc] initWithSceneHandle:v5 delegate:self];
    [(NSMutableArray *)self->_overlayViewProviders addObject:v12];

    goto LABEL_9;
  }
  int v9 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 != 1) {
    goto LABEL_6;
  }
LABEL_9:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_overlayViewProviders;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17++), "noteDisplayModeChange:", -[SBSceneViewController displayMode](self, "displayMode"));
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)_setRealStatusBarStyleDelegate:(id)a3
{
  uint64_t v7 = (UIStatusBarStyleDelegate_SpringBoardOnly *)a3;
  if (self->_realStatusBarStyleDelegate != v7)
  {
    objc_storeStrong((id *)&self->_realStatusBarStyleDelegate, a3);
    *(unsigned char *)&self->_conformanceFlags = *(unsigned char *)&self->_conformanceFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_conformanceFlags = *(unsigned char *)&self->_conformanceFlags & 0xFB | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_conformanceFlags = *(unsigned char *)&self->_conformanceFlags & 0xFD | v6;
  }
}

- (void)_createStatusBar
{
  id v40 = [(SBSceneViewController *)self sceneHandle];
  BOOL v3 = [v40 _windowScene];
  uint64_t v4 = [v40 sceneIdentifier];
  char v5 = NSString;
  char v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  v38 = (void *)v4;
  int v8 = [v5 stringWithFormat:@"%@ - %@", v7, v4];

  v39 = v3;
  int v9 = [v3 statusBarManager];
  uint64_t v10 = [v9 reusePool];

  objc_storeWeak((id *)&self->_statusBarReusePool, v10);
  long long v11 = [v10 getReusableStatusBarWithReason:v8];
  statusBar = self->_statusBar;
  self->_statusBar = v11;

  long long v13 = [(SBDeviceApplicationSceneViewController *)self _underlyingStatusBarViewIfAvailable];
  uint64_t v14 = [v13 actionGestureRecognizer];
  uint64_t v15 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__statusBarScrollToTop_];
  scrollToTopGestureRecognizer = self->_scrollToTopGestureRecognizer;
  self->_scrollToTopGestureRecognizer = v15;

  [(UITapGestureRecognizer *)self->_scrollToTopGestureRecognizer requireGestureRecognizerToFail:v14];
  [v13 addGestureRecognizer:self->_scrollToTopGestureRecognizer];
  uint64_t v17 = +[SBPlatformController sharedInstance];
  int v18 = [v17 isInternalInstall];

  if (v18)
  {
    double v19 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__statusBarShowDebug_];
    showDebugGestureRecognizer = self->_showDebugGestureRecognizer;
    self->_showDebugGestureRecognizer = v19;

    [(UITapGestureRecognizer *)self->_showDebugGestureRecognizer setNumberOfTouchesRequired:2];
    [(UITapGestureRecognizer *)self->_showDebugGestureRecognizer requireGestureRecognizerToFail:v14];
    [v13 addGestureRecognizer:self->_showDebugGestureRecognizer];
  }
  long long v21 = [(UIStatusBar *)self->_statusBar layer];
  [v21 setHitTestsAsOpaque:1];

  [(SBDeviceApplicationSceneViewController *)self _setupStatusBarStylesFromSceneHandle:v40];
  [(UIStatusBar *)self->_statusBar requestResolvedStyle:0];
  [(UIStatusBar *)self->_statusBar setStyleDelegate:self];
  [(UIStatusBar *)self->_statusBar setLegibilityStyle:0];
  [(UIStatusBar *)self->_statusBar setForegroundColor:0];
  long long v22 = +[SBMedusaDomain rootSettings];
  if ([v22 statusBarDebugBackgroundColorsEnabled])
  {
    long long v23 = self->_statusBar;
    double v24 = [MEMORY[0x1E4F428B8] cyanColor];
    uint64_t v25 = [v24 colorWithAlphaComponent:0.4];
    [(UIStatusBar *)v23 setBackgroundColor:v25];
  }
  id v26 = [v40 statusBarStateProvider];
  [v26 addStatusBarObserver:self];

  long long v27 = [v40 breadcrumbProvider];
  [v27 addObserver:self];

  long long v28 = [v40 statusBarStateProvider];
  long long v29 = [v28 backgroundActivitiesToSuppress];

  long long v30 = [v40 sceneIdentifier];
  [(SBDeviceApplicationSceneViewController *)self _applyBackgroundActivitiesToSuppress:v29 toSceneWithIdentifier:v30];

  v31 = [(SBDeviceApplicationSceneViewController *)self view];
  id v32 = objc_alloc(MEMORY[0x1E4FA6028]);
  [v31 bounds];
  v33 = (UIView *)objc_msgSend(v32, "initWithFrame:");
  statusBarWrapperView = self->_statusBarWrapperView;
  self->_statusBarWrapperView = v33;

  id v35 = objc_alloc(MEMORY[0x1E4F4F8D0]);
  [v31 bounds];
  CGRect v36 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v35, "initWithFrame:");
  statusBarTransformView = self->_statusBarTransformView;
  self->_statusBarTransformView = v36;

  [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView setAutoresizingMask:18];
  [(UIView *)self->_statusBarWrapperView addSubview:self->_statusBar];
  [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView addContentView:self->_statusBarWrapperView];
  [v31 addSubview:self->_statusBarTransformView];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneViewController;
  [(SBSceneViewController *)&v6 viewDidLoad];
  [(SBDeviceApplicationSceneViewController *)self _configureForCurrentSecureDisplayState];
  BOOL v3 = [(SBSceneViewController *)self _sceneView];
  [v3 setDelegate:self];
  uint64_t v4 = [(SBDeviceApplicationSceneViewController *)self sceneMinificationFilter];
  [v3 setMinificationFilter:v4];

  objc_msgSend(v3, "setRendersAsynchronously:", -[SBDeviceApplicationSceneViewController sceneRendersAsynchronously](self, "sceneRendersAsynchronously"));
  if (self->_statusBarAssertions || self->_shouldDrawStatusBarInsideSceneView) {
    [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];
  }
  if (![(SBDeviceApplicationSceneViewController *)self _shouldSuppressHomeGrabber])
  {
    char v5 = [(SBDeviceApplicationSceneViewController *)self homeGrabberPillSettings];
    [v3 createHomeGrabberViewIfNecessaryWithSettings:v5];
  }
}

- (void)setSceneRendersAsynchronously:(BOOL)a3
{
  if (self->_sceneRendersAsynchronously != a3)
  {
    self->_sceneRendersAsynchronously = a3;
    if ([(SBDeviceApplicationSceneViewController *)self isViewLoaded])
    {
      id v4 = [(SBSceneViewController *)self _sceneView];
      [v4 setRendersAsynchronously:self->_sceneRendersAsynchronously];
    }
  }
}

- (void)setSceneMinificationFilter:(id)a3
{
  id v4 = (NSString *)a3;
  sceneMinificationFilter = self->_sceneMinificationFilter;
  if (sceneMinificationFilter != v4)
  {
    long long v11 = v4;
    char v6 = [(NSString *)sceneMinificationFilter isEqual:v4];
    id v4 = v11;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (NSString *)[(NSString *)v11 copy];
      int v8 = self->_sceneMinificationFilter;
      self->_sceneMinificationFilter = v7;

      int v9 = [(SBDeviceApplicationSceneViewController *)self isViewLoaded];
      id v4 = v11;
      if (v9)
      {
        uint64_t v10 = [(SBSceneViewController *)self _sceneView];
        [v10 setMinificationFilter:self->_sceneMinificationFilter];

        id v4 = v11;
      }
    }
  }
}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
  if (self->_homeGrabberDisplayMode != a3)
  {
    int v5 = [(SBDeviceApplicationSceneViewController *)self _shouldSuppressHomeGrabber];
    self->_homeGrabberDisplayMode = a3;
    int v6 = [(SBDeviceApplicationSceneViewController *)self _shouldSuppressHomeGrabber];
    if (v5 != v6)
    {
      int v7 = v6;
      id v9 = [(SBSceneViewController *)self _sceneView];
      if (v7)
      {
        [v9 tearDownHomeGrabberView];
      }
      else
      {
        int v8 = [(SBDeviceApplicationSceneViewController *)self homeGrabberPillSettings];
        [v9 createHomeGrabberViewIfNecessaryWithSettings:v8];
      }
    }
  }
}

- (BOOL)_shouldSuppressHomeGrabber
{
  int64_t homeGrabberDisplayMode = self->_homeGrabberDisplayMode;
  if (!homeGrabberDisplayMode)
  {
    int v3 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings isEnabled];
    int64_t homeGrabberDisplayMode = 1;
    if (v3) {
      int64_t homeGrabberDisplayMode = 2;
    }
  }
  return homeGrabberDisplayMode == 1;
}

- (BOOL)sceneRendersAsynchronously
{
  return self->_sceneRendersAsynchronously;
}

- (NSString)sceneMinificationFilter
{
  return self->_sceneMinificationFilter;
}

- (void)_setupStatusBarStylesFromSceneHandle:(id)a3
{
  id v6 = a3;
  id v4 = [v6 sceneIfExists];
  if (v4)
  {
    int v5 = [v6 statusBarStateProvider];
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:](self, "_setStatusBarStyle:", [v5 statusBarStyle]);
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", [v5 statusBarStyleForPartWithIdentifier:*MEMORY[0x1E4F441B8]], *MEMORY[0x1E4F441B8]);
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", [v5 statusBarStyleForPartWithIdentifier:*MEMORY[0x1E4F441A0]], *MEMORY[0x1E4F441A0]);
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", [v5 statusBarStyleForPartWithIdentifier:*MEMORY[0x1E4F441C8]], *MEMORY[0x1E4F441C8]);
  }
}

- (void)_applyBackgroundActivitiesToSuppress:(id)a3 toSceneWithIdentifier:(id)a4
{
  statusBar = self->_statusBar;
  if (statusBar)
  {
    uint64_t v5 = [(UIStatusBar *)self->_statusBar currentResolvedStyle];
    [(UIStatusBar *)statusBar requestResolvedStyle:v5];
  }
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  BOOL v5 = a3;
  int v7 = objc_alloc_init(SBMutableStatusBarSettings);
  double v8 = 1.0;
  if (v5) {
    double v8 = 0.0;
  }
  id v9 = [NSNumber numberWithDouble:v8];
  [(SBMutableStatusBarSettings *)v7 setAlpha:v9];

  uint64_t v10 = [(SBDeviceApplicationSceneViewController *)self statusBarAssertionWithStatusBarSettings:v7 atLevel:a4];

  return v10;
}

- (id)statusBarAssertionWithStatusBarSettings:(id)a3 atLevel:(unint64_t)a4
{
  id v6 = a3;
  if (!self->_statusBarAssertions)
  {
    int v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    statusBarAssertions = self->_statusBarAssertions;
    self->_statusBarAssertions = v7;
  }
  id v9 = [[SBSceneViewStatusBarAssertion alloc] initWithStatusBarSettings:v6 nubViewHidden:0x7FFFFFFFFFFFFFFFLL atLevel:a4];
  [(SBSceneViewStatusBarAssertion *)v9 addObserver:self];
  [(NSHashTable *)self->_statusBarAssertions addObject:v9];
  [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];

  return v9;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];
  [v5 _setSceneMaskingDelegate:self];
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  id v13 = a5;
  int64_t v7 = -[SBDeviceApplicationSceneViewController _currentStatusBarStyleForPartWithIdentifier:](self, "_currentStatusBarStyleForPartWithIdentifier:");
  activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
  if (activeOverlayStatusBarAssertion)
  {
    id v9 = [(SBSceneViewStatusBarAssertion *)activeOverlayStatusBarAssertion settings];
    a4 = _SBStatusBarStyleFromLegacyStyle([v9 style]);
  }
  if (v7 != a4)
  {
    statusBarChanges = self->_statusBarChanges;
    if (!statusBarChanges)
    {
      long long v11 = (_SBStatusBarChanges *)objc_opt_new();
      objc_super v12 = self->_statusBarChanges;
      self->_statusBarChanges = v11;

      statusBarChanges = self->_statusBarChanges;
    }
    [(_SBStatusBarChanges *)statusBarChanges setStatusBarPartStyle:a4 forPartWithIdentifier:v13];
    [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];
  }
}

- (int64_t)_currentStatusBarStyleForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDeviceApplicationSceneViewController *)self _underlyingStatusBarViewIfAvailable];
  id v6 = v5;
  if (v5) {
    int64_t v7 = [v5 styleForPartWithIdentifier:v4];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_underlyingStatusBarViewIfAvailable
{
  return (id)[(UIStatusBar *)self->_statusBar statusBar];
}

- (void)statusBarAssertionDidInvalidate:(id)a3
{
  [(NSHashTable *)self->_statusBarAssertions removeObject:a3];
  [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  int64_t v6 = [(SBDeviceApplicationSceneViewController *)self _currentStatusBarStyle];
  activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
  if (activeOverlayStatusBarAssertion)
  {
    double v8 = [(SBSceneViewStatusBarAssertion *)activeOverlayStatusBarAssertion settings];
    a4 = _SBStatusBarStyleFromLegacyStyle([v8 style]);
  }
  if (v6 != a4)
  {
    statusBarChanges = self->_statusBarChanges;
    if (!statusBarChanges)
    {
      uint64_t v10 = (_SBStatusBarChanges *)objc_opt_new();
      long long v11 = self->_statusBarChanges;
      self->_statusBarChanges = v10;

      statusBarChanges = self->_statusBarChanges;
    }
    [(_SBStatusBarChanges *)statusBarChanges setStatusBarStyle:a4];
    [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];
  }
}

- (int64_t)_currentStatusBarStyle
{
  v2 = [(SBDeviceApplicationSceneViewController *)self _underlyingStatusBarViewIfAvailable];
  int v3 = v2;
  if (v2) {
    int64_t v4 = [v2 style];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)animationFactoryForImplicitTransitionFromMode:(int64_t)a3 toMode:(int64_t)a4 defaultFactory:(id)a5
{
  id v7 = a5;
  if (a4 != 4) {
    goto LABEL_4;
  }
  double v8 = [(SBSceneViewController *)self sceneHandle];
  id v9 = [v8 application];
  uint64_t v10 = [v9 info];
  char v11 = [v10 shouldSkipCrossfadeToLive];

  if (v11) {
    id v12 = 0;
  }
  else {
LABEL_4:
  }
    id v12 = v7;

  return v12;
}

- (void)sceneView:(id)a3 changedPreferredStatusBarStyleTo:(int64_t)a4
{
  id v13 = a3;
  placeholderStatusBarAssertion = self->_placeholderStatusBarAssertion;
  if (a4 == -1)
  {
    [(SBSceneViewStatusBarAssertion *)placeholderStatusBarAssertion invalidate];
    uint64_t v10 = (SBMutableStatusBarSettings *)self->_placeholderStatusBarAssertion;
    self->_placeholderStatusBarAssertion = 0;
  }
  else if (placeholderStatusBarAssertion)
  {
    id v7 = [(SBSceneViewStatusBarAssertion *)placeholderStatusBarAssertion settings];
    uint64_t v8 = [v7 style];

    if (v8 == a4) {
      goto LABEL_8;
    }
    id v9 = [(SBSceneViewStatusBarAssertion *)self->_placeholderStatusBarAssertion settings];
    uint64_t v10 = (SBMutableStatusBarSettings *)[v9 mutableCopy];

    [(SBMutableStatusBarSettings *)v10 setStyle:a4];
    [(SBSceneViewStatusBarAssertion *)self->_placeholderStatusBarAssertion setSettings:v10];
  }
  else
  {
    uint64_t v10 = objc_alloc_init(SBMutableStatusBarSettings);
    [(SBMutableStatusBarSettings *)v10 setStyle:a4];
    char v11 = [(SBDeviceApplicationSceneViewController *)self statusBarAssertionWithStatusBarSettings:v10 atLevel:0];
    id v12 = self->_placeholderStatusBarAssertion;
    self->_placeholderStatusBarAssertion = v11;
  }
LABEL_8:
}

- (void)dealloc
{
  int v3 = [(SBSceneViewController *)self sceneHandle];
  [v3 removeObserver:self];
  int64_t v4 = [v3 statusBarStateProvider];
  [v4 removeStatusBarObserver:self];

  id v5 = [v3 breadcrumbProvider];
  [v5 removeObserver:self];

  [(SBDeviceApplicationSceneViewController *)self _removeStatusBar];
  [(SBDeviceApplicationSceneViewController *)self _relinquishResignActiveAssertion];
  [(SBDeviceApplicationSceneViewController *)self _destroySceneOverlayViewProviders];
  [(BSInvalidatable *)self->_liveContentDisableAssertion invalidate];

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneViewController;
  [(SBSceneViewController *)&v6 dealloc];
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneViewController;
  [(SBSceneViewController *)&v4 invalidate];
  int v3 = [(SBSceneViewController *)self sceneHandle];
  [v3 removeObserver:self];

  [(SBDeviceApplicationSceneViewController *)self _relinquishResignActiveAssertion];
  [(SBDeviceApplicationSceneViewController *)self _destroySceneOverlayViewProviders];
  [(BSInvalidatable *)self->_liveContentDisableAssertion invalidate];
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneViewController;
  id v7 = a4;
  -[SBDeviceApplicationSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [(SBSceneViewController *)self _sceneView];
  objc_msgSend(v8, "containerViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (SBHomeGrabberView)homeGrabberView
{
  v2 = [(SBSceneViewController *)self _sceneView];
  int v3 = [v2 homeGrabberView];

  return (SBHomeGrabberView *)v3;
}

- (void)setRendersWhileLocked:(BOOL)a3
{
  if (self->_rendersWhileLocked != a3)
  {
    self->_rendersWhileLocked = a3;
    [(SBDeviceApplicationSceneViewController *)self _configureForCurrentSecureDisplayState];
  }
}

- (BOOL)sceneResizesHostedContext
{
  v2 = [(SBSceneViewController *)self _sceneView];
  char v3 = [v2 resizesHostedContext];

  return v3;
}

- (void)_setStatusBarAssertions:(id)a3
{
  id v5 = (NSHashTable *)a3;
  if (self->_statusBarAssertions != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_statusBarAssertions, a3);
    int v6 = [(SBDeviceApplicationSceneViewController *)self isViewLoaded];
    id v5 = v7;
    if (v6)
    {
      [(SBDeviceApplicationSceneViewController *)self _updateStatusBarState];
      id v5 = v7;
    }
  }
}

- (void)setBackgroundView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSceneViewController *)self _sceneView];
  [v5 setBackgroundView:v4];
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

uint64_t __63__SBDeviceApplicationSceneViewController__updateStatusBarState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  int v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "level"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 level];

  objc_super v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)activateOverlayForViewProvider:(id)a3
{
  id v13 = a3;
  id v4 = [v13 overlayViewController];
  id v5 = [v4 parentViewController];

  if (!v5)
  {
    activeOverlayViewProviders = self->_activeOverlayViewProviders;
    if (!activeOverlayViewProviders)
    {
      id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = self->_activeOverlayViewProviders;
      self->_activeOverlayViewProviders = v7;

      activeOverlayViewProviders = self->_activeOverlayViewProviders;
    }
    [(NSMutableArray *)activeOverlayViewProviders addObject:v13];
    objc_super v9 = [(SBSceneViewController *)self _sceneView];
    uint64_t v10 = [v4 overlayView];
    uint64_t v11 = [(NSMutableArray *)self->_overlayViewProviders containsObject:v13];
    [v4 beginAppearanceTransition:1 animated:v11];
    [(SBDeviceApplicationSceneViewController *)self addChildViewController:v4];
    objc_msgSend(v9, "addOverlayView:withPriority:", v10, objc_msgSend(v13, "priority"));
    [v4 didMoveToParentViewController:self];
    [v4 endAppearanceTransition];
    [v13 showContentWithAnimation:v11 completionHandler:0];
    [(SBDeviceApplicationSceneViewController *)self _updateStatusBarAppearanceForOverlayProvider:v13];
    [(SBDeviceApplicationSceneViewController *)self _recalculateResignActiveAssertionForActiveOverlays];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:self];
  }
}

- (void)deactivateOverlayForViewProvider:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_activeOverlayViewProviders containsObject:v4])
  {
    id v5 = [v4 overlayViewController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__SBDeviceApplicationSceneViewController_deactivateOverlayForViewProvider___block_invoke;
    v7[3] = &unk_1E6AF4E00;
    void v7[4] = self;
    id v8 = v5;
    id v9 = v4;
    id v6 = v5;
    [v9 hideContentWithAnimation:1 completionHandler:v7];
  }
}

uint64_t __75__SBDeviceApplicationSceneViewController_deactivateOverlayForViewProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateOverlay:*(void *)(a1 + 40) forViewProvider:*(void *)(a1 + 48)];
}

- (void)_deactivateOverlay:(id)a3 forViewProvider:(id)a4
{
  activeOverlayViewProviders = self->_activeOverlayViewProviders;
  id v7 = a4;
  id v8 = a3;
  id v16 = [(NSMutableArray *)activeOverlayViewProviders lastObject];
  [v8 beginAppearanceTransition:0 animated:0];
  [v8 willMoveToParentViewController:0];
  id v9 = [(SBSceneViewController *)self _sceneView];
  uint64_t v10 = [v8 overlayView];
  objc_msgSend(v9, "removeOverlayView:withPriority:", v10, objc_msgSend(v7, "priority"));

  [v8 removeFromParentViewController];
  [v8 endAppearanceTransition];

  [(NSMutableArray *)self->_activeOverlayViewProviders removeObject:v7];
  if ([(NSMutableArray *)self->_activeOverlayViewProviders count])
  {
    if (![v16 affectsStatusBarPresentation]) {
      goto LABEL_7;
    }
    uint64_t v11 = objc_alloc_init(SBMutableStatusBarSettings);
    id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "prefersStatusBarHidden") ^ 1);
    [(SBMutableStatusBarSettings *)v11 setAlpha:v12];

    -[SBMutableStatusBarSettings setStyle:](v11, "setStyle:", [v16 preferredStatusBarStyle]);
    [(SBSceneViewStatusBarAssertion *)self->_activeOverlayStatusBarAssertion setSettings:v11];
  }
  else
  {
    id v13 = self->_activeOverlayViewProviders;
    self->_activeOverlayViewProviders = 0;

    activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
    if (!activeOverlayStatusBarAssertion) {
      goto LABEL_7;
    }
    [(SBSceneViewStatusBarAssertion *)activeOverlayStatusBarAssertion invalidate];
    uint64_t v11 = (SBMutableStatusBarSettings *)self->_activeOverlayStatusBarAssertion;
    self->_activeOverlayStatusBarAssertion = 0;
  }

LABEL_7:
  [(SBDeviceApplicationSceneViewController *)self _recalculateResignActiveAssertionForActiveOverlays];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:self];
}

- (BOOL)overlayViewProviderIsHostedInNonrotatingWindow:(id)a3
{
  id v4 = [(SBDeviceApplicationSceneViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 applicationSceneViewControllerIsInNonrotatingWindow:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)windowSceneForOverlayViewProvider:(id)a3
{
  id v4 = objc_msgSend((id)SBApp, "windowSceneManager", a3);
  char v5 = [(SBSceneViewController *)self sceneHandle];
  id v6 = [v4 windowSceneForSceneHandle:v5];

  return v6;
}

- (BOOL)overlayViewProviderIsHostedInSecureWindow:(id)a3
{
  char v3 = [(SBDeviceApplicationSceneViewController *)self view];
  id v4 = [v3 window];
  char v5 = [(id)objc_opt_class() _isSecure];

  return v5;
}

- (id)hostWindowForOverlayViewProvider:(id)a3
{
  char v3 = [(SBDeviceApplicationSceneViewController *)self view];
  id v4 = [v3 window];

  return v4;
}

- (id)initialTraitsParticipantForOverlayViewProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsParticipantForOverlayContainer);
  return WeakRetained;
}

- (void)overlayViewProviderNeedsStatusBarAppearanceUpdate:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_activeOverlayViewProviders, "containsObject:")) {
    [(SBDeviceApplicationSceneViewController *)self _updateStatusBarAppearanceForOverlayProvider:v4];
  }
}

- (void)sceneHandle:(id)a3 didMoveFromSceneManager:(id)a4
{
  [(SBDeviceApplicationSceneViewController *)self _configureStatusBarWithCurrentStyleRequest];
  [(SBDeviceApplicationSceneViewController *)self _configureForCurrentSecureDisplayState];
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
}

- (void)beginMaskingForReason:(int64_t)a3 continuation:(id)a4 scene:(id)a5
{
  if (a3 == 1)
  {
    id v7 = (void (**)(id, void))a4;
    id v8 = [(SBSceneViewController *)self _sceneView];
    [v8 enableTransitionOverlay:1];
    v7[2](v7, 0);
  }
}

- (void)invalidateMasking:(id)a3
{
  id v3 = [(SBSceneViewController *)self _sceneView];
  [v3 enableTransitionOverlay:0];
}

- (int64_t)leadingStatusBarStyle
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewController *)self _effectiveStyleForPartIdentifier:*MEMORY[0x1E4F441B8]];
  return _SBStatusBarLegacyStyleFromStyle(v2);
}

- (int64_t)trailingStatusBarStyle
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewController *)self _effectiveStyleForPartIdentifier:*MEMORY[0x1E4F441C8]];
  return _SBStatusBarLegacyStyleFromStyle(v2);
}

- (id)backgroundActivitiesToSuppress
{
  uint64_t v2 = [(SBSceneViewController *)self sceneHandle];
  id v3 = [v2 statusBarStateProvider];
  id v4 = [v3 backgroundActivitiesToSuppress];

  return v4;
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = [(SBSceneViewController *)self sceneHandle];
  if ([v11 wantsDeviceOrientationEventsEnabled]
    && ![(SBDeviceApplicationSceneViewController *)self _statusBarHasMatchMoveAnimation])
  {

    if (v6) {
      [(SBDeviceApplicationSceneViewController *)self _addStatusBarMatchMoveAnimationForView:v10];
    }
  }
  else
  {
  }
  id v12 = [(SBSceneViewController *)self _sceneView];
  [v12 willRotateFromInterfaceOrientation:a3 toInterfaceOrientation:a4 alongsideContainerView:v10 animated:v6];

  id v13 = [(SBSceneViewController *)self sceneHandle];
  uint64_t v14 = [v13 application];
  if ([v14 classicAppPhoneAppRunningOnPad])
  {
    uint64_t v15 = [(UIViewController *)self _sbWindowScene];
    id v16 = [v15 switcherController];
    uint64_t v17 = [v16 windowManagementStyle];

    if (v17 == 2)
    {
      id v27 = v10;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      int v18 = self->_activeOverlayViewProviders;
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            double v24 = [v23 overlayViewController];
            uint64_t v25 = [v24 overlayView];
            char v26 = [v25 needsCounterRotation];

            if ((v26 & 1) == 0) {
              [v23 willDoBoundsPreservingRotationFromInterfaceOrientation:a3 toInterfaceOrientation:a4];
            }
          }
          uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v20);
      }

      id v10 = v27;
    }
  }
  else
  {
  }
}

- (id)prepareForContentRotation
{
  uint64_t v2 = [(SBSceneViewController *)self _sceneView];
  id v3 = [v2 prepareForContentRotation];

  return v3;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  id v6 = [(SBSceneViewController *)self sceneHandle];
  if ([v6 wantsDeviceOrientationEventsEnabled])
  {
    BOOL v5 = [(SBDeviceApplicationSceneViewController *)self _statusBarHasMatchMoveAnimation];

    if (v5)
    {
      [(SBDeviceApplicationSceneViewController *)self _removeStatusBarMatchMoveAnimation];
    }
  }
  else
  {
  }
}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  return a4;
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  unint64_t v5 = a5;
  if (*(unsigned char *)&self->_conformanceFlags) {
    unint64_t v5 = [(UIStatusBarStyleDelegate_SpringBoardOnly *)self->_realStatusBarStyleDelegate statusBar:a3 effectiveStyleOverridesForRequestedStyle:a4 overrides:a5];
  }
  id v7 = [(SBSceneViewController *)self sceneHandle];
  id v8 = [v7 statusBarStateProvider];
  id v9 = [v8 backgroundActivitiesToSuppress];

  unint64_t v10 = v5 & ~STUIStyleOverridesForBackgroundActivityIdentifiers();
  return v10;
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  if ((*(unsigned char *)&self->_conformanceFlags & 4) != 0) {
    return [(UIStatusBarStyleDelegate_SpringBoardOnly *)self->_realStatusBarStyleDelegate overriddenRequestedStyleFromStyle:a3];
  }
  else {
    return a3;
  }
}

- (void)_destroySceneOverlayViewProviders
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (void *)[(NSMutableArray *)self->_activeOverlayViewProviders copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SBDeviceApplicationSceneViewController *)self deactivateOverlayForViewProvider:*(void *)(*((void *)&v19 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_activeOverlayViewProviders removeAllObjects];
  activeOverlayViewProviders = self->_activeOverlayViewProviders;
  self->_activeOverlayViewProviders = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = self->_overlayViewProviders;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "invalidate", (void)v15);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_overlayViewProviders removeAllObjects];
  overlayViewProviders = self->_overlayViewProviders;
  self->_overlayViewProviders = 0;
}

- (void)_updateStatusBarAppearanceForOverlayProvider:(id)a3
{
  id v9 = a3;
  if ([v9 affectsStatusBarPresentation])
  {
    uint64_t v4 = objc_alloc_init(SBMutableStatusBarSettings);
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "prefersStatusBarHidden") ^ 1);
    [(SBMutableStatusBarSettings *)v4 setAlpha:v5];

    -[SBMutableStatusBarSettings setStyle:](v4, "setStyle:", [v9 preferredStatusBarStyle]);
    activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
    if (activeOverlayStatusBarAssertion)
    {
      [(SBSceneViewStatusBarAssertion *)activeOverlayStatusBarAssertion setSettings:v4];
    }
    else
    {
      uint64_t v7 = [(SBDeviceApplicationSceneViewController *)self statusBarAssertionWithStatusBarSettings:v4 atLevel:1];
      id v8 = self->_activeOverlayStatusBarAssertion;
      self->_activeOverlayStatusBarAssertion = v7;
    }
  }
}

- (void)_recalculateResignActiveAssertionForActiveOverlays
{
  BOOL v3 = [(SBDeviceApplicationSceneViewController *)self _activeOverlaysWantResignActiveAssertion];
  resignActiveAssertion = self->_resignActiveAssertion;
  if (v3)
  {
    if (!resignActiveAssertion)
    {
      objc_initWeak(&location, self);
      uint64_t v5 = +[SBSceneManagerCoordinator sharedInstance];
      uint64_t v6 = [v5 sceneDeactivationManager];
      uint64_t v7 = (UIApplicationSceneDeactivationAssertion *)[v6 newAssertionWithReason:7];
      id v8 = self->_resignActiveAssertion;
      self->_resignActiveAssertion = v7;

      id v9 = self->_resignActiveAssertion;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__SBDeviceApplicationSceneViewController__recalculateResignActiveAssertionForActiveOverlays__block_invoke;
      v10[3] = &unk_1E6B00560;
      objc_copyWeak(&v11, &location);
      [(UIApplicationSceneDeactivationAssertion *)v9 acquireWithPredicate:v10 transitionContext:0];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (resignActiveAssertion)
  {
    [(SBDeviceApplicationSceneViewController *)self _relinquishResignActiveAssertion];
  }
}

uint64_t __92__SBDeviceApplicationSceneViewController__recalculateResignActiveAssertionForActiveOverlays__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [v3 identifier];

  uint64_t v6 = [WeakRetained sceneHandle];
  uint64_t v7 = [v6 sceneIdentifier];
  uint64_t v8 = [v5 isEqualToString:v7];

  return v8;
}

- (void)_relinquishResignActiveAssertion
{
  [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
  resignActiveAssertion = self->_resignActiveAssertion;
  self->_resignActiveAssertion = 0;
}

- (BOOL)_activeOverlaysWantResignActiveAssertion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_activeOverlayViewProviders;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "wantsResignActiveAssertion", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateBreadcrumbIfPossible];
}

- (void)_removeStatusBar
{
  uint64_t v3 = [(UITapGestureRecognizer *)self->_scrollToTopGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_scrollToTopGestureRecognizer];

  scrollToTopGestureRecognizer = self->_scrollToTopGestureRecognizer;
  self->_scrollToTopGestureRecognizer = 0;

  uint64_t v5 = [(UITapGestureRecognizer *)self->_showDebugGestureRecognizer view];
  [v5 removeGestureRecognizer:self->_showDebugGestureRecognizer];

  showDebugGestureRecognizer = self->_showDebugGestureRecognizer;
  self->_showDebugGestureRecognizer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarReusePool);
  [WeakRetained recycleStatusBar:self->_statusBar];

  statusBar = self->_statusBar;
  self->_statusBar = 0;

  objc_storeWeak((id *)&self->_statusBarReusePool, 0);
  [(UIView *)self->_statusBarWrapperView removeFromSuperview];
  [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView removeFromSuperview];
  statusBarWrapperView = self->_statusBarWrapperView;
  self->_statusBarWrapperView = 0;

  statusBarTransformView = self->_statusBarTransformView;
  self->_statusBarTransformView = 0;
}

- (void)_statusBarScrollToTop:(id)a3
{
}

- (void)_statusBarShowDebug:(id)a3
{
}

- (void)_statusBarTapped:(id)a3 type:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id WeakRetained = self->_overlayViewProviders;
  uint64_t v8 = [(NSMutableArray *)WeakRetained countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(WeakRetained);
      }
      if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "handledStatusBarTap:type:", v6, a4, (void)v12)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)WeakRetained countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id WeakRetained = (NSMutableArray *)objc_loadWeakRetained((id *)&self->_delegate);
    [(NSMutableArray *)WeakRetained applicationSceneViewController:self statusBarTapped:v6 tapActionType:a4];
  }
}

- (BOOL)_statusBarHasMatchMoveAnimation
{
  uint64_t v2 = [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView layer];
  uint64_t v3 = [v2 animationForKey:@"RotationMatchMoveAnimation"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_addStatusBarMatchMoveAnimationForView:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F39C00];
  id v5 = a3;
  id v6 = [v4 animation];
  long long v7 = [v5 layer];

  [v6 setSourceLayer:v7];
  [v6 setDuration:INFINITY];
  [v6 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v6 setRemovedOnCompletion:0];
  [v6 setAppliesX:0];
  [v6 setAppliesY:0];
  [v6 setAppliesScale:1];
  [v6 setUsesNormalizedCoordinates:1];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
  v14[0] = v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
  v14[1] = v9;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
  v14[2] = v10;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
  v14[3] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  [v6 setSourcePoints:v12];

  long long v13 = [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView layer];
  [v13 addAnimation:v6 forKey:@"RotationMatchMoveAnimation"];
}

- (void)_removeStatusBarMatchMoveAnimation
{
  id v2 = [(BSUIOrientationTransformWrapperView *)self->_statusBarTransformView layer];
  [v2 removeAnimationForKey:@"RotationMatchMoveAnimation"];
}

- (int64_t)_effectiveStyleForPartIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSceneViewController *)self sceneHandle];
  id v6 = [v5 statusBarStateProvider];

  int64_t v7 = [v6 statusBarStyle];
  uint64_t v8 = [v6 statusBarPartStyles];
  uint64_t v9 = [v8 objectForKey:v4];

  if (v9)
  {
    uint64_t v10 = [v9 integerValue];
    if (v10 != 4) {
      int64_t v7 = v10;
    }
  }

  return v7;
}

- (void)_willEnableSecureDisplay
{
}

- (void)_didDisableSecureDisplay
{
}

- (int64_t)homeGrabberDisplayMode
{
  return self->_homeGrabberDisplayMode;
}

- (NSHashTable)_statusBarAssertions
{
  return self->_statusBarAssertions;
}

- (BOOL)shouldDrawStatusBarInsideSceneView
{
  return self->_shouldDrawStatusBarInsideSceneView;
}

- (SBDeviceApplicationSceneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDeviceApplicationSceneViewControllerDelegate *)WeakRetained;
}

- (MTLumaDodgePillSettings)homeGrabberPillSettings
{
  return self->_homeGrabberPillSettings;
}

- (void)setHomeGrabberPillSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGrabberPillSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneMinificationFilter, 0);
  objc_storeStrong((id *)&self->_statusBarAssertions, 0);
  objc_storeStrong((id *)&self->_statusBarChanges, 0);
  objc_storeStrong((id *)&self->_realStatusBarStyleDelegate, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_liveContentDisableAssertion, 0);
  objc_storeStrong((id *)&self->_showDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollToTopGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarTransformView, 0);
  objc_storeStrong((id *)&self->_statusBarWrapperView, 0);
  objc_destroyWeak((id *)&self->_statusBarReusePool);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_placeholderStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_activeOverlayStatusBarAssertion, 0);
  objc_destroyWeak((id *)&self->_traitsParticipantForOverlayContainer);
  objc_storeStrong((id *)&self->_activeOverlayViewProviders, 0);
  objc_storeStrong((id *)&self->_overlayViewProviders, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
}

@end