@interface SBHomeScreenViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasPerformedInitialLayout;
- (BOOL)homeScreenAutorotatesEvenWhenIconIsDragging;
- (BOOL)isHomeAffordanceInteractionAllowed;
- (BOOL)isIconContentHidden;
- (BOOL)isRotating;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutorotate;
- (BSInvalidatable)widgetEditViewControllerOrientationUpdateDeferralAssertion;
- (CGRect)_homeAffordanceFrameForHomeAffordanceInteraction;
- (CGRect)_homeAffordanceFrameForLayout;
- (SBFHomeAffordanceInteraction)homeAffordanceInteraction;
- (SBFHomeAffordanceView)homeAffordanceView;
- (SBFZStackParticipant)zStackParticipant;
- (SBFloatingDockBehaviorAssertion)homeScreenFloatingDockAssertion;
- (SBFloatingDockBehaviorAssertion)widgetEditFloatingDockAssertion;
- (SBHIconImageAppearance)currentIconImageAppearance;
- (SBHIconImageStyleConfiguration)currentIconImageStyleConfiguration;
- (SBHIconManager)iconManager;
- (SBHomeScreenReturnToSpotlightPolicy)returnToSpotlightPolicy;
- (SBHomeScreenViewController)initWithWindowScene:(id)a3 iconController:(id)a4 iconManager:(id)a5 userInterfaceController:(id)a6;
- (SBIconController)iconController;
- (SBUIController)userInterfaceController;
- (SBWindowScene)windowScene;
- (UIView)iconContentView;
- (_UILegibilitySettings)legibilitySettings;
- (id)_autorotationPreventionReasons;
- (id)containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:(BOOL)a3;
- (id)containerViewForPresentingContextMenuForIconView:(id)a3;
- (int64_t)effectiveOrientation;
- (unint64_t)possibleInterfaceOrientations;
- (unint64_t)supportedInterfaceOrientations;
- (void)_acquireFloatingDockBehaviorAssertionIfNecessaryForFloatingDockController:(id)a3;
- (void)_acquireForceTouchOrientationUpdateDeferralAssertionForIconView:(id)a3;
- (void)_acquireForceTouchWindowLevelAssertionForIconView:(id)a3;
- (void)_animateTransitionToSize:(CGSize)a3 andInterfaceOrientation:(int64_t)a4 withTransitionContext:(id)a5;
- (void)_appIconForceTouchControllerDidDismissNotification:(id)a3;
- (void)_appIconForceTouchControllerWillPresentNotification:(id)a3;
- (void)_beginAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_cleanupAfterTransitionToSize:(CGSize)a3 fromInterfaceOrientation:(int64_t)a4 withTransitionContext:(id)a5;
- (void)_dismissAllIconForceTouchControllersDidFire:(id)a3;
- (void)_endAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3;
- (void)_floatingDockFrameDidChange:(id)a3;
- (void)_iconEditingDidChange:(id)a3;
- (void)_performInitialLayoutWithOrientation:(int64_t)a3;
- (void)_prepareForTransitionToSize:(CGSize)a3 andInterfaceOrientation:(int64_t)a4 withTransitionCoordinator:(id)a5;
- (void)_relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:(id)a3;
- (void)_relinquishForceTouchWindowLevelAssertionForIconView:(id)a3;
- (void)_updateHomeAffordanceInteraction;
- (void)_updateHomeAffordanceView;
- (void)_updateIconContentViewOrientationAndLayoutIfNeeded;
- (void)_widgetEditViewDidDisappearImplementation;
- (void)_widgetEditViewWillAppear:(id)a3;
- (void)dealloc;
- (void)disableAnimationForNextIconRotation;
- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3;
- (void)loadView;
- (void)nudgeIconInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)setAllowIconRotation:(BOOL)a3 forReason:(id)a4;
- (void)setAllowedInterfaceOrientations:(unint64_t)a3;
- (void)setEffectiveOrientation:(int64_t)a3;
- (void)setHomeAffordanceInteraction:(id)a3;
- (void)setHomeAffordanceInteractionAllowed:(BOOL)a3;
- (void)setHomeAffordanceView:(id)a3;
- (void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)a3;
- (void)setHomeScreenFloatingDockAssertion:(id)a3;
- (void)setIconContentHidden:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setOrientation:(int64_t)a3;
- (void)setPerformedInitialLayout:(BOOL)a3;
- (void)setPossibleInterfaceOrientations:(unint64_t)a3;
- (void)setRotating:(BOOL)a3;
- (void)setWidgetEditFloatingDockAssertion:(id)a3;
- (void)setWidgetEditViewControllerOrientationUpdateDeferralAssertion:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBHomeScreenViewController

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_endAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3
{
  BOOL v17 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(SBHomeScreenViewController *)self childViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        v10 = [(SBHomeScreenViewController *)self iconController];
        v11 = [(SBHomeScreenViewController *)self windowScene];
        v12 = [v10 libraryViewControllerForWindowScene:v11];

        v13 = [v10 homeScreenOverlayController];
        v14 = [v13 viewController];

        if (v9 != v14 && v9 != v12) {
          [(SBHomeScreenViewController *)self bs_endAppearanceTransitionForChildViewController:v9 toVisible:v17];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v16 = [(SBHomeScreenViewController *)self iconManager];
  [v16 cancelAllFolderScrolling];
}

- (void)viewWillLayoutSubviews
{
  [(SBHomeScreenViewController *)self _updateIconContentViewOrientationAndLayoutIfNeeded];
  v3 = [(SBHomeScreenViewController *)self view];
  v4 = [(SBHomeScreenViewController *)self windowScene];
  uint64_t v5 = [(SBHomeScreenViewController *)self iconController];
  uint64_t v6 = [v5 libraryViewControllerForWindowScene:v4];
  uint64_t v7 = [v6 viewIfLoaded];
  uint64_t v8 = [v7 superview];

  if (v8 == v3)
  {
    id v9 = v7;
    [v3 bringSubviewToFront:v9];
    v10 = [v6 externalBackgroundView];
    v11 = [v10 superview];

    if (v11 == v3)
    {
      id v12 = v10;

      [v3 insertSubview:v12 belowSubview:v9];
      id v9 = v12;
    }
  }
  else
  {
    id v9 = 0;
  }
  v13 = [v5 homeScreenOverlayController];
  v14 = [v13 viewController];
  v15 = [v14 view];

  v16 = [v15 superview];

  if (v16 == v3)
  {
    if (v9) {
      [v3 insertSubview:v15 belowSubview:v9];
    }
    else {
      [v3 bringSubviewToFront:v15];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SBHomeScreenViewController;
  [(SBHomeScreenViewController *)&v17 viewWillLayoutSubviews];
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (SBIconController)iconController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconController);
  return (SBIconController *)WeakRetained;
}

- (void)_updateIconContentViewOrientationAndLayoutIfNeeded
{
  if (!self->_rotating)
  {
    int64_t v3 = [(SBHomeScreenViewController *)self effectiveOrientation];
    id v8 = [(SBHomeScreenViewController *)self _iconContentView];
    v4 = [(SBHomeScreenViewController *)self iconManager];
    uint64_t v5 = [v8 orientation];
    uint64_t v6 = [v4 rootFolderController];
    uint64_t v7 = [v6 orientation];

    if (v5 != v3 || v7 != v3 || !self->_performedInitialLayout) {
      [(SBHomeScreenViewController *)self _performInitialLayoutWithOrientation:v3];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v3 = [(SBHomeScreenViewController *)self allowedInterfaceOrientations];
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    v4 = [(SBHomeScreenViewController *)self iconManager];
    if (([v4 hasAnimatingFolder] & 1) != 0
      || [v4 isIconDragging]
      && !-[SBHomeScreenViewController homeScreenAutorotatesEvenWhenIconIsDragging](self, "homeScreenAutorotatesEvenWhenIconIsDragging")|| [v4 isTransitioningHomeScreenState])
    {
      uint64_t v5 = [(SBHomeScreenViewController *)self view];
      uint64_t v6 = [v5 window];

      [v6 interfaceOrientation];
      unint64_t v3 = XBInterfaceOrientationMaskForInterfaceOrientation();
    }
  }
  return v3;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenViewController;
  [(SBHomeScreenViewController *)&v15 viewDidLayoutSubviews];
  unint64_t v3 = [(SBHomeScreenViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(SBHomeScreenViewController *)self iconContentView];
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);
  UIRectGetCenter();
  objc_msgSend(v12, "setCenter:");
  v13 = [(SBHomeScreenViewController *)self homeAffordanceView];
  if (v13)
  {
    [(SBHomeScreenViewController *)self _homeAffordanceFrameForLayout];
    SBRectWithSize();
    objc_msgSend(v13, "setBounds:");
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    v14 = [(SBHomeScreenViewController *)self homeAffordanceInteraction];
    [v14 setNeedsUpdate];
  }
}

- (UIView)iconContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconContentView);
  return (UIView *)WeakRetained;
}

- (SBFHomeAffordanceView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (int64_t)effectiveOrientation
{
  if (([(SBHomeScreenViewController *)self isViewLoaded] & 1) == 0)
  {
    [(SBHomeScreenViewController *)self allowedInterfaceOrientations];
    return 1;
  }
  unint64_t v3 = [(SBHomeScreenViewController *)self view];
  double v4 = [v3 window];

  if (v4)
  {
    double v5 = [(SBHomeScreenViewController *)self view];
    double v6 = [v5 window];
    int64_t v7 = [v6 _windowInterfaceOrientation];
  }
  else
  {
    double v5 = [(SBHomeScreenViewController *)self _iconContentView];
    int64_t v7 = [v5 orientation];
  }

  [(SBHomeScreenViewController *)self allowedInterfaceOrientations];
  if (!v7) {
    return 1;
  }
  if (SBFInterfaceOrientationMaskContainsInterfaceOrientation()) {
    return v7;
  }
  else {
    return 1;
  }
}

- (unint64_t)possibleInterfaceOrientations
{
  if (![(id)SBApp homeScreenRotationStyleWantsUIKitRotation]) {
    return 2;
  }
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v4 userInterfaceIdiom] == 1;
  }
  if (v2) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)a3
{
  self->_homeScreenAutorotatesEvenWhenIconIsDragging = a3;
}

- (void)zStackParticipantDidChange:(id)a3
{
  id v4 = a3;
  double v5 = +[SBWorkspace mainWorkspace];
  double v6 = [v5 currentTransaction];

  int64_t v7 = [v6 transitionRequest];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      double v10 = v9;
    }
    else {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 source];
  unint64_t v13 = [(SBHomeScreenReturnToSpotlightPolicy *)self->_returnToSpotlightPolicy homeScreenZStackParticipantDidChange:v4 launchingForSpotlight:v12 == 2];

  if (v13 == 1)
  {
    [(SBHomeScreenReturnToSpotlightPolicy *)self->_returnToSpotlightPolicy willReactivateSpotlight];
    v14 = +[SBSceneManagerCoordinator sharedInstance];
    objc_super v15 = [v14 sceneDeactivationManager];
    v16 = (void *)[v15 newAssertionWithReason:5];

    [v16 acquireWithPredicate:&__block_literal_global_306 transitionContext:0];
    objc_super v17 = [(SBHomeScreenViewController *)self iconManager];
    long long v18 = [v17 rootFolderController];

    [v18 setPresentationSource:5];
    BOOL v19 = [(SBHomeScreenReturnToSpotlightPolicy *)self->_returnToSpotlightPolicy shouldAnimateReactivation];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__SBHomeScreenViewController_zStackParticipantDidChange___block_invoke_2;
    v21[3] = &unk_1E6AF4AC0;
    id v22 = v16;
    id v20 = v16;
    [v18 presentSpotlightAnimated:v19 completionHandler:v21];
    [v18 setPresentationSource:0];
  }
  [(SBHomeScreenViewController *)self _updateHomeAffordanceInteraction];
}

- (void)_updateHomeAffordanceInteraction
{
  if ([(SBHomeScreenViewController *)self isHomeAffordanceInteractionAllowed])
  {
    unint64_t v3 = [(SBHomeScreenViewController *)self zStackParticipant];
    BOOL v4 = [v3 activationState] == 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = [(SBHomeScreenViewController *)self homeAffordanceInteraction];
  [v5 setEnabled:v4];
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (BOOL)isHomeAffordanceInteractionAllowed
{
  return self->_homeAffordanceInteractionAllowed;
}

- (SBFHomeAffordanceInteraction)homeAffordanceInteraction
{
  return self->_homeAffordanceInteraction;
}

- (void)setIconContentHidden:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_iconContentHidden != a3)
  {
    BOOL v3 = a3;
    self->_iconContentHidden = a3;
    id v5 = [(SBHomeScreenViewController *)self _homeScreenView];
    double v6 = [(SBHomeScreenViewController *)self iconContentView];
    if (([v6 isDescendantOfView:v5] & 1) == 0) {
      [v5 addSubview:v6];
    }
    BOOL v7 = !v3;
    [(SBHomeScreenViewController *)self _beginAppearanceTransitionForChildViewControllersToVisible:v7 animated:0];
    if (v7)
    {
      id v9 = [v5 statusBarLegibilityView];
      [v5 insertSubview:v6 aboveSubview:v9];

      [v6 setHidden:0];
      [(SBHomeScreenViewController *)self _updateIconContentViewOrientationAndLayoutIfNeeded];
      [v6 layoutIfNeeded];
      [(SBHomeScreenViewController *)self _endAppearanceTransitionForChildViewControllersToVisible:v7];
      double v10 = [v6 window];
      uint64_t v11 = [v10 interfaceOrientation];
      uint64_t v12 = [(SBHomeScreenViewController *)self interfaceOrientation];
      if (v11)
      {
        uint64_t v13 = v12;
        if (v12 != v11)
        {
          v14 = BKLogOrientationGlobal();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 134218240;
            uint64_t v16 = v11;
            __int16 v17 = 2048;
            uint64_t v18 = v13;
            _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Home screen orientation did not match between window and view controller (%li vs %li)", (uint8_t *)&v15, 0x16u);
          }

          [(SBHomeScreenViewController *)self setInterfaceOrientation:v11];
          [(SBHomeScreenViewController *)self _updateIconContentViewOrientationAndLayoutIfNeeded];
        }
      }
    }
    else
    {
      [v6 setHidden:1];
      uint64_t v8 = [v6 firstResponder];
      [v8 resignFirstResponder];

      [(SBHomeScreenViewController *)self _endAppearanceTransitionForChildViewControllersToVisible:v7];
    }
    [v5 setNeedsLayout];
    [v5 layoutIfNeeded];
  }
}

- (void)_beginAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v17 = a3;
  BOOL v18 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(SBHomeScreenViewController *)self childViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        uint64_t v11 = [(SBHomeScreenViewController *)self iconController];
        uint64_t v12 = [(SBHomeScreenViewController *)self windowScene];
        uint64_t v13 = [v11 libraryViewControllerForWindowScene:v12];

        v14 = [v11 homeScreenOverlayController];
        int v15 = [v14 viewController];

        if (v10 != v15 && v10 != v13) {
          [(SBHomeScreenViewController *)self bs_beginAppearanceTransitionForChildViewController:v10 toVisible:v17 animated:v18];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)setAllowIconRotation:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"SBHomeScreenViewController.m" lineNumber:703 description:@"reason must be valid"];
  }
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen") & 1) == 0)
  {
    uint64_t v8 = [(NSMutableSet *)self->_iconRotationPreventionReasons count];
    iconRotationPreventionReasons = self->_iconRotationPreventionReasons;
    if (v4)
    {
      if (![(NSMutableSet *)iconRotationPreventionReasons containsObject:v7]) {
        goto LABEL_15;
      }
      [(NSMutableSet *)self->_iconRotationPreventionReasons removeObject:v7];
      double v10 = BKLogOrientationGlobal();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        uint64_t v14 = [(NSMutableSet *)self->_iconRotationPreventionReasons count];
        if (v8) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15)
        {
          if (self->_disableAnimationForNextIconRotation)
          {
            uint64_t v16 = 0;
          }
          else
          {
            BOOL v17 = +[SBCoverSheetPresentationManager sharedInstance];
            uint64_t v16 = [v17 isVisible] ^ 1;
          }
          if (SBWorkspaceSpringBoardIsActive())
          {
            BOOL v18 = [(SBHomeScreenViewController *)self view];
            long long v19 = [v18 window];

            uint64_t v20 = [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:0];
            uint64_t v21 = [v19 _windowInterfaceOrientation];
            uint64_t v22 = [(id)SBApp activeInterfaceOrientation];
            BOOL v24 = v20 == v21 && v21 == v22;
            if (!v20 || v24)
            {
              v30 = BKLogOrientationGlobal();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v34 = 0;
                _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "Nudging home screen window orientation because icon rotation changed.", v34, 2u);
              }

              objc_msgSend(v19, "sb_updateInterfaceOrientationFromActiveInterfaceOrientation:", v16);
            }
            else
            {
              [v19 _windowInterfaceOrientation];
              v25 = BSInterfaceOrientationDescription();
              v26 = BSInterfaceOrientationDescription();
              BOOL v27 = [(SBHomeScreenViewController *)self shouldAutorotate];
              v28 = BKLogOrientationGlobal();
              BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              if (v27)
              {
                if (v29)
                {
                  *(_DWORD *)v34 = 138543618;
                  *(void *)&v34[4] = v25;
                  *(_WORD *)&v34[12] = 2114;
                  *(void *)&v34[14] = v26;
                  _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Forcible update for the home screen from %{public}@ to %{public}@.", v34, 0x16u);
                }

                [(id)SBApp updateNativeOrientationWithOrientation:v20 updateMirroredDisplays:1 animated:1 logMessage:@"Force-update active interface orientation after unlock"];
              }
              else
              {
                if (v29)
                {
                  v31 = [(SBHomeScreenViewController *)self _autorotationPreventionReasons];
                  v32 = [v31 componentsJoinedByString:@", "];
                  *(_DWORD *)v34 = 138543874;
                  *(void *)&v34[4] = v25;
                  *(_WORD *)&v34[12] = 2114;
                  *(void *)&v34[14] = v26;
                  __int16 v35 = 2114;
                  v36 = v32;
                  _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Not doing a forcible update for the home screen from %{public}@ to %{public}@ because %{public}@.", v34, 0x20u);
                }
              }
            }
          }
          self->_disableAnimationForNextIconRotation = 0;
        }
        goto LABEL_45;
      }
      *(_DWORD *)v34 = 138543362;
      *(void *)&v34[4] = v7;
      uint64_t v11 = "Enabling home screen icon rotation for reason: %{public}@";
    }
    else
    {
      if (!iconRotationPreventionReasons)
      {
        uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v13 = self->_iconRotationPreventionReasons;
        self->_iconRotationPreventionReasons = v12;

        iconRotationPreventionReasons = self->_iconRotationPreventionReasons;
      }
      if ([(NSMutableSet *)iconRotationPreventionReasons containsObject:v7]) {
        goto LABEL_15;
      }
      [(NSMutableSet *)self->_iconRotationPreventionReasons addObject:v7];
      double v10 = BKLogOrientationGlobal();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)v34 = 138543362;
      *(void *)&v34[4] = v7;
      uint64_t v11 = "Disabling home screen icon rotation for reason: %{public}@";
    }
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v11, v34, 0xCu);
    goto LABEL_14;
  }
LABEL_45:
}

- (SBHomeScreenViewController)initWithWindowScene:(id)a3 iconController:(id)a4 iconManager:(id)a5 userInterfaceController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBHomeScreenViewController.m", 100, @"Invalid parameter not satisfying: %@", @"userInterfaceController" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)SBHomeScreenViewController;
  BOOL v15 = [(SBHomeScreenViewController *)&v24 initWithNibName:0 bundle:0];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_windowScene, v11);
    objc_storeWeak((id *)&v16->_userInterfaceController, v14);
    objc_storeWeak((id *)&v16->_iconController, v12);
    objc_storeWeak((id *)&v16->_iconManager, v13);
    [v12 addFloatingDockControllerObserver:v16];
    BOOL v17 = -[SBIconContentView initWithOrientation:]([SBIconContentView alloc], "initWithOrientation:", [(id)SBApp activeInterfaceOrientation]);
    [(SBIconContentView *)v17 setAccessibilityIdentifier:@"Home screen icons"];
    [(SBIconContentView *)v17 _setIgnoreBackdropViewsWhenHiding:1];
    objc_storeWeak((id *)&v16->_iconContentView, v17);
    [(SBHomeScreenViewController *)v16 setIconContentHidden:1];
    BOOL v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v16 selector:sel__dismissAllIconForceTouchControllersDidFire_ name:*MEMORY[0x1E4FA65A0] object:0];
    [v18 addObserver:v16 selector:sel__floatingDockFrameDidChange_ name:@"SBFloatingDockControllerFrameDidChangeNotification" object:0];
    [v18 addObserver:v16 selector:sel__iconEditingDidChange_ name:*MEMORY[0x1E4FA6578] object:0];
    BOOL v19 = +[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled];
    if (v19) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = objc_alloc_init(SBHomeScreenReturnToSpotlightPolicy);
    }
    objc_storeStrong((id *)&v16->_returnToSpotlightPolicy, v20);
    if (!v19) {

    }
    uint64_t v21 = [v11 assistantController];
    [v21 addObserver:v16];

    v16->_homeAffordanceInteractionAllowed = 1;
  }

  return v16;
}

- (void)dealloc
{
  BOOL v3 = [(SBHomeScreenViewController *)self windowScene];
  BOOL v4 = [v3 assistantController];
  [v4 addObserver:self];

  id v5 = [(SBHomeScreenViewController *)self iconController];
  [v5 removeFloatingDockControllerObserver:self];
  uint64_t v6 = [(SBHomeScreenViewController *)self homeScreenFloatingDockAssertion];
  [v6 invalidate];
  [(SBHomeScreenViewController *)self setHomeScreenFloatingDockAssertion:0];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenViewController;
  [(SBHomeScreenViewController *)&v8 dealloc];
}

- (void)loadView
{
  BOOL v3 = [SBHomeScreenView alloc];
  BOOL v4 = -[SBHomeScreenView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBHomeScreenViewController *)self setView:v4];
}

- (BOOL)shouldAutorotate
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    LOBYTE(v3) = 1;
  }
  else if ([(id)SBApp homeScreenRotationStyleWantsUIKitRotation])
  {
    BOOL v4 = [(SBHomeScreenViewController *)self iconManager];
    id v5 = [(SBHomeScreenViewController *)self userInterfaceController];
    if (([v4 isSidebarVisibilityGestureActive] & 1) != 0
      || ([v4 hasAnimatingFolder] & 1) != 0
      || [v4 isIconDragging]
      && !-[SBHomeScreenViewController homeScreenAutorotatesEvenWhenIconIsDragging](self, "homeScreenAutorotatesEvenWhenIconIsDragging")|| -[NSMutableSet count](self->_iconRotationPreventionReasons, "count")|| ([v5 isIconListViewTornDown] & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      int v3 = [v4 isTransitioningHomeScreenState] ^ 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__appIconForceTouchControllerWillPresentNotification_ name:*MEMORY[0x1E4FA6720] object:0];
  [v5 addObserver:self selector:sel__appIconForceTouchControllerDidDismissNotification_ name:*MEMORY[0x1E4FA6718] object:0];
  [(SBHomeScreenViewController *)self _beginAppearanceTransitionForChildViewControllersToVisible:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeScreenViewController;
  [(SBHomeScreenViewController *)&v11 viewDidAppear:a3];
  BOOL v4 = [(SBHomeScreenViewController *)self view];
  id v5 = [v4 window];
  objc_msgSend(v5, "_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary");

  objc_super v6 = [(SBHomeScreenViewController *)self windowScene];
  id v7 = [v6 statusBarManager];
  objc_super v8 = [v7 layoutManager];
  [v8 addActiveLayoutLayer:0];

  uint64_t v9 = [(SBHomeScreenViewController *)self zStackParticipant];
  if (!v9)
  {
    double v10 = [v6 zStackResolver];
    uint64_t v9 = [v10 acquireParticipantWithIdentifier:0 delegate:self];
    [(SBHomeScreenViewController *)self setZStackParticipant:v9];
  }
  [(SBHomeScreenViewController *)self _updateHomeAffordanceView];
  [(SBHomeScreenViewController *)self _endAppearanceTransitionForChildViewControllersToVisible:1];
  [(SBHomeScreenViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(SBHomeScreenViewController *)self _beginAppearanceTransitionForChildViewControllersToVisible:0 animated:v3];
  [(SBHomeScreenViewController *)self resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenViewController;
  [(SBHomeScreenViewController *)&v4 viewDidDisappear:a3];
  [(SBHomeScreenViewController *)self _widgetEditViewDidDisappearImplementation];
  [(SBHomeScreenViewController *)self _endAppearanceTransitionForChildViewControllersToVisible:0];
}

- (_UILegibilitySettings)legibilitySettings
{
  BOOL v2 = [(SBHomeScreenViewController *)self _homeScreenView];
  BOOL v3 = [v2 statusBarLegibilityView];
  objc_super v4 = [v3 legibilitySettings];

  return (_UILegibilitySettings *)v4;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4 = a3;
  id v6 = [(SBHomeScreenViewController *)self _homeScreenView];
  objc_super v5 = [v6 statusBarLegibilityView];
  [v5 setLegibilitySettings:v4];
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  id v12 = [(UIViewController *)self sb_childOrPresentedViewControllerStatusBarSettings];
  if (v12)
  {
    BOOL v3 = [(SBHomeScreenViewController *)self windowScene];
    id v4 = [v3 statusBarManager];
    objc_super v5 = [v4 assertionManager];

    id v6 = (SBWindowSceneStatusBarSettingsAssertion *)[v5 newSettingsAssertionWithSettings:v12 atLevel:0 reason:@"Homescreen Child/Presented VC"];
    childOrPresentedStatusBarAssertion = self->_childOrPresentedStatusBarAssertion;
    self->_childOrPresentedStatusBarAssertion = v6;

    objc_super v8 = self->_childOrPresentedStatusBarAssertion;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v8 acquireWithAnimationParameters:v9];
  }
  else
  {
    double v10 = self->_childOrPresentedStatusBarAssertion;
    objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v10 invalidateWithAnimationParameters:v11];

    objc_super v5 = self->_childOrPresentedStatusBarAssertion;
    self->_childOrPresentedStatusBarAssertion = 0;
  }
}

- (void)_acquireFloatingDockBehaviorAssertionIfNecessaryForFloatingDockController:(id)a3
{
  id v7 = a3;
  id v4 = [v7 windowScene];
  objc_super v5 = [(SBHomeScreenViewController *)self windowScene];

  if (v5 == v4)
  {
    id v6 = [(SBHomeScreenViewController *)self homeScreenFloatingDockAssertion];
    if (!v6)
    {
      id v6 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v7 visibleProgress:1 animated:0 gesturePossible:0 atLevel:@"homescreen" reason:0 withCompletion:1.0];
      [(SBHomeScreenViewController *)self setHomeScreenFloatingDockAssertion:v6];
    }
  }
}

- (id)_autorotationPreventionReasons
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    if ([(id)SBApp homeScreenRotationStyleWantsUIKitRotation])
    {
      objc_super v5 = [(SBHomeScreenViewController *)self iconManager];
      id v6 = [(SBHomeScreenViewController *)self userInterfaceController];
      if ([v5 isSidebarVisibilityGestureActive]) {
        [v4 addObject:@"iconControllerSidebarVisibilityGestureActive"];
      }
      if ([v5 hasAnimatingFolder]) {
        [v4 addObject:@"iconControllerHasAnimatingFolder"];
      }
      if ([v5 isIconDragging]
        && ![(SBHomeScreenViewController *)self homeScreenAutorotatesEvenWhenIconIsDragging])
      {
        [v4 addObject:@"iconControllerIconDragging"];
      }
      if ([(NSMutableSet *)self->_iconRotationPreventionReasons count])
      {
        id v7 = [(NSMutableSet *)self->_iconRotationPreventionReasons allObjects];
        [v4 addObjectsFromArray:v7];
      }
      if ([v6 isIconListViewTornDown]) {
        [v4 addObject:@"iconListViewTornDown"];
      }
      if ([v5 isTransitioningHomeScreenState]) {
        [v4 addObject:@"iconListTransitioningHomeScreenState"];
      }
    }
    else
    {
      [v4 addObject:@"homeScreenRotationStyle"];
    }
    BOOL v8 = [v4 count] == 0;
    if (v8 != [(SBHomeScreenViewController *)self shouldAutorotate])
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"SBHomeScreenViewController.m" lineNumber:427 description:@"_autorotationPreventionReasons out of sync with shouldAutorotate"];
    }
  }
  return v4;
}

- (void)_performInitialLayoutWithOrientation:(int64_t)a3
{
  BOOL performedInitialLayout = self->_performedInitialLayout;
  self->_BOOL performedInitialLayout = 1;
  id v6 = SBLogIcon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBHomeScreenViewController _performInitialLayoutWithOrientation:](a3, v6);
  }

  id v7 = [(SBHomeScreenViewController *)self iconManager];
  if (a3)
  {
    BOOL v8 = [(SBHomeScreenViewController *)self _iconContentView];
    [v8 setOrientation:a3];
    [v7 noteInterfaceOrientationChanged];
  }
  [v7 resetRootIconLists];
  if (!performedInitialLayout)
  {
    uint64_t v9 = [v7 rootFolderController];
    objc_msgSend(v9, "setCurrentPageIndex:animated:", objc_msgSend(v9, "defaultPageIndex"), 0);
  }
}

- (void)setHomeAffordanceInteractionAllowed:(BOOL)a3
{
  if (self->_homeAffordanceInteractionAllowed != a3)
  {
    self->_homeAffordanceInteractionAllowed = a3;
    [(SBHomeScreenViewController *)self _updateHomeAffordanceInteraction];
  }
}

- (void)_updateHomeAffordanceView
{
  id v14 = [(SBHomeScreenViewController *)self windowScene];
  BOOL v3 = [(SBHomeScreenViewController *)self view];
  id v4 = [v14 assistantController];
  int v5 = [v4 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];
  id v6 = [(SBHomeScreenViewController *)self homeAffordanceView];

  if (!v5 || v6)
  {
    if (v6) {
      char v12 = v5;
    }
    else {
      char v12 = 1;
    }
    if ((v12 & 1) == 0)
    {
      id v13 = [(SBHomeScreenViewController *)self homeAffordanceView];
      [v13 removeFromSuperview];

      [(SBHomeScreenViewController *)self setHomeAffordanceView:0];
      [(SBHomeScreenViewController *)self setHomeAffordanceInteraction:0];
    }
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4FA5F20]);
    BOOL v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v8 setHintStyle:2];
    [v3 addSubview:v8];
    [(SBHomeScreenViewController *)self setHomeAffordanceView:v8];
    uint64_t v9 = [v14 homeAffordanceInteractionManager];
    double v10 = (void *)[v9 newHomeAffordanceInteraction];
    objc_super v11 = v10;
    if (v10)
    {
      [v10 setDelegate:self];
      [v3 addInteraction:v11];
      [(SBHomeScreenViewController *)self setHomeAffordanceInteraction:v11];
      [(SBHomeScreenViewController *)self _updateHomeAffordanceInteraction];
    }
  }
}

- (CGRect)_homeAffordanceFrameForHomeAffordanceInteraction
{
  BOOL v2 = [(SBHomeScreenViewController *)self view];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  objc_super v11 = [MEMORY[0x1E4F743B8] sharedInstance];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat rect = *MEMORY[0x1E4F1DB28];
  id v13 = objc_opt_class();
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  [v13 suggestedSizeForContentWidth:v11 withSettings:CGRectGetWidth(v33)];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  double Width = CGRectGetWidth(v34);
  v35.origin.x = rect;
  v35.origin.y = v12;
  v35.size.width = v15;
  v35.size.height = v17;
  CGFloat v19 = (Width - CGRectGetWidth(v35)) * 0.5;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  CGRectGetHeight(v36);
  v37.origin.x = v19;
  v37.origin.y = v12;
  v37.size.width = v15;
  v37.size.height = v17;
  CGRectGetHeight(v37);
  [v11 edgeSpacing];
  SBScreenScale();
  BSRectRoundForScale();
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_homeAffordanceFrameForLayout
{
  double v3 = [(SBHomeScreenViewController *)self view];
  [v3 bounds];
  CGFloat x = v44.origin.x;
  CGFloat y = v44.origin.y;
  CGFloat width = v44.size.width;
  CGFloat height = v44.size.height;
  CGRectGetMidX(v44);
  CGFloat v8 = [(SBHomeScreenViewController *)self iconManager];
  double v9 = [v8 rootFolderController];
  if ([v9 isDockExternal])
  {
    CGFloat v10 = [v8 floatingDockViewController];
    objc_super v11 = [v10 view];
    CGFloat v12 = [v11 _screen];
    id v13 = [v12 fixedCoordinateSpace];

    [v10 floatingDockScreenFrame];
    objc_msgSend(v3, "convertRect:fromCoordinateSpace:", v13);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat rect = v20;
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    CGRectGetMaxY(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGRectGetMaxY(v46);
    v47.origin.CGFloat x = v15;
    v47.origin.CGFloat y = v17;
    v47.size.CGFloat width = v19;
    v47.size.CGFloat height = rect;
    CGRectGetMaxY(v47);
  }
  else
  {
    CGFloat v10 = [v9 folderView];
    id v13 = [v10 dockView];
    double v21 = [v13 dockListView];
    [v21 bounds];
    objc_msgSend(v3, "convertRect:fromView:", v21);
    CGFloat recta = v22;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRectGetMaxY(v48);
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    CGRectGetMaxY(v49);
    v50.origin.CGFloat x = recta;
    v50.origin.CGFloat y = v24;
    v50.size.CGFloat width = v26;
    v50.size.CGFloat height = v28;
    CGRectGetMaxY(v50);
  }
  [(SBHomeScreenViewController *)self _homeAffordanceFrameForHomeAffordanceInteraction];
  double v29 = [(SBHomeScreenViewController *)self traitCollection];
  [v29 displayScale];
  UIRectCenteredAboutPointScale();
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = v31;
  double v39 = v33;
  double v40 = v35;
  double v41 = v37;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (void)_prepareForTransitionToSize:(CGSize)a3 andInterfaceOrientation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  objc_msgSend(a5, "transitionDuration", a3.width, a3.height);
  double v8 = v7;
  double v9 = +[SBWallpaperController sharedInstance];
  [v9 orientationSource:2 willRotateToInterfaceOrientation:a4 duration:v8];

  CGFloat v10 = +[SBReachabilityManager sharedInstance];
  [v10 setReachabilityTemporarilyDisabled:1 forReason:@"MainWindowRotation"];

  objc_super v11 = [(SBHomeScreenViewController *)self windowScene];
  LODWORD(v10) = SBWorkspaceLauncherIsActive(v11, 1);

  if (v10)
  {
    CGFloat v12 = (void *)SBApp;
    [v12 noteInterfaceOrientationChanged:a4 duration:@"Home Screen is transitioning" logMessage:v8];
  }
}

- (void)_animateTransitionToSize:(CGSize)a3 andInterfaceOrientation:(int64_t)a4 withTransitionContext:(id)a5
{
  objc_msgSend(a5, "transitionDuration", a3.width, a3.height);
  double v7 = v6;
  id v8 = +[SBWallpaperController sharedInstance];
  [v8 orientationSource:2 willAnimateRotationToInterfaceOrientation:a4 duration:v7];
}

- (void)_cleanupAfterTransitionToSize:(CGSize)a3 fromInterfaceOrientation:(int64_t)a4 withTransitionContext:(id)a5
{
  double v6 = +[SBWallpaperController sharedInstance];
  [v6 orientationSource:2 didRotateFromInterfaceOrientation:a4];

  [(id)SBApp resetIdleTimerAndUndim];
  double v7 = +[SBReachabilityManager sharedInstance];
  [v7 setReachabilityTemporarilyDisabled:0 forReason:@"MainWindowRotation"];

  id v8 = (void *)SBApp;
  [v8 noteHomeScreenLayoutDidChange];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _toWindowOrientation];
  uint64_t v10 = [v8 _fromWindowOrientation];
  if (([(SBHomeScreenViewController *)self supportedInterfaceOrientations] & (1 << v9)) != 0)
  {
    self->_rotating = 1;
    objc_super v11 = [(SBHomeScreenViewController *)self iconController];
    [v11 dismissAppIconForceTouchControllers:0];
    CGFloat v12 = [(SBHomeScreenViewController *)self iconManager];
    id v13 = [v12 iconShareSheetManager];
    [v13 hideIconShareSheetsIfAnyForRotationAnimation];
    [v11 dismissHomeScreenOverlayUsingTransitionCoordinator:v7];
    [v12 dismissModalInteractions];
    -[SBHomeScreenViewController _prepareForTransitionToSize:andInterfaceOrientation:withTransitionCoordinator:](self, "_prepareForTransitionToSize:andInterfaceOrientation:withTransitionCoordinator:", v9, v7, width, height);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v16[3] = &unk_1E6B09440;
    v16[4] = self;
    *(double *)&v16[5] = width;
    *(double *)&v16[6] = height;
    v16[7] = v9;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v15[3] = &unk_1E6B09440;
    v15[4] = self;
    *(double *)&v15[5] = width;
    *(double *)&v15[6] = height;
    v15[7] = v10;
    [v7 animateAlongsideTransition:v16 completion:v15];
    v14.receiver = self;
    v14.super_class = (Class)SBHomeScreenViewController;
    -[SBHomeScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  }
}

void __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_animateTransitionToSize:andInterfaceOrientation:withTransitionContext:", *(void *)(a1 + 56), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) _iconContentView];
  [v3 setOrientation:*(void *)(a1 + 56)];
}

uint64_t __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_cleanupAfterTransitionToSize:fromInterfaceOrientation:withTransitionContext:", *(void *)(a1 + 56), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 1019) = 0;
  return result;
}

- (void)nudgeIconInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen") & 1) == 0)
  {
    id v7 = [(SBHomeScreenViewController *)self view];
    id v9 = [v7 window];

    if ([(id)SBApp homeScreenRotationStyleWantsUIKitRotation])
    {
      int v8 = [(SBHomeScreenViewController *)self isViewLoaded];
      if ((unint64_t)(a3 - 1) <= 3 && v8 && [v9 _windowInterfaceOrientation] != a3) {
        [v9 _legacySetRotatableViewOrientation:a3 updateStatusBar:1 duration:0 force:a4];
      }
    }
  }
}

- (void)disableAnimationForNextIconRotation
{
  self->_disableAnimationForNextIconRotation = 1;
}

- (id)containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SBHomeScreenViewController *)self iconController];
  if (v3
    && (+[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance"), double v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 isVisibleAndNotDisappearing], v6, v7))
  {
    int v8 = [v5 coverSheetTodayViewController];
  }
  else
  {
    int v8 = [v5 todayViewController];
  }
  id v9 = v8;
  if ([v8 _appearState] == 2 || objc_msgSend(v9, "_appearState") == 1)
  {
    uint64_t v10 = [v9 containerViewController];
    objc_super v11 = (void *)v10;
    if (v10) {
      CGFloat v12 = (SBHomeScreenViewController *)v10;
    }
    else {
      CGFloat v12 = self;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = self;
  }

  return v13;
}

- (id)containerViewForPresentingContextMenuForIconView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 _sbWindowScene];
  double v6 = [v5 floatingDockController];
  int v7 = [(SBHomeScreenViewController *)self iconController];
  int v8 = [v7 _openFolderController];
  id v9 = [v6 floatingDockViewController];
  uint64_t v10 = [v9 presentedFolderController];

  objc_super v11 = [v4 location];

  if (!v6 || !SBIconLocationGroupContainsLocation())
  {
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      if (v8)
      {
        CGFloat v12 = [v7 _openFolderController];
        goto LABEL_13;
      }
      if (SBIconLocationGroupContainsLocation())
      {
        CGFloat v12 = [(SBHomeScreenViewController *)self containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:0];
        goto LABEL_13;
      }
      if (SBIconLocationGroupContainsLocation())
      {
        CGFloat v12 = [v7 libraryViewControllerForWindowScene:v5];
        goto LABEL_13;
      }
      id v13 = self;
    }
    objc_super v14 = [(SBHomeScreenViewController *)v13 view];
    goto LABEL_14;
  }
  CGFloat v12 = [v6 viewController];
LABEL_13:
  CGFloat v15 = v12;
  objc_super v14 = [v12 view];

LABEL_14:
  return v14;
}

- (void)_widgetEditViewWillAppear:(id)a3
{
  id v4 = [(SBHomeScreenViewController *)self widgetEditFloatingDockAssertion];

  if (!v4)
  {
    double v5 = [(SBHomeScreenViewController *)self windowScene];
    double v6 = [v5 floatingDockController];
    int v7 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v6 visibleProgress:1 animated:0 gesturePossible:4 atLevel:@"edit widgets" reason:0 withCompletion:0.0];
    [(SBHomeScreenViewController *)self setWidgetEditFloatingDockAssertion:v7];
  }
  int v8 = [(SBHomeScreenViewController *)self widgetEditViewControllerOrientationUpdateDeferralAssertion];

  if (!v8)
  {
    id v9 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"edit widgets"];
    [(SBHomeScreenViewController *)self setWidgetEditViewControllerOrientationUpdateDeferralAssertion:v9];
  }
}

- (void)_widgetEditViewDidDisappearImplementation
{
  BOOL v3 = [(SBHomeScreenViewController *)self widgetEditFloatingDockAssertion];
  [v3 invalidate];

  [(SBHomeScreenViewController *)self setWidgetEditFloatingDockAssertion:0];
  id v4 = [(SBHomeScreenViewController *)self widgetEditViewControllerOrientationUpdateDeferralAssertion];
  [v4 invalidate];

  [(SBHomeScreenViewController *)self setWidgetEditViewControllerOrientationUpdateDeferralAssertion:0];
}

- (void)_appIconForceTouchControllerWillPresentNotification:(id)a3
{
  id v4 = [a3 object];
  [(SBHomeScreenViewController *)self _acquireForceTouchOrientationUpdateDeferralAssertionForIconView:v4];
  [(SBHomeScreenViewController *)self _acquireForceTouchWindowLevelAssertionForIconView:v4];
}

- (void)_appIconForceTouchControllerDidDismissNotification:(id)a3
{
  id v4 = [a3 object];
  [(SBHomeScreenViewController *)self _relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:v4];
  [(SBHomeScreenViewController *)self _relinquishForceTouchWindowLevelAssertionForIconView:v4];
}

- (void)_acquireForceTouchOrientationUpdateDeferralAssertionForIconView:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (!v5)
  {
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBHomeScreenViewController.m", 852, @"Invalid parameter not satisfying: %@", @"iconView" object file lineNumber description];

    id v5 = 0;
  }
  appIconForceTouchControllerOrientationUpdateDeferralAssertions = self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions;
  if (!appIconForceTouchControllerOrientationUpdateDeferralAssertions)
  {
    int v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    int v8 = self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions;
    self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions = v7;

    id v5 = v13;
    appIconForceTouchControllerOrientationUpdateDeferralAssertions = self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions;
  }
  id v9 = [(NSMapTable *)appIconForceTouchControllerOrientationUpdateDeferralAssertions objectForKey:v5];
  if (!v9)
  {
    uint64_t v10 = (void *)SBApp;
    objc_super v11 = [NSString stringWithFormat:@"AppIconForceTouchController is presented context menu for %@", v13];
    id v9 = [v10 deviceOrientationUpdateDeferralAssertionWithReason:v11];

    [(NSMapTable *)self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions setObject:v9 forKey:v13];
  }
}

- (void)_relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBHomeScreenViewController.m", 867, @"Invalid parameter not satisfying: %@", @"iconView" object file lineNumber description];

    id v5 = 0;
  }
  double v6 = [(NSMapTable *)self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions objectForKey:v5];
  [v6 invalidate];
  [(NSMapTable *)self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions removeObjectForKey:v8];
}

- (void)_acquireForceTouchWindowLevelAssertionForIconView:(id)a3
{
  id v18 = a3;
  if (!v18)
  {
    CGFloat v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBHomeScreenViewController.m", 876, @"Invalid parameter not satisfying: %@", @"iconView" object file lineNumber description];
  }
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    id v5 = [(NSMapTable *)self->_appIconForceTouchControllerWindowLevelAssertions objectForKey:v18];
    if (!v5)
    {
      double v6 = [v18 window];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!self->_appIconForceTouchControllerWindowLevelAssertions)
          {
            int v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
            appIconForceTouchControllerWindowLevelAssertions = self->_appIconForceTouchControllerWindowLevelAssertions;
            self->_appIconForceTouchControllerWindowLevelAssertions = v7;
          }
          id v9 = [v18 window];
          [v9 windowLevel];
          double v11 = v10 + -1.0;

          CGFloat v12 = [v18 _sbWindowScene];
          id v13 = [v12 floatingDockController];
          objc_super v14 = [SBFloatingDockWindowLevelAssertion alloc];
          CGFloat v15 = NSStringFromSelector(a2);
          double v16 = [(SBFloatingDockWindowLevelAssertion *)v14 initWithFloatingDockController:v13 priority:2 level:v15 reason:v11];

          [(NSMapTable *)self->_appIconForceTouchControllerWindowLevelAssertions setObject:v16 forKey:v18];
        }
      }
    }
  }
}

- (void)_relinquishForceTouchWindowLevelAssertionForIconView:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBHomeScreenViewController.m", 909, @"Invalid parameter not satisfying: %@", @"iconView" object file lineNumber description];
  }
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    id v5 = [(NSMapTable *)self->_appIconForceTouchControllerWindowLevelAssertions objectForKey:v7];
    [v5 invalidate];
    [(NSMapTable *)self->_appIconForceTouchControllerWindowLevelAssertions removeObjectForKey:v7];
  }
}

- (void)_dismissAllIconForceTouchControllersDidFire:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[(NSMapTable *)self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions copy];
  id v5 = (void *)[(NSMapTable *)self->_appIconForceTouchControllerWindowLevelAssertions copy];
  double v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v4 keyEnumerator];
  id v9 = [v8 allObjects];
  double v10 = [v7 setWithArray:v9];
  [v6 unionSet:v10];

  double v11 = (void *)MEMORY[0x1E4F1CAD0];
  CGFloat v12 = [v5 keyEnumerator];
  id v13 = [v12 allObjects];
  objc_super v14 = [v11 setWithArray:v13];
  [v6 unionSet:v14];

  if ([v6 count])
  {
    CGFloat v15 = SBLogIcon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenViewController _dismissAllIconForceTouchControllersDidFire:]((uint64_t)v6, v15);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          [(SBHomeScreenViewController *)self _relinquishForceTouchWindowLevelAssertionForIconView:v21];
          [(SBHomeScreenViewController *)self _relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }

    [(NSMapTable *)self->_appIconForceTouchControllerWindowLevelAssertions removeAllObjects];
    [(NSMapTable *)self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions removeAllObjects];
  }
}

- (void)_floatingDockFrameDidChange:(id)a3
{
  id v3 = [(SBHomeScreenViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)_iconEditingDidChange:(id)a3
{
  id v3 = [(SBHomeScreenViewController *)self zStackParticipant];
  [v3 setNeedsUpdatePreferencesWithReason:@"Home Screen editing changed"];
}

- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3
{
  id v3 = [(SBHomeScreenViewController *)self homeAffordanceView];
  [v3 performHintAnimation];
}

uint64_t __57__SBHomeScreenViewController_zStackParticipantDidChange___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 clientHandle];
  id v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.Spotlight"];

  return v4;
}

uint64_t __57__SBHomeScreenViewController_zStackParticipantDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relinquish];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHomeScreenViewController *)self iconManager];
  objc_msgSend(v5, "setSuppressSystemApertureForSystemChromeSuppression:", objc_msgSend(v6, "isEditing"));
  [v5 setAllowsDimmingWhenForegroundInactive:1];
}

- (BOOL)isIconContentHidden
{
  return self->_iconContentHidden;
}

- (BOOL)homeScreenAutorotatesEvenWhenIconIsDragging
{
  return self->_homeScreenAutorotatesEvenWhenIconIsDragging;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setEffectiveOrientation:(int64_t)a3
{
  self->_effectiveOrientation = a3;
}

- (void)setAllowedInterfaceOrientations:(unint64_t)a3
{
  self->_allowedInterfaceOrientations = a3;
}

- (void)setPossibleInterfaceOrientations:(unint64_t)a3
{
  self->_possibleInterfaceOrientations = a3;
}

- (SBHIconImageStyleConfiguration)currentIconImageStyleConfiguration
{
  return self->_currentIconImageStyleConfiguration;
}

- (SBHIconImageAppearance)currentIconImageAppearance
{
  return self->_currentIconImageAppearance;
}

- (SBUIController)userInterfaceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceController);
  return (SBUIController *)WeakRetained;
}

- (SBFloatingDockBehaviorAssertion)homeScreenFloatingDockAssertion
{
  return self->_homeScreenFloatingDockAssertion;
}

- (void)setHomeScreenFloatingDockAssertion:(id)a3
{
}

- (SBFloatingDockBehaviorAssertion)widgetEditFloatingDockAssertion
{
  return self->_widgetEditFloatingDockAssertion;
}

- (void)setWidgetEditFloatingDockAssertion:(id)a3
{
}

- (BSInvalidatable)widgetEditViewControllerOrientationUpdateDeferralAssertion
{
  return self->_widgetEditViewControllerOrientationUpdateDeferralAssertion;
}

- (void)setWidgetEditViewControllerOrientationUpdateDeferralAssertion:(id)a3
{
}

- (void)setZStackParticipant:(id)a3
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

- (BOOL)hasPerformedInitialLayout
{
  return self->_performedInitialLayout;
}

- (void)setPerformedInitialLayout:(BOOL)a3
{
  self->_BOOL performedInitialLayout = a3;
}

- (SBHomeScreenReturnToSpotlightPolicy)returnToSpotlightPolicy
{
  return self->_returnToSpotlightPolicy;
}

- (void)setHomeAffordanceInteraction:(id)a3
{
}

- (void)setHomeAffordanceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_returnToSpotlightPolicy, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_widgetEditViewControllerOrientationUpdateDeferralAssertion, 0);
  objc_storeStrong((id *)&self->_widgetEditFloatingDockAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenFloatingDockAssertion, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_destroyWeak((id *)&self->_iconController);
  objc_destroyWeak((id *)&self->_userInterfaceController);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_currentIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_currentIconImageStyleConfiguration, 0);
  objc_destroyWeak((id *)&self->_iconContentView);
  objc_storeStrong((id *)&self->_appIconForceTouchControllerWindowLevelAssertions, 0);
  objc_storeStrong((id *)&self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, 0);
  objc_storeStrong((id *)&self->_childOrPresentedStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_iconRotationPreventionReasons, 0);
}

- (void)_performInitialLayoutWithOrientation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Peforming initial layout with orientation (%lu)", (uint8_t *)&v2, 0xCu);
}

- (void)_dismissAllIconForceTouchControllersDidFire:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Forcefully removing assertions for iconViews: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end